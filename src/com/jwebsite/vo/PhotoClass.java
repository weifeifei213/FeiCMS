package com.jwebsite.vo;




public class PhotoClass {
	// Fields
	private Integer ClassID;
	private String ClassName;
	private Integer OrderID;
	private Integer ChannelID;
	private Integer ParentID;
	private String ParentPath;
	private Integer Depth;
	private Integer RootID;
	private Integer Child;
	private String ArrChildID;
	private Integer PrevID;
	private Integer NextID;
	private String Readme;
	private String ClassDir;
	private String ParentDir;
	private Integer isShow;
	
	
	public Integer getClassID() {
		return ClassID;
	}
	public void setClassID(Integer classID) {
		ClassID = classID;
	}
	public String getClassName() {
		return ClassName;
	}
	public void setClassName(String className) {
		ClassName = className;
	}
	public Integer getOrderID() {
		return OrderID;
	}
	public void setOrderID(Integer orderID) {
		OrderID = orderID;
	}
	public Integer getChannelID() {
		return ChannelID;
	}
	public void setChannelID(Integer channelID) {
		ChannelID = channelID;
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
		ArrChildID = arrChildID;
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
		return isShow;
	}
	public void setIsShow(Integer isShow) {
		this.isShow = isShow;
	}	
}