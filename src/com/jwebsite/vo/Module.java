package com.jwebsite.vo;

public class Module {

	private Integer ModuleID; 
	private String  ModuleName;// 模块名称 
	private Integer ParentModuleID;// 父节点ID 
	private String  ModuleCode;// 模块编码 
	private Integer IsSystem;// 是否为系统模块:系统模块不可以关闭 
	private String  Directory;// 模块目录 
	private String  ModulePage;// 模块页面 
	private Integer Closed;// 是否关闭 
	
	public Integer getModuleID() {
		return ModuleID;
	}
	public void setModuleID(Integer moduleID) {
		ModuleID = moduleID;
	}
	public String getModuleName() {
		return ModuleName;
	}
	public void setModuleName(String moduleName) {
		ModuleName = moduleName;
	}
	public Integer getParentModuleID() {
		return ParentModuleID;
	}
	public void setParentModuleID(Integer parentModuleID) {
		ParentModuleID = parentModuleID;
	}
	public String getModuleCode() {
		return ModuleCode;
	}
	public void setModuleCode(String moduleCode) {
		ModuleCode = moduleCode;
	}
	public Integer getIsSystem() {
		return IsSystem;
	}
	public void setIsSystem(Integer isSystem) {
		IsSystem = isSystem;
	}
	public String getDirectory() {
		return Directory;
	}
	public void setDirectory(String directory) {
		Directory = directory;
	}
	public String getModulePage() {
		return ModulePage;
	}
	public void setModulePage(String modulePage) {
		ModulePage = modulePage;
	}
	public Integer getClosed() {
		return Closed;
	}
	public void setClosed(Integer closed) {
		Closed = closed;
	}
	
	

}
