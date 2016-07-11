package com.jwebsite.vo;

public class Template {
	private Integer TemplateID; //主键
	private Integer ModelID;//频道ID
	private String TemplateName;//模板名称
	private Integer TemplateType;//模板类型
	private String TemplateContent;//模板内容
	private Integer IsDefault;//默认模板
	private Integer ProjectID;	//方案ID
	private Integer IsDefaultInProject;// 在方案中为默认
	private Integer Deleted;//是否被删除
	
	public Integer getTemplateID() {
		return TemplateID;
	}
	public void setTemplateID(Integer templateID) {
		TemplateID = templateID;
	}
	public Integer getModelID() {
		return ModelID;
	}
	public void setModelID(Integer modelID) {
		ModelID = modelID;
	}
	public String getTemplateName() {
		return TemplateName;
	}
	public void setTemplateName(String templateName) {
		TemplateName = templateName;
	}
	public Integer getTemplateType() {
		return TemplateType;
	}
	public void setTemplateType(Integer templateType) {
		TemplateType = templateType;
	}
	public String getTemplateContent() {
		return TemplateContent;
	}
	public void setTemplateContent(String templateContent) {
		TemplateContent = templateContent;
	}
	public Integer getIsDefault() {
		return IsDefault;
	}
	public void setIsDefault(Integer isDefault) {
		IsDefault = isDefault;
	}
	public Integer getProjectID() {
		return ProjectID;
	}
	public void setProjectID(Integer projectID) {
		ProjectID = projectID;
	}
	public Integer getIsDefaultInProject() {
		return IsDefaultInProject;
	}
	public void setIsDefaultInProject(Integer isDefaultInProject) {
		IsDefaultInProject = isDefaultInProject;
	}
	public Integer getDeleted() {
		return Deleted;
	}
	public void setDeleted(Integer deleted) {
		Deleted = deleted;
	}
}
