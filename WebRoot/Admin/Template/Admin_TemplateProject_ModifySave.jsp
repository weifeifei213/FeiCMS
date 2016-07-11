<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../PubPackage.jsp"%>
<%
	String Action = request.getParameter("Action");
	String ID = request.getParameter("ID");
	if ("SaveAdd".equals(Action)) {
		Map map = request.getParameterMap();
		TemplateProject tp = new TemplateProject();
		FormUtils<TemplateProject> fu = new FormUtils<TemplateProject>(
				TemplateProject.class);
		tp = fu.getForm(map);
		if (tp.getIsDefault() == null) {
			tp.setIsDefault(0);
		}
		if (tp.getEnable() == null) {
			tp.setEnable(0);
		}
		DAOFactory.getTemplateProjectDao().updateTemplateProject(tp);
		JS.ErrCode(response, "修改成功！");
		JS.goURL(response, "Admin_TemplateProject.jsp");
	}
	if ("Del".equals(Action)) {		
		DAOFactory.getTemplateProjectDao().delTemplateProject(
				Integer.parseInt(ID));
		JS.ErrCode(response, "成功删除！");
		JS.goURL(response, "Admin_TemplateProject.jsp");
	}
	if ("IsDefault".equals(Action) || "NoDefault".equals(Action)||"Disable".equals(Action) || "Enable".equals(Action)) {		
		DAOFactory.getTemplateProjectDao().UpdateState(Action,ID);		
		JS.goURL(response, "Admin_TemplateProject.jsp");
	}	
	if ("NumDel".equals(Action)) {

	}
	
%>


