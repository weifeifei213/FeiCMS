<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="PubPackage.jsp"%>
<%
String adminPopNum="POP000000";
if(!DAOFactory.getAdminDaoInstance().checkAdminPopedom(Integer.parseInt(session.getAttribute("AdminID").toString()),adminPopNum))
{
JS.ErrCode(response,"你没有足够的权限！请与管理员联系！");
JS.goBack(response,-1);
}
ResultSet rs = DAOFactory.getAdminDaoInstance().showAllAdmin();
%>
<html>
	<head>
		<title>管理员管理</title>
		<meta http-equiv='Content-Type' content='text/html; charset=utf-8'>
		<link href='CSS/Admin_Style.css' rel='stylesheet' type='text/css'>
	</head>
	<body leftmargin='2' topmargin='0' marginwidth='0' marginheight='0'>
		<table width='100%' border='0' align='center' cellpadding='2'
			cellspacing='1' class='border'>
			<tr class='topbg'>
				<td height='22' colspan='10'>
					<table width='100%'>
						<tr class='topbg'>
							<td align='center'>
								<b>管 理 员 管 理</b>
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
					<a href='Admin_Admin.jsp'>管理员管理首页</a>&nbsp;|&nbsp;
					<a href='Admin_Admin_Add.jsp'>新增管理员</a>
				</td>
			</tr>
		</table>
		<SCRIPT language=javascript>
function delete_confirm(e){ 
if (event.srcElement.outerText=="删除") 
 
} 
document.onclick=delete_confirm;		
function unselectall(){
    if(document.myform.chkAll.checked){
 document.myform.chkAll.checked = document.myform.chkAll.checked&0;
    }
}
function CheckAll(form){
  for (var i=0;i<form.elements.length;i++){
    var e = form.elements[i];
    if (e.Name != 'chkAll'&&e.disabled!=true)
       e.checked = form.chkAll.checked;
    }
}
</script>
		<br>
		<table width='100%' border='0' cellpadding='0' cellspacing='0'>
			<tr>
				<form name='myform' method='Post' action='Admin_Admin.jsp'
					onSubmit="return confirm('确定要删除选中的管理员吗？');">
				<td>
					<table width='100%' border='0' align='center' cellpadding='2'
						cellspacing='1' class='border'>
						<tr align='center' class='title' height='22'>
							<td width='30'>
								<strong>选中</strong>
							</td>
							<td width='30' height='22'>
								<strong>序号</strong>
							</td>
							<td width="421">
								<strong>管理员名</strong>							</td>
							<td width='119'>
								<strong>权 限</strong>
							<td width='152'>
								<strong>最后登录IP</strong>							</td>
							<td width='153'>
								<strong>最后登录时间</strong>							</td>
							<td width='92'>
								<strong>登录次数</strong>							</td>
							<td width='211'>
								<strong>操 作</strong>							</td>
						</tr>
						<%
							//获取记录总数
						   int pageSize=20; 
                           int rowCount; //总的记录数 
                           int pageCount; //总的页数 
                           int currPage; //当前页数 
						   String strPage; 
                           strPage=request.getParameter("page"); 
						   if (strPage==null){ 
							currPage=1; 
							} 
							else{ 
							currPage=Integer.parseInt(strPage); 
							if (currPage<1) currPage=1; 
							} 
							rs.last();
							rowCount = rs.getRow();//取得总记录数
							pageCount=(rowCount+pageSize-1)/pageSize; //计算总页数
							if (currPage>pageCount) currPage=pageCount; 							
							int thepage=(currPage-1)*pageSize; 
							int n=0; 
						 rs.absolute(thepage+1); 
						 rs.previous();
							while(rs.next()&&n<pageSize) 
							{
						%>
						<tr align='center' class='tdbg' onMouseOut="this.className='tdbg'"
							onMouseOver="this.className='tdbgmouseover'">
							<td width='30'>
								<input name='ID' type='checkbox' id='ID'
									value='<%=rs.getInt("ID")%>'  onclick='unselectall()'>
							</td>
							<td width='30'>
								<%=rs.getInt("ID")%>
							</td>
							<td>
								<font color=red><b><%=rs.getString("AdminName")%>
								</b> </font>
							</td>
							<td width='119'>
								<%
								if (rs.getInt("Purview") == 1) {
								%>
								<font color=blue>超级管理员</font>
								<%
								} else if(rs.getInt("Purview") == 3){
								%>
								申报管理员
								<%
								
								}else {
								%>
								普通管理员
								<%
								}
								%>
						  </td>
							<td width='152'>
								<%=rs.getString("LastLoginIP")%>
						  </td>
							<td width='153'> 
								<%=rs.getString("LastLoginTime")%>
						  </td>
							<td width='92'>
								<%=rs.getInt("LoginTimes")%>
						  </td>
							<td width='211'>
							
								<a href='Admin_Admin_ModifyPwd.jsp?ID=<%=rs.getInt("ID") %>'>修改密码</a>&nbsp;&nbsp;
								<a href='Admin_Admin_ModifyPurview.jsp?ID=<%=rs.getInt("ID") %>'>修改权限</a>&nbsp;&nbsp;
								<a href='Admin_Admin_Save.jsp?Action=Del&AdminID=<%=rs.getInt("ID") %>' onClick="return confirm('确定要删除此管理员吗？');">删除</a>
								
								
							</td>
						</tr>
						<%
							n++;
							}
						%>
					</table>
					
					<table width='100%' border='0' cellpadding='0' cellspacing='0'>
						<tr>
							<td width='200' height='30'>
								<input name='chkAll' type='checkbox' id='chkAll'
									onclick='CheckAll(this.form)' value='checkbox'>
								选中本页显示的所有管理员
							</td>
							<td>
								<input name='Action' type='hidden' id='Action' value='Del'>
								<input name='Scode' type='hidden' id='Scode' value='svk3kt6a8mu'>
								<input name='Submit' type='submit' id='Submit' value='删除选中的管理员'
								onClick="document.myform.chkAll.checked">
								
							</td>
						</tr>
					</table>
				</td>
				
			</tr>
		</table>
		<div class="show_page">
						共
			<b><%=rowCount %></b> 个管理员&nbsp;&nbsp;
			<%
			if(pageCount>1){
			   out.println("<a href=Admin_Admin.jsp?page=1>首页</a> <a href=Admin_Admin.jsp?page="+(currPage-1)+">上一页</a>");
			   }
			else
			{
			    out.println("首页 上一页");
			    }
			 %>
			&nbsp;
			<%
			if(currPage<pageCount)
			{
			   out.println("<a href=Admin_Admin.jsp?page="+(currPage+1)+">下一页</a> <a href=Admin_Admin.jsp?page="+pageCount+">尾页</a>");
			   }
			else
			{
			   out.println("下一页 尾页");
			   }
			 %>
			<strong><font color=red><%=currPage %></font>/<%=pageCount %></strong>页 &nbsp;
			<input type='text' name='MaxPerPage' size='3' maxlength='4'
				value='<%=pageSize %>'
				onKeyPress="if (event.keyCode==13) window.location='Admin_Article_List.jsp?page='+this.value;">
			个管理员/页&nbsp;
		</div>
	</body>
</html>
<!-- Powered by: PowerEasy 2005 -->
