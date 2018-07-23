package cn.believeus.init;

import javax.annotation.Resource;

import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

import cn.believeus.model.Tauthority;
import cn.believeus.model.Trole;
import cn.believeus.model.Tuser;
import cn.believeus.service.MySQLService;
import cn.believeus.variables.Variables;

@Component
public class InitAdmin implements ApplicationListener<ApplicationEvent>{
	
	@Resource
	private MySQLService service;
	
	// tomcat第一次启动会调用这个方法
	@Override
	public void onApplicationEvent(ApplicationEvent event) {
		// tomcat启动完毕调用该方法
		if(event instanceof ContextRefreshedEvent){
			Tuser user = (Tuser)service.findObject(Tuser.class, Variables.USER_NAME, "admin");
			if(user == null){
				 user = new Tuser();
				 user.setTruename("admin");
				 user.setUsername("admin");
				 user.setPassword("admin");
				 user.setSex("保密");
				 user.setStatus("7x24小时运转");
				 user.setDescription("该管理员拥有所有权限");
				 user.setLearnValue(500);
				 user.setLiveValue(500);
				 Trole role=new Trole();
				 role.setDescription("该角色拥有所有权限");
				 role.setRoleName("admin");
				 user.setRole(role);
				 service.saveOrUpdate(user);
				 Tauthority authority=new Tauthority();
				 authority.setPermission("*");
				 authority.setRole(role);
				 service.saveOrUpdate(authority);
			}
		}
	}
}
