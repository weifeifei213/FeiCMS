package com.jwebsite.vo;

public class Role {	
	private Integer  RoleID;               
	private String RoleName;//角色名称  
	private String Description;//角色描述  
	private Integer ListOrder;//排序        
	private Integer Disabled;//禁用        
	
	public Integer getRoleID() {
		return RoleID;
	}
	public void setRoleID(Integer roleID) {
		RoleID = roleID;
	}
	public String getRoleName() {
		return RoleName;
	}
	public void setRoleName(String roleName) {
		RoleName = roleName;
	}
	public String getDescription() {
		return Description;
	}
	public void setDescription(String description) {
		Description = description;
	}
	public Integer getListOrder() {
		return ListOrder;
	}
	public void setListOrder(Integer listOrder) {
		ListOrder = listOrder;
	}
	public Integer getDisabled() {
		return Disabled;
	}
	public void setDisabled(Integer disabled) {
		Disabled = disabled;
	}
	
	

}
