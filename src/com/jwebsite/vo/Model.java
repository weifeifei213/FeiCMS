package com.jwebsite.vo;
/**
 * 栏目模型
 * @author 木鱼 *
 */
public class Model {
	private Integer ModelID;
	private String ModelName;
	private Integer ModelType;
	private Integer SiteID;
	public Integer getModelID() {
		return ModelID;
	}
	public void setModelID(Integer modelID) {
		ModelID = modelID;
	}
	public String getModelName() {
		return ModelName;
	}
	public void setModelName(String modelName) {
		ModelName = modelName;
	}
	public Integer getModelType() {
		return ModelType;
	}
	public void setModelType(Integer modelType) {
		ModelType = modelType;
	}
	public Integer getSiteID() {
		return SiteID;
	}
	public void setSiteID(Integer siteID) {
		SiteID = siteID;
	}	
	
	
	
	
}
