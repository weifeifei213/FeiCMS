<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.megalith.vo.QyskUsergroup"%>
<%@ include file="../PubPackage.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
int adminID=0;
Admin admin=new Admin();
String purview_View="";
String purview_Input="";
String purview_Check="";
String purview_Manage="";


if("SetPurview".equals(request.getParameter("Action"))){
//获取权限参数
 String adminPopList="";
 String purview_ViewList="";
 String purview_InputList="";
 String purview_CheckList="";
 String purview_ManageList="";
 
if(request.getParameterValues("Purview_View")!=null)
   {
    String listpurview_View[]=request.getParameterValues("Purview_View");
    for(int i=0;i<listpurview_View.length;i++)
   {
   purview_ViewList=purview_ViewList+listpurview_View[i]+",";
   
   }
   }
   if(request.getParameterValues("Purview_Input")!=null)
   {
     String listpurview_Input[]=request.getParameterValues("Purview_Input");
      for(int i=0;i<listpurview_Input.length;i++)
   {
   purview_InputList=purview_InputList+listpurview_Input[i]+",";
   
   }
   
   }
  if(request.getParameterValues("Purview_Manage")!=null)
   {
   String listpurview_Manage[]=request.getParameterValues("Purview_Manage");
    for(int i=0;i<listpurview_Manage.length;i++)
   {
   purview_ManageList=purview_ManageList+listpurview_Manage[i]+",";
   
   }
  }
String GroupID =request.getParameter("GroupID");
QyskUsergroup ug=DAOFactory.getQyskUserGroupDao().quaryOneUserGroup(Integer.parseInt(GroupID));

ug.setArrClassBrowse(purview_ViewList);
ug.setArrClassInput(purview_InputList);
ug.setArrClassView(purview_ManageList);

DAOFactory.getQyskUserGroupDao().updateUserGroup(ug);

JS.goURL(response,"Admin_UserGroup.jsp");

}
 %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv='Content-Type' content='text/html; charset=utf-8'>
		<link href='../CSS/Admin_Style.css' rel='stylesheet' type='text/css'>
		<title>设置栏目权限</title>

  </head>
  
  <body>  
     <form action="Admin_UserGroup_SetPurview.jsp?Action=SetPurview" method="post">     
     <input type="hidden" name="GroupID" id="GroupID" value="<%=request.getParameter("GroupID")%>" >
   <table width='100%' border='0' cellspacing='1' cellpadding='2'
				class='border'>
				 <tr class='title'>
      <td height='22' colspan='6'><div align='center'>会员组权限设置</div></td>
    </tr>
    <tr><td colspan="6">&nbsp;</td></tr>
				<tr align='center' class='title' height='22'>
					<td>
						<strong>栏目名称</strong>
					</td>
					<td width='30'>
						<strong>查看</strong>
					</td>
					<td width='30'>
						<strong>录入</strong>
					</td>
					<td width='30' height='22'>
						<strong>管理</strong>
					</td>
				</tr>
			<% 
			//显示文章分类
			DbConnection conn=null;
			ResultSet rs=null;
			String strNbsp="";
			String strSql="select ClassName,ClassID,ClassDir from article_class where Depth=0";
			try{
			conn=new DbConnection();
			rs=conn.executeQuerySql(strSql);
			while(rs.next()){
			%>
				
				<tr class='tdbg'>
					<td>
						<img src='../Images/Folder/tree_folder4.gif' width='15' height='15'
							valign='abvmiddle'>
						<b><%=rs.getString("ClassName") %></td>
					<td width='30' align='center'>
						<input name='Purview_View' type='checkbox' id='Purview_View'
							value='<%=rs.getInt("ClassID")%>' <%if(purview_View.indexOf(rs.getInt("ClassID"))>=0){out.print("checked");} %>>
					</td>
					<td width='30' align='center'>
						<input name='Purview_Input' type='checkbox' id='Purview_Input'
							value='<%=rs.getInt("ClassID")%>' <%if(purview_Input.indexOf(rs.getInt("ClassID"))>=0){out.print("checked");} %>>
					</td>
					<td width='30' align='center'>
						<input name='Purview_Manage' type='checkbox' id='Purview_Manage'
							value='<%=rs.getInt("ClassID")%>' <%if(purview_Manage.indexOf(rs.getInt("ClassID"))>=0){out.print("checked");} %>>
					</td>
				</tr>
			
				<%
			out.println(DAOFactory.getArticleClassDaoInstance().queryChildClass(rs.getInt("ClassID"),strNbsp,purview_View,purview_Input,purview_Check,purview_Manage));
			}			 
			}
			catch(Exception ex)
			{
			out.println("<tr class=tdbg><td colspan=3 align=center>"+ex+"</td></tr>");
			}
			rs.close();
			conn.closeConnection();
			%>
			<tr><td colspan="6" align="center">
			<input type="submit" value="确定" >
			<input type="reset" value="重置" >
			</td></tr>
			<tr>
			<td colspan="6">
			<font color='#0000FF'>注：</font><br>1、栏目权限采用继承制度，即在某一栏目拥有某项权限，则在此栏目的所有子栏目中都拥有这项权限，并可在子栏目中指定更多的权限。<br>2、灰色并且选中的项目，说明该栏目为开放栏目，会员组在此栏目拥有浏览和查看权限。<br><br><font color='red'>权限含义：</font><br>浏览－－指可以浏览此栏目的信息列表<br>查看－－指可以查看此栏目中的信息的内容<br>发布－－指可以在此栏目中发布信息
			</td>
			</tr>
		</table></form>  
  </body>
</html>
