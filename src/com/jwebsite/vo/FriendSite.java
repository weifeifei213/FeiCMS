package com.jwebsite.vo;

public class FriendSite {
	private int iD;
	private int classID;
	private int linkType;
	private String siteName;
	private String siteUrl;
	private String siteIntro;
	private String logoUrl;
	private String siteEmail;
	private String hits;
	private String updateTime;
	private int elite;
	private int orderID;
	public int getClassID() {
		return classID;
	}
	public void setClassID(int classID) {
		this.classID = classID;
	}
	public int getElite() {
		return elite;
	}
	public void setElite(int elite) {
		this.elite = elite;
	}
	public String getHits() {
		return hits;
	}
	public void setHits(String hits) {
		this.hits = hits;
	}
	public int getID() {
		return iD;
	}
	public void setID(int id) {
		iD = id;
	}
	public int getLinkType() {
		return linkType;
	}
	public void setLinkType(int linkType) {
		this.linkType = linkType;
	}
	public String getLogoUrl() {
		return logoUrl;
	}
	public void setLogoUrl(String logoUrl) {
		this.logoUrl = logoUrl;
	}
	public int getOrderID() {
		return orderID;
	}
	public void setOrderID(int orderID) {
		this.orderID = orderID;
	}
	public String getSiteEmail() {
		return siteEmail;
	}
	public void setSiteEmail(String siteEmail) {
		this.siteEmail = siteEmail;
	}
	public String getSiteIntro() {
		return siteIntro;
	}
	public void setSiteIntro(String siteIntro) {
		this.siteIntro = siteIntro;
	}
	public String getSiteName() {
		return siteName;
	}
	public void setSiteName(String siteName) {
		this.siteName = siteName;
	}
	public String getSiteUrl() {
		return siteUrl;
	}
	public void setSiteUrl(String siteUrl) {
		this.siteUrl = siteUrl;
	}
	public String getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
	
}