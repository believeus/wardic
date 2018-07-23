package cn.believeus.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.CallbackException;
import org.hibernate.Session;

@Entity
@Table
public class Tuser extends TbaseEntity {

	private static final long serialVersionUID = -7459216849514123828L;
	/** 联系方式 */
	private String phone;
	private String description;
	/** 注册密码 */
	private String password;
	private Trole role;
	private String sex;
	
	/** 紧急联系人 */
	private String urgent;

	/** 注册用户名 */
	private String username;
	private String truename;

	/** 学习积分 */
	private Integer  learnValue;
    
	/**生活积分*/
	private Integer  liveValue;
	
	
	public String getDescription() {
		return description;
	}

	public Integer getLearnValue() {
		return learnValue;
	}

	public Integer getLiveValue() {
		return liveValue;
	}

	public String getPassword() {
		return password;
	}


	public String getPhone() {
		return phone;
	}

	@OneToOne(cascade = CascadeType.ALL)
	public Trole getRole() {
		return role;
	}

	public String getSex() {
		return sex;
	}

	
	public String getTruename() {
		return truename;
	}


	public String getUrgent() {
		return urgent;
	}

	public String getUsername() {
		return username;
	}

	@Override
	public boolean onUpdate(Session s) throws CallbackException {
		return super.onUpdate(s);
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public void setLearnValue(Integer learnValue) {
		this.learnValue = learnValue;
	}

	public void setLiveValue(Integer liveValue) {
		this.liveValue = liveValue;
	}


	public void setPassword(String password) {
		this.password = password;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}


	public void setRole(Trole role) {
		this.role = role;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}



	public void setTruename(String truename) {
		this.truename = truename;
	}

	public void setUrgent(String urgent) {
		this.urgent = urgent;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	
	
	
}
