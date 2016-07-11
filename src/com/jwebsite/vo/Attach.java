package com.jwebsite.vo;

/**
 * 附件表
 * @author 木鱼
 *
 */
public class Attach {
	private Integer ID;
	private String ArticleID;
	private String AttachUrl;
	private String UploadTime;
	private Integer Deleted;
	private Integer AttachType;
	
	public Integer getID() {
		return ID;
	}
	public void setID(Integer iD) {
		ID = iD;
	}
	public String getArticleID() {
		return ArticleID;
	}
	public void setArticleID(String articleID) {
		ArticleID = articleID;
	}
	public String getAttachUrl() {
		return AttachUrl;
	}
	public void setAttachUrl(String attachUrl) {
		AttachUrl = attachUrl;
	}
	public String getUploadTime() {
		return UploadTime;
	}
	public void setUploadTime(String uploadTime) {
		UploadTime = uploadTime;
	}
	public Integer getDeleted() {
		return Deleted;
	}
	public void setDeleted(Integer deleted) {
		Deleted = deleted;
	}
	public Integer getAttachType() {
		return AttachType;
	}
	public void setAttachType(Integer attachType) {
		AttachType = attachType;
	}
	
	
}
