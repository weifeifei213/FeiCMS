package com.jwebsite.vo;

public class TemplateProject {
	private Integer TemplateProjectID;
	private String TemplateProjectName;
	private String TemplateProjectURL ;
	private String Intro;
	private Integer IsDefault;
	private Integer Enable;
	
	public Integer getTemplateProjectID() {
		return TemplateProjectID;
	}
	public void setTemplateProjectID(Integer templateProjectID) {
		TemplateProjectID = templateProjectID;
	}
	public String getTemplateProjectName() {
		return TemplateProjectName;
	}
	public void setTemplateProjectName(String templateProjectName) {
		TemplateProjectName = templateProjectName;
	}
	public String getTemplateProjectURL() {
		return TemplateProjectURL;
	}
	public void setTemplateProjectURL(String templateProjectURL) {
		TemplateProjectURL = templateProjectURL;
	}
	public String getIntro() {
		return Intro;
	}
	public void setIntro(String intro) {
		Intro = intro;
	}
	public Integer getIsDefault() {
		return IsDefault;
	}
	public void setIsDefault(Integer isDefault) {
		IsDefault = isDefault;
	}
	public Integer getEnable() {
		return Enable;
	}
	public void setEnable(Integer enable) {
		Enable = enable;
	}

}
