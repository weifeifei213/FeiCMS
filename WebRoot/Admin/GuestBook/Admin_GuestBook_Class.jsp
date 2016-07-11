<%@ page language="java"  pageEncoding="utf-8"%>
<%@ include file="../PubPackage.jsp"%>
<html><head><title>留言管理</title>
<meta http-equiv='Content-Type' content='text/html; charset=utf-8'>
<link href='CSS/Admin_Style.css' rel='stylesheet' type='text/css'>
</head>
<body leftmargin='2' topmargin='0' marginwidth='0' marginheight='0'>
<table width='100%' border='0' align='center' cellpadding='2' cellspacing='1' class='border'>
  <tr class='topbg'> 
    <td height='22' colspan='10'><table width='100%'><tr class='topbg'><td align='center'><b>网 站 留 言 管 理</b></td></tr></table></td>
  </tr>
  <tr class='tdbg'>
    <td width='70' height='30'><strong>管理导航：</strong></td>
    <td>    <a href='Admin_GuestBook.jsp'>网站留言管理</a>&nbsp;|&nbsp;    <a href='Admin_GuestBook_Class.jsp'>留言类别管理</a>&nbsp;|&nbsp;    <a href='Admin_GuestBook_ClassAdd.jsp'>添加留言类别</a>&nbsp;    </td>
  </tr>
</table>
<br><table width='100%' border='0' align='center' cellpadding='2' cellspacing='1' class='border'>  <tr class='title' height='22'>    <td width='50' align='center'><strong>类别ID</strong></td>    <td width='150' align='center'><strong>类别名称</strong></td>    <td align='center'><strong>类别说明</strong></td>    <td width='150' align='center'><strong>常规操作</strong></td>    <td width='100' align='center'><strong>排序操作</strong></td>
  </tr>  <tr class='tdbg' onmouseout="this.className='tdbg'" onmouseover="this.className='tdbgmouseover'">    <td width='50' align='center'>1</td>    <td width='150' align='center'><a href='Admin_GuestBook.asp?KindID=1' title='点击进入管理此类别的留言'>sdf</a></td>    <td>sfd</td>    <td width='150' align='center'><a href='Admin_GuestBook.asp?action=ModifyGKind&KindID=1'>修改</a>&nbsp;&nbsp;<a href='Admin_GuestBook.asp?Action=DelGKind&KindID=1' onClick="return confirm('确定要删除此类别吗？删除此类别后原属于此类别的留言将不属于任何类别。');">删除</a>&nbsp;&nbsp;<a href='Admin_GuestBook.asp?Action=ClearGKind&KindID=1' onClick="return confirm('确定要清空此类别中的留言吗？本操作将原属于此类别的留言改为不属于任何类别。');">清空</a></td><form name='orderform' method='post' action='Admin_GuestBook.asp'>    <td width='100' align='center'>      <input name='OrderID' type='text' id='OrderID' value='1' size='4' maxlength='4' style='text-align:center '>      <input name='KindID' type='hidden' id='KindID' value='1'>    <input type='submit' name='Submit' value='修改'>    <input name='Action' type='hidden' id='Action' value='OrderGuestKind'></td></form></tr></table></body></html>
<!-- Powered by: PowerEasy 2005 -->
