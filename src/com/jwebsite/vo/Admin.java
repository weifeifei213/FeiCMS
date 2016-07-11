package com.jwebsite.vo;

public class Admin {
	private int id;
	private String adminName;
	private String Password;
	private int purview;
	private String roleName;
	private String lastLoginIP;
	private String lastLoginTime;
	private String lastLogoutTime;
	private int loginTimes;
	private String AdminPopList;
	private String adminPurview_Article;
	private String adminPurview_Others;
	private String arrClass_View;
	private String arrClass_Input;
	private String arrClass_Check;
	private String arrClass_Manage;
	private int sendmessageid;
	
	public int getSendmessageid() {
		return sendmessageid;
	}
	public void setSendmessageid(int sendmessageid) {
		this.sendmessageid = sendmessageid;
	}
	public String getAdminPurview_Article() {
		return adminPurview_Article;
	}
	public void setAdminPurview_Article(String adminPurview_Article) {
		this.adminPurview_Article = adminPurview_Article;
	}
	public String getArrClass_Check() {
		return arrClass_Check;
	}
	public void setArrClass_Check(String arrClass_Check) {
		this.arrClass_Check = arrClass_Check;
	}
	public String getArrClass_Input() {
		return arrClass_Input;
	}
	public void setArrClass_Input(String arrClass_Input) {
		this.arrClass_Input = arrClass_Input;
	}
	public String getArrClass_Manage() {
		return arrClass_Manage;
	}
	public void setArrClass_Manage(String arrClass_Manage) {
		this.arrClass_Manage = arrClass_Manage;
	}
	public String getArrClass_View() {
		return arrClass_View;
	}
	public void setArrClass_View(String arrClass_View) {
		this.arrClass_View = arrClass_View;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getLastLoginIP() {
		return lastLoginIP;
	}
	public void setLastLoginIP(String lastLoginIP) {
		this.lastLoginIP = lastLoginIP;
	}
	public String getLastLoginTime() {
		return lastLoginTime;
	}
	public void setLastLoginTime(String lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}
	public String getLastLogoutTime() {
		return lastLogoutTime;
	}
	public void setLastLogoutTime(String lastLogoutTime) {
		this.lastLogoutTime = lastLogoutTime;
	}
	public int getLoginTimes() {
		return loginTimes;
	}
	public void setLoginTimes(int loginTimes) {
		this.loginTimes = loginTimes;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	public int getPurview() {
		return purview;
	}
	public void setPurview(int purview) {
		this.purview = purview;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public String getAdminPurview_Others() {
		return adminPurview_Others;
	}
	public void setAdminPurview_Others(String adminPurview_Others) {
		this.adminPurview_Others = adminPurview_Others;
	}
	public String getAdminPopList() {
		return AdminPopList;
	}
	public void setAdminPopList(String adminPopList) {
		AdminPopList = adminPopList;
	}
	

}
