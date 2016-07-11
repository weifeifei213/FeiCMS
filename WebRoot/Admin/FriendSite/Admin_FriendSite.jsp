<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="../PubPackage.jsp"%>
<%
String adminPopNum="POP000216";
if(!DAOFactory.getAdminDaoInstance().checkAdminPopedom(Integer.parseInt(session.getAttribute("AdminID").toString()),adminPopNum))
{
JS.ErrCode(response,"你没有足够的权限！请与管理员联系！");
JS.goBack(response,-1);
}
FriendSiteDao friendSiteDao=new FriendSiteDaoImpl();
Admin admin=DAOFactory.getAdminDaoInstance().showAdmin(Integer.parseInt(session.getAttribute("AdminID").toString()))  ;  


     ResultSet rs=null;
	if(admin.getPurview()!=1){ 
	String viewList=admin.getArrClass_View();
	String view=viewList.substring(0,viewList.length()-1);
	rs=friendSiteDao.showAllFs(view);
	}else{	
	
	if(request.getParameter("KindID")!=null){
	rs=friendSiteDao.showAClassFs(request.getParameter("KindID"));
	
	}else{
	
	rs=friendSiteDao.showAllFs(); 
	
	}
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
					<a href='Admin_FriendSite_ClassAdd.jsp'>添加链接类别&nbsp;</a>
				</td>
			</tr>
			
		</table>
		<SCRIPT language=javascript>
function unselectall(){
    if(document.myform.chkAll.checked){
 document.myform.chkAll.checked = document.myform.chkAll.checked&0;
    }
}
function CheckAll(form){
  for (var i=0;i<form.elements.length;i++){
    var e = form.elements[i];
    if (e.Name != 'chkAll'&&e.disabled==false)
       e.checked = form.chkAll.checked;
    }
  }
function ConfirmDel(){
 if(document.myform.Action.value=='Del'){
     if(confirm('确定要删除选中的友情链接吗？'))
         return true;
     else
         return false;
 }
 else if(document.myform.Action.value=='MoveToKind'){
     if(confirm('确定要将选中的友情链接移动到指定的类别吗？'))
         return true;
     else
         return false;
 }
}
</SCRIPT>
		<br>
        <br>
		<table width='100%' border='0' align='center' cellpadding='0'
			cellspacing='0'>
			<tr>
				<td height='22'>
					您现在的位置：&nbsp;
					<a href='Admin_FriendSite.asp?ShowType=0'>友情链接管理</a>&nbsp;&gt;&gt;&nbsp;按类别分类&nbsp;&gt;&gt;&nbsp;所有友情链接
				</td>
			</tr>
		</table>
		<table width='100%' border='0' cellpadding='0' cellspacing='0'>
			<tr>
				<form name='myform' method='Post' action='Admin_FriendSite_ModfySave.jsp'
					onsubmit='return ConfirmDel();'>
				<td>
					<table class='border' border='0' cellspacing='1' width='100%'
						cellpadding='0'>
						<tr class='title' height='22'>
							<td width='30' align='center'>
								<strong>选中</strong>
							</td>
							<td width='80' align='center'>
								<strong>链接类别</strong>
							</td>
							<td width='60' align='center'>
								<strong>链接类型</strong>
							</td>
							<td align='center'>
								<strong>网站名称</strong>
							</td>
							<td width='100' align='center'>
								<strong>网站LOGO</strong>
							</td>
							<td width='40' align='center'>
								<strong>点击</strong>
							</td>
							<td width='100' align='center'>
								<strong>操作</strong>
							</td>
						</tr>
						<%
						while(rs.next())
						{
						 %>
						<tr class='tdbg' onMouseOut="this.className='tdbg'"
							onmouseover="this.className='tdbgmouseover'">
							<td width='30' align='center'>
								<input name='ID' type='checkbox' onclick='unselectall()' id='ID'
									value='<%=rs.getInt("ID") %>'>
							</td>
							<td width='80' align='center'>
							<%=DAOFactory.getSiteClassDao().getClassName(rs.getInt("ClassID")) %>
							</td>
							<td width='60' align='center'>文字链接</td>
							<td>
								<a href='<%=rs.getString("SiteUrl") %>' target='blank'
									title='网站名称：<%=rs.getString("SiteName") %>'><%=rs.getString("SiteName") %></a>
							</td>
							<td width='100' align='center'>
								<a href='<%=rs.getString("SiteUrl") %>' target='_blank' title='<%=rs.getString("SiteUrl") %>'><img
										src='<%=rs.getString("LogoUrl") %>' width='88' height='31' border='0'>
								</a>
							</td>
							
							<td width='40' align='center'>
								<%=rs.getString("Hits") %>
							</td>
							
							<td width='100' align='center'>
								<a href='Admin_FriendSite_Modfy.jsp?ID=<%=rs.getInt("ID") %>'>修改</a>
								<a href='Admin_FriendSite_ModfySave.jsp?Action=Del&ID=<%=rs.getInt("ID") %>'
									onclick="return confirm('确定要删除此友情链接站点吗？');">删除</a>
							</td>
						</tr>
						<%
						}
						
						%>
					</table>
					<table width='100%' border='0' cellpadding='0' cellspacing='0'>

						<tr>
							<td width='160' height='30'>
								<input name='chkAll' type='checkbox' id='chkAll'
									onclick='CheckAll(this.form)' value='checkbox'>
								选中本页所有友情链接
							</td>
							<td>
								<input type='submit' value='删除选定链接' name='submit'
									onClick="document.myform.Action.value='NumDel'">
								&nbsp;&nbsp;&nbsp;
							  <input name='Action' type='hidden' id='Action' value=''>
							</td>
						</tr>
					</table>
				</td>
				</form>
			</tr>
		</table>
		<br>
		<br>
	</body>
</html>
