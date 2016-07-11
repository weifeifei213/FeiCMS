<%@ page language="java"  pageEncoding="utf-8"%>
<%@ include file="../PubPackage.jsp"%>
<%
FriendSite fs=new FriendSite();
if (request.getParameter("ID") == null
		|| "".equals(request.getParameter("ID"))) {
			JS.AlertCode(response, "参数传递错误！");
			JS.goBack(response, -1);
		}
else
{
int id=Integer.parseInt(request.getParameter("ID"));
FriendSiteDao fsDao=new FriendSiteDaoImpl();
fs=fsDao.quaryOneFs(id);

}
  

%>
<html>
	<head>
		<title>友情链接管理</title>
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
								<b>友 情 链 接 管 理</b></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr class='tdbg'>
				<td width='70' height='30'>
					<strong>管理导航：</strong>
				</td>
				<td>
					<a href='Admin_FriendSite.jsp'>友情链接管理首页</a>&nbsp;|&nbsp;    <a href='Admin_FriendSite_Add.jsp'>添加友情链接</a>&nbsp;|&nbsp;    <a href='Admin_FriendSite_Class.jsp'>链接类别管理</a>&nbsp;|&nbsp;    <a href='Admin_FriendSite_ClassAdd.jsp'>添加链接类别&nbsp;</a>&nbsp;</td>
			</tr>
		</table>
		<script language='JavaScript'>
function CheckForm(){
  if(document.myform.SiteName.value==''){
    alert('请输入网站名称！');
    document.myform.SiteName.focus();
    return false;
  }
  if(document.myform.SiteUrl.value=='' || document.myform.SiteUrl.value=='http://'){
    alert('请输入网站地址！');
    document.myform.SiteUrl.focus();
    return false;
  }
}
</script>
		<form method='post' name='myform' onsubmit='return CheckForm()'
			action='Admin_FriendSite_ModfySave.jsp?ID=<%=fs.getID() %>'>
			<table border='0' cellpadding='2' cellspacing='1' align='center'
				width='100%' class='border'>
				<tr class='title'>
					<td height='22' colspan='2' align='center'>
						<strong>修改友情链接</strong>					</td>
				</tr>
				<tr class='tdbg'>
					<td width='150' align='right'>
						<strong>链接所属类别：</strong>					</td>
					<td>
						<select name='ClassID' id='ClassID'>
							<option value='0'>
								不属于任何类别							</option>
							
						</select>					</td>
				</tr>
				
				<tr class='tdbg'>
					<td width='150' align='right'>
						<strong>网站名称：</strong>					</td>
					<td>
						<input type='text' name='SiteName' id='SiteName' size='60'
							maxlength='50' value='<%=fs.getSiteName() %>'>
						<font color='#FF0000'> *</font>					</td>
				</tr>
				<tr class='tdbg'>
					<td width='150' align='right'>
						<strong>网站地址：</strong>					</td>
					<td>
						<input type='text' name='SiteUrl' id='SiteUrl' size='80'
							maxlength='100' value='<%=fs.getSiteUrl() %>'>
						<font color='#FF0000'>*</font>					</td>
				</tr>
				<tr class='tdbg'>
					<td width='150' align='right'>
						<strong>网站Logo地址：</strong>					</td>
					<td>
						<input type='text' name='DefaultPicUrl' id='DefaultPicUrl' size='80'
							maxlength='100' value='<%=fs.getLogoUrl() %>'>		
					
							<iframe name="ad" frameborder="0" width="100%" height="24"
											scrolling="no" src="UpLoadLogo.jsp"></iframe>		
							
							
										</td>
				</tr>
				
				<tr class='tdbg'>
					<td width='150' align='right'>
						<strong>电子邮件：</strong>					</td>
					<td>
						<input type='text' name='SiteEmail' id='SiteEmail' size='40'
							maxlength='50' value='<%=fs.getSiteEmail() %>'>					</td>
				</tr>
				
				<tr class='tdbg'>
					<td width='150' align='right'>
						<strong>网站简介：</strong>					</td>
					<td>
						<textarea name='SiteIntro' id='SiteIntro' cols='67' rows='4'><%=fs.getSiteIntro() %></textarea>					</td>
				</tr>
				
				<tr class='tdbg'>
					<td width='150' align='right'>
						<strong>录入时间：</strong>					</td>
					<td>

						<input type='text' name='UpdateTime' id='UpdateTime'
							value='<%=fs.getUpdateTime() %>' maxlength='50'>
						
						<font color='#0000FF'>2003-5-12 12:32:47</font>					</td>
				</tr>
				
				
				<tr class='tdbg'>
					<td height='40' colspan='2' align='center'>
						<input name='Action' type='hidden' id='Action' value='Save'>
						<input type='submit' value=' 确 定 ' name='submit'>
						&nbsp;&nbsp;
						<input type='reset' value=' 重 填 ' name='reset'>					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
