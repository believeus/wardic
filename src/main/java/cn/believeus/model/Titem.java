package cn.believeus.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.persistence.Transient;

@Table(name = "item")
@Entity
public class Titem {

	private int id;
	private String title;
	private int pid;
	private int oid;// 排序号
	private Titem parent;
	private List<Titem> child = new ArrayList<Titem>();
	private Tdata databox;

	public Titem() {
		
	}

	public Titem(int id, String title, int oid) {
		this.id = id;
		this.title = title;
		this.oid = oid;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@OneToMany(mappedBy = "parent", cascade = CascadeType.ALL)
	@OrderBy("oid asc")
	public List<Titem> getChild() {
		return child;
	}
	
	@OneToOne(mappedBy="item",fetch=FetchType.LAZY)
	public Tdata getDatabox() {
		return databox;
	}

	public void setDatabox(Tdata databox) {
		this.databox = databox;
	}

	@ManyToOne
	@JoinColumn(name = "pid")
	public Titem getParent() {
		return parent;
	}

	public void setParent(Titem parent) {
		this.parent = parent;
	}

	public void setChild(List<Titem> child) {
		this.child = child;
	}

	@Transient
	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public int getOid() {
		return oid;
	}

	public void setOid(int oid) {
		this.oid = oid;
	}

}