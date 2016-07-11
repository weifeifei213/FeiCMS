<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="PubPackage.jsp"%>
<%
	String action = request.getParameter("Action");
	//保存修改
	
	
	if (action.equals("Del")) {
	    String adminPopNum="POP000107";
		if(!DAOFactory.getAdminDaoInstance().checkAdminPopedom(Integer.parseInt(session.getAttribute("AdminID").toString()),adminPopNum))
		{
		 JS.ErrCode(response,"你没有足够的权限！请与管理员联系！");
		 JS.goBack(response,-1);
		 return;
		}
		if (request.getParameter("AdminID") == null
		|| "".equals(request.getParameter("AdminID"))) {
			JS.AlertCode(response, "参数传递错误！");
			JS.goBack(response, -1);
			return;
		} else {
			int articleAdminID = Integer.parseInt(request
			.getParameter("AdminID"));
			DAOFactory.getAdminDaoInstance().delAdmin(articleAdminID);
			JS.goURL(response, "Admin_Admin.jsp");

		}
	}


	
%>
