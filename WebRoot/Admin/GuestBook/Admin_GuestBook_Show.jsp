<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="../PubPackage.jsp"%>
<%
String adminPopNum="POP000209";
if(!DAOFactory.getAdminDaoInstance().checkAdminPopedom(Integer.parseInt(session.getAttribute("AdminID").toString()),adminPopNum))
{
JS.ErrCode(response,"你没有足够的权限！请与管理员联系！");
JS.goBack(response,-1);
}
if(request.getParameter("ID")==null||"".equals(request.getParameter("ID")))
{
 JS.ErrCode(response,"参数传递错误！");
 JS.goBack(response,-1);
 return; 
}
int guestBookID=Integer.parseInt(request.getParameter("ID"));
GuestBook guestBook=new GuestBook();
guestBook=DAOFactory.getGuestBookDao().queryGuestBook(guestBookID);
 %>
<html>
	<head>
		<title>留言管理</title>
		<meta http-equiv='Content-Type' content='text/html; charset=utf-8'>
		<link href='CSS/Admin_Style.css' rel='stylesheet' type='text/css'></head>
	<body leftmargin='2' topmargin='0' marginwidth='0' marginheight='0'>
		<table width='100%' border='0' align='center' cellpadding='2'
			cellspacing='1' class='border'>
			<tr class='topbg'>
				<td height='22' colspan='10'>
					<table width='100%'>
						<tr class='topbg'>
							<td align='center'><b>网 站 留 言 管 理</b></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr class='tdbg'>
				<td width='70' height='30'>
					<strong>管理导航：</strong>
				</td>
				<td><a href='Admin_GuestBook.jsp'>网站留言管理&nbsp;</a> </td>
			</tr>
		</table>
		<script language='JavaScript'>
function CheckForm(){
  if (document.myform.Title.value==''){
     alert('调查主题不能为空！');
     document.myform.Title.focus();
     return false;
  }
  return true;  
}
</script>
			<table width='100%' border='0' align='center' cellpadding='2'
				cellspacing='1' class='border'>
				<tr class='title'>
					<td height='22' colspan=4 align=center class='title'><strong> 留 言 内 容</strong></td>
				</tr>
				<tr class='tdbg'>
					<td width="20%" align='right'>留言标题：					</td>
					<td  colspan='3'><%=guestBook.getGuestTitle() %></td>
				</tr>
				
				<tr class='tdbg'>
					<td align='right'>留言内容：					</td>
					<td colspan='3'><%=guestBook.getGuestContent() %></td>
				</tr>
				<tr class='tdbg'>
					<td align='right'>
						留言时间：					</td>
				  <td colspan='3'><%=guestBook.getGuestDatetime() %></td>
				</tr>
				<%
				if(guestBook.getIsReply()==1)
				{
				 %>
			 <tr class='tdbg'>
				  <td align='right'>回复内容：</td>
			      <td colspan='3'><%=guestBook.getGuestReply() %></td>
			  </tr>
				<tr class='tdbg'>
				  <td align='right'>回复人：</td>
			      <td colspan='3'><%=guestBook.getGuestReplyAdmin() %></td>
			  </tr>
				<tr class='tdbg'>
				  <td align='right'>回复时间：</td>
			      <td colspan='3'><%=guestBook.getGuestDatetime() %></td>
			  </tr>
				<%}else{ %>
				<tr class='tdbg'>
					<td colspan=4 align=center><input name='Submit' type='button' id='Submit'  onClick="javascript:window.location='Admin_GuestBook_Reply.jsp?ID=<%=guestBookID%>';" value='回 复' >
						&nbsp;</td>
				</tr>
				<%} %>
			</table>
	</body>
</html>
<!-- Powered by: PowerEasy 2005 -->
