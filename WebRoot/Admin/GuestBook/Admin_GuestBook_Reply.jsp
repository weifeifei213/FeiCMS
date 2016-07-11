<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="../PubPackage.jsp"%>
<%
String adminPopNum="POP000212";
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
int id=Integer.parseInt(request.getParameter("ID"));
if(request.getParameter("Action")!=null)
{
 String action=request.getParameter("Action");
 if("SaveAdd".equals(action))
 {
  GuestBook guestBook =new GuestBook();
  String guestBookReply=request.getParameter("Content");
  String guestBookReplyAdmin=request.getParameter("ReplyAdmin");
  
  String dateTime=request.getParameter("ReplyDatetime");
  String IsShow=request.getParameter("IsShow");
  
  
guestBook.setGuestReply(guestBookReply);
guestBook.setGuestReplyAdmin(guestBookReplyAdmin);
guestBook.setGuestDatetime(dateTime);
guestBook.setGuestID(id);
guestBook.setIsShow(Integer.parseInt(IsShow));
  
 DAOFactory.getGuestBookDao().UpdateGuestBook(guestBook);
 JS.goURL(response,"Admin_GuestBook.jsp");
 }
 if("IsShow".equals(action)){  
 DAOFactory.getGuestBookDao().ShowGuestBook(id);
 JS.goURL(response,"Admin_GuestBook.jsp");
 }
}

 %>
<html>
	<head>
		<title>调查管理</title>
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
		<form method='POST' name='myform' onSubmit='return CheckForm();'
			action='Admin_GuestBook_Reply.jsp?ID=<%=id %>' target='_self'>
			<table width='100%' border='0' align='center' cellpadding='2'
				cellspacing='1' class='border'>
				<tr class='title'>
					<td height='22' colspan=4 align=center class='title'><strong>回 复 留 言</strong></td>
				</tr>
				<tr class='tdbg'>
					<td width="20%" align='right'>回复内容：					</td>
					<td width="45" colspan='3'>
						<textarea name='Content' cols='60' rows='10'></textarea>					</td>
				</tr>
				
				<tr class='tdbg'>
					<td align='right'>回复人：					</td>
					<td colspan='3'><input name='ReplyAdmin' type='text' id='ReplyAdmin' size='20' maxlength='20' value=<%=session.getAttribute("AdminName") %>></td>
				</tr>
				<tr class='tdbg'>
					<td align='right'>是否显示：					</td>
					<td colspan='3'>显示：<input type="radio" name="IsShow" id="IsShow" value="1" /> &nbsp;&nbsp;&nbsp;&nbsp;不显示：<input type="radio" name="IsShow" id="IsShow" value="-1" checked="checked" /></td>
				</tr>
				<tr class='tdbg'>
					<td align='right'>
						回复时间：					</td>
					<td colspan='3'>
					<% 
	//取得但前时间
	GregorianCalendar gc = new GregorianCalendar();
	String nowDateTime = Integer.toString(gc
	.get(GregorianCalendar.YEAR))
	+ "-"
	+ Integer.toString(gc.get(GregorianCalendar.MONTH) + 1)
	+ "-"
	+ Integer.toString(gc.get(GregorianCalendar.DAY_OF_MONTH))
	+ " "
	+ Integer.toString(gc.get(GregorianCalendar.HOUR_OF_DAY))
	+ ":"
	+ Integer.toString(gc.get(GregorianCalendar.MINUTE))
	+ ":" + Integer.toString(gc.get(GregorianCalendar.SECOND));
	%>
						<input name='ReplyDatetime' type='text' id='ReplyDatetime'
							value='<%=nowDateTime %>' size='20' maxlength='20'>					</td>
				</tr>
				
				<tr class='tdbg'>
					<td colspan=4 align=center>
					    <input name='IsReply' type='hidden' id='IsReply' value='1'>
						<input name='Action' type='hidden' id='Action' value='SaveAdd'>
						<input name='Submit' type='submit' id='Submit' value='回 复'>
						&nbsp;
						<input name='Reset' type='reset' id='Reset' value=' 清 除 '>					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
<!-- Powered by: PowerEasy 2005 -->
