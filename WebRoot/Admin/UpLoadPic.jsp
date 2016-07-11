<%@ page language="java"  pageEncoding="utf-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.io.File"%>
<%@ include file="PubPackage.jsp"%>
<jsp:useBean id="smart" scope="page" class="org.lxh.smart.SmartUpload"/>

<%
if(request.getParameter("Action")!=null&&request.getParameter("Action").equals("load"))
{
	// 1、上传初始化
	smart.initialize(pageContext) ;
	// 2、准备上传
	smart.upload() ;
	// 3、保存上传的文件
	// smart.save("/upload") ;
	String ext = smart.getFiles().getFile(0).getFileExt() ;
	GregorianCalendar   gc=new   GregorianCalendar();   
    
    
    //给文件取名  
    SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
	String fileName = df.format(new Date()) + "_" + new Random().nextInt(1000);
    //String fileName =Integer.toString(gc.get(GregorianCalendar.YEAR))+Integer.toString(gc.get(GregorianCalendar.MONTH)+1)+Integer.toString(gc.get(GregorianCalendar.DAY_OF_MONTH))+Integer.toString(gc.get(GregorianCalendar.SECOND));
    // 保存文件
      System.out.println("文件大小:"+smart.getFiles().getSize());
      //图片不能超过400kB
      
     if(smart.getFiles().getSize()>(1024*400)){
     JS.ErrCode(response,"该图片已超过400KB,请压缩 ！");
     JS.goBack(response,-1);
     return;
    
    }    
    SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
    String ymd = sdf.format(new Date());
   
   String savePath = pageContext.getServletContext().getRealPath("/") + "UserFiles/image/"+ymd + "/"; 
     //创建文件夹  
   //savePath =savePath;   
   File dirFile = new File(savePath);
   if (!dirFile.exists()) {
	dirFile.mkdirs();
   }    
     
     System.out.println(savePath+fileName+"."+ext);
     
	smart.getFiles().getFile(0).saveAs(savePath+fileName+"."+ext);
	String LoadFileName="UserFiles/image/"+ymd + "/"+fileName+"."+ext;    

%>	
    
	<script language="javascript">
	parent.myform.DefaultPicUrl.value='<%=LoadFileName%>';
    </script>
<%
	//JS.goBack(response,-1);

}


%>

<link href='CSS/Admin_Style.css' rel='stylesheet' type='text/css'>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
<body>
<form name="fileform" enctype="multipart/form-data" method="post" action="UpLoadPic.jsp?Action=load" ">
<table width="100%" border="0" align="left" cellpadding="0" cellspacing="0" >
  <tr>
    <td width="303" height="20" align="left" class='tdbg'>
      <input name="file" type="file" size="50"></td>
    <td    class='tdbg'><input name="uploadfile" type="submit" id="uploadfile" value="上传" IsShowProcessBar="True"></td>
  </tr>
</table>
</form>
</body>