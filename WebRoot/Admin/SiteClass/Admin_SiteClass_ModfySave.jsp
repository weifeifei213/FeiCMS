<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="../PubPackage.jsp"%>
<%
	String action = request.getParameter("Action");
	ArticleClassDao articleClassDao=new ArticleClassDaoImpl();
	
	if (action.equals("Del")) {
	String adminPopNum="POP000103";
	if(!DAOFactory.getAdminDaoInstance().checkAdminPopedom(Integer.parseInt(session.getAttribute("AdminID").toString()),adminPopNum))
	{
	 JS.ErrCode(response,"你没有足够的权限！请与管理员联系！");
	 JS.goBack(response,-1);
	 return;
	}
		if (request.getParameter("ClassID") == null
		|| "".equals(request.getParameter("ClassID"))) {
			JS.AlertCode(response, "参数传递错误！");
			JS.goBack(response, -1);
		} else {
         int classID=Integer.parseInt(request.getParameter("ClassID"));       
         articleClassDao.delClass(classID);
         JS.goURL(response,"Admin_SiteClass.jsp");
         
		}
		}
	if(action.equals("Clear"))
	{
	   if (request.getParameter("ClassID") == null
		|| "".equals(request.getParameter("ClassID"))) {
			JS.AlertCode(response, "参数传递错误！");
			JS.goBack(response, -1);
		} else {
		ArticleDao articleDao=new ArticleDaoImpl();
         int classID=Integer.parseInt(request.getParameter("ClassID"));       
         articleDao.delArticleByClassID(classID);
         JS.goURL(response,"Admin_SiteClass.jsp");         
	}
	}
	if(action.equals("Modfy"))
	{
	   if (request.getParameter("ClassID") == null
		|| "".equals(request.getParameter("ClassID"))) {
			JS.AlertCode(response, "参数传递错误！");
			JS.goBack(response, -1);
		} else {
		Map map=request.getParameterMap();
		FormUtils<SiteClass> f=new FormUtils(SiteClass.class);
		SiteClass sc= f.getForm(map);
		DAOFactory.getSiteClassDao().updateClass(sc);
        JS.goURL(response,"Admin_SiteClass.jsp");
         
	}
	
	}

%>
