package com.jwebsite.vo;

public class Announce {
	private Integer ID;// 公共ID
	private String Title;// 公告标题
	private String Content;// 公共内容
	private String Author;// 作者
	private String DateAndTime;// 添加时间
	private Integer IsSelected;// 被选中
	private Integer ShowType;// 显示类型
	private Integer OutTime;// 公告天数
	public Integer getID() {
		return ID;
	}
	public void setID(Integer iD) {
		ID = iD;
	}
	public String getTitle() {
		return Title;
	}
	public void setTitle(String title) {
		Title = title;
	}
	public String getContent() {
		return Content;
	}
	public void setContent(String content) {
		Content = content;
	}
	public String getAuthor() {
		return Author;
	}
	public void setAuthor(String author) {
		Author = author;
	}
	public String getDateAndTime() {
		return DateAndTime;
	}
	public void setDateAndTime(String dateAndTime) {
		DateAndTime = dateAndTime;
	}
	public Integer getIsSelected() {
		return IsSelected;
	}
	public void setIsSelected(Integer isSelected) {
		IsSelected = isSelected;
	}
	public Integer getShowType() {
		return ShowType;
	}
	public void setShowType(Integer showType) {
		ShowType = showType;
	}
	public Integer getOutTime() {
		return OutTime;
	}
	public void setOutTime(Integer outTime) {
		OutTime = outTime;
	}

}
