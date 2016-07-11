<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<link rel="stylesheet" href="<%=basePath%>kindeditor/themes/default/default.css" />
	<link rel="stylesheet" href="<%=basePath%>kindeditor/plugins/code/prettify.css" />
	<script charset="utf-8" src="<%=basePath%>kindeditor/kindeditor.js"></script>
	<script charset="utf-8" src="<%=basePath%>kindeditor/lang/zh_CN.js"></script>
	<script charset="utf-8" src="<%=basePath%>kindeditor/plugins/code/prettify.js"></script>
	<script>
		KindEditor.ready(function(K) {
			var editor1 = K.create('textarea[name="Content"]', {
				cssPath : '<%=basePath%>kindeditor/plugins/code/prettify.css',
				uploadJson : '<%=basePath%>kindeditor/jsp/upload_json.jsp',
				fileManagerJson : '<%=basePath%>kindeditor/jsp/file_manager_json.jsp',
				
				allowFileManager : true,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						document.forms['myform'].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						document.forms['myform'].submit();
					});				
				}
			});
			prettyPrint();
		});
	</script>

