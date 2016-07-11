<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="PubPackage.jsp"%>
<%
if(request.getParameter("ID")==null||"".equals(request.getParameter("ID")))
{
  JS.ErrCode(response,"参数传递错误！");
  JS.goBack(response,-1);
  return;
}
String id=request.getParameter("ID");
if(request.getParameter("Action")!=null)
{
 String action=request.getParameter("Action");
 if("SaveModifyPwd".equals(action))
 {
  Admin admin=new Admin();
  String adminPwd=request.getParameter("Password");
  MD5 md5=new MD5(adminPwd);
  String admin_passwd=md5.compute();
  admin.setId(Integer.parseInt(id));
  admin.setPassword(admin_passwd);
  DAOFactory.getAdminDaoInstance().updateAdminPwd(admin);
  JS.AlertCode(response,"修改密码成功！");
  JS.goURL(response,"Admin_Admin.jsp");
 }

}
Admin admin=DAOFactory.getAdminDaoInstance().showAdmin(Integer.parseInt(id));
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
								<b>管 理 员 管 理</b>							</td>
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
					<a href='Admin_Admin_Add.jsp'>新增管理员</a>				</td>
			</tr>
		</table>
		<SCRIPT language=javascript>
function CheckModifyPwd(){
  if(document.form1.Password.value==''){
      alert('密码不能为空！');
   document.form1.Password.focus();
      return false;
    }
  if((document.form1.Password.value)!=(document.form1.PwdConfirm.value)){
      alert('初始密码与确认密码不同！');
   document.form1.PwdConfirm.select();
   document.form1.PwdConfirm.focus();
      return false;
    }
}

</SCRIPT>
		<form method='post' action='Admin_Admin_ModifyPwd.jsp?ID=<%=id %>' name='form1'
			onsubmit='return CheckModifyPwd();'>
			<table width='100%' border='0' align='center' cellpadding='2'
				cellspacing='1' class='border'>
				<tr class='title'>
					<td height='22' colspan='2' align='center'>
						<strong>修 改 管 理 员 密 码</strong>					</td>
				</tr>
				<tr>
					<td width='40%' class='tdbg'>
						<strong>管理员名：</strong></td>
					<td width='60%' class='tdbg'>
						<%=admin.getAdminName() %>
						<input name='ID' type='hidden' value='1'>					</td>
				</tr>
				
				<tr>
					<td width='40%' class='tdbg'>
						<strong>新 密 码：</strong>					</td>
					<td width='60%' class='tdbg'>
						<input type='password' name='Password'>					</td>
				</tr>
				
				<tr>
					<td width='40%' class='tdbg'>
						<strong>确认密码：</strong>					</td>
					<td width='60%' class='tdbg'>
						<input type='password' name='PwdConfirm'>					</td>
				</tr>
				
				<tr>
					<td colspan='2' align='center' class='tdbg'>
						<input name='Action' type='hidden' id='Action'
							value='SaveModifyPwd'>
						<input name='Scode' type='hidden' id='Scode' value='qf8y8bwaks8'>
						<input type='submit' name='Submit' value='保存修改结果'
							style='cursor:hand;'>
						&nbsp;
						<input name='Cancel' type='button' id='Cancel' value=' 取 消 '
							onClick="window.location.href='Admin_Admin.jsp'"
							style='cursor:hand;'>					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
<!-- Powered by: PowerEasy 2005 -->
