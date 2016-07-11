<%@ page language="java"  pageEncoding="utf-8"%>
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
    String fileName =Integer.toString(gc.get(GregorianCalendar.YEAR))+Integer.toString(gc.get(GregorianCalendar.MONTH)+1)+Integer.toString(gc.get(GregorianCalendar.DAY_OF_MONTH))+Integer.toString(gc.get(GregorianCalendar.SECOND));
    // 保存文件
    System.out.println("文件大小:"+smart.getFiles().getSize());
    if(smart.getFiles().getSize()>(1024*1024*2)){
    JS.ErrCode(response,"文件已超过2MB，请压缩 ！");
    JS.goBack(response,-1);
     return;
    
    }
    
	smart.getFiles().getFile(0).saveAs("UserFiles/File/"+fileName+"."+ext) ;
	
	
	
	
	String LoadFileName="UserFiles/File/"+fileName+"."+ext;
	
	out.println( "<script>parent.myform.WordFileUrl.value='"+LoadFileName+"'</script>");
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
<form name="fileform" enctype="multipart/form-data" method="post" action="UpLoadWord.jsp?Action=load" ">
<table width="100%" border="0" align="left" cellpadding="0" cellspacing="0" >
  <tr>
    <td width="303" height="20" align="left" class='tdbg'>
      <input name="file" type="file" size="50"></td>
    <td    class='tdbg'><input name="uploadfile" type="submit" id="uploadfile" value="上传" IsShowProcessBar="True"></td>
  </tr>
</table>
</form>
</body>