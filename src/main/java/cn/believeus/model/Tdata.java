package cn.believeus.model;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Type;

@Table(name = "data")
@Entity
public class Tdata extends TbaseEntity implements java.io.Serializable {

	private static final long serialVersionUID = -3416419788711416943L;
	private String content;
	private Titem item;
	public Tdata() {
	}
	public Tdata(String content){
		this.content=content;
	}
	@Type(type="text")
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	
	@OneToOne(mappedBy="databox")
	public Titem getItem() {
		return item;
	}

	public void setItem(Titem item) {
		this.item = item;
	}

}