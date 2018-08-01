package cn.believeus.controller;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import mydfs.storage.server.MydfsTrackerServer;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import cn.believeus.model.Tdata;
import cn.believeus.model.Titem;
import cn.believeus.service.MySQLService;

import com.alibaba.fastjson.JSONArray;

@Controller
public class IndexController {
	@Resource
	private MySQLService service;
	
	@Resource
	private MydfsTrackerServer mydfsTrackerServer;
	
	@RequestMapping("/index")
	public ModelAndView index(@RequestParam(required=false) String login) {
		ModelAndView modelView = new ModelAndView();
		if("believeus".equals(login)){
			modelView.setViewName("/WEB-INF/admin.jsp");
		}else {
			modelView.setViewName("/WEB-INF/index.jsp");
		}
		
		String hql = "from Titem  where parent is null order by oid asc ";
		List<?> itembox = service.findObjectList(hql);
		modelView.addObject("itembox", itembox);
		return modelView;
	}
	
	@RequestMapping("/findItem")
	@ResponseBody
	public String findItem(int id) {
		String hql = "select new Titem(id,title,oid) from Titem where parent.id="+ id + " order by oid asc ";
		List<?> itembox = service.findObjectList(hql);
		return JSONArray.toJSONString(itembox);
	}

	@RequestMapping("/findData")
	@ResponseBody
	public String findData(int id) {
		Tdata data = ((Titem)service.findObject(Titem.class, id)).getDatabox();
		if (data!=null) {
			return data.getContent();
		}
		return "<h3>请输入文章内容……</h3>";

	}
	
	@RequestMapping("/upload")
	@ResponseBody
	public Map<String, String> upload(@RequestParam(value="myFileName")MultipartFile mf){
		try {
			String fileName = mf.getOriginalFilename();
			String stuffix=fileName.substring(fileName.lastIndexOf(".")+1);
			InputStream in = mf.getInputStream();
			String filepath = mydfsTrackerServer.upload(in, stuffix);
			Map<String, String> map = new HashMap<String, String>();
			map.put("data",filepath);//这里应该是项目路径
			return map;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	@ResponseBody
	@RequestMapping("/saveData")
	public String saveData(String msg) {

		Tdata tdata = new Tdata();
		String itemId = msg.split("@")[0];
		String content = msg.split("@")[1];
		Titem item = (Titem) service.findObject(Titem.class, Integer.parseInt(itemId));
		if (item.getDatabox()!=null) {
			tdata = item.getDatabox();
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
		String thisContent=thisItem.getDatabox().getContent();
		String otherContent=otherItem.getDatabox().getContent();
		thisItem.getDatabox().setContent(otherContent);
		otherItem.getDatabox().setContent(thisContent);
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
