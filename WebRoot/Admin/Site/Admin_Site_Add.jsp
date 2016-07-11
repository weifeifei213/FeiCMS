<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="../PubPackage.jsp"%>
<%
String adminPopNum="POP000202";
if(!DAOFactory.getAdminDaoInstance().checkAdminPopedom(Integer.parseInt(session.getAttribute("AdminID").toString()),adminPopNum))
{
JS.ErrCode(response,"你没有足够的权限！请与管理员联系！");
JS.goBack(response,-1);
}
if(request.getParameter("Action")!=null)
{
 String action=request.getParameter("Action");
 if("SaveAdd".equals(action))
 {
 String SiteName=request.getParameter("SiteName");
 String SiteDir=request.getParameter("SiteDir");
 String SiteUrl=request.getParameter("SiteUrl");
 String TemplateID=request.getParameter("TemplateID");
 SiteConfig site=new SiteConfig();
 site.setSiteName(SiteName);
 site.setInstallDir(SiteDir);
 site.setSiteUrl(SiteUrl);
 site.setTemplateProjectID(Integer.parseInt(TemplateID));
 DAOFactory.getSiteDao().insertSite(site);
 JS.alert("创建站点成功！");
 JS.goURL(response,"Admin_Site.jsp");
 }
}

 %>
<html>
	<head>
		<title>站点管理--添加站点</title>
		<meta http-equiv='Content-Type' content='text/html; charset=utf-8'>
		<link href='../CSS/Admin_Style.css' rel='stylesheet' type='text/css'>
	</head>
	<body leftmargin='2' topmargin='0' marginwidth='0' marginheight='0'>
		<table width='100%' border='0' align='center' cellpadding='2'
			cellspacing='1' class='border'>
			<tr class='topbg'>
				<td height='22' colspan='10'>
					<table width='100%'>
						<tr class='topbg'>
							<td align='center'><b>新建站点</b></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr class='tdbg'>
				<td width='70' height='30'>
					<strong>管理导航：</strong>
				</td>
				<td>
					<a href='Admin_Site.jsp'>站点管理首页</a>&nbsp;|
					<a href="Admin_Site_Add.jsp">新建站点</a>
				</td>
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
			action='Admin_Site_Add.jsp' target='_self'>
			<table width='100%' border='0' cellpadding='5' cellspacing='1'
				Class='border'>
				<tr>
					<td class='tdbg'>
						<table width='95%' border='0' align='center' cellpadding='2'
							cellspacing='1' bgcolor='#FFFFFF'>
							<tbody id='Tabs' style='display:'>
								<tr class='tdbg'>
									<td width='40%' class='tdbg5'>
										<strong>网站名称：</strong>
									</td>
									<td>
										<input name='SiteName' type='text' id='SiteName' value=''
											size='40' maxlength='50'>
									</td>
								</tr>
								<tr class='tdbg'>
									<td width='40%' class='tdbg5'>
										<strong>网站标题：</strong>
									</td>
									<td>
										<input name='SiteTitle' type='text' id='SiteTitle'
											value='' size='40' maxlength='50'>
									</td>
								</tr>
								<tr class='tdbg'>
									<td width='40%' class='tdbg5'>
										<strong>网站地址：</strong>
										<br>
										请填写完整URL地址
									</td>
									<td>
										<input name='SiteUrl' type='text' id='SiteUrl'
											value='' size='40' maxlength='255'>
									</td>
								</tr>
								<tr class='tdbg'>
									<td width='40%' class='tdbg5'>
										<font color=red><strong>安装目录：</strong>
										<br>系统安装目录（相对于根目录的位置）<br>系统会自动获得正确的路径，但需要手工保存设置。</font>
									</td>
									<td>
										<input name='InstallDir' type='text' id='InstallDir'
											value='' size='40' maxlength='30' readonly>
									</td>
								</tr>
								<tr class='tdbg'>
									<td width='40%' class='tdbg5'>
										<strong>LOGO地址：</strong>
										<br>
										请填写完整URL地址
									</td>
									<td>
										<input name='LogoUrl' type='text' id='LogoUrl'
											value='' size='40' maxlength='255'>
									</td>
								</tr>
								<tr class='tdbg'>
									<td width='40%' class='tdbg5'>
										<strong>Banner地址：</strong>
										<br>
										请填写完整URL地址
									</td>
									<td>
										<input name='BannerUrl' type='text' id='BannerUrl'
											value='' size='40' maxlength='255'>
									</td>
								</tr>
								<tr class='tdbg'>
									<td width='40%' class='tdbg5'>
										<strong>技术支持：</strong>
									</td>
									<td>
										<input name='TechnicalSupport' type='text'
											id='TechnicalSupport' value='' size='60'>
									</td>
								</tr>

								<tr class='tdbg'>
									<td width='40%' class='tdbg5'>
										<strong>版权信息：</strong>
										<br>
										支持HTML标记，不能使用双引号
									</td>
									<td>
										<textarea name='Copyright' cols='60' rows='4' id='Copyright'></textarea>
									</td>
								</tr>
								<tr class='tdbg'>
									<td width='40%' class='tdbg5'>
										<strong>网站META关键词：</strong>
										<br>
										针对搜索引擎设置的关键词
										<br>
										例如：在文本框填写
										<br>
										&lt;meta name="Keywords" content="网站,门户,新闻,快讯"&gt;
										<br>
										多个关键词请用,号分隔
									</td>
									<td>
										<textarea name='Meta_Keywords' cols='60' rows='4'
											id='Meta_Keywords'></textarea>
									</td>
								</tr>
								<tr class='tdbg'>
									<td width='40%' class='tdbg5'>
										<strong>网站META网页描述：</strong>
										<br>
										针对搜索引擎设置的网页描述
										<br>
										例如：在文本框填写
										<br>
										&lt;meta name="Description" content="网站,门户,新闻,快讯"&gt;
										<br>
										多个描述请用,号分隔
									</td>
									<td>
										<textarea name='Meta_Description' cols='60' rows='4'
											id='Meta_Description'></textarea>
									</td>
								</tr>
								
				<tr class='tdbg'>
					<td colspan=4 align=center>
						<input name='Action' type='hidden' id='Action' value='SaveAdd'>
						<input name='Submit' type='submit' id='Submit' value=' 添 加 '>
						&nbsp;
						<input name='Reset' type='reset' id='Reset' value=' 清 除 '>					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
