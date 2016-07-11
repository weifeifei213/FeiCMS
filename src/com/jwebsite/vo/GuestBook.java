package com.jwebsite.vo;

public class GuestBook {
	private int guestID;
	private int  classID;
	private String guestName;
	private String guestEmail;
	private String guestIP;
	private String guestTitle;
	private String guestContent;
	private String guestDatetime;
	private int isReply;
	private String GuestReplyAdmin;
	private String GuestReply;
	private String GuestReplyDatetime;
	private int isShow;
	
	public int getIsShow() {
		return isShow;
	}
	public void setIsShow(int isShow) {
		this.isShow = isShow;
	}
	public int getClassID() {
		return classID;
	}
	public void setClassID(int classID) {
		this.classID = classID;
	}
	public String getGuestContent() {
		return guestContent;
	}
	public void setGuestContent(String guestContent) {
		this.guestContent = guestContent;
	}
	public String getGuestDatetime() {
		return guestDatetime;
	}
	public void setGuestDatetime(String guestDatetime) {
		this.guestDatetime = guestDatetime;
	}
	public String getGuestEmail() {
		return guestEmail;
	}
	public void setGuestEmail(String guestEmail) {
		this.guestEmail = guestEmail;
	}
	public int getGuestID() {
		return guestID;
	}
	public void setGuestID(int guestID) {
		this.guestID = guestID;
	}
	public String getGuestIP() {
		return guestIP;
	}
	public void setGuestIP(String guestIP) {
		this.guestIP = guestIP;
	}
	public String getGuestName() {
		return guestName;
	}
	public void setGuestName(String guestName) {
		this.guestName = guestName;
	}
	public String getGuestTitle() {
		return guestTitle;
	}
	public void setGuestTitle(String guestTitle) {
		this.guestTitle = guestTitle;
	}
	public String getGuestReply() {
		return GuestReply;
	}
	public void setGuestReply(String guestReply) {
		GuestReply = guestReply;
	}
	public String getGuestReplyAdmin() {
		return GuestReplyAdmin;
	}
	public void setGuestReplyAdmin(String guestReplyAdmin) {
		GuestReplyAdmin = guestReplyAdmin;
	}
	public String getGuestReplyDatetime() {
		return GuestReplyDatetime;
	}
	public void setGuestReplyDatetime(String guestReplyDatetime) {
		GuestReplyDatetime = guestReplyDatetime;
	}
	public int getIsReply() {
		return isReply;
	}
	public void setIsReply(int isReply) {
		this.isReply = isReply;
	}
	

}
