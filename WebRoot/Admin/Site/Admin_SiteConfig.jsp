<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="../PubPackage.jsp"%>
<% 
String adminPopNum="POP000218";

if(request.getParameter("Action")!=null)
{
 String action=request.getParameter("Action");
 if(action.equals("Save"))
 {
 if(!DAOFactory.getAdminDaoInstance().checkAdminPopedom(Integer.parseInt(session.getAttribute("AdminID").toString()),adminPopNum))
{
JS.ErrCode(response,"你没有足够的权限！请与管理员联系！");
JS.goBack(response,-1);
}
 String siteName=request.getParameter("SiteName");
 String siteTitle=request.getParameter("SiteTitle");
 String siteUrl=request.getParameter("SiteUrl");
 String installDir=request.getParameter("InstallDir");
 String logoUrl=request.getParameter("LogoUrl");
 String bannerUrl=request.getParameter("BannerUrl");
 String technicalSupport=request.getParameter("TechnicalSupport");
 String copyright=request.getParameter("Copyright");
 String meta_Keywords=request.getParameter("Meta_Keywords");
 String meta_Description=request.getParameter("Meta_Description");
 SiteConfig cfg=new SiteConfig();
 cfg.setSiteName(siteName);
 cfg.setSiteTitle(siteTitle);
 cfg.setSiteUrl(siteUrl);
 cfg.setInstallDir(installDir);
 cfg.setLogoUrl(logoUrl);
 cfg.setBannerUrl(bannerUrl);
 cfg.setTechnicalSupport(technicalSupport);
 cfg.setCopyright(copyright);
 cfg.setMeta_Keywords(meta_Keywords);
 cfg.setMeta_Description(meta_Description);
 DAOFactory.getSiteDao().updateSite(cfg);
 JS.goBack(response,-1); 
 }


}
String SiteID=request.getParameter("SiteID");
if(null==SiteID||"".equals(SiteID)){
SiteID="1";
}
SiteConfig cfg=DAOFactory.getSiteDao().getSite(SiteID);
if(null==cfg){
cfg=new SiteConfig();
SiteConfig site=DAOFactory.getSiteDao().getSite(SiteID);
cfg.setSiteID(Integer.parseInt(SiteID));
cfg.setSiteName(site.getSiteName());
cfg.setSiteUrl(site.getSiteUrl());
cfg.setInstallDir(site.getInstallDir());
cfg.setLogoUrl("http://");
DAOFactory.getSiteDao().insertSite(cfg);
}
%>
<html>
	<head>
		<title>网站配置</title>
		<meta http-equiv='Content-Type' content='text/html; charset=utf-8'>
		<link href='../CSS/Admin_Style.css' rel='stylesheet' type='text/css'>
		<script language='JavaScript'>
function SelectColor(sEL,form){
    var dEL = document.all(sEL);
    var url = '../Editor/editor_selcolor.asp?color='+encodeURIComponent(sEL);
    var arr = showModalDialog(url,window,'dialogWidth:280px;dialogHeight:250px;help:no;scroll:no;status:no');
    if (arr) {
        form.value=arr;
        sEL.style.backgroundColor=arr;
    }
}
</script>
	</head>
	<body leftmargin='2' topmargin='0' marginwidth='0' marginheight='0'>
		<table width='100%' border='0' align='center' cellpadding='2'
			cellspacing='1' Class='border'>
			<tr class='topbg'>
				<td height='22' colspan='10'>
					<table width='100%'>
						<tr class='topbg'>
							<td align='center'>
								<b>网 站 基 本 配 置</b>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<script language='javascript'>
var tID=0;
function ShowTabs(ID){
  if(ID!=tID){
    TabTitle[tID].className='title5';
    TabTitle[ID].className='title6';
    Tabs[tID].style.display='none';
    Tabs[ID].style.display='';
    tID=ID;
  }
}
function IsDigit()
{
  return ((event.keyCode >= 48) && (event.keyCode <= 57));
}
//-->
</script>
		<form name='myform' id='myform' method='POST'
			action='Admin_SiteConfig.jsp?Action=Save'>
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
										<input name='SiteName' type='text' id='SiteName' value='<%=cfg.getSiteName() %>'
											size='40' maxlength='50'>
									</td>
								</tr>
								<tr class='tdbg'>
									<td width='40%' class='tdbg5'>
										<strong>网站标题：</strong>
									</td>
									<td>
										<input name='SiteTitle' type='text' id='SiteTitle'
											value='<%=cfg.getSiteTitle() %>' size='40' maxlength='50'>
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
											value='<%=cfg.getSiteUrl() %>' size='40' maxlength='255'>
									</td>
								</tr>
								<tr class='tdbg'>
									<td width='40%' class='tdbg5'>
										<font color=red><strong>安装目录：</strong>
										<br>系统安装目录（相对于根目录的位置）<br>系统会自动获得正确的路径，但需要手工保存设置。</font>
									</td>
									<td>
										<input name='InstallDir' type='text' id='InstallDir'
											value='<%=cfg.getInstallDir() %>' size='40' maxlength='30' readonly>
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
											value='<%=cfg.getLogoUrl() %>' size='40' maxlength='255'>
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
											value='<%=cfg.getBannerUrl() %>' size='40' maxlength='255'>
									</td>
								</tr>
								<tr class='tdbg'>
									<td width='40%' class='tdbg5'>
										<strong>技术支持：</strong>
									</td>
									<td>
										<input name='TechnicalSupport' type='text'
											id='TechnicalSupport' value='<%=cfg.getTechnicalSupport() %>' size='60'>
									</td>
								</tr>

								<tr class='tdbg'>
									<td width='40%' class='tdbg5'>
										<strong>版权信息：</strong>
										<br>
										支持HTML标记，不能使用双引号
									</td>
									<td>
										<textarea name='Copyright' cols='60' rows='4' id='Copyright'><%=cfg.getCopyright() %></textarea>
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
											id='Meta_Keywords'><%=cfg.getMeta_Keywords() %></textarea>
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
											id='Meta_Description'><%=cfg.getMeta_Description() %></textarea>
									</td>
								</tr>
							</tbody>
						</table>
						<table width='100%' border='0'>
							<tr>
								<td height='40' align='center'>
									<input name='cmdSave' type='submit' id='cmdSave' value=' 保存设置 '>
								</td>
							</tr>
						</table>
						</form>
	</body>
</html>
<!-- Powered by: PowerEasy 2005 -->
