<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="../PubPackage.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 %>	
<%
if(!(request.getParameter("Action")==null||"".equals(request.getParameter("Action"))))
{
 String action=request.getParameter("Action");
 if("SaveModfy".equals(action))
 {
 int id=0;
 int outTime=1;
 int showType=0;
 int isSelected=0;
 if(request.getParameter("ID")!=null)
   id=Integer.parseInt(request.getParameter("ID"));
 String title=request.getParameter("Title");
 String content=request.getParameter("Content");
 String author=request.getParameter("Author");
 String upDateTime=request.getParameter("DateAndTime"); 
 
 if(request.getParameter("OutTime")!=null)
   outTime=Integer.parseInt(request.getParameter("OutTime"));
   
 if(request.getParameter("ShowType")!=null)
   showType=Integer.parseInt(request.getParameter("ShowType"));
   
 if(request.getParameter("IsSelected")!=null)
   isSelected=Integer.parseInt(request.getParameter("IsSelected"));
 Announce announce=new Announce();
 announce.setID(id);
 announce.setTitle(title);
 announce.setContent(content);
 announce.setAuthor(author);
 announce.setDateAndTime(upDateTime);
 announce.setOutTime(outTime);
 announce.setShowType(showType);
 announce.setIsSelected(isSelected); 
 DAOFactory.getAnnounceDao().UpdataAnnounce(announce);
 JS.goURL(response,"Admin_Announce.jsp");
 }
 
if("Del".equals(action))
{
 if(request.getParameter("ID")==null||"".equals(request.getParameter("ID")))
  {
   JS.ErrCode(response,"参数传递错误！");
   JS.goBack(response,-1);
   return; 
  }else{
  int id=Integer.parseInt(request.getParameter("ID"));
  DAOFactory.getAnnounceDao().delAnnounce(id);
  JS.goURL(response,"Admin_Announce.jsp");  
  }
}
if("CancelNew".equals(action))
{
 if(request.getParameter("ID")==null||"".equals(request.getParameter("ID")))
  {
   	JS.ErrCode(response,"参数传递错误！");
   	JS.goBack(response,-1);
   	return; 
  }else{
  	int id=Integer.parseInt(request.getParameter("ID"));
  	DAOFactory.getAnnounceDao().calcelNewAnnounce(id);
  	JS.goURL(response,"Admin_Announce.jsp");  
  }
}
if("NumDel".equals(action))
{
 	String id[]=request.getParameterValues("ID");
  	for(int i=0;i<id.length;i++){
    DAOFactory.getAnnounceDao().delAnnounce(Integer.parseInt(id[i]));
  	}
  	JS.goURL(response,"Admin_Announce.jsp");
}

if("Modfy".equals(action))
{
Announce announce=new Announce();
int id=0;
if(request.getParameter("ID")==null||"".equals(request.getParameter("ID")))
{
  JS.ErrCode(response,"参数传递错误！");
  JS.goBack(response,-1);
  return;
}else{
	id=Integer.parseInt(request.getParameter("ID"));
	if(DAOFactory.getAnnounceDao().queryOneAnnounce(id)!=null) 
  	announce=DAOFactory.getAnnounceDao().queryOneAnnounce(id);
}
 %>
<html>
	<head>
		<title>公告管理</title>
		<%@include file="../Include.jsp" %>
		<%@include file="../kindeditorInclude.jsp" %>		
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
	</head>
	<body leftmargin='2' topmargin='0' marginwidth='0' marginheight='0'>
		<table width='100%' border='0' align='center' cellpadding='2'
			cellspacing='1' class='border'>
			<tr class='topbg'>
				<td height='22' colspan='10'>
					<table width='100%'>
						<tr class='topbg'>
							<td align='center'>
								<b>网 站 公 告 管 理</b>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr class='tdbg'>
				<td width='70' height='30'>
					<strong>管理导航：</strong>
				</td>
				<td>
					<a href='Admin_Announce.jsp'>公告管理首页</a>&nbsp;|&nbsp;
					<a href='Admin_Announce_Add.jsp'>修改公告</a>
				</td>
			</tr>
		</table>
		<script language='JavaScript'>
function CheckForm(){
  if (document.myform.Title.value==''){
     alert('公告标题不能为空！');
     document.myform.Title.focus();
     return false;
  }
  var CurrentMode=editor.CurrentMode;
  if (CurrentMode==0){
    document.myform.Content.value=editor.HtmlEdit.document.body.innerHTML; 
  }
  else if(CurrentMode==1){
    document.myform.Content.value=editor.HtmlEdit.document.body.innerText;
  }
  if (document.myform.Content.value==''){
     alert('公告内容不能为空！');
     editor.HtmlEdit.focus();
     return false;
  }
  return true;  
}
</script>
		<form method='POST' name='myform' onSubmit='return CheckForm();'
			action='Admin_Announce_Modfy.jsp?ID=<%=id %>' target='_self'>
			<table width='100%' border='0' align='center' cellpadding='2'
				cellspacing='1' class='border'>
				<tr class='title'>
					<td height='22' colspan='2' align='center'>
						<strong>添 加 公 告</strong>
					</td>
				</tr>
				<tr class='tdbg'>
					<td  align='right'>
						标题：
					</td>
					<td >
						<input type='text' name='Title' size='66' id='Title' value='<%=announce.getTitle() %>'>
					</td>
				</tr>
				<tr class='tdbg'>
					<td align='right'>
						内容：
					</td>
					<td>						
		         <textarea name="Content" cols="100" rows="8" style="width:100%;height:300px;visibility:hidden;">
		         <%=announce.getContent() %>
		         </textarea>
		           </td>
				</tr>
				<tr class='tdbg'>
					<td align='right'>
						发布人：
					</td>
					<td>
						<input name='Author' type='text' id='Author' value='<%=announce.getAuthor() %>'
							size='20' maxlength='20'>
					</td>
				</tr>
				<tr class='tdbg'>
					<td align='right'>
						发布时间：
					</td>
					<td>
						<input name='DateAndTime' type='text' id='DateAndTime'
							value='<%=announce.getDateAndTime() %>' size='20' maxlength='20'>
					</td>
				</tr>
				<tr class='tdbg'>
					<td align='right'>
						有效期：
					</td>
					<td>
						<input name='OutTime' type='text' id='OutTime' value='<%=announce.getOutTime() %>' size='10'
							maxlength='20'>
						天（为0时，表示永远有效）
					</td>
				</tr>
				<tr class='tdbg'>
					<td align='right'>
						显示类型：
					</td>
					<td>
					<%
					switch(announce.getShowType())
					{
					case 0:
					 %>
						<input type='radio' name='ShowType' value='0' checked>
						全部&nbsp;&nbsp;
						<input type='radio' name='ShowType' value='1' >
						滚动&nbsp;&nbsp;
						<input type='radio' name='ShowType' value='2'>
						弹出&nbsp;&nbsp;
					<%
					break;
					case 1:
					%>
					    <input type='radio' name='ShowType' value='0' >
						全部&nbsp;&nbsp;
						<input type='radio' name='ShowType' value='1' checked>
						滚动&nbsp;&nbsp;
						<input type='radio' name='ShowType' value='2'>
						弹出&nbsp;&nbsp;
					<% 
					break;
					case 2:
					%>
					    <input type='radio' name='ShowType' value='0' >
						全部&nbsp;&nbsp;
						<input type='radio' name='ShowType' value='1' >
						滚动&nbsp;&nbsp;
						<input type='radio' name='ShowType' value='2' checked>
						弹出&nbsp;&nbsp;
					<%
					break; 
					}
					 %>
					</td>
				</tr>
				<tr class='tdbg'>
					<td align='right'>
						&nbsp;
					</td>
					<td>
					<%
					
					if(announce.getIsSelected()==1)
					{
					 %>
						<input name='IsSelected' type='checkbox' id='IsSelected'
							value='1' checked>
					<%
					}else{
					 %>
					 <input name='IsSelected' type='checkbox' id='IsSelected'
							value='1' >
					 <%
					 }
					  %>
						设为最新公告
					</td>
				</tr>
				<tr class='tdbg'>
					<td height='40' colspan='2' align='center'>
						<input name='Action' type='hidden' id='Action' value='SaveModfy'>
						<input type='submit' name='Submit' value=' 修 改 '>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
<%
}
}
 %>
