package com.jwebsite.vo;

public class ArticleClass {
	private int classID;//栏目ID
	private int ChannelID;//频道ID
	private String  className;//栏目名称
	private int parentID;//父栏目
	private String parentPath;//父路径
	private int depth;//栏目深度
	private int rootID;//根ID
	private int child;//子栏目数
	private String arrChildID;//所有子栏目
	private int prevID;//上一个栏目ID
	private int NextID;//下一个栏目ID
	private String  readme;//栏目说明
	private String  classDir;//栏目目录
	
	
	public int getClassID() {
		return classID;
	}
	public void setClassID(int classID) {
		this.classID = classID;
	}
	public int getChannelID() {
		return ChannelID;
	}
	public void setChannelID(int channelID) {
		ChannelID = channelID;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public int getParentID() {
		return parentID;
	}
	public void setParentID(int parentID) {
		this.parentID = parentID;
	}
	public String getParentPath() {
		return parentPath;
	}
	public void setParentPath(String parentPath) {
		this.parentPath = parentPath;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public int getRootID() {
		return rootID;
	}
	public void setRootID(int rootID) {
		this.rootID = rootID;
	}
	public int getChild() {
		return child;
	}
	public void setChild(int child) {
		this.child = child;
	}
	public String getArrChildID() {
		return arrChildID;
	}
	public void setArrChildID(String arrChildID) {
		this.arrChildID = arrChildID;
	}
	public int getPrevID() {
		return prevID;
	}
	public void setPrevID(int prevID) {
		this.prevID = prevID;
	}
	public int getNextID() {
		return NextID;
	}
	public void setNextID(int nextID) {
		NextID = nextID;
	}
	public String getReadme() {
		return readme;
	}
	public void setReadme(String readme) {
		this.readme = readme;
	}
	public String getClassDir() {
		return classDir;
	}
	public void setClassDir(String classDir) {
		this.classDir = classDir;
	}
	
	
	

}
