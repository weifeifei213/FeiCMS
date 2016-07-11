package com.jwebsite.vo;

public class RoleRight {
	private Integer ID;//ID    
	private Integer RoleID;//角色ID
	private String PurviewCode;//权限名称  
	private String PurviewValue;//权限值
	public Integer getID() {
		return ID;
	}
	public void setID(Integer iD) {
		ID = iD;
	}
	public Integer getRoleID() {
		return RoleID;
	}
	public void setRoleID(Integer roleID) {
		RoleID = roleID;
	}
	public String getPurviewCode() {
		return PurviewCode;
	}
	public void setPurviewCode(String purviewCode) {
		PurviewCode = purviewCode;
	}
	public String getPurviewValue() {
		return PurviewValue;
	}
	public void setPurviewValue(String purviewValue) {
		PurviewValue = purviewValue;
	}

}
