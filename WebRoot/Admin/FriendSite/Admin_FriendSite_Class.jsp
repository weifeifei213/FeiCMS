<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="../PubPackage.jsp"%>
<%
Admin admin=DAOFactory.getAdminDaoInstance().showAdmin(Integer.parseInt(session.getAttribute("AdminID").toString()))  ;  
		List<FriendSiteClass> li=null;
	if(admin.getPurview()!=1){ 
		String viewList=admin.getArrClass_View();
		String view=viewList.substring(0,viewList.length()-1);
		li=DAOFactory.getFriendSiteClassDao().quaryAllClass(view);
	}else{
		li=DAOFactory.getFriendSiteClassDao().quaryAllClass();
	}
%>
<html>
	<head>
		<title>友情链接管理</title>
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
								<b>友 情 链 接 管 理</b>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr class='tdbg'>
				<td width='70' height='30'>
					<strong>管理导航：</strong>
				</td>
				<td>
					<a href='Admin_FriendSite.jsp'>友情链接管理首页</a>&nbsp;|&nbsp;
					<a href='Admin_FriendSite_Add.jsp'>添加友情链接</a>&nbsp;|&nbsp;
					<a href='Admin_FriendSite_Class.jsp'>链接类别管理</a>&nbsp;|&nbsp;
					<a href='Admin_FriendSite_ClassAdd.jsp'>添加链接类别&nbsp;</a>&nbsp;
				</td>
			</tr>
		</table>
		<br>
		<table width='100%' border='0' align='center' cellpadding='0'
			cellspacing='1' class='border'>
			<tr class='title' height='22'>
				<td width='30' align='center'>
					<strong>ID</strong>
				</td>
				
				<td width='200' align='center'>
					<strong>类别名称</strong>
				</td>
				<td align='center'>
					<strong>类别说明</strong>
				</td>
				<td width='120' align='center'>
					<strong>常规操作</strong>
				</td>
			</tr>
			<%
			for(int i=0;i<li.size();i++){
			FriendSiteClass fsc=li.get(i);
			%>
			<tr class='tdbg' onmouseout="this.className='tdbg'"
				onmouseover="this.className='tdbgmouseover'">
				<td width='30' align='center'>
					<%=fsc.getClassName() %>
				</td>
				<td width='200' align='center'>
					<a href='Admin_FriendSite.jsp?KindID=<%=fsc.getClassID() %>' title='点击进入管理此类别的友情链接'><%=fsc.getClassName()%></a>
				</td>
				<td>
					<%=fsc.getReadMe() %>
				</td>

				<td width='120' align='center'>
					<a
						href='Admin_FriendSite_ClassModfy.jsp?Action=Modfy&id=<%=fsc.getClassID() %>&ClassID=<%=fsc.getClassID() %>'>修改</a>&nbsp;
					<a href='Admin_FriendSite_ClassModfy.jsp?Action=Del&ClassID=<%=fsc.getClassID() %>'
						onClick="return confirm('确定要删除此类别吗？删除此类别后原属于此类别的友情链接将不属于任何类别。');">删除</a>&nbsp;
				</td>
			</tr>
			<%
			}
			 %>
		</table>
	</body>
</html>
