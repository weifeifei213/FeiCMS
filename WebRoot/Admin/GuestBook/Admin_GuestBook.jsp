<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../PubPackage.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String adminPopNum="POP000209";
if(!DAOFactory.getAdminDaoInstance().checkAdminPopedom(Integer.parseInt(session.getAttribute("AdminID").toString()),adminPopNum))
{
JS.ErrCode(response,"你没有足够的权限！请与管理员联系！");
JS.goBack(response,-1);
}
List<GuestBook> li=DAOFactory.getGuestBookDao().showAllGuestBook(0);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>留言管理</title>
<meta http-equiv='Content-Type' content='text/html; charset=utf-8'>
<link href='../CSS/Admin_Style.css' rel='stylesheet' type='text/css'>
</head>
<body leftmargin='2' topmargin='0' marginwidth='0' marginheight='0'>
<table width='100%' border='0' align='center' cellpadding='2' cellspacing='1' class='border'>
  <tr class='topbg'> 
    <td height='22' colspan='10'>
    <table width='100%'>
    <tr class='topbg'><td align='center'><b>网 站 留 言 管 理</b></td></tr>
    </table>
    </td>
  </tr>
  <tr class='tdbg'>
    <td width='70' height='30'><strong>管理导航：</strong></td>
    <td>    
    <a href='Admin_GuestBook.jsp'>网站留言管理</a>&nbsp;|&nbsp;    
    <a href='Admin_GuestBook_Class.jsp'>留言类别管理</a>&nbsp;|&nbsp;    
    <a href='Admin_GuestBook_ClassAdd.jsp'>添加留言类别</a>&nbsp;    
    </td>
  </tr>
</table>
<br/>
<table width='100%' border='0' align='center' cellpadding='2' cellspacing='1' class='border'>  
<tr class='title' height='22'>    
<td width='50' align='center'><strong>类别ID</strong></td>    
<td width='150' align='center'><strong>类别名称</strong></td>    
<td align='center'><strong>类别说明</strong></td>    
<td width='150' align='center'><strong>常规操作</strong></td>    
<td width='100' align='center'><strong>排序操作</strong></td>
  </tr>  
  <% for(GuestBook gb:li){
  %>
  <tr class='tdbg' onmouseout="this.className='tdbg'" onmouseover="this.className='tdbgmouseover'">    
  <td width='50' align='center'>1</td>    
  <td width='150' align='center'>
  <a href='Admin_GuestBook.asp?KindID=1' title='点击进入管理此类别的留言'>sdf</a></td>    
  <td>sfd</td>    
  <td width='150' align='center'>
  <a href='Admin_GuestBook.asp?action=ModifyGKind&KindID=1'>修改</a>&nbsp;&nbsp;
  <a href='Admin_GuestBook.asp?Action=DelGKind&KindID=1' >删除</a>&nbsp;&nbsp;
  <a href='Admin_GuestBook.asp?Action=ClearGKind&KindID=1' >清空</a></td>
     
  <td width='100' align='center'>
  <form name='orderform' method='post' action='Admin_GuestBook.asp'>      
  <input name='OrderID' type='text' id='OrderID' value='1' size='4' maxlength='4' style='text-align:center '>  
  <input name='KindID' type='hidden' id='KindID' value='1'>    
  <input type='submit' name='Submit' value='修改'>    
  <input name='Action' type='hidden' id='Action' value='OrderGuestKind'>
  </form>
  </td>  
  </tr>  
  <% } %>
  
  </table>
  </body>
  </html>