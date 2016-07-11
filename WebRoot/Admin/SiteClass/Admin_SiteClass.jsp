<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="../PubPackage.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

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
		<title>内容管理----栏目管理</title>
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache"> 
        <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache"> 
        <META HTTP-EQUIV="Expires" CONTENT="0">
		<link href='<%=basePath %>Admin/CSS/Admin_Style.css' rel='stylesheet' type='text/css'>
		<link href='<%=basePath %>Admin/CSS/Admin_Main.css' rel='stylesheet' type='text/css'>
	</head>
	<body leftmargin='2' topmargin='0' marginwidth='0' marginheight='0'>
		<table width='100%' border='0' align='center' cellpadding='2'
			cellspacing='1' class='border'>
			<tr class='topbg'>
				<td height='22' colspan='10'>
					<table width='100%'>
						<tr class='topbg'>
							<td align='center'>
								<b>内容管理----栏目管理</b>
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
					<a href='<%=basePath %>Admin/SiteClass/Admin_SiteClass.jsp'>栏目管理首页</a>&nbsp;|&nbsp;
				<a href='<%=basePath %>Admin/SiteClass/Admin_SiteClass_Add.jsp'>添加栏目</a>&nbsp;</td>
			</tr>
		</table>
		<br>
		<table width='100%' border='0' align='center' cellpadding='0'
			cellspacing='1' class='border'>
			<tr class='title' height='22'>
				<td width='30' align='center'>
					<strong>ID</strong>				</td>
				<td align='center'>
					<strong>栏目名称及目录</strong>				</td>
				<td align='center'>
					<strong>栏目模型</strong>				</td>
				<td align='center' width="120px">
					<strong>栏目属性</strong>				</td>		
				<td width='200' align='center'>
					<strong>操作选项</strong>				</td>
			</tr>
			<% 
			//获取管理员管理的相应部门
			Admin admin=DAOFactory.getAdminDaoInstance().showAdmin(Integer.parseInt(session.getAttribute("AdminID").toString())); 		
			//显示图片分类			
			try{
			List<SiteClass> sclist=DAOFactory.getSiteClassDao().queryAllTop("0","0");
			for(SiteClass sc:sclist){			
			int dept=sc.getDepth()==null?0:sc.getDepth().intValue();					
			%>
			<tr class='tdbg' onMouseOut="this.className='tdbg'"
				onmouseover="this.className='tdbgmouseover'">
				<td width='30' align='center'>
					<%=sc.getClassID()%></td>
				<td>
					<%for(int i=0;i<sc.getDepth();i++){
					%>
					&nbsp;&nbsp;
					<%
					} %> 
					<img src='<%=basePath %>Admin/Images/Folder/tree_folder3.gif' width='15' height='15'
						valign='abvmiddle'>				    
					<a  <%if(sc.getDepth()==0){out.print("class='ABold'");} %>
						href='<%=basePath %>Admin/SiteClass/Admin_SiteClass_Modfy.jsp?ClassID=<%=sc.getClassID() %>'
						title=''><%=sc.getClassName() %></a>&nbsp;&nbsp;[<%=sc.getClassDir() %>]
									
			</td>
			<td align="center">
			<% if(null!=sc.getModelID()){out.print(DAOFactory.getModelDao().getModel(sc.getModelID().toString()).getModelName());} %>
			</td>
			<td align="center">
			<%if(null!=sc.getIsPage()&&sc.getIsPage()==1){out.print("<font color='#0f0'>[单]</font>");} %>
			<%if(null!=sc.getIsOutsideLink()&&sc.getIsOutsideLink()==1){out.print("<font color='#0f0'>[外]</font>");} %>		
			</td>
				<td align='left' >
					&nbsp;
					<a href='<%=basePath %>/Admin/SiteClass/Admin_SiteClass_Add.jsp?ClassID=<%=sc.getClassID()%>'>添加子栏目</a>&nbsp;|&nbsp;
					<a href='Admin_SiteClass_ModfySave.jsp?Action=Clear&ClassID=<%=sc.getClassID()%>'
						onClick='return ConfirmDel3();'>清空</a>&nbsp;|&nbsp;
					<a href='Admin_SiteClass_ModfySave.jsp?Action=Del&ClassID=<%=sc.getClassID()%>' onClick='return ConfirmDel2();'>删除</a>	
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
			   if(confirm('删除栏目操作将删除此栏目中的所有子栏目和图片，并且不能恢复！确定要删除此栏目吗？'))
			     return true;
			   else
			     return false;}
			function ConfirmDel3(){
			   if(confirm('清空栏目将把栏目（包括子栏目）的所有图片放入回收站中！确定要清空此栏目吗？'))
			     return true;
			   else
			     return false;}
         </script>
		<br>
	</body>
</html>
