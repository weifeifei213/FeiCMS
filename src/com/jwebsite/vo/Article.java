package com.jwebsite.vo;

public class Article {	
	private Integer ArticleID;//文章ID        
	private Integer  ClassID ;//栏目ID        
	private String ClassName;//栏目名称      
	private String  SpecialID ;//专题ID        
	private String Title;///文章标题      
	private String Inputer ;//作者          
	private String Keyword;//关键词        
	private Integer Hits;//访问量        
	private String UpdateTime;//修改时间      
	private String CreateTime;//创建时间      
	private Integer OnTop;//置顶          
	private Integer Elite;//推荐          
	private Integer Status ;//状态 审核     
	private Integer IfTohtml ;//是否静态化    
	private String URL;// 静态地址      
	private String Content;//内容          
	private Integer IncludePic;//首页图片      
	private String DefaultPicUrl;//图片路径      
	private Integer IncludeFile;//附件          
	private String UploadFiles;//附件地址      
	private Integer PaginationType;//分页类型      
	private Integer Deleted;//删除          
	private Integer TemplateID;//模板          
	private Integer MaxCharPerPage;//自动分页时的每页大约字符数（包含HTML标记） 
	private Integer ReadPoint;//分数，点数    
	private String Abstract;//内容摘要      
	private Integer ListOrder;//排序          
	private Integer IsLink;//链接          
	public Integer getArticleID() {
		return ArticleID;
	}
	public void setArticleID(Integer articleID) {
		ArticleID = articleID;
	}
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
	
	public String getSpecialID() {
		return SpecialID;
	}
	public void setSpecialID(String specialID) {
		SpecialID = specialID;
	}
	public String getTitle() {
		return Title;
	}
	public void setTitle(String title) {
		Title = title;
	}
	public String getInputer() {
		return Inputer;
	}
	public void setInputer(String inputer) {
		Inputer = inputer;
	}
	public String getKeyword() {
		return Keyword;
	}
	public void setKeyword(String keyword) {
		Keyword = keyword;
	}
	public Integer getHits() {
		return Hits;
	}
	public void setHits(Integer hits) {
		Hits = hits;
	}
	public String getUpdateTime() {
		return UpdateTime;
	}
	public void setUpdateTime(String updateTime) {
		UpdateTime = updateTime;
	}
	public String getCreateTime() {
		return CreateTime;
	}
	public void setCreateTime(String createTime) {
		CreateTime = createTime;
	}
	public Integer getOnTop() {
		return OnTop;
	}
	public void setOnTop(Integer onTop) {
		OnTop = onTop;
	}
	public Integer getElite() {
		return Elite;
	}
	public void setElite(Integer elite) {
		Elite = elite;
	}
	public Integer getStatus() {
		return Status;
	}
	public void setStatus(Integer status) {
		Status = status;
	}
	public Integer getIfTohtml() {
		return IfTohtml;
	}
	public void setIfTohtml(Integer ifTohtml) {
		IfTohtml = ifTohtml;
	}
	public String getURL() {
		return URL;
	}
	public void setURL(String uRL) {
		URL = uRL;
	}
	public String getContent() {
		return Content;
	}
	public void setContent(String content) {
		Content = content;
	}
	public Integer getIncludePic() {
		return IncludePic;
	}
	public void setIncludePic(Integer includePic) {
		IncludePic = includePic;
	}
	public String getDefaultPicUrl() {
		return DefaultPicUrl;
	}
	public void setDefaultPicUrl(String defaultPicUrl) {
		DefaultPicUrl = defaultPicUrl;
	}
	public Integer getIncludeFile() {
		return IncludeFile;
	}
	public void setIncludeFile(Integer includeFile) {
		IncludeFile = includeFile;
	}
	public String getUploadFiles() {
		return UploadFiles;
	}
	public void setUploadFiles(String uploadFiles) {
		UploadFiles = uploadFiles;
	}
	public Integer getPaginationType() {
		return PaginationType;
	}
	public void setPaginationType(Integer paginationType) {
		PaginationType = paginationType;
	}
	public Integer getDeleted() {
		return Deleted;
	}
	public void setDeleted(Integer deleted) {
		Deleted = deleted;
	}
	public Integer getTemplateID() {
		return TemplateID;
	}
	public void setTemplateID(Integer templateID) {
		TemplateID = templateID;
	}
	public Integer getMaxCharPerPage() {
		return MaxCharPerPage;
	}
	public void setMaxCharPerPage(Integer maxCharPerPage) {
		MaxCharPerPage = maxCharPerPage;
	}
	public Integer getReadPoint() {
		return ReadPoint;
	}
	public void setReadPoint(Integer readPoint) {
		ReadPoint = readPoint;
	}
	public String getAbstract() {
		return Abstract;
	}
	public void setAbstract(String abstract1) {
		Abstract = abstract1;
	}
	public Integer getListOrder() {
		return ListOrder;
	}
	public void setListOrder(Integer listOrder) {
		ListOrder = listOrder;
	}
	public Integer getIsLink() {
		return IsLink;
	}
	public void setIsLink(Integer isLink) {
		IsLink = isLink;
	}
	


}
