<%@ page language="java" pageEncoding="utf-8"%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ include file="../PubPackage.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 %>	
<%
String adminPopNum="POP000108";
if(!DAOFactory.getAdminDaoInstance().checkAdminPopedom(Integer.parseInt(session.getAttribute("AdminID").toString()),adminPopNum))
{
 JS.ErrCode(response,"你没有足够的权限！请与管理员联系！");
 JS.goBack(response,-1);
 return;
}
ResultSet rs=null;
if(request.getParameter("PhotoID")==null)
{
  JS.ErrCode(response,"参数传递错误！");
  JS.goBack(response,-1);
  }
  else
  {
  int PhotoID=Integer.parseInt(request.getParameter("PhotoID"));
  try{
   rs=DAOFactory.getPhotoDao().quaryOnePhotoRS(PhotoID);
   if(rs.next())
   {
 
  
%>
<html>
	<head>
		<title>图片管理</title>
		<meta http-equiv='Content-Type' content='text/html; charset=utf-8'>
		<link href='../CSS/Admin_Style.css' rel='stylesheet' type='text/css'>
				
		<script src="../../js/prototype.js"></script>
		<script src="../../js/checklogin.js"></script>
		
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
		
		
	</head>
	<body leftmargin='2' topmargin='0' marginwidth='0' marginheight='0'>
		<table width='100%' border='0' align='center' cellpadding='2'
			cellspacing='1' class='border'>
			<tr class='topbg'>
				<td height='22' colspan='10'>
					<table width='100%'>
						<tr class='topbg'>
							<td align='center'>
								<b>图片中心管理----添加图片</b>
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
					<a href='Admin_Photo_List.jsp'>图片管理首页</a>&nbsp;|&nbsp;
					<a href='Admin_Photo_Add.jsp'>添加图片</a>&nbsp;|&nbsp;
					<a href='Admin_Photo_Check.jsp'>审核图片</a>&nbsp;|&nbsp;
					<a href='Admin_Photo_Special.jsp'>专题图片管理</a>&nbsp;|&nbsp;
					<a href='Admin_Photo_Recyclebin.jsp'>图片回收站管理</a>
				</td>
			</tr>
		</table>
		<script language='JavaScript'>
	function FCKeditor_OnComplete( editorInstance )
{
	window.status = editorInstance.Description ;
}
	
	function selectPaginationType(){
	  document.myform.PaginationType.value=2;
	}
	function rUseLinkUrl(){
	  if(document.myform.UseLinkUrl.checked==true){
		document.myform.LinkUrl.disabled=false;
		 ArticleContent.style.display='none';
		 ArticleContent2.style.display='none';
		 ArticleContent3.style.display='none';
	  }
	  else{
		document.myform.LinkUrl.disabled=true;
		ArticleContent.style.display='';
		ArticleContent2.style.display='';
		ArticleContent3.style.display='';
	  }
	}
	function CheckForm(){
	  if (document.myform.Title.value==''){
		alert('图片标题不能为空！');
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
	
	//同步两个文本框内容
	var i=0;
	function ShowPics(obj){
	var strpic=obj.value;
	var PicUrl=document.getElementById('showPic');
	PicUrl.innerHTML=PicUrl.innerHTML
	+"<div id='picDiv_"+i+"' style='width: 130;height:90 ;border: 1px dashed #000;float: left' >"
									+"<table cellpadding='0' cellspacing='0'>"
									+"<tr><td><img alt='' id='img_"+i+"' src='../../"+strpic+"' width='125' height='85' align='middle' style='border: 1px solid #000;'></td></tr>"
									+"<tr><td><a href='javascript:if(confirm(\"确实要删除该图片吗?\")) DelPics(\""+strpic+"\",\"picDiv_"+i+"\");\' style='font-size: 12px;color: #ff9933'>[删除]</a>"
									+"<input type='text' name='picNote_"+i+"' size='12' value='备注' />"
									+"<input type='hidden' name='picUrl_"+i+"' size='12' value='"+strpic+"' /></td></tr>"
									+"</table></div>";
									var a= PicUrl.innerHTML;
									a=a.replace('/','//');
									//alert(a);
									//alert(PicUrl.innerHTML);	
	i=i+1;
	}
	
	function DelPics(url,divs){
	//删除div
	//alert("删除");
	var _div=document.getElementById(divs); 
	 _div.parentNode.removeChild(_div);
	//删除数据	
	// alert(url)
	var PicUrls=document.getElementById("PicUrls").value; 
	document.getElementById("PicUrls").value=PicUrls.replace("|"+url,"");	 
	//删除文件  ajax
	
  URL = '<%=basePath%>/Admin_File_Servlet?imageFile='+url ;
    //url.substring(url.lastIndexOf("/")+1)
  new Ajax.Request(URL, { method: 'post',onSuccess: 
 function(transport) 
 {
 alert(transport.responseText);
 }

});
		
	
	
	
	}	
	
	
	</script>
		<br>
		<table width='100%'>
			<tr>
				<td align='left'>
					您现在的位置：
					<a href='Admin_Photo.jsp?ChannelID=1'>图片中心管理</a>&nbsp;&gt;&gt;&nbsp;添加图片
				</td>
			</tr>
		</table>
		<form method='POST' name='myform' onSubmit='return CheckForm();'
			action='Admin_Photo_ModfySave.jsp?PhotoID=<%=PhotoID %>' target='_self'>
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
										<select name='Tid'>
										<option value="" selected>选择图片分类</option>										
					                      <%
					                     out.print(DAOFactory.getPhotoClassDao().GetAllClass(rs.getInt("Tid")));
											%>
										</select>
										&nbsp;&nbsp;&nbsp;&nbsp;
										
									</td>
								</tr>
								<tr class='tdbg'>
									<td width='120' align='right' class='tdbg5'>
										图片标题：
									</td>
									<td>
										<input name="Title" type="text" id="TitleIntact" size="80"
											maxlength="500" value=<%=rs.getString("Title") %>>
										<span style="clear: both;"> <font color='#FF0000'>*</font>
										</span>
									</td>
								</tr>
								<tr class='tdbg'>
									<td width='120' align='right' class='tdbg5'>
										关键字：
									</td>
									<td>
										<div style="clear: both;">
											<input name='KeyWords' type='text' style="clear:both"
												id='KeyWords' value='<%=rs.getString("KeyWords") %>' autocomplete='off' size='50'
												maxlength='255'>
											<font color='#FF0000'>*</font>
										</div>
										<div id="skey" style='display:none'></div>
										<font color='#0000FF'>用来查找相关图片，可输入多个关键字，中间用<font
											color='#FF0000'>“|”</font>隔开。不能出现&quot;'&?;:()等字符。</font>
									</td>
								</tr>
								<tr class='tdbg'>
									<td width='120' align='right' class='tdbg5'>
										图片作者：
									</td>
									<td>
										<div style="clear: both;">
											<input name='Author' type='text' style="clear: both" 
												id='Author' autocomplete='off' size='50' maxlength='255' value="<%=rs.getString("Author")%>">
											<font color='#FF0000'>*</font>
										</div>
										<div id="skey" style='display: none'></div>
									</td>
								</tr>
								<tr class='tdbg'>
									<td width='120' align='right' class='tdbg5'>
										图片来源：
									</td>
									<td>
										<div style="clear: both;">
											<input name='Origin' type='text' style="clear: both"
												id='Origin' autocomplete='off' size='50' maxlength='255' value="<%=rs.getString("Origin")%>">
											<font color='#FF0000'>*</font>
										</div>
										<div id="skey" style='display: none;'></div>
									</td>
								</tr>
								<tr class='tdbg'>
									<td width='120' rowspan="2" align='right' class='tdbg5'>
										<font color='#FF0000'>缩略图：</font>
									</td>
									<td>										
										<input name='DefaultPicUrl' type='text' id='DefaultPicUrl'
											size='30' maxlength='200'  value=<%=rs.getString("PhotoUrl") %> />
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
									<td width='120'  align='right' class='tdbg5'>
										<font color='#FF0000'>显示样式：</font>
									</td>
									<td>
									<table border="0"  cellpadding="0" cellspacing="0" width="80%" >
									<tr><td background="Images/p1.jpg" style="background-repeat: no-repeat" height="85" width="25%" >&nbsp;</td>
									<td background="Images/p2.jpg"  style="background-repeat: no-repeat" height="85" width="25%"></td>
									<td background="Images/p3.jpg" style="background-repeat: no-repeat" height="85" width="25%"></td>
									<td background="Images/p4.jpg" style="background-repeat: no-repeat" height="85" width="25%"></td></tr>
									<tr >
									<td><input type="radio" name="showstyle" value="1" checked >幻灯片（横排） </td>
									<td><input type="radio" name="showstyle" value="2"  >田字格</td>
									<td><input type="radio" name="showstyle" value="3"  >顺序列表</td>
									<td><input type="radio" name="showstyle" value="4"  >幻灯片（竖排）</td></tr>
									</table>
									每页显示<input name="PageNum" type="text" id="PageNum" value="12" size="2" >	张							
								   </td>
								</tr>
								
								<tr class='tdbg'>
									<td width='120' rowspan="2" align='right' class='tdbg5'>
										<font color='#FF0000'>图片内容：</font>
									</td>
									<td>
										<input name='DefaultPicUrls' type='text' id='DefaultPicUrls'
											size='30' maxlength='200' onchange="ShowPics(this)"><font color='#FF0000'>*</font>
										<%
										String PicUrlArr[]=(rs.getString("PicUrls")).split("\\|");
										String picu="";
										for(int i=0;i<PicUrlArr.length;i++){
										if(PicUrlArr[i].endsWith(".jpg")){
										picu+="|"+PicUrlArr[i];
										}
										
										}										
										 %>
										
										
										<input name="PicUrls" id="PicUrls" type="text" value="<%=picu %>">
										上传所有需要展示的图片
									</td>
								</tr>
								<tr class='tdbg'>
								   
									<td>
										<iframe name="ad" frameborder="0" width="100%" height="24"
											scrolling="no" src="../UpLoadPics.jsp"></iframe>
									</td>
								</tr>
								<tr class='tdbg'>
									<td width="100%" height="100px" colspan="2">
										<div id="showPic" title="showPic" style="vertical-align: top">
                                    <% 
                                    
                                    for(int i=0;i<PicUrlArr.length&&i+1<PicUrlArr.length;i++){
                                    %>
                                    <div id='picDiv_0<%=i %>' style='width: 130;height:90 ;border: 1px dashed #000;float: left' >
									<table cellpadding='0' cellspacing='0'>
									<tr><td><img alt='' id='img_0<%=i %>' src='../../<%=PicUrlArr[i] %>' width='125' height='85' align='middle' style='border: 1px solid #000;'></td></tr>
									<tr><td><a href='javascript:if(confirm("确实要删除该图片吗?")) DelPics("<%=PicUrlArr[i] %>","picDiv_0<%=i %>");' style='font-size: 12px;color: #ff9933'>[删除]</a>
									<input type='text' name='picNote_0<%=i %>' size='12' value='<%=PicUrlArr[i+1] %>' />
									<input type='hidden' name='picUrl_0<%=i %>' size='12' value='<%=PicUrlArr[i] %>' />
									</td></tr>
									</table></div>
                                    
                                   <%i++; } %>
                                    

										</div>
									</td>
								</tr>
								
								
								

								<tr class='tdbg' id='ArticleContent' style="display:''">
									<td width='120' align='right' valign='bottom' class='tdbg5'>
										<p>
											图片描述：
										</p>
										<br>
										<br>
										<br>
										<br>
									</td>
									<td>
									     								
      								<textarea name="Content" cols="100" rows="8" style="width:100%;height:100px;visibility:hidden;">
      								<%=rs.getString("PictureContent") %>
      								</textarea>
		
      								
      								
      								
									</td>
								</tr>							
								<tr class='tdbg'>
									<td width='120' align='right' class='tdbg5'>
										图片状态：
									</td>
									<td>
									<%
									switch(rs.getInt("Status")){
									case -1:
									 %>
										<input name='Status' type='radio' id='Status' value='-1' checked>
										草稿&nbsp;&nbsp;
										<input Name='Status' Type='Radio' Id='Status' Value='0'>
										待审核&nbsp;&nbsp;
										<input Name='Status' Type='Radio' Id='Status' Value='1'
											>
										终审通过
									<%
									break;
									case 0:
									 %>
									 <input name='Status' type='radio' id='Status' value='-1'>
										草稿&nbsp;&nbsp;
										<input Name='Status' Type='Radio' Id='Status' Value='0' checked>
										待审核&nbsp;&nbsp;
										<input Name='Status' Type='Radio' Id='Status' Value='1'
											>
										终审通过
									 <%
									break;
									case 1:
									 %>
									 <input name='Status' type='radio' id='Status' value='-1'>
										草稿&nbsp;&nbsp;
										<input Name='Status' Type='Radio' Id='Status' Value='0'>
										待审核&nbsp;&nbsp;
										<input Name='Status' Type='Radio' Id='Status' Value='1'
											checked>
										终审通过
									<%break;
									} %>
									</td>
								</tr>
							</tbody>
							
							<script language='javascript'>
								function SelectAll(){
								  for(var i=0;i<document.myform.SpecialID.length;i++){
									document.myform.SpecialID.options[i].selected=true;}
								}
								function UnSelectAll(){
								  for(var i=0;i<document.myform.SpecialID.length;i++){
									document.myform.SpecialID.options[i].selected=false;}
								}
						 </script>

							<tr class='tdbg'>
								<td width='120' align='right' class='tdbg5'>
									所属专题：
								</td>
								<td>
									<select name='SpecialID' size='2' multiple
										style='height:100px;width:206px;'>
										<%=DAOFactory.getSpecialDao().showSpecialInSel(rs.getString("SpecialID")+",")%>
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
									图片属性：
								</td>
								<td>
								<%if(rs.getInt("IsTop")==1) {%>
									<input name='IsTop' type='checkbox' id='OnTop' value='1' checked>
								<%}else {%>
								   <input name='IsTop' type='checkbox' id='OnTop' value='1' >
								 <%} %>
									固顶图片&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<%if(rs.getInt("Recommend")==1) {%>
									<input name='Recommend' type='checkbox' id='Elite' value='1' checked>
								<%}else{ %>
								    <input name='Recommend' type='checkbox' id='Elite' value='1' >
								<%} %>
									推荐图片&nbsp;&nbsp;&nbsp;&nbsp;
								</td>
							</tr>
														<tr class='tdbg'>
								<td width='120' align='right' class='tdbg5'>
									图片等级：
								</td>
								<td>
									<select id="Rank" name="Rank"> 
									<option value="★">★</option>
									<option value="★★">★★</option>
									<option value="★★★">★★★</option>
									<option value="★★★★">★★★★</option>
									<option value="★★★★★">★★★★★</option>
									</select>
								</td>
							</tr>
							<tr class='tdbg'>
								<td width='120' align='right' class='tdbg5'>
									浏览数：
								</td>
								<td>
									本日：<input id="HitsByDay" name="HitsByDay" type="text" size="2"  value="0" >
									本周：<input id="HitsByWeek" name="HitsByWeek" type="text" size="2"  value="0" >
									本月：<input id="HitsByMonth" name="HitsByMonth" type="text" size="2"  value="0" >
									总计：<input id="Hits" name="Hits" type="text" size="2"  value="0" >
									得分：<input id="Score" name="Score" type="text" size="2"  value="0" >分
								</td>
							</tr>
							
							<tr class='tdbg'>
								<td width='120' align='right' class='tdbg5'>
									录入时间：
								</td>
								<td>
								<%
										//取得但前时间
											GregorianCalendar gc = new GregorianCalendar();
											String nowDateTime = "";
											Date d = new Date();
											SimpleDateFormat sdf = new SimpleDateFormat(
													"yyyy-MM-dd hh:mm:ss");
											nowDateTime = sdf.format(d);
									%>
									
									<input name='ModifyDate' type='text' id='ModifyDate'
										value='<%=nowDateTime %>' maxlength='50'>
									时间格式为“年-月-日 时:分:秒”，如：
									<font color='#0000FF'>2003-5-12 12:32:47</font>
								</td>
							</tr>
							
							
							
							
						</table>
					</td>
				</tr>
			</table>
			<p align='center'>
				<input name='Action' type='hidden' id='Action' value=''>
				<input name='add' type='submit' id='Add' value=' 修 改 '
					onClick="document.myform.Action.value='SaveModfy';document.myform.target='_self';"
					style='cursor:hand;'>
				&nbsp;
				<input name='Preview' type='submit' id='Preview' value=' 预 览 '
					onClick="document.myform.Action.value='Preview';document.myform.target='_blank';"
					style='cursor:hand;'>
				<input name='Cancel' type='button' id='Cancel' value=' 取 消 '
					onClick="window.location.href='Admin_Article.asp?ChannelID=1&Action=Manage';"
					style='cursor:hand;'>
			</p>
			<br>
		</form>
	</body>
</html>
<%
   }
}
  catch(Exception ex)
  {
  System.out.println(ex);
  }
}


%>