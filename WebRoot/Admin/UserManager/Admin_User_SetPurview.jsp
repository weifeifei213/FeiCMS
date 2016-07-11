<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.megalith.hibernate.pojo.QyskUsergroup"%>
<%@page import="com.megalith.hibernate.pojo.QyskUser"%>
<%@ include file="../PubPackage.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String UserID=request.getParameter("uid");
QyskUser user=BIZFactory.getQyskUserBizInstance().GetUser(Integer.parseInt(UserID));
List GroupList=BIZFactory.getQyskUserGroupBizInstance().getUserGroup();

 %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv='Content-Type' content='text/html; charset=utf-8'>
		<link href='../CSS/Admin_Style.css' rel='stylesheet' type='text/css'>
		<title>设置会员权限</title>

  </head>
  
  <body>  
     <form action="<%=basePath %>Admin_user.do?oper=AdminUserSetPurview" method="post">     
     <input type="hidden" name="UserID" id="UserID" value="<%=UserID %>" >
     
   <table width='100%' border='0' cellspacing='1' cellpadding='2'
				class='border'>
				 <tr class='title'>
      <td height='22' colspan='6'><div align='center'>会员权限设置</div></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
     <tr class='title'>
      <td height='22' colspan='6'><div align='center'>会员级别设置</div></td>
    </tr>
    <tr class='tdbg'><td>
    <% for(int i=0;i<GroupList.size();i++){
    QyskUsergroup ug=(QyskUsergroup)GroupList.get(i);
    %>
    <input type="radio" value="<%=ug.getGroupId() %>" name="GroupID" <%if(user.getGroupId().equals(ug.getGroupId())){out.print("checked");} %>  ><%=ug.getGroupName() %>
    <%} %>    
    </td></tr></table> 
     <!--  
    <table width='100%' border='0' cellspacing='1' cellpadding='2' class='border'>
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
			-->
		<table width='100%' border='0' cellspacing='1' cellpadding='2'
				class='border'>
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
