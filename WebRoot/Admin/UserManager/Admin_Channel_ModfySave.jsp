<%@ page language="java" pageEncoding="utf-8"%>
<%@page import="com.megalith.vo.ArticleClass"%>
<%@ include file="../PubPackage.jsp"%>
<%
	String action = request.getParameter("Action");
	Qysk_UserGroupDao ugdao=new Qysk_UserGroupDaoImpl();
	
	if (action.equals("Del")) {
	String adminPopNum="POP000103";
	if(!DAOFactory.getAdminDaoInstance().checkAdminPopedom(Integer.parseInt(session.getAttribute("AdminID").toString()),adminPopNum))
	{
	 JS.ErrCode(response,"你没有足够的权限！请与管理员联系！");
	 JS.goBack(response,-1);
	 return;
	}
		if (request.getParameter("GroupID") == null
		|| "".equals(request.getParameter("GroupID"))) {
			JS.AlertCode(response, "参数传递错误！");
			JS.goBack(response, -1);
		} else {
         int groupID=Integer.parseInt(request.getParameter("GroupID"));       
         ugdao.delUserGroup(groupID);
         
         JS.goURL(response,"Admin_UserGroup.jsp");
         
		}
		}
	
	if(action.equals("Modfy"))
	{
	   if (request.getParameter("ClassID") == null
		|| "".equals(request.getParameter("ClassID"))) {
			JS.AlertCode(response, "参数传递错误！");
			JS.goBack(response, -1);
		} else {
		ArticleClass articleClass=new ArticleClass();
        int classID=Integer.parseInt(request.getParameter("ClassID"));
        String className=request.getParameter("ClassName").trim();
        int parentID=Integer.parseInt(request.getParameter("ParentID"));
        String classDir=request.getParameter("ClassDir").trim();
        String readme=request.getParameter("Readme").trim();
        articleClass.setClassID(classID);
        articleClass.setClassName(className);
        articleClass.setClassDir(classDir);
        articleClass.setParentID(parentID);
        articleClass.setReadme(readme);
        //articleClassDao.updateClass(articleClass);
        //response.sendRedirect("Admin_Class.jsp");
        JS.goURL(response,"Admin_Class.jsp");
         
	}
	
	}

%>
