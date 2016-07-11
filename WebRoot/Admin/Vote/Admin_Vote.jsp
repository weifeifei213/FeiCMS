<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="../PubPackage.jsp"%>
<%
String adminPopNum="POP000215";
if(!DAOFactory.getAdminDaoInstance().checkAdminPopedom(Integer.parseInt(session.getAttribute("AdminID").toString()),adminPopNum))
{
JS.ErrCode(response,"你没有足够的权限！请与管理员联系！");
JS.goBack(response,-1);
}
ResultSet rs=DAOFactory.getVoteDaoInstance().queryAllVote();
%>
<html>
	<head>
		<title>调查管理</title>
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
								<b>网 站 调 查 管 理</b>
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
					<a href='Admin_Vote.jsp'>调查管理首页</a>&nbsp;|
					<a href="Admin_Vote_Add.jsp">添加新调查</a>
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
     if(confirm('确定要删除选中的调查吗？'))
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
					您现在的位置：网站调查管理&nbsp;&gt;&gt;&nbsp;网站首页调查
				</td>
			</tr>
		</table>
		<table width='100%' border='0' cellpadding='0' cellspacing='0'>
			<tr>
				<form name='myform' method='Post' action='Admin_Vote_Modfy.jsp'
					onsubmit='return ConfirmDel();'>
				<td>
					<table class='border' border='0' cellspacing='1' width='100%'
						cellpadding='0'>
						<tr class='title'>
							<td width='30' height='22' align='center'>
								<strong>选中</strong>
							</td>
							<td width='30' height='22' align='center'>
								<strong>ID</strong>
							</td>
							<td height='22' align='center'>
								<strong>主题</strong>
							</td>
							<td width='60' height='22' align='center'>
								<strong>调查状态</strong>
							</td>
							<td width='60' height='22' align='center'>
								<strong>调查类型</strong>
							</td>
							<td width='120' height='22' align='center'>
								<strong>发布时间</strong>
							</td>
							<td width='120' height='22' align='center'>
								<strong>终止时间</strong>
							</td>
							<td width='80' height='22' align='center'>
								<strong>操作</strong>
							</td>
						</tr>
						<%
						while(rs.next())
						{
						 %>
						<tr class='tdbg' onmouseout="this.className='tdbg'"
							onmouseover="this.className='tdbgmouseover'">
							<td width='30' align='center'>
								<input name='ID' type='checkbox' onclick='unselectall()'
									value='<%=rs.getInt("ID") %>'>
							</td>
							<td width='30' align='center'>
								<%=rs.getInt("ID") %>
							</td>
							<td>
								<a href='Admin_Vote_Modfy.jsp?Action=Modify&ID=<%=rs.getInt("ID") %>'><%=rs.getString("Title") %></a>
							</td>
							<td width='60' align='center'>
							<%
							if(rs.getInt("IsSelected")==1)
							{
							 %>
								<font color=green>启用</font>
							<%
							}
							else							
							{
							 %>
							   停用
							 <%
							 }
							  %>
							</td>
							<td width='60' align='center'>
							<%
							if(rs.getInt("VoteType")==1)
		                         out.println("单选");
		                    else
		                        out.println("多选");							
							 %>
								
							<td align='center'>
								<%=rs.getString("VoteTime") %>
							</td>
							<td align='center'>
								<%=rs.getString("EndTime") %>
							</td>
							<td width='80' align='center'>
								<a href='Admin_Vote_Modfy.jsp?Action=Modify&ID=<%=rs.getInt("ID") %>'>修改</a>&nbsp;
								<a href='Admin_Vote_Modfy.jsp?Action=Del&ID=<%=rs.getInt("ID") %>'
									onClick="return confirm('确定要删除此调查吗？');">删除</a>&nbsp;
							</td>
						</tr>
						<%
						}
						 %>
					</table>
					<table width='100%' border='0' cellpadding='0' cellspacing='0'>
						<tr>
							<td width='130' height='30'>
								<input name='chkAll' type='checkbox' id='chkAll'
									onclick='CheckAll(this.form)' value='checkbox'>
								选中所有的调查
							</td>
							<td>
								<input type='submit' value='删除选定的调查' name='submit'
									onClick="document.myform.Action.value='NumDel'">
								&nbsp;&nbsp;
								
								<input name='Action' type='hidden' id='Action'
									value=''>
							</td>
						</tr>
					</table>
				</td>
				</form>
			</tr>
		</table>
		<br>
		<b>说明：</b>
		<br>
		&nbsp;&nbsp;&nbsp;&nbsp;只有将调查设为最新调查后才会在前台显示
		<br>
		<br>
	</body>
</html>
