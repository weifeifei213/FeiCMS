<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="../PubPackage.jsp"%>
<%
String adminPopNum="POP000214";
if(!DAOFactory.getAdminDaoInstance().checkAdminPopedom(Integer.parseInt(session.getAttribute("AdminID").toString()),adminPopNum))
{
JS.ErrCode(response,"你没有足够的权限！请与管理员联系！");
JS.goBack(response,-1);
}
 List<Announce> li=DAOFactory.getAnnounceDao().queryAllAnnounce();
%>
<html>
	<head>
		<title>公告管理</title>
		<meta http-equiv='Content-Type' content='text/html; charset=utf-8'>
		<link href='../CSS/Admin_Style.css' rel='stylesheet' type='text/css'>
	</head>
	<body leftmargin='2' topmargin='0' marginwidth='0' marginheight='0'>
		<table width='100%' border='0' align='center' cellpadding='2'
			cellspacing='1' class='border'>
			<tr class='topbg'>
				<td height='22' colspan='10'>
					<table width="100%"> 
						<tr class="topbg"> 
							<td align="center"> 
								<b>网 站 公 告 管 理</b> 
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
					<a href='Admin_Announce.jsp'>公告管理首页</a>&nbsp;|&nbsp;
					<a href='Admin_Announce_Add.jsp'>添加新公告</a>
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
     if(confirm('确定要删除选中的公告吗？'))
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
					您现在的位置：网站公告管理&nbsp;&gt;&gt;&nbsp;网站首页公告
				</td>
			</tr>
		</table>
		<form name='myform' method='Post' action='Admin_Announce_Modfy.jsp'
					onsubmit='return ConfirmDel();'>
		<table width='100%' border='0' cellpadding='0' cellspacing='0'>
			<tr>				
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
								<strong>标 题</strong>
							</td>
							<td width='60' height='22' align='center'>
								<strong>最新公告</strong>
							</td>
							<td width='60' height='22' align='center'>
								<strong>显示方式</strong>
							</td>
							<td width='60' height='22' align='center'>
								<strong>发布人</strong>
							</td>
							<td width='120' height='22' align='center'>
								<strong>发布时间</strong>
							</td>
							<td width='60' height='22' align='center'>
								<strong>有效期</strong>
							</td>
							<td width='150' height='22' align='center'>
								<strong>操作</strong>
							</td>
						</tr>
						<%
						for(int i=0;i<li.size();i++){
						Announce ann=li.get(i);
						 %>
						<tr class='tdbg' onmouseout="this.className='tdbg'"
							onmouseover="this.className='tdbgmouseover'">
							<td width='30' align='center'>
								<input name='ID' type='checkbox' onclick='unselectall()'
									value='<%=ann.getID() %>'>
							</td>
							<td width='30' align='center'>
								<%=ann.getID() %>
							</td>
							<td>
								<a href='Admin_Announce_Modfy.jsp?Action=Modfy&ID=<%=ann.getID() %>'
									title='公告内容：<%=ann.getContent() %>'><%=ann.getTitle() %></a>
							</td>
							<td width='60' align='center'>
							 <%
							 if(ann.getIsSelected()==1){
							 %>
								<font color=green>新</font>
							<%} %>
							</td>
							<td width='60' align='center'>
							 <%
							 switch(ann.getShowType())
							 {
							 case 0:out.println("全部");break;
							 case 1:out.println("滚动");break;
							 case 2:out.println("弹出");break;							 
							 }							 
							%>
							</td>
							<td width='60' align='center'>
								<%=ann.getAuthor() %>
							</td>
							<td width='120' align='center'>
								<%=ann.getDateAndTime() %>
							</td>
							<td width='60' align='center'>
								<%=ann.getOutTime() %>
							</td>
							<td width='150' align='center'>
								<a href='Admin_Announce_Modfy.jsp?Action=Modfy&ID=<%=ann.getID() %>'>修改</a>&nbsp;
								<a href='Admin_Announce_Modfy.jsp?Action=Del&ID=<%=ann.getID() %>'
									onClick="return confirm('确定要删除此公告吗？');">删除</a>&nbsp;
								<a href='Admin_Announce_Modfy.jsp?Action=CancelNew&ID=<%=ann.getID() %>'>取消最新</a>
							</td>
							</tr>
						<%	} %>
					</table>
					<table width='100%' border='0' cellpadding='0' cellspacing='0'>
						<tr>
							<td width='130' height='30'>
								<input name='chkAll' type='checkbox' id='chkAll'
									onclick='CheckAll(this.form)' value='checkbox'>
								选中所有的公告
							</td>
							<td>
								<input type='submit' value='删除选定的公告' name='submit'
									onClick="document.myform.Action.value='NumDel'">
								&nbsp;&nbsp;&nbsp;&nbsp;
								<input name='Action' type='hidden' id='Action' value=''>
							</td>
						</tr>
					</table>
				</td>				
			</tr>
		</table>
		</form>
		<br>
		<b>说明：</b>
		<br>
		&nbsp;&nbsp;&nbsp;&nbsp;只有将公告设为最新公告后才会在前台显示
		<br>
		<br>
	</body>
</html>
