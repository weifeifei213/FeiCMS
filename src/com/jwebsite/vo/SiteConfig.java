package com.jwebsite.vo;

public class SiteConfig {
	private Integer SiteID; // 主键 站点ID
	private String SiteName; // 站点名称
	private String SiteTitle; // 网站标题
	private String SiteUrl; // 网站域名
	private String SiteEmail; // 管理员Email
	private String InstallDir; // 安装目录
	private String LogoUrl; // 网站logo
	private String BannerUrl; // 横幅网址
	private String TechnicalSupport; // 技术支持
	private String Copyright; // 网站版权
	private String Meta_Keywords; // 网站关键词
	private String Meta_Description; // 网站描述
	private Integer TemplateProjectID;// 模板方案ID

	public String getSiteName() {
		return SiteName;
	}

	public void setSiteName(String siteName) {
		SiteName = siteName;
	}

	public Integer getSiteID() {
		return SiteID;
	}

	public void setSiteID(Integer siteID) {
		SiteID = siteID;
	}

	public String getSiteTitle() {
		return SiteTitle;
	}

	public void setSiteTitle(String siteTitle) {
		SiteTitle = siteTitle;
	}

	public String getSiteUrl() {
		return SiteUrl;
	}

	public void setSiteUrl(String siteUrl) {
		SiteUrl = siteUrl;
	}

	public String getInstallDir() {
		return InstallDir;
	}

	public void setInstallDir(String installDir) {
		InstallDir = installDir;
	}

	public String getLogoUrl() {
		return LogoUrl;
	}

	public void setLogoUrl(String logoUrl) {
		LogoUrl = logoUrl;
	}

	public String getBannerUrl() {
		return BannerUrl;
	}

	public void setBannerUrl(String bannerUrl) {
		BannerUrl = bannerUrl;
	}

	public String getTechnicalSupport() {
		return TechnicalSupport;
	}

	public void setTechnicalSupport(String technicalSupport) {
		TechnicalSupport = technicalSupport;
	}

	public String getCopyright() {
		return Copyright;
	}

	public void setCopyright(String copyright) {
		Copyright = copyright;
	}

	public String getMeta_Keywords() {
		return Meta_Keywords;
	}

	public void setMeta_Keywords(String metaKeywords) {
		Meta_Keywords = metaKeywords;
	}

	public String getMeta_Description() {
		return Meta_Description;
	}

	public void setMeta_Description(String metaDescription) {
		Meta_Description = metaDescription;
	}

	public String getSiteEmail() {
		return SiteEmail;
	}

	public void setSiteEmail(String siteEmail) {
		SiteEmail = siteEmail;
	}

	public Integer getTemplateProjectID() {
		return TemplateProjectID;
	}

	public void setTemplateProjectID(Integer templateProjectID) {
		TemplateProjectID = templateProjectID;
	}

}
