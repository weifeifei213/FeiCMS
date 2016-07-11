<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="../PubPackage.jsp"%>
<%
	String action = request.getParameter("Action");
	SpecialDao specialDao=new SpecialDaoImpl();
	
	if (action.equals("Del")) {
	   String adminPopNum="POP000112";
if(!DAOFactory.getAdminDaoInstance().checkAdminPopedom(Integer.parseInt(session.getAttribute("AdminID").toString()),adminPopNum))
{
JS.ErrCode(response,"你没有足够的权限！请与管理员联系！");
JS.goBack(response,-1);
}
		if (request.getParameter("SpecialID") == null
		|| "".equals(request.getParameter("SpecialID"))) {
			JS.AlertCode(response, "参数传递错误！");
			JS.goBack(response, -1);
			return;
		} else {
         int specialID=Integer.parseInt(request.getParameter("SpecialID"));           
         specialDao.delOneSpecial(specialID);
         JS.goURL(response,"Admin_Special.jsp");
         
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
         articleDao.delArticle(classID);
         JS.goURL(response,"Admin_Class.jsp");
         
	}
	}
	if(action.equals("ModfySave"))
	{
	   if (request.getParameter("SpecialID") == null||"".equals(request.getParameter("SpecialID"))){
			JS.AlertCode(response, "参数传递错误！");
			JS.goBack(response, -1);
			return;
		} else {
		int openType=0;
		int isElite=0;
		if(request.getParameter("OpenType")!=null){
		   openType = Integer.parseInt(request.getParameter("OpenType"));
		}
		if(request.getParameter("IsElite")!=null){
		   isElite = Integer.parseInt(request.getParameter("IsElite"));
		}
		Special special=new Special();
		special.setSpecialID(Integer.parseInt(request.getParameter("SpecialID")));
		special.setSpecialName(request.getParameter("SpecialName"));
		special.setSpecialDir(request.getParameter("SpecialDir"));
		special.setOpenType(openType);
		special.setIsElite(isElite);
		special.setTips(request.getParameter("Tips"));
		special.setReadMe(request.getParameter("Readme"));
		specialDao.updateSpecial(special);
        //response.sendRedirect("Admin_Class.jsp");
        JS.goURL(response,"Admin_Special.jsp");
         
	}
	
	}

%>
