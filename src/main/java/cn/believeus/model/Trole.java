package cn.believeus.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table
public class Trole extends TbaseEntity{

	private static final long serialVersionUID = 3691434950191147508L;
	
	private String roleName;
	private String description;
	private Tuser user;
	private List<Tauthority> authoritys=new ArrayList<Tauthority>();
	
	@OneToMany(mappedBy="role",cascade=CascadeType.ALL,fetch=FetchType.LAZY)
	public List<Tauthority> getAuthoritys() {
		return authoritys;
	}
	public void setAuthoritys(List<Tauthority> authoritys) {
		this.authoritys = authoritys;
	}
	
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	@OneToOne(mappedBy = "role")
	public Tuser getUser() {
		return user;
	}
	public void setUser(Tuser user) {
		this.user = user;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
}
