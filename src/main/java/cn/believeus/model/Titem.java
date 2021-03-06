package cn.believeus.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
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
	private String type;//folder or file
	private List<Titem> child = new ArrayList<Titem>();
	private Tdata databox;

	public Titem() {
		
	}

	public Titem(int id, String title, int oid,String type) {
		this.id = id;
		this.title = title;
		this.oid = oid;
		this.type=type;
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
	
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="fk_boxId",unique=true) //会在Iitem表上创建一个fk_boxId列
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

}