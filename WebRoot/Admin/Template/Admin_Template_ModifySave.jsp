<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../PubPackage.jsp"%>
<%
	String Action = request.getParameter("Action");
	if ("ModifySave".equals(Action)) {
		Map map = request.getParameterMap();
		Template tp = new Template();
		FormUtils<Template> fu = new FormUtils<Template>(Template.class);
		tp = fu.getForm(map);
		if (tp.getIsDefault() == null) {
			tp.setIsDefault(0);
		}
		if (tp.getIsDefaultInProject() == null) {
			tp.setIsDefaultInProject(0);
		}
		tp.setDeleted(0);
		DAOFactory.getTemplateDao().updateTemplate(tp);
		JS.goURL(response, "Admin_Template.jsp");
	}
	if ("Del".equals(Action)) {
		String ID = request.getParameter("ID");
		DAOFactory.getTemplateDao().delTemplate(Integer.parseInt(ID));
		JS.goURL(response, "Admin_Template.jsp");
	}
%>
