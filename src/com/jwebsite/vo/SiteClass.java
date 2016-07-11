package com.jwebsite.vo;

public class SiteClass {
	private Integer ClassID;//栏目ID
	private Integer ModelID;//频道ID
	private String  ClassName;//栏目名称
	private Integer ParentID;//父栏目
	private String ParentPath;//父路径
	private Integer Depth;//栏目深度
	private Integer RootID;//根ID
	private Integer Child;//子栏目数
	private String ArrChildID;//所有子栏目
	private Integer PrevID;//上一个栏目ID
	private Integer NextID;//下一个栏目ID
	private String  Readme;//栏目说明
	private String  ClassDir;//栏目目录	
	private String  ParentDir;//父节点目录
	
	private Integer  IsShow; //是否在首页显示
	private Integer IsOutsideLink; //是否外部链接
	private String LinkURL; //链接地址
	private Integer IsPage; //是否单页
	private Integer SiteID; //所属站点
	
	public Integer getClassID() {
		return ClassID;
	}
	public void setClassID(Integer classID) {
		ClassID = classID;
	}
	
	public Integer getModelID() {
		return ModelID;
	}
	public void setModelID(Integer modelID) {
		ModelID = modelID;
	}
	public String getClassName() {
		return ClassName;
	}
	public void setClassName(String className) {
		ClassName = className;
	}
	public Integer getParentID() {
		return ParentID;
	}
	public void setParentID(Integer parentID) {
		ParentID = parentID;
	}
	public String getParentPath() {
		return ParentPath;
	}
	public void setParentPath(String parentPath) {
		ParentPath = parentPath;
	}
	public Integer getDepth() {
		return Depth;
	}
	public void setDepth(Integer depth) {
		Depth = depth;
	}
	public Integer getRootID() {
		return RootID;
	}
	public void setRootID(Integer rootID) {
		RootID = rootID;
	}
	public Integer getChild() {
		return Child;
	}
	public void setChild(Integer child) {
		Child = child;
	}
	public String getArrChildID() {
		return ArrChildID;
	}
	public void setArrChildID(String arrChildID) {
		this.ArrChildID = arrChildID;
	}
	public Integer getPrevID() {
		return PrevID;
	}
	public void setPrevID(Integer prevID) {
		PrevID = prevID;
	}
	public Integer getNextID() {
		return NextID;
	}
	public void setNextID(Integer nextID) {
		NextID = nextID;
	}
	public String getReadme() {
		return Readme;
	}
	public void setReadme(String readme) {
		Readme = readme;
	}
	public String getClassDir() {
		return ClassDir;
	}
	public void setClassDir(String classDir) {
		ClassDir = classDir;
	}	
	public String getParentDir() {
		return ParentDir;
	}
	public void setParentDir(String parentDir) {
		ParentDir = parentDir;
	}
	public Integer getIsShow() {
		return IsShow;
	}
	public void setIsShow(Integer isShow) {
		IsShow = isShow;
	}
	public Integer getIsOutsideLink() {
		return IsOutsideLink;
	}
	public void setIsOutsideLink(Integer isOutsideLink) {
		IsOutsideLink = isOutsideLink;
	}
	public String getLinkURL() {
		return LinkURL;
	}
	public void setLinkURL(String linkURL) {
		LinkURL = linkURL;
	}
	public Integer getIsPage() {
		return IsPage;
	}
	public void setIsPage(Integer isPage) {
		IsPage = isPage;
	}
	public Integer getSiteID() {
		return SiteID;
	}
	public void setSiteID(Integer siteID) {
		SiteID = siteID;
	}
	
	
}
