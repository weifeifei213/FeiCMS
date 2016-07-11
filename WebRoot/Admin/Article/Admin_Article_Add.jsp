<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="../PubPackage.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String adminPopNum="POP000106";
if(!DAOFactory.getAdminDaoInstance().checkAdminPopedom(Integer.parseInt(session.getAttribute("AdminID").toString()),adminPopNum))
{
 JS.ErrCode(response,"你没有足够的权限！请与管理员联系！");
 JS.goBack(response,-1);
 return;
}

%>
<html>
	<head>	
		<title>文章管理</title>		
		<meta http-equiv='Content-Type' content='text/html; charset=utf-8'>
		<link href='../CSS/Admin_Style.css' rel='stylesheet' type='text/css'>
		<link href='../CSS/Admin_Main.css' rel='stylesheet' type='text/css'>		
		<%@include file="kindeditor.jsp" %>
	</head>
	<body leftmargin='2' topmargin='0' marginwidth='0' marginheight='0'>
		<table width='100%' border='0' align='center' cellpadding='2'
			cellspacing='1' class='border'>
			<tr class='topbg'>
				<td height='22' colspan='10'>
					<table width='100%'>
						<tr class='topbg'>
							<td align='center'>
								文章中心管理----添加文章
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
					<a href='Admin_Article_List.jsp'>文章管理首页</a>&nbsp;|&nbsp;
					<a href='Admin_Article_Add.jsp'>添加文章</a>&nbsp;|&nbsp;
					<a href='Admin_Article_Check.jsp'>审核文章</a>&nbsp;|&nbsp;
					<a href='Admin_Article_Recyclebin.jsp'>文章回收站管理</a>
				</td>
			</tr>
		</table>
		<script language='JavaScript'>
		var str="";
	function GetClassID(value){}
	function FCKeditor_OnComplete( editorInstance ){
	window.status = editorInstance.Description ;}
	
	function selectPaginationType(){
	  document.myform.PaginationType.value=2;
	}
	function rUseLinkUrl(){
	  if(document.myform.UseLinkUrl.checked==true){
		document.myform.LinkUrl.disabled=false;
		 ArticleContent.style.display='none';
		 ArticleContent2.style.display='none';
		 ArticleContent3.style.display='none';
	  }else{
		document.myform.LinkUrl.disabled=true;
		ArticleContent.style.display='';
		ArticleContent2.style.display='';
		ArticleContent3.style.display='';
	  }
	}
	function CheckForm(){
	  if (document.myform.Title.value==''){
		alert('文章标题不能为空！');
		document.myform.Title.focus();
		return false;
	  }
	  if (document.myform.Keyword.value==''){
		alert('关键字不能为空！');
		document.myform.Keyword.focus();
		return false;
	  }
	}
	
	function IsDigit(){
	  return ((event.keyCode >= 48) && (event.keyCode <= 57));
	}
	function CopyTitle(){
	  if (document.myform.VoteTitle.value==''){
		 document.myform.VoteTitle.value = document.myform.Title.value;
	  }
	}	
	function addinput(iname,ivalue){
	  if(iname!='' && ivalue!=''){
		 $(iname).value=ivalue;
	  }
	}
	</script>
		<br>
		<table width='100%'>
			<tr>
				<td align='left'>
					您现在的位置：
					文章中心管理&nbsp;&gt;&gt;&nbsp;添加文章
				</td>
			</tr>
		</table>
		<form method='POST' name='myform' onSubmit='return CheckForm();'
			action='Admin_Article_AddSave.jsp' target='_self'>
			<table width='100%' border='0' align='center' cellpadding='5'
				cellspacing='0' class='border'>
				<tr align='center'>
					<td class='tdbg' height='200' valign='top'>
						<table width='98%' border='0' cellpadding='2' cellspacing='1'
							bgcolor='#FFFFFF'>
							<tbody id='Tabs' style='display:'>
								<tr class='tdbg'>
									<td width='120' align='right' class='tdbg5'>
										所属栏目：
									</td>
									<td>
									<select name='ClassID'id="ClassID" onchange="GetClassID(this.value);">
										<option value="" selected>选择文章分类</option>
										 <%							
                                String AdminID=session.getAttribute("AdminID").toString();                                
								SiteClassDao siteClassDao=new SiteClassDaoImpl();
								List<SiteClass> sclist=siteClassDao.queryOneTop(0,Integer.parseInt(AdminID));
								for(SiteClass sc:sclist){
								%>
								<option value="<%=sc.getClassID() %>"  >
								<% for(int i=0;i<sc.getDepth();i++){out.print("&nbsp;&nbsp;┣");} %>
								<%=sc.getClassName() %>
								</option>
								<%
								}
								%>  							
										</select>										
									</td>
								</tr>
								<tr class='tdbg'>
									<td width='120' align='right' class='tdbg5'>
										文章标题：
									</td>
									<td>
										<input name="Title" type="text" id="TitleIntact" size="80"
											maxlength="500">
										<span style="clear: both;"> <font color='#FF0000'>*</font>
										</span>
									</td>
								</tr>
								<tr class='tdbg'>
									<td width='120' align='right' class='tdbg5'>
										关键字：
									</td>
									<td><div style="clear: both;">
											<input name='Keyword' type='text' style="clear:both"
												id='Keyword' autocomplete='off' size='50'
												maxlength='255'>
											<font color='#FF0000'>*</font>
										</div>
										<div id="skey" style='display:none'></div>
										<font color='#0000FF'>用来查找相关文章，可输入多个关键字，中间用<font
											color='#FF0000'>“|”</font>隔开。不能出现&quot;'&?;:()等字符。</font></td>
								</tr>
                                <tr class='tdbg'>
									<td width='120' align='right' class='tdbg5'>
										内容摘要：
									</td>
									<td><div style="clear: both;">
											<textarea name="Abstract" class="textarea2" rows="5" cols="50"></textarea>
										</div>
									</td>
								</tr>
								<tr class='tdbg' id='ArticleContent' >
									<td width='120' align='right'  class='tdbg5'>
										<p >文章内容：</p>									
									</td>
									<td>									    								
      								<textarea name="Content" cols="100" rows="8" style="width:100%;height:300px;visibility:hidden;"></textarea>									
									</td>
								</tr>
								<tr class='tdbg'>
									<td width='120' rowspan="2" align='right' class='tdbg5'>
										<font color='#FF0000'>首页图片：</font>
									</td>
									<td>
										<select name='IncludePic' id='IncludePic'>
											<option value="0" selected>
												不指定首页图片
											</option>
											<option value="1">
												指定首页图片
											</option>
										</select>
										&nbsp;&nbsp;
										<input name='DefaultPicUrl' type='text' id='DefaultPicUrl'
											size='30' maxlength='200'>
										用于在首页的幻灯片处显示
									</td>
								</tr>
								<tr class='tdbg'>
									<td>
										<iframe name="ad" frameborder="0" width="100%" height="24"
											scrolling="no" src="../UpLoadPic.jsp"></iframe>
									</td>
								</tr>
								<tr class='tdbg'>
									<td rowspan="2" align='right' class='tdbg5'>
										下载文件：
									</td>
									<td>
										<select name='IncludeFile' id='IncludeFile'>
											<option value="0">
												不包含下载文件
											</option>
											<option value="1">
												包含下载文件
											</option> 
										</select>
										&nbsp;&nbsp;
										<input name='UploadFiles' type='text' id='UploadFiles'
											size='30' maxlength='200'>
									</td>
								</tr>
								<tr class='tdbg'>
									<td>
										<iframe name="ad1" frameborder="0" width="100%" height="24"
											scrolling="no" src="../UpLoadFile.jsp"></iframe>
									</td>
								</tr>
								<tr class='tdbg' id='ArticleContent2' style="display:''">
									<td width='120' align='right' class='tdbg5'>
										内容分页方式：
									</td>
									<td>
										<select name='PaginationType' id='PaginationType'>
											<option value='0' selected>
												不分页
											</option>
											<option value='1'>
												自动分页
											</option>
											<option value='2'>
												手动分页
											</option>
										</select>
										&nbsp;&nbsp;&nbsp;&nbsp;
										<strong><font color='#0000FF'>注：</font> </strong><font
											color='#0000FF'>手动分页符标记为“</font><font color='#FF0000'> NextPage </font><font
											color='#0000FF'>”，注意大小写</font>
									</td>
								</tr>
								<tr class='tdbg' id='ArticleContent3' style="display:''">
									<td width='120' align='right' class='tdbg5'>&nbsp;										
									</td>
									<td>
										自动分页时的每页大约字符数（包含HTML标记且必须大于100）：
										<input name='MaxCharPerPage' type='text' id='MaxCharPerPage'
											value='10000' size='8' maxlength='8'>
									</td>
								</tr>								 
								<tr class='tdbg'>
									<td width='120' align='right' class='tdbg5'>
										文章状态：
									</td>
									<td>								 
										<%
										Admin admin=DAOFactory.getAdminDaoInstance().showAdmin(Integer.parseInt(AdminID));
										 System.out.print("admin.getPurview()"+admin.getPurview());
										 if(admin.getPurview()==1){
										 %>
										<input Name='Status' Type='hidden' Id='Status' Value='1'>
										<%}else{ %>										
										<input Name='Status' Type='hidden' Id='Status' Value='0'>
										待审核
										<%} %>
										
									</td>
								</tr>
								 
							</tbody>
							<SCRIPT language='javascript' >
								function SelectAll(){
								  for(var i=0;i<document.myform.SpecialID.length;i++){
									document.myform.SpecialID.options[i].selected=true;}
								}
								function UnSelectAll(){
								  for(var i=0;i<document.myform.SpecialID.length;i++){
									document.myform.SpecialID.options[i].selected=false;}
								}
							</SCRIPT>

							<tr class='tdbg'>
								<td width='120' align='right' class='tdbg5'>
									所属专题：
								</td>
								<td>
									<select name='SpecialID' size='2' multiple
										style='height:300px;width:260px;'>
										<%=DAOFactory.getSpecialDao().showSpecialInSel(",")%>
									</select>
									<br>
									<input type='button' name='Submit' value='  选定所有专题  '
										onclick='SelectAll()'>
									<br>
									<input type='button' name='Submit' value='取消选定所有专题'
										onclick='UnSelectAll()'>
								</td>
							</tr>
							<tr class='tdbg'>
								<td width='120' align='right' class='tdbg5'>
									文章属性：
								</td>
								<td>
									<input name='OnTop' type='checkbox' id='OnTop' value='1'>
									固顶文章&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input name='Elite' type='checkbox' id='Elite' value='1'>
									推荐文章&nbsp;&nbsp;&nbsp;&nbsp;
								</td>
							</tr>
							<tr class='tdbg'>
								<td width='120' align='right' class='tdbg5'>
									阅读积分：
								</td>
								<td>
									<input type="text" name="ReadPoint" value="0">
								</td>
							</tr>
							<tr class='tdbg'>
								<td width='120' align='right' class='tdbg5'>
									排序：
								</td>
								<td>
									<input type="text" name="ListOrder" value="0" >
								</td>
							</tr>
							<tr class='tdbg'>
								<td width='120' align='right' class='tdbg5'>
									是否外部引用文章：
								</td>
								<td >
								<input id="IsLink" class="mid" type="radio" name="IsLink"  value="1" >
								<label for="IsLink" class="mid">是</label>
								<input id="NoLink" class="mid" type="radio" name="IsLink" checked="checked"  value="0" >
								<label for="NoLink" class="mid">否</label>
									
							    <label for="URL" class="mid">URL:</label>
							    <input id="URL" type="text" name="IsLink"   value="http://" >
								</td>
							</tr>
							
							<tr class='tdbg'>
								<td width='120' align='right' class='tdbg5'>
									录入时间：
								</td>
								<td>									
									<input name='UpdateTime' type='text' id='UpdateTime'
										value='<%=DateTimeUtils.getDateTime("yyyy-MM-dd HH:mm:ss") %>' maxlength='50'>
									时间格式为“年-月-日   时:分:秒”，如：
									<font color='#0000FF'>2003-5-12 12:32:47</font>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>

			<p align='center'>			
				<input name='Action' type='hidden' id='Action' value=''>
				<input name='add' type='submit' id='Add' value=' 添 加 '
					onClick="document.myform.Action.value='SaveAdd';document.myform.target='_self';"
					style='cursor:hand;'>
				&nbsp;
				<input name='Preview' type='button' id='Preview' value=' 预 览 '
					onClick="ss()"
					style='cursor:hand;'>
				<input name='Cancel' type='button' id='Cancel' value=' 取 消 '
					onClick="window.location.href='Admin_Article.jsp?ChannelID=1&Action=Manage';"
					style='cursor:hand;'>
			</p>
			<br>
		</form>
	</body>
</html>
