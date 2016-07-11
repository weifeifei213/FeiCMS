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
%>
<html>
	<head>
		<title>模板方案管理</title>
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
								<b>模板方案管理</b>
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
					<a href='Admin_TemplateProject.jsp'>模板方案管理</a>&nbsp;|&nbsp;
				    <a href='Admin_TemplateProject_Add.jsp'>新建模板方案</a>				    
				    </td>
			</tr>
		</table>
		<br>
		<table width='100%' border='0' align='center' cellpadding='0'
			cellspacing='1' class='border'>
			<tr class='title' height='22'>	
				<td width="30" align='center'>	<strong>ID</strong></td>	
				<td align='center'>	<strong>模板方案名称</strong></td>
				<td align='center'>	<strong>模板方案路径</strong></td>
				<td align='center'>	<strong>是否默认</strong></td>
				<td align='center'>	<strong>是否启用</strong></td>
				<td width='380' align='center'>
					<strong>操作选项</strong>				</td>
			</tr>
			<% 
			//获取管理员管理的相应部门
			Admin admin=DAOFactory.getAdminDaoInstance().showAdmin(Integer.parseInt(session.getAttribute("AdminID").toString())); 		
			//显示模板方案
			try{			
			String path= pageContext.getServletContext().getRealPath("/");
			List<TemplateProject> tlist=DAOFactory.getTemplateProjectDao().queryTemplateProject();
			
			for(TemplateProject tp:tlist){
			System.out.println(tp.getTemplateProjectName());
			%>
			<tr class='tdbg' onMouseOut="this.className='tdbg'"
				onmouseover="this.className='tdbgmouseover'">
				<td align='center'><%=tp.getTemplateProjectID() %></td>				
				<td><a	href='Admin_PhotoClass_Modfy.jsp?ClassID=<%=tp.getTemplateProjectID() %>' title=''><%=tp.getTemplateProjectName() %></a></td>			
				<td>[<%=tp.getTemplateProjectURL() %>]</td>
				<td align='center'><% if(tp.getIsDefault()==1){out.print("<font color='green'>√</font>");}else{out.print("<font color='red'>×</font>");} %> </td>
				<td align='center'><% if(tp.getEnable()==1){out.print("<font color='green'>√</font>");}else{out.print("<font color='red'>×</font>");} %> </td>				
				<td align='left' width='380'>	
				<a href='Admin_Template.jsp?Action=MangerTp&ID=<%=tp.getTemplateProjectID()%>'>管理模板</a>
				<%if(tp.getIsDefault()==0){%>
				<a href="Admin_TemplateProject_ModifySave.jsp?Action=IsDefault&ID=<%=tp.getTemplateProjectID()%>">设为默认</a>	
				<%}else{%>
				<a href="Admin_TemplateProject_ModifySave.jsp?Action=NoDefault&ID=<%=tp.getTemplateProjectID()%>">取消默认</a>	
				<%} %>				
				<%if(tp.getEnable()==1){	%>
				<a href="Admin_TemplateProject_ModifySave.jsp?Action=Disable&ID=<%=tp.getTemplateProjectID()%>">禁用</a>	<%
				}else{%>
				<a href="Admin_TemplateProject_ModifySave.jsp?Action=Enable&ID=<%=tp.getTemplateProjectID()%>">启用</a>	
				<%} %>	
				<a href='Admin_TemplateProject_Modify.jsp?ID=<%=tp.getTemplateProjectID()%>'>修改</a>&nbsp;|&nbsp;
				<a href='Admin_TemplateProject_ModifySave.jsp?Action=Del&ID=<%=tp.getTemplateProjectID()%>'
						onClick='return ConfirmDel2();'>删除</a>				
								
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
			function ConfirmDel2(){
			   if(confirm('删除模板方案，该方案下的所有模板将会被一起删除，确定要删除吗？'))
			     return true;
			   else
			     return false;}			
         </script>
		<br>
	</body>
</html>
