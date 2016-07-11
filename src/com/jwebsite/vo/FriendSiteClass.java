package com.jwebsite.vo;
/**
 * 友情链接数据模型
 * @author 魏飞飞 *
 */
public class FriendSiteClass {
	private int ClassID;
	private String ClassName;
	private String ReadMe;
	private Integer OrderID;
	
	public int getClassID() {
		return ClassID;
	}
	public void setClassID(int classID) {
		ClassID = classID;
	}
	public String getClassName() {
		return ClassName;
	}
	public void setClassName(String className) {
		ClassName = className;
	}
	public String getReadMe() {
		return ReadMe;
	}
	public void setReadMe(String readMe) {
		ReadMe = readMe;
	}
	public Integer getOrderID() {
		return OrderID;
	}
	public void setOrderID(Integer orderID) {
		OrderID = orderID;
	}
	
	
}
