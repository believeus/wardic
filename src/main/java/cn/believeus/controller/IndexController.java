package cn.believeus.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.believeus.model.Tdata;
import cn.believeus.model.Titem;
import cn.believeus.service.MySQLService;

import com.alibaba.fastjson.JSONArray;

@Controller
public class IndexController {
	@Resource
	private MySQLService service;

	@RequestMapping("/index")
	public ModelAndView index() {
		ModelAndView modelView = new ModelAndView();
		modelView.setViewName("/WEB-INF/index.jsp");
		String hql = "from Titem  where parent is null order by oid asc ";
		List<?> itembox = service.findObjectList(hql);
		modelView.addObject("itembox", itembox);
		return modelView;
	}

	@RequestMapping("/findItem")
	@ResponseBody
	public String findItem(int id) {
		String hql = "select new Titem(id,title,oid) from Titem where parent.id="
				+ id + " order by oid asc ";
		List<?> itembox = service.findObjectList(hql);
		return JSONArray.toJSONString(itembox);
	}

	@RequestMapping("/findData")
	@ResponseBody
	public String findData(int id) {
		Titem item = (Titem) service.findObject(Titem.class, id);
		if (!item.getDatabox().isEmpty()) {
			Tdata tdata = item.getDatabox().get(0);
			return tdata.getContent();
		}
		return "<h3>请输入文章内容……</h3>";

	}

	@ResponseBody
	@RequestMapping("/saveData")
	public String saveData(String msg) {

		Tdata tdata = new Tdata();
		String itemId = msg.split("@")[0];
		String content = msg.split("@")[1];
		Titem item = (Titem) service.findObject(Titem.class,
				Integer.parseInt(itemId));
		if (!item.getDatabox().isEmpty()) {
			tdata = item.getDatabox().get(0);
			tdata.setContent(content);
		} else {
			tdata.setContent(content);
			tdata.setItem(item);
		}
		service.saveOrUpdate(tdata);
		return "success";

	}

	@ResponseBody
	@RequestMapping(value = "/save")
	public String saveItem(Titem item) {
		int pid = item.getPid();
		// 保存子项
		if (pid != 0) {
			Titem pItem = (Titem) service.findObject(Titem.class, pid);
			item.setParent(pItem);
		}
		service.saveOrUpdate(item);
		return "success:" + item.getId();
	}

	@ResponseBody
	@RequestMapping(value = "/alterOrder")
	public String alterOrder(String data) {
		int thisId = Integer.parseInt(data.split(":")[0]);
		int otherId = Integer.parseInt(data.split(":")[1]);
		Titem thisItem = (Titem) service.findObject(Titem.class, thisId);
		Titem otherItem = (Titem) service.findObject(Titem.class, otherId);
		//如果是两个临近的替换,替换文本内容即可
		if(data.split(":").length==2){
			String otherTitle = otherItem.getTitle();
			String thisTitle = thisItem.getTitle();
			thisItem.setTitle(otherTitle);
			otherItem.setTitle(thisTitle);
		}
		//如果是跨子类替换，需要替换oid
		else if (data.split(":").length==4) {
			int thisOid = Integer.parseInt(data.split(":")[2]);
			int otherOid = Integer.parseInt(data.split(":")[3]);
			thisItem.setOid(otherOid);
			otherItem.setOid(thisOid);
		}
		
		service.saveOrUpdate(thisItem);
		service.saveOrUpdate(otherItem);
		return "success";
	}

	@ResponseBody
	@RequestMapping(value = "/updateOrder")
	public String updateOrder(String data) {
		int id = Integer.parseInt(data.split(":")[0]);
		int oid = Integer.parseInt(data.split(":")[1]);
		Titem item = (Titem) service.findObject(Titem.class, id);
		item.setOid(oid);
		return "success";
	}

	@ResponseBody
	@RequestMapping(value = "/del")
	public String delItem(int id) {
		service.delete(Titem.class, id);
		return "success";

	}
}
