<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="../PubPackage.jsp"%>
<%
int articleID=0;
int classID=0;

String title="";
String updateTime="";
String content="";
String inputer="";
String keyword="";
int includeFile=0;
int hits=0;
if(request.getParameter("ID")==null||"".equals(request.getParameter("ID")))
{
JS.ErrCode(response," 参数传递错误！");
JS.goBack(response,-1);
return ;
}
  articleID=Integer.parseInt(request.getParameter("ID"));
  classID=Integer.parseInt(request.getParameter("ClassID"));
  Article art  =DAOFactory.getArticleDAOInstance().queryOneArticle(articleID);
  if(null!=art)
  {
   title=art.getTitle();
   updateTime=art.getUpdateTime();
   content=art.getContent();
   inputer=art.getInputer();
   keyword=art.getKeyword();
   hits=art.getHits()+1; 
   includeFile=art.getIncludeFile();
   if(includeFile==1)
   {
   content=content+"<br>此文章包含下载文件,点击<a href="+art.getUploadFiles()+"  target=_blank><font color=red>下载该文件</font></a>";
   }
  }
  DAOFactory.getArticleDAOInstance().updateHits(hits,articleID);

String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->


  <OBJECT ID="jatoolsPrinter"
			CLASSID="CLSID:B43D3361-D975-4BE2-87FE-057188254255"
			codebase="/jatoolsPrinter1.0/jatoolsP.cab#version=1,2,0,5" width=0
			height=0></OBJECT>
   </head>
<script language="JavaScript">
function doPrint(printpageClass)
{
		if(typeof(jatoolsPrinter.page_div_prefix)=='undefined'){
        alert("请按页顶上的黄色提示下载ActiveX控件.如果没有提示请按以下步骤设置ie.\n 工具-> internet 选项->安全->自定义级别,设置 ‘下载未签名的 ActiveX ’为'启用'状态")
        return ;
       }
		   var myreport = new Object();    
            myreport.documents = document; 
			myreport.print_settings = new Object();
			 myreport.print_settings.pageWidth=2100;
			 myreport.print_settings.pageHeight=2970;	
			 copyrights:'杰创软件拥有版权 www.jatools.com'        				   
			myreport.page_div_prefix = new Object();
			if(printpageClass == 'A4'){
			  myreport.classesReplacedWhenPrint = new Array(('.only_showgif{display:none}'));
			  myreport.page_div_prefix = whichreport1.value; 
			}		
       //jatoolsPrinter.print(myreport,true);   // 直接打印，不弹出打印机设置对话框 
	   jatoolsPrinter.printPreview(myreport);  //打印预览
}   
</script>
  <body>
    <a href="javascript:doPrint('A4')"></a>
   <select size="1" name="whichreport1" style="display: none">
			<option selected value="report1">
				
			</option>
		</select>
  <div id="report1page1">
  <table>
    <tr class="tdbg"> 
    <td colspan="3"><p align="center"><font size="6">
    打印测试标题</font><br>
        点击数：0&nbsp;&nbsp;&nbsp;&nbsp;文章录入：<%=inputer %></p>
      <p><%=content %></p>
      </td>
  </tr>
  </table>
  </div>
  </body>
</html>
