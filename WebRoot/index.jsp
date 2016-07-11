<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link href="SWFUpload/css/swfupload-default.css" rel="stylesheet"type="text/css" />
	<script type="text/javascript" src="SWFUpload/js/jquery-latest.js"></script>
	<script type="text/javascript" src="SWFUpload/swfupload/swfupload.js"></script>
	<script type="text/javascript" src="SWFUpload/js/handlers.js"></script>

<script type="text/javascript">
	var contextPath="${pageContext.request.contextPath}";
	function startLoad(){
		var url=contextPath+"/servlet/FileUploadServlet.htm"; //处理上传的servlet
		var sizeLimit="1 MB";// 文件的大小  注意: 中间要有空格
		var types="*.jpg;*.jpeg;*.gif"; //注意是 " ; " 分割 
		var typesdesc="web iamge file"; //这里可以自定义
		var uploadLimit=20;  //上传文件的 个数
		initSwfupload(url,sizeLimit,types,typesdesc,uploadLimit);
	}
</script>
  </head>
  
  <body>
  <center>
	<input type="button" onclick="startLoad()" value="批量图片上传"/>
  </center>
  </body>
</html>
