<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="../PubPackage.jsp"%>
<%
String adminPopNum="POP000104";
if(!DAOFactory.getAdminDaoInstance().checkAdminPopedom(Integer.parseInt(session.getAttribute("AdminID").toString()),adminPopNum))
{
 JS.ErrCode(response,"你没有足够的权限！请与管理员联系！");
 JS.goBack(response,-1);
 return;
}
if(request.getParameter("ID")!=null){
	session.setAttribute("ProjectID",request.getParameter("ID"));
}
String ID=(String)session.getAttribute("ProjectID");
String sql=" select * from template where ProjectID = "+ID;
%>
<html>
	<head>
		<title>模板管理</title>
		<link href='../CSS/Admin_Style.css' rel='stylesheet' type='text/css'>
	</head>
	<body leftmargin='2' topmargin='0' marginwidth='0' marginheight='0'>
		<table width='100%' border='0' align='center' cellpadding='2'
			cellspacing='1' class='border'>
			<tr class='topbg'>
				<td height='22' colspan='10'>
					<table width='100%'>
						<tr class='topbg'>
							<td align='center'>
								<b>模板管理</b>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr class='tdbg'>
				<td width='70' height='30'>
					<strong>管理导航：</strong>
				</td>
				<td height='30'>
					<a href='Admin_Template.jsp'>模板管理</a>&nbsp;|&nbsp;
				    <a href='Admin_Template_Add.jsp'>新建模板</a>				    
				    </td>
			</tr>
		</table>
		<br>
		<table width='100%' border='0' align='center' cellpadding='0'
			cellspacing='1' class='border'>
			<tr class='title' height='22'>	
				<td width="30" align='center'>	<strong>ID</strong></td>	
				<td align='center'>	<strong>模板名称</strong></td>
				<td align='center'>	<strong>所属模型</strong></td>
				<td align='center'>	<strong>模板类型</strong></td>
				<td align='center'>	<strong>所属方案</strong></td>
				<td align='center'>	<strong>默认</strong></td>
				<td align='center'>	<strong>方案中默认</strong></td>
				<td width='380' align='center'>
					<strong>操作选项</strong>				</td>
			</tr>
			<% 
			//获取管理员管理的相应部门
			Admin admin=DAOFactory.getAdminDaoInstance().showAdmin(Integer.parseInt(session.getAttribute("AdminID").toString())); 		
			//显示模板方案
			try{			
			List<Template> tlist=DAOFactory.getTemplateDao().queryTemplate(sql);			
			for(Template tp:tlist){
			System.out.println(tp.getTemplateName());
			%>
			<tr class='tdbg' onMouseOut="this.className='tdbg'"
				onmouseover="this.className='tdbgmouseover'">
				<td align='center'><%=tp.getTemplateID()%></td>				
				<td><a	href='Admin_Template_Modify.jsp?ID=<%=tp.getTemplateID() %>' title=''><%=tp.getTemplateName() %></a></td>			
				<td>[<%= DAOFactory.getModelDao().getModel(tp.getModelID().toString()).getModelName()  %>]</td>
				<td><%=DAOFactory.getTemplateTypeDao().getTypeName(tp.getTemplateType()) %></td>
				<td><%=DAOFactory.getTemplateProjectDao().getTemplateProject(tp.getProjectID().toString()).getTemplateProjectName() %></td>
				<td align='center'><% if(tp.getIsDefault()==1){out.print("<font color='green'>√</font>");}else{out.print("<font color='red'>×</font>");} %> </td>
				<td align='center'><% if(tp.getIsDefaultInProject()==1){out.print("<font color='green'>√</font>");}else{out.print("<font color='red'>×</font>");} %> </td>				
				<td align='left' width='380'>				
				<%if(tp.getIsDefault()==0){%>
				<a href="Admin_TemplateProject_ModifySave.jsp?Action=IsDefault&ID=<%=tp.getTemplateID()%>">设为默认</a>	
				<%}else{%>
				<a href="Admin_TemplateProject_ModifySave.jsp?Action=NoDefault&ID=<%=tp.getTemplateID()%>">取消默认</a>	
				<%} %>				
				<%if(tp.getIsDefaultInProject() ==1){	%>
				<a href="Admin_TemplateProject_ModifySave.jsp?Action=Disable&ID=<%=tp.getTemplateID()%>">禁用</a>	<%
				}else{%>
				<a href="Admin_TemplateProject_ModifySave.jsp?Action=Enable&ID=<%=tp.getTemplateID()%>">启用</a>	
				<%} %>	
				<a href='Admin_Template_Modify.jsp?ID=<%=tp.getTemplateID()%>'>修改</a>&nbsp;|&nbsp;
				<a href='Admin_Template_ModifySave.jsp?Action=Del&ID=<%=tp.getTemplateID()%>'>删除</a>				
								
			   </td>
			</tr>
			<%			
			}			 
			}
			catch(Exception ex)
			{
			out.println("<tr class=tdbg><td colspan=3 align=center>"+ex+"</td></tr>");
			}			
			%>
		</table>
		
		<script language='JavaScript' type='text/JavaScript'>
			function ConfirmDel1(){
			   alert('此栏目下还有子栏目，必须先删除下属子栏目后才能删除此栏目！');
			   return false;}
			function ConfirmDel2(){
			   if(confirm('删除栏目操作将删除此栏目中的所有子栏目和文章，并且不能恢复！确定要删除此栏目吗？'))
			     return true;
			   else
			     return false;}
			function ConfirmDel3(){
			   if(confirm('清空栏目将把栏目（包括子栏目）的所有文章放入回收站中！确定要清空此栏目吗？'))
			     return true;
			   else
			     return false;}
         </script>
		<br>
	</body>
</html>
