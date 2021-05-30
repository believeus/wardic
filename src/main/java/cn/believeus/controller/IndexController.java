package cn.believeus.controller;

import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mydfs.storage.server.MydfsTrackerServer;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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

	@Resource
	private MydfsTrackerServer mydfsTrackerServer;

	@RequestMapping("/index")
	public ModelAndView index(@RequestParam(required = false) String login) {
		ModelAndView modelView = new ModelAndView();
		modelView.setViewName("/WEB-INF/index.jsp");
		String hql = "from Titem  where parent is null order by oid asc ";
		List<?> itembox = service.findObjectList(hql);
		modelView.addObject("itembox", itembox);
		return modelView;
	}

	@RequestMapping("/ieHell")
	public ModelAndView IEhell() {
		ModelAndView modelView = new ModelAndView();
		modelView.setViewName("/WEB-INF/hellIE.jsp");
		return modelView;
	}

	@RequestMapping("/findItem")
	@ResponseBody
	public String findItem(int id) {
		String hql = "select new Titem(id,title,oid,type) from Titem where parent.id=" + id + " order by oid asc ";
		List<?> itembox = service.findObjectList(hql);
		return JSONArray.toJSONString(itembox);
	}

	@RequestMapping("/findData")
	@ResponseBody
	public String findData(int id) {
		Tdata data = ((Titem) service.findObject(Titem.class, id)).getDatabox();
		return data.getContent();
	}

	@RequestMapping("/article/{id}")
	public ModelAndView store(@PathVariable(value = "id") int id) {
		ModelAndView modelView = new ModelAndView();
		modelView.addObject("id", id);
		modelView.setViewName("/WEB-INF/ipage.jsp");
		return modelView;
	}

	@ResponseBody
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public Map<String, String>  upload(HttpServletRequest request, HttpServletResponse response) {
		try {
			Map<String, String> data = new LinkedHashMap<String, String>();
			DiskFileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload fileUpload = new ServletFileUpload(factory);
			fileUpload.setHeaderEncoding("UTF-8");
			List<FileItem> list = fileUpload.parseRequest(request);
			for (FileItem item : list) {
				if (!item.isFormField()) {
					InputStream in = item.getInputStream();
					String fileName = item.getName();
					String stuffix = fileName.substring(fileName.lastIndexOf(".") + 1);
					String filepath = mydfsTrackerServer.upload(in, stuffix);
					data.put("uploaded", "1");
					data.put("fileName", fileName.substring(fileName.lastIndexOf(".")));
					data.put("url", filepath);
					System.out.println(fileName);
					return data;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@ResponseBody
	@RequestMapping("/saveData")
	public String saveData(String itemId, String content) {
		Tdata tdata = new Tdata();
		Titem item = (Titem) service.findObject(Titem.class, Integer.parseInt(itemId));
		if (item.getDatabox() != null) {
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
	public String saveItem(Titem im) {
		// 更新菜单
		if (im.getId() != 0) {
			Titem pItem = (Titem) service.findObject(Titem.class, im.getId());
			pItem.setTitle(im.getTitle());
			service.saveOrUpdate(pItem);
			// 新创建一个子item
		} else {
			if (im.getPid() != 0) {
				Titem pItem = (Titem) service.findObject(Titem.class, im.getPid());
				im.setParent(pItem);
			}
			im.setDatabox(new Tdata("<h1>请输入文章内容……</h1>"));
			service.saveOrUpdate(im);
		}

		return "success:" + im.getId();
	}

	@ResponseBody
	@RequestMapping(value = "/moveup")
	public String moveup(String data) {
		int thisId = Integer.parseInt(data.split(":")[0]);
		int otherId = Integer.parseInt(data.split(":")[1]);
		Titem thisItem = (Titem) service.findObject(Titem.class, thisId);
		Titem otherItem = (Titem) service.findObject(Titem.class, otherId);
		int thisOid = thisItem.getOid();
		int otherOid = otherItem.getOid();
		thisItem.setOid(otherOid);
		otherItem.setOid(thisOid);
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
		service.saveOrUpdate(item);
		return "success";
	}

	@ResponseBody
	@RequestMapping(value = "/del")
	public String delItem(int id) {
		service.delete(Titem.class, id);
		return "success";
	}

	@ResponseBody
	@RequestMapping(value = "/gettime")
	public String getDate() {
		String time = new SimpleDateFormat("hh:mm:ss").format(new Date());
		return time;
	}

	@RequestMapping(value = "/login")
	public String login() {
		return "redirect:/";
	}

	@RequestMapping(value = "/logout")
	public String logout() {
		SecurityUtils.getSubject().logout();
		return "redirect:/";
	}
}
