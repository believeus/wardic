package cn.believeus.model;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Type;

@Table(name = "data")
@Entity
public class Tdata extends TbaseEntity implements java.io.Serializable {

	private static final long serialVersionUID = -3416419788711416943L;
	private String content;
	private Titem item;

	@Type(type="text")
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	
	@ManyToOne
	@JoinColumn(name = "fk_itemId", referencedColumnName = "id")
	public Titem getItem() {
		return item;
	}

	public void setItem(Titem item) {
		this.item = item;
	}

}