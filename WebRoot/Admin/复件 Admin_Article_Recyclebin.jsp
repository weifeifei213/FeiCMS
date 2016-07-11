<%@ page contentType="text/html; charset=utf-8" language="java"%>
<html>
	<head>
		<title>文章管理</title>
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
								<b>文章中心管理----文章回收站管理</b>
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
						href='Admin_Article.asp?ChannelID=1&ManageType=Recyclebin&Status=9'>文章回收站管理</a>
				</td>
			</tr>
			<form name='form3' method='Post'
				action='Admin_Article.asp?ChannelID=1&Action=Manage&ManageType=Recyclebin&ClassID=0&SpecialID=0&Field=&keyword='>
			<tr class='tdbg'>
				<td width='70' height='30'>
					<strong>文章选项：</strong>
				</td>
				<td>
					<input name='Status' type='radio' onclick='submit();' value='9'
						checked>
					所有文章&nbsp;&nbsp;&nbsp;&nbsp;
					<input name='Status' type='radio' onclick='submit();' value='-1'>
					草稿&nbsp;&nbsp;&nbsp;&nbsp;
					<input name='Status' type='radio' onclick='submit();' value='0'>
					待审核&nbsp;&nbsp;&nbsp;&nbsp;
					<input name='Status' type='radio' onclick='submit();' value='1'>
					已审核&nbsp;&nbsp;&nbsp;&nbsp;
					<input name='Status' type='radio' onclick='submit();' value='-2'>
					退稿
				</td>
				<td>
					<input name='OnTop' type='checkbox' onclick='submit()' value='True'>
					固顶文章&nbsp;&nbsp;&nbsp;&nbsp;
					<input name='IsElite' type='checkbox' onclick='submit()'
						value='True'>
					推荐文章&nbsp;&nbsp;&nbsp;&nbsp;
					<input name='IsHot' type='checkbox' onclick='submit()' value='True'>
					热门文章
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
					还没有任何栏目，请首先添加栏目。
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
						href='Admin_Article.asp?ChannelID=1&Action=Manage&ManageType=Recyclebin'>文章回收站管理</a>&nbsp;&gt;&gt;&nbsp;所有文章！
				</td>
				<td width='200' height='22' align='right'>
					<select name='JumpClass' id='JumpClass'
						onChange="if(this.options[this.selectedIndex].value!=''){location='Admin_Article.asp?ChannelID=1&Action=Manage&ManageType=Recyclebin&ClassID='+this.options[this.selectedIndex].value;}">
						<option value='' selected>
							跳转栏目至…
						</option>
						<option value=''>
							请先添加栏目
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
							<td width='100' align='center'>
								<strong>回收站操作</strong>
							</td>
						</tr>
						<tr class='tdbg' onMouseOut="this.className='tdbg'"
							onMouseOver="this.className='tdbgmouseover'">
							<td width='30' align='center'>
								<input name='ArticleID' type='checkbox'
									onclick='CheckItem(this)' id='ArticleID' value='1'>
							</td>
							<td width='25' align='center'>
								1
							</td>
							<td>
								<a
									href='Admin_Article.asp?ChannelID=1&Action=Manage&ManageType=Recyclebin&ClassID=-1'>[<font
									color='gray'>不属于任何栏目</font>]</a>&nbsp;
								<a href='Admin_Article.asp?ChannelID=1&Action=Show&ArticleID=1'
									title='标&nbsp;&nbsp;&nbsp;&nbsp;题：test
作&nbsp;&nbsp;&nbsp;&nbsp;者：佚名
转 贴 自：本站原创
更新时间：2007-8-15 19:45:37
点 击 数：0
关 键 字：test
推荐等级：★★★
分页方式：不分页
阅读点数：0'>test</a>
							</td>
							<td width='60' align='center'>
								<a
									href='Admin_Article.asp?ChannelID=1&Action=Manage&ManageType=Recyclebin&field=Inputer&keyword=admin'
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
							<td width='100' align='center'>
								<a
									href='Admin_Article.asp?ChannelID=1&Action=ConfirmDel&ArticleID=1'
									onClick="return confirm('确定要彻底删除此文章吗？彻底删除后将无法还原！');">彻底删除</a>
								<a
									href='Admin_Article.asp?ChannelID=1&Action=Restore&ArticleID=1'>还原</a>
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
								<input name='submit1' type='submit' id='submit1'
									onClick="document.myform.Action.value='ConfirmDel'"
									value=' 彻底删除 '>
								&nbsp;
								<input name='Submit2' type='submit' id='Submit2'
									onClick="document.myform.Action.value='ClearRecyclebin'"
									value='清空回收站'>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<input name='Submit3' type='submit' id='Submit3'
									onClick="document.myform.Action.value='Restore'"
									value='还原选定的文章'>
								&nbsp;
								<input name='Submit4' type='submit' id='Submit4'
									onClick="document.myform.Action.value='RestoreAll'"
									value='还原所有文章'>
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
				onKeyPress="if (event.keyCode==13) window.location='Admin_Article.asp?ChannelID=1&Action=Manage&ManageType=Recyclebin&ClassID=0&SpecialID=0&Field=&keyword=&Status=9&Created=&PayStatus=False&OnTop=&IsElite=&IsHot=&page=1&MaxPerPage='+this.value;">
			篇文章/页&nbsp;转到：
			<select name='page' size='1'
				onChange="javascript:window.location='Admin_Article.asp?ChannelID=1&Action=Manage&ManageType=Recyclebin&ClassID=0&SpecialID=0&Field=&keyword=&Status=9&Created=&PayStatus=False&OnTop=&IsElite=&IsHot=&MaxPerPage=20&page='+this.options[this.selectedIndex].value;">
				<option value='1' selected>
					第1页
				</option>
			</select>
		</div>
		<br>
		<form method='Get' name='SearchForm'
			action='Admin_Article.asp?ChannelID=1&Action=Manage&ManageType=Recyclebin'>
			<Input Type='Hidden' Name='PayStatus' Value='False'>
			<table width='100%' border='0' cellpadding='0' cellspacing='0'
				class='border'>
				<tr class='tdbg'>
					<td width='80' align='right'>
						<strong>文章搜索：</strong>
					</td>
					<td>
						<select name='Field' size='1'>
							<option value='Title' selected>
								文章标题
							</option>
							<option value='Content'>
								文章内容
							</option>
							<option value='Author'>
								文章作者
							</option>
							<option value='Inputer'>
								录入者
							</option>
						</select>
						<select name='ClassID'>
							<option value=''>
								所有栏目
							</option>
							<option value=''>
								请先添加栏目
							</option>
						</select>
						<input type='text' name='keyword' size='20' value='关键字'
							maxlength='50' onFocus='this.select();'>
						<input type='submit' name='Submit' value='搜索'>
						<input name='ManageType' type='hidden' id='ManageType'
							value='Recyclebin'>
						<input name='ChannelID' type='hidden' id='ChannelID' value='1'>
					</td>
				</tr>
			</table>
		</form>
		<br>
		<b>说明：</b>
		<br>
		&nbsp;&nbsp;&nbsp;&nbsp;文章属性中的各项含义：
		<font color=blue>顶</font>----固顶文章，
		<font color=red>热</font>----热门文章，
		<font color=green>荐</font>----推荐文章，
		<font color=blue>图</font>----首页图片文章，
		<font color=black>调</font>----有调查
		<br>
		<br>
	</body>
</html>
<!-- Powered by: PowerEasy 2005 -->
