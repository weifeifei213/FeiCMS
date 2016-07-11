<%@ page language="java"  pageEncoding="utf-8"%>
<%@ include file="../PubPackage.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String SiteID=(String)session.getAttribute("SiteID");

if(null==SiteID||"".equals(SiteID)){ SiteID="1";}

 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>模型管理</title>
		<meta http-equiv='Content-Type' content='text/html; charset=utf-8'>
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
								<b>内容管理系统----模型管理</b>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr class='tdbg'>
				<td width='70' height='30'><strong>管理导航：</strong></td>
				<td height='30'>
				<a href='Admin_Site.jsp'>模型管理首页</a>&nbsp;|&nbsp;
				<a href='Admin_Site_Add.jsp'>添加模型</a>&nbsp;</td>
			</tr>
		</table>
		<br>
		<table width='100%' border='0' align='center' cellpadding='0'
			cellspacing='1' class='border'>
			<tr class='title' height='22'>
				<td width='30' align='center'><strong>ID</strong></td>
				<td align='center'><strong>模型名称</strong></td>
				<td align='center'><strong>模型属性</strong></td>				
				<td width='480' align='center'><strong>操作选项</strong></td>
			</tr>
			<% 
			//获取管理员管理的相应部门
			Admin admin=DAOFactory.getAdminDaoInstance().showAdmin(Integer.parseInt(session.getAttribute("AdminID").toString())); 		
			//显示图片分类			
			try{			
			List<SiteConfig> sitelist=DAOFactory.getSiteDao().querySite();			
			for(SiteConfig site:sitelist){			
			%>
			<tr class='tdbg' onMouseOut="this.className='tdbg'"
				onmouseover="this.className='tdbgmouseover'">
				<td width='30' align='center'>
					<%=site.getSiteID()%></td>
				<td>
					
					<b><a
						href='<%=basePath %>/Admin/Photo/Admin_PhotoClass_Modfy.jsp?ClassID=<%=site.getSiteID() %>'
						title=''><%=site.getSiteName() %></a></b>&nbsp;&nbsp;[<%=site.getInstallDir() %>] </td>
				<td><a href="<%=site.getSiteUrl() %>" target="_blank"><%=site.getSiteUrl() %></a></td>
				
				<td align='left' width='380'>
					&nbsp;					
					<a href='<%=basePath %>Photo_PhotoClass.do?oper=ClearPhotoClass&ClassID=<%=site.getSiteID()%>'>字段管理</a>&nbsp;|&nbsp;
					<a href='Admin_SiteConfig.jsp?SiteID=<%=site.getSiteID()%>'>修改</a>&nbsp;|&nbsp;
					<a href='<%=basePath %>Photo_PhotoClass.do?oper=DeletPhotoClass&ClassID=<%=site.getSiteID()%>'
						onClick='return ConfirmDel2();'>删除</a>				</td>
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
		
		<br>
  </body>
</html>
