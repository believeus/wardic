package cn.believeus.model;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table
public class Tauthority extends TbaseEntity{

	private static final long serialVersionUID = -9077588934802148130L;
	
	private String permission;
	private Trole role;

	@ManyToOne
	@JoinColumn(name = "fk_roleId", referencedColumnName = "id")
	public Trole getRole() {
		return role;
	}
	public void setRole(Trole role) {
		this.role = role;
	}
	public String getPermission() {
		return permission;
	}
	public void setPermission(String permission) {
		this.permission = permission;
	}

	
}
