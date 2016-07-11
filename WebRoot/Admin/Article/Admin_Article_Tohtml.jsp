<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
	<head>
		<title>文章管理</title>
		<meta http-equiv='Content-Type' content='text/html; charset=utf-8'>
		<link href='../CSS/Admin_Style.css' rel='stylesheet' type='text/css'>		
		<script src="../js/prototype.js"></script>
		<script type="text/javascript">
		function page2html(){
		var indexname=document.getElementById("IndexName").value;
		var IndexTemplet=document.getElementById("IndexTemplet").value;			
				
		var URL = '<%=basePath%>/Page2Html?ManageType=Index2Html&dataUrl='+IndexTemplet+'&temUrl='+indexname;    
        new Ajax.Request(URL, { method: 'post',onSuccess: 
         function(transport) 
         {         
         if(transport.responseText==1){alert('生成成功！');}else{alert('生成失败，请重新生成！')}        
          }
          });
		}		
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
								<b>文章中心管理----文章生成</b>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr class='tdbg'>
				<td width='70' height='30'>
					<strong>管理导航：</strong>
				</td>
				<td colspan='5'>
					<a href='Admin_Article.asp?ChannelID=1&Status=9'>文章管理首页</a>&nbsp;|&nbsp;
					<a
						href='Admin_Article.asp?ChannelID=1&Action=Add&&ClassID=0&SpecialID=0'>添加文章</a>&nbsp;|&nbsp;
					<a href='Admin_Article.asp?ChannelID=1&ManageType=Check&Status=0'>审核文章</a>&nbsp;|&nbsp;
					<a href='Admin_Article.asp?ChannelID=1&ManageType=Special'>专题文章管理</a>&nbsp;|&nbsp;
					<a
						href='Admin_Article.asp?ChannelID=1&ManageType=Recyclebin&Status=9'>文章回收站管理</a>&nbsp;|&nbsp;
					<a href='Admin_Article.asp?ChannelID=1&ManageType=HTML&Status=1'><b>生成HTML管理</b>
					</a>
				</td>
			</tr>
			<form name='form3' method='Post'
				action='Admin_Article.asp?ChannelID=1&Action=Manage&ManageType=HTML&ClassID=0&SpecialID=0&Field=&keyword='>
			<tr class='tdbg'>
				<td width='70' height='30'>
					<strong>文章选项：</strong>
				</td>
				<td>
					<input name='Created' type='radio' onclick='submit();' value=''
						checked>
					所有文章&nbsp;&nbsp;&nbsp;&nbsp;
					<input name='Created' type='radio' onclick='submit();'
						value='False'>
					未生成的文章&nbsp;&nbsp;&nbsp
					<input name='Created' type='radio' onclick='submit();' value='True'>
					已生成的文章
				</td>
			</tr>
			</form>
		</table>
		<SCRIPT language=javascript>
function CheckItem(CB){
  var tagname=(arguments.length>1)?arguments[1]:'TR';
  if(document.myform.chkAll.checked){
    document.myform.chkAll.checked = document.myform.chkAll.checked&0;
  }
  if (CB.checked){hL(CB,tagname)};else{dL(CB,tagname)};
  var TB=TO=0;
  for (var i=0;i<myform.elements.length;i++) {
    var e=myform.elements[i];
    if ((e.name != 'chkAll') && (e.type=='checkbox')) {
      TB++;
      if (e.checked) TO++;
    }
  }
  myform.chkAll.checked=(TO==TB)?true:false;
}
function CheckAll(form){
  var tagname=(arguments.length>1)?arguments[1]:'TR';
  for (var i=0;i<form.elements.length;i++){
    var e = form.elements[i];
    if (e.name != 'chkAll' && e.disabled == false && e.type == 'checkbox') {
      e.checked = form.chkAll.checked;
      if (e.checked){hL(e,tagname)};else{dL(e,tagname)};
    }
  }
}
function hL(E,tagname){
  while (E.tagName!=tagname) {E=E.parentElement;}
  E.className='tdbg2';
}
function dL(E,tagname){
  while (E.tagName!=tagname) {E=E.parentElement;}
  E.className='tdbg';
}
function ConfirmDel(){
 if(document.myform.Action.value=='Del'){
     if(confirm('确定要删除选中的文章吗？本操作将把选中的文章移到回收站中。必要时您可从回收站中恢复！'))
         return true;
     else
         return false;
 }
 else if(document.myform.Action.value=='ConfirmDel'){
     if(confirm('确定要彻底删除选中的文章吗？彻底删除后将不能恢复！'))
         return true;
     else
         return false;
 }
 else if(document.myform.Action.value=='ClearRecyclebin'){
     if(confirm('确定要清空回收站？一旦清空将不能恢复！'))
         return true;
     else
         return false;
 }
 else if(document.myform.Action.value=='DelFromSpecial'){
     if(confirm('确定要将选中的文章从其所属专题中删除吗？操作成功后文章将不属于任何专题。'))
         return true;
     else
         return false;
 }
}



</SCRIPT>
		<br>
		<table width='100%' border='0' align='center' cellpadding='2'
			cellspacing='1' class='border'>
			<tr class='title'>
				<td height='22'>
					|&nbsp;
					<a
						href='Admin_Article.asp?ChannelID=1&Action=Manage&ManageType=HTML&ClassID=1'>新闻中心</a>
					|
				</td>
			</tr>
			<tr class='tdbg'>
			<td>首页生成:首页文件名称  
			<input type="text" id="IndexName" name="IndexName" value="Index.html"   >
			首页模板
			<input type="text" id="IndexTemplet" name="IndexTemplet" value="IndexTemplet.jsp"   >
			<input type="button" value="生成" onclick="page2html()" >
			</td>
			</tr>
			
		</table>
		<br>
		<table width='100%' border='0' align='center' cellpadding='0'
			cellspacing='0'>
			<tr>
				<td height='22'>
					您现在的位置：&nbsp;文章中心管理&nbsp;&gt;&gt;&nbsp;
					<a
						href='Admin_Article.asp?ChannelID=1&Action=Manage&ManageType=HTML'>文章生成</a>&nbsp;&gt;&gt;&nbsp;所有文章！
				</td>
				<td width='200' height='22' align='right'>
					<select name='JumpClass' id='JumpClass'
						onChange="if(this.options[this.selectedIndex].value!=''){location='Admin_Article.asp?ChannelID=1&Action=Manage&ManageType=HTML&ClassID='+this.options[this.selectedIndex].value;}">
						<option value='' selected>
							跳转栏目至…
						</option>
						<option value='1'>
							新闻中心
						</option>
					</select>
				</td>
			</tr>
		</table>
		<table width='100%' border='0' cellpadding='0' cellspacing='0'>
			<tr>
				<form name='myform' method='Post' action='Admin_Article.asp'
					onsubmit='return ConfirmDel();'>
				<td>
					<table class='border' border='0' cellspacing='1' width='100%'
						cellpadding='0'>
						<tr class='title' height='22'>
							<td height='22' width='30' align='center'>
								<strong>选中</strong>
							</td>
							<td width='25' align='center'>
								<strong>ID</strong>
							</td>
							<td align='center'>
								<strong>文章标题</strong>
							</td>
							<td width='60' align='center'>
								<strong>录入者</strong>
							</td>
							<td width='40' align='center'>
								<strong>点击数</strong>
							</td>
							<td width='80' align='center'>
								<strong>文章属性</strong>
							</td>
							<td width='60' align='center'>
								<strong>审核状态</strong>
							</td>
							<td width='40' align='center'>
								<strong>已生成</strong>
							</td>
							<td width='180' align='center'>
								<strong>生成HTML操作</strong>
							</td>
						</tr>
						<tr class='tdbg' onMouseOut="this.className='tdbg'"
							onMouseOver="this.className='tdbgmouseover'">
							<td width='30' align='center'>
								<input name='ArticleID' type='checkbox'
									onclick='CheckItem(this)' id='ArticleID' value='2'>
							</td>
							<td width='25' align='center'>
								2
							</td>
							<td>
								<a
									href='Admin_Article.asp?ChannelID=1&Action=Manage&ManageType=HTML&ClassID=-1'>[<font
									color='gray'>不属于任何栏目</font>]</a>&nbsp;
								<a href='Admin_Article.asp?ChannelID=1&Action=Show&ArticleID=2'
									title='标&nbsp;&nbsp;&nbsp;&nbsp;题：文章标题
作&nbsp;&nbsp;&nbsp;&nbsp;者：佚名
转 贴 自：本站原创
更新时间：2007-8-15 22:51:16
点 击 数：0
关 键 字：文章标题
推荐等级：★★★
分页方式：不分页
阅读点数：0'>文章标题</a>
							</td>
							<td width='60' align='center'>
								<a
									href='Admin_Article.asp?ChannelID=1&Action=Manage&ManageType=HTML&field=Inputer&keyword=admin'
									title='点击将查看此用户录入的所有文章'>admin</a>
							</td>
							<td width='40' align='center'>
								0
							</td>
							<td width='80' align='center'>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</td>
							<td width='60' align='center'>
								<font color=black>终审通过</font>
							</td>
							<td width='40' align='center'>
								<font color=red><b>×</b>
								</font>
							</td>
							<td width='180' align='left'>
								&nbsp;
								<a
									href='Admin_ArticleCreate.asp?ChannelID=1&Action=CreateArticle&ArticleID=2'
									title='生成本文章的HTML页面'>生成文件</a>&nbsp;
							</td>
						</tr>
					</table>
					<table width='100%' border='0' cellpadding='0' cellspacing='0'>
						<tr>
							<td width='200' height='30'>
								<input name='chkAll' type='checkbox' id='chkAll'
									onclick='CheckAll(this.form)' value='checkbox'>
								选中本页显示的所有文章
							</td>
							<td>
								<input name='CreateType' type='hidden' id='CreateType' value='1'>
								<input name='ClassID' type='hidden' id='ClassID' value='0'>
								<input name='submit1' type='submit' id='submit1'
									onClick="document.myform.Action.value='CreateIndex';document.myform.CreateType.value='1';document.myform.action='Admin_ArticleCreate.asp';"
									value='生成首页'>
								&nbsp;&nbsp;
								<input name='submit1' type='submit' id='submit1'
									onClick="document.myform.Action.value='CreateClass';document.myform.CreateType.value='2';document.myform.action='Admin_ArticleCreate.asp';"
									value='生成所有栏目列表页'>
								&nbsp;&nbsp;
								<input name='submit1' type='submit' id='submit1'
									onClick="document.myform.Action.value='CreateArticle';document.myform.CreateType.value='3';document.myform.action='Admin_ArticleCreate.asp';"
									value='生成所有文章'>
								&nbsp;&nbsp;
								<input name='submit2' type='submit' id='submit2'
									onClick="document.myform.Action.value='CreateArticle';document.myform.action='Admin_ArticleCreate.asp';"
									value='生成选定的文章'>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<input name='Submit3' type='submit' id='submit3'
									onClick="document.myform.Action.value='DelFile';document.myform.action='Admin_Article.asp'"
									value='删除选定文章的HTML文件'>
								<input name='Action' type='hidden' id='Action' value=''>
								<input name='ChannelID' type='hidden' id='ChannelID' value='1'>
							</td>
						</tr>
					</table>
				</td>
				</form>
			</tr>
		</table>
		<div class="show_page">
			共
			<b>1</b> 篇文章&nbsp;&nbsp;首页 上一页&nbsp;下一页 尾页&nbsp;页次：
			<strong><font color=red>1</font>/1</strong>页 &nbsp;
			<input type='text' name='MaxPerPage' size='3' maxlength='4'
				value='20'
				onKeyPress="if (event.keyCode==13) window.location='Admin_Article.asp?ChannelID=1&Action=Manage&ManageType=HTML&ClassID=0&SpecialID=0&Field=&keyword=&Status=3&Created=&PayStatus=False&OnTop=&IsElite=&IsHot=&page=1&MaxPerPage='+this.value;">
			篇文章/页&nbsp;转到：
			<select name='page' size='1'
				onChange="javascript:window.location='Admin_Article.asp?ChannelID=1&Action=Manage&ManageType=HTML&ClassID=0&SpecialID=0&Field=&keyword=&Status=3&Created=&PayStatus=False&OnTop=&IsElite=&IsHot=&MaxPerPage=20&page='+this.options[this.selectedIndex].value;">
				<option value='1' selected>
					第1页
				</option>
			</select>
		</div>
		<br>
	
	
	</body>
</html>
<!-- Powered by: PowerEasy 2005 -->
