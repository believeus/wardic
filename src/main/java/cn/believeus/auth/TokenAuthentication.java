package cn.believeus.auth;

import org.apache.shiro.authc.UsernamePasswordToken;

/**
 * 登录令牌
 * 
 * @author e3dmall Team
 * @version 1.0
 */
public class TokenAuthentication extends UsernamePasswordToken {

	private static final long serialVersionUID = 5898441540965086534L;

	/** 验证码ID */
	private String captchaId;

	/** 验证码 */
	private String captcha;

	/**
	 * @param username
	 *            用户名
	 * @param password
	 *            密码
	 * @param captchaId
	 *            验证码ID
	 * @param captcha
	 *            验证码
	 * @param rememberMe
	 *            记住我
	 * @param host
	 *            IP
	 */
	public TokenAuthentication(String username, String password, String captchaId, String captcha, boolean rememberMe, String host) {
		super(username, password, rememberMe);
		this.captchaId = captchaId;
		this.captcha = captcha;
	}
   public TokenAuthentication(String username,String password){
	   super(username, password);
   }
   public TokenAuthentication(String username,String password,boolean rememberMe){
	   super(username, password,rememberMe);
   }
	/**
	 * 获取验证码ID
	 * 
	 * @return 验证码ID
	 */
	public String getCaptchaId() {
		return captchaId;
	}

	/**
	 * 设置验证码ID
	 * 
	 * @param captchaId
	 *            验证码ID
	 */
	public void setCaptchaId(String captchaId) {
		this.captchaId = captchaId;
	}

	/**
	 * 获取验证码
	 * 
	 * @return 验证码
	 */
	public String getCaptcha() {
		return captcha;
	}

	/**
	 * 设置验证码
	 * 
	 * @param captcha
	 *            验证码
	 */
	public void setCaptcha(String captcha) {
		this.captcha = captcha;
	}

}