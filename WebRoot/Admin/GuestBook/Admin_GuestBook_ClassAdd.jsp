<%@ page language="java"  pageEncoding="utf-8"%>
<%@ include file="../PubPackage.jsp"%>
<html><head><title>留言管理</title>
<meta http-equiv='Content-Type' content='text/html; charset=utf-8'>
<link href='CSS/Admin_Style.css' rel='stylesheet' type='text/css'>
</head>
<body leftmargin='2' topmargin='0' marginwidth='0' marginheight='0'>
<table width='100%' border='0' align='center' cellpadding='2' cellspacing='1' class='border'>
  <tr class='topbg'> 
    <td height='22' colspan='10'><table width='100%'><tr class='topbg'><td align='center'><b>网 站 留 言 管 理</b></td>
    </tr></table></td>
  </tr>
  <tr class='tdbg'>
    <td width='70' height='30'><strong>管理导航：</strong></td>
    <td>    <a href='Admin_GuestBook.jsp'>网站留言管理</a>&nbsp;|&nbsp;    <a href='Admin_GuestBook_Class.jsp'>留言类别管理</a>&nbsp;|&nbsp;    <a href='Admin_GuestBook_ClassAdd.jsp'>添加留言类别</a>&nbsp;</td>
  </tr>
</table>
<form method='post' action='Admin_GuestBook.asp' name='myform'>  <table width='100%' border='0' align='center' cellpadding='2' cellspacing='1' class='border' >    <tr class='title'>      <td height='22' colspan='2'> <div align='center'><strong>添加留言类别</strong></div></td>    </tr>    <tr class='tdbg'>      <td width='350' class='tdbg'><strong>类别名称：</strong></td>      <td class='tdbg'><input name='KindName' type='text' id='KindName' size='49' maxlength='30'>&nbsp;</td>    </tr>    <tr class='tdbg'>      <td width='350' class='tdbg'><strong>类别说明</strong><br>鼠标移至类别名称上时将显示设定的说明文字（不支持HTML）</td>      <td class='tdbg'><textarea name='ReadMe' cols='40' rows='5' id='ReadMe'></textarea></td>    </tr>    <tr class='tdbg'>      <td colspan='2' align='center' class='tdbg'><input name='Action' type='hidden' id='Action' value='SaveAddGKind'>        <input  type='submit' name='Submit' value=' 添 加 '>&nbsp;&nbsp;        <input name='Cancel' type='button' id='Cancel' value=' 取 消 ' onClick="window.location.href='Admin_GuestBook.asp'" style='cursor:hand;'></td>    </tr>  </table></form></body></html>
<!-- Powered by: PowerEasy 2005 -->