package com.jwebsite.pub;

import com.jwebsite.dao.*;
import com.jwebsite.daoimpl.*;

public class DAOFactory {
	//文章管理
	public static ArticleDao getArticleDAOInstance() {
		return new ArticleDaoImpl();
	}
	//友情链接类别管理
	public static FriendSiteClassDao getFriendSiteClassDao() {
		return new FriendSiteClassDaoImpl();
	}
	//友情链接管理
	public static FriendSiteDao getFriendSiteDao() {
		return new FriendSiteDaoImpl();
	}
	//公告管理
	public static AnnounceDao getAnnounceDao() {
		return new AnnounceDaoImpl();
	}	
	//调查管理
	public static VoteDao getVoteDaoInstance() {
		return new VoteDaoImpl();
	}
	//留言管理
	public static GuestBookDao getGuestBookDao() {
		return new GuestBookDaoImpl();
	}
	//专题管理
	public static SpecialDao getSpecialDao() {
		return new SpecialDaoImpl();
	}
	//文章类别管理
	public static ArticleClassDao getArticleClassDaoInstance() {
		return new ArticleClassDaoImpl();
	}	
	//管理员管理
	public static AdminDao getAdminDaoInstance() {
		return new AdminDaoImpl();
	}
	//考试管理
	public static TestDao getTestDaoInstance() {
		return new TestDaoImpl();
	}
	//试题管理
	public static QuestionDao getQuestionDaoInstance() {
		return new QuestionDaoImpl();
	}
	//前台显示
	public static OnstageDao getOnstageDaoInstance() {
		return new OnstageDaoImpl();
	}
	//值班管理
	public static OnDutyDao getOnDuty() {
		return new OnDutyDapImpl();
	}
	//站内邮件
	public static EmailDao getEmailInfo(){
		return new EmailDaoImpl();
	}
	//图片管理
	public static PhotoDao getPhotoDao(){
		return new PhotoDaoImpl();
	}
	//图片类别管理
	public static PhotoClassDao getPhotoClassDao(){		
		return new PhotoClassDaoImpl();
	}
	//用户管理
	public static UserDao getUserDao(){return new UserDaoImpl();}
	//用户组管理
	public static UserGroupDao getUserGroupDao(){return new UserGroupDaoImpl();}	
	//栏目管理
	public static SiteClassDao getSiteClassDao(){return new SiteClassDaoImpl();}
	//站点管理
	public static SiteDao getSiteDao(){return new SiteDaoImpl();}
	//模板方案管理
	public static TemplateProjectDao getTemplateProjectDao(){return new TemplateProjectDaoImpl();}
	//模板管理
	public static TemplateDao getTemplateDao(){return new TemplateDaoImpl();}
	//模型管理
	public static ModelDao getModelDao(){return new ModelDaoImpl();}
	//模板类型管理
	public static TemplateTypeDao getTemplateTypeDao(){return new TemplateTypeDaoImpl();}
	
}
