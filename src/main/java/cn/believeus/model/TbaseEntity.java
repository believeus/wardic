package cn.believeus.model;

import java.io.Serializable;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import org.hibernate.CallbackException;
import org.hibernate.Session;
import org.hibernate.classic.Lifecycle;

@MappedSuperclass
public class TbaseEntity implements Serializable,Lifecycle {
	
	private static final long serialVersionUID = -4017940130624140047L;
	
	public int id;
	public String status;
	public long createTime;
	public long editTime;

	@Id
	// MySQL/SQLServer: @GeneratedValue(strategy = GenerationType.AUTO)
	// Oracle: @GeneratedValue(strategy = GenerationType.AUTO, generator =
	// "sequenceGenerator")
	@GeneratedValue(strategy = GenerationType.AUTO)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public long getCreateTime() {
		return createTime;
	}

	public void setCreateTime(long createTime) {
		this.createTime = createTime;
	}

	/* @OrderBy("editTime ASC") */
	public long getEditTime() {
		return editTime;
	}

	public void setEditTime(long editTime) {
		this.editTime = editTime;
	}

	//wuqiwei 当保存的时候自动设置editTime和createTime无需手工设置
	@Override
	public boolean onSave(Session s) throws CallbackException {
		createTime=editTime=System.currentTimeMillis();
		return false;
	}
	//wuqiwei 当更新的时候自动设置editTime无需手工设置
	@Override
	public boolean onUpdate(Session s) throws CallbackException {
		TbaseEntity entity=(TbaseEntity)s.get(this.getClass(), id);
		this.createTime=entity.getCreateTime();
		this.editTime=System.currentTimeMillis();
		return false;
	}

	@Override
	public boolean onDelete(Session s) throws CallbackException {
		return false;
	}

	@Override
	public void onLoad(Session s, Serializable id) {
		
	}
}
