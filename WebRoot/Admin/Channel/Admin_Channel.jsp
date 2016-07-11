<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ include file="../PubPackage.jsp"%>
<% 
String adminPopNum="POP000105";
if(!DAOFactory.getAdminDaoInstance().checkAdminPopedom(Integer.parseInt(session.getAttribute("AdminID").toString()),adminPopNum))
{
 JS.ErrCode(response,"你没有足够的权限！请与管理员联系！");
 JS.goBack(response,-1);
 return;
}
ArticleClassDaoImpl acd=new ArticleClassDaoImpl(); 
DbConnection conn=new DbConnection();
String showTopClass=""; 
Admin admin=DAOFactory.getAdminDaoInstance().showAdmin(Integer.parseInt(session.getAttribute("AdminID").toString()))  ;  
	
int status=9;
String strSql="select * from  channel order by ChannelID desc";

System.out.println(strSql);
ResultSet rs=conn.executeQuerySql(strSql);


%>
<html>
	<head>
		<title>频道管理</title>
		<meta http-equiv='Content-Type' content='text/html; charset=gb2312'>
		<link href='../CSS/Admin_Style.css' rel='stylesheet' type='text/css'>
	</head>
	<body leftmargin='2' topmargin='0' marginwidth='0' marginheight='0'>
		<table width='100%' border='0' align='center' cellpadding='2'
			cellspacing='1' class='border'>
			<tr class='topbg'>
				<td height='22' colspan='10'>
					<table width='100%'>
						<tr class='topbg'>
							<td align='center'>
								<b>频道中心管理----所有频道</b>
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
					<a href='Admin_Channel.jsp'>频道管理首页</a>&nbsp;|&nbsp;
					<a href='Admin_Channel_Add.jsp'>添加频道</a>&nbsp;|&nbsp;					
					<a href='Admin_Channel_Recyclebin.jsp'>频道回收站管理</a>
				</td>
			</tr>
		
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
     if(confirm('确定要删除选中的频道吗？本操作将把选中的频道移到回收站中。必要时您可从回收站中恢复！'))
         return true;
     else
         return false;
 }
 else if(document.myform.Action.value=='ConfirmDel'){
     if(confirm('确定要彻底删除选中的频道吗？彻底删除后将不能恢复！'))
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
     if(confirm('确定要将选中的频道从其所属专题中删除吗？操作成功后频道将不属于任何专题。'))
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
				<%
				if(showTopClass.equals("")||showTopClass==null)
				  out.println("还没有任何栏目，请首先添加栏目。");
				else
				  out.println(showTopClass);
				%>
				
				</td>
			</tr>
		</table>
		<br>
		<table width='100%' border='0' align='center' cellpadding='0'
			cellspacing='0'>
			<tr>
				<td height='22'>
					您现在的位置：&nbsp;频道中心管理&nbsp;&gt;&gt;所有频道！</td>
				
			</tr>
		</table>
		<table width='100%' border='0' cellpadding='0' cellspacing='0'>
			<tr>
				<form name='myform' method='Post' action='Admin_Channel_ModfySave.jsp' onsubmit='return ConfirmDel();'>
				<td>
					<table class='border' border='0' cellspacing='1' width='100%'
						cellpadding='0'>
						<tr class='title' height='22'>
							<td height='22' width='30' align='center'>
								<strong>选中</strong>							</td>
							<td width='25' align='center'>
								<strong>ID</strong>							</td>
							<td width="100" align='center'>
								<strong>频道名称</strong>					</td>
							<td width="100" align='center'>
								<strong>打开方式</strong>					</td>
							<td width="100" align='center'>
								<strong>频道类型</strong>					</td>
							<td width="200" align='center'>
								<strong>频道目录/链接地址</strong>					</td>	
							<td width="100" align='center'>
								<strong>项目名称</strong>					</td>
							<td width="100" align='center'>
								<strong>功能模块</strong>					</td>
							<td width='100' align='center'>
								<strong>频道状态</strong>							</td>
							<td width='238' align='center'><STRONG>常规管理操作</STRONG></td>
						</tr>
						<%
						//获取记录总数
						   int pageSize=15; 
                           int rowCount; //总的记录数 
                           int pageCount; //总的页数 
                           int currPage; //当前页数 
						   String strPage; 
                           strPage=request.getParameter("page"); 
						   if (strPage==null){ 
							currPage=1; 
							} 
							else{ 
							currPage=Integer.parseInt(strPage); 
							if (currPage<1) currPage=1; 
							} 
							rs.last();
							rowCount = rs.getRow();//取得总记录数
							pageCount=(rowCount+pageSize-1)/pageSize; //计算总页数
							if (currPage>pageCount) currPage=pageCount; 							
							int thepage=(currPage-1)*pageSize; 
							int n=0; 
						 rs.absolute(thepage+1); 
						 rs.previous();
						 while(rs.next()&n<pageSize)
						  {
					       n++;
						 %>
						<tr class='tdbg' onMouseOut="this.className='tdbg'"
							onMouseOver="this.className='tdbgmouseover'">
							<td width='30' height="36" align='center'>
								<input name='ArticleID' type='checkbox'
									onclick='CheckItem(this)' id='ArticleID' value=<%=rs.getInt("ChannelID") %>>							</td>
							<td width='25' align='center'>
								<%=rs.getInt("ChannelID") %>							</td>
							<td>
								&nbsp;
								<a href='Admin_Article_Modfy.jsp?ArticleID=<%=rs.getInt("ChannelID") %>'
									title=<%=rs.getString("ChannelName") %>><%=rs.getString("ChannelName") %></a></td>
							
									
							<td width='73' align='center'>
								<% switch(rs.getInt("OpenType")){
								case 0:
								out.print("原窗口");break;
								case 1:
								out.print("新窗口");break;
								
								} %>						  </td>
							<td  align='center'>
								<%switch(rs.getInt("ChannelType")){
								case 0:
								out.print("内置频道");break;
								case 1:
								out.print("系统内部频道");break;
								case 2:
								out.print("外部频道");break;
								
								} %>						  </td>
							<td  align='center'>
								<% switch(rs.getInt("ChannelType")){
								case 0:
								out.print(rs.getString("ChannelDir"));break;
								case 1:
								out.print(rs.getString("ChannelDir"));break;
								case 2:
								out.print(rs.getString("LinkUrl"));break;
								
								} %>						  </td>	
								
							<td width='65' align='center'>
								<%=rs.getString("ChannelShortName") %>						  </td>
							<td width='113' align='center'>
							<% switch(rs.getInt("ModuleType")){
							     case 1:
								 out.println("频道");
								 break;
								 case  2:
								 out.println("下载");
								 break;
								 case  3:
								 out.println("图片");
								 break;
								 case  4:
								 out.println("留言");
								 break;
								 case  5:
								 out.println("商城");
								 break;
								 case  6:
								 out.println("供求");
								 break;
								 case  7:
								 out.println("房产");
								 break;
								 case  8:
								 out.println("招聘");
								 break;
							} %>
									  </td>
							<td width='74' align='center'>
								
								 <%
								 switch(rs.getInt("Disabled"))
								 {
								 case 0:
								 out.println("正常");
								 break;
								 case  1:
								 out.println("<font color=red>已禁用</font>");
								 break;
								 }
								
								 %>
						  				  </td>
							<td width='238' align='center'>
							<%
							switch(rs.getInt("Disabled")){
							case 0:
							out.print("<a href='Admin_Article_ModfySave.jsp?Action=Del&ArticleID="+rs.getInt("ChannelID")+"'>禁用</a>");break;
							case 1:
							out.print("<a href='Admin_Article_ModfySave.jsp?Action=Del&ArticleID="+rs.getInt("ChannelID")+"' >启用</a>");break;
							}
							 %>
							
								&nbsp;<a href='Admin_Article_Modfy.jsp?ArticleID=<%=rs.getInt("ChannelID") %>'>修改</a>
								&nbsp;<a href='Admin_Article_ModfySave.jsp?Action=Del&ArticleID=<%=rs.getInt("ChannelID") %>' onClick="return confirm('确定要删除此频道吗？删除后你还可以从回收站中还原。');">删除</a>
								</td>
						</tr>
						<%
						
                       
						} 
						conn.closeConnection();
						%>
					</table>
					<table width='100%' border='0' cellpadding='0' cellspacing='0'>
						<tr>
							<td width='200' height='30'>
								<input name='chkAll' type='checkbox' id='chkAll'
									onclick='CheckAll(this.form)' value='checkbox'>
								选中本页显示的所有频道
							</td>
							<td>
							
								<input name='submit3' type='submit' value=' 批量删除 '
									onClick="document.myform.Action.value='NumDel'">
								&nbsp;&nbsp;
<input name='submit1' type='submit' value=' 审核通过 '
									onClick="document.myform.Action.value='NumSetPassed'">
								&nbsp;&nbsp;
								<input name='submit2' type='submit' value=' 取消审核 '
									onClick="document.myform.Action.value='NumCancelPassed'">
								<input name='Action' type='hidden' id='Action' value=''>
								
						  </td>
						</tr>
					</table>
				</td>
				</form>
			</tr>
		</table>
		<div class="show_page">
			共
			<b><%=rowCount %></b> 篇频道&nbsp;&nbsp;
			<%
			if(currPage>1){
			   out.println("<a href=Admin_Article_List.jsp?page=1>首页</a> <a href=Admin_Article_List.jsp?page="+(currPage-1)+">上一页</a>");
			   }
			else
			{
			    out.println("首页 上一页");
			    }
			 %>
			&nbsp;
			<%
			if(currPage<pageCount)
			{
			   out.println("<a href=Admin_Article_List.jsp?page="+(currPage+1)+">下一页</a> <a href=Admin_Article_List.jsp?page="+pageCount+">尾页</a>");
			   }
			else
			{
			   out.println("下一页 尾页");
			   }
			 %>
			<strong><font color=red><%=currPage %></font>/<%=pageCount %></strong>页 &nbsp;
			<input type='text' name='MaxPerPage' size='3' maxlength='4'
				value='<%=pageSize %>'
				onKeyPress="if (event.keyCode==13) window.location='Admin_Article_List.jsp?page='+this.value;">
			篇频道/页&nbsp;
			
		</div>
		<br>
		<form method='Post' name='SearchForm'
			action='Admin_Article_List.jsp?Action=Search&Type=All'>
			<table width='100%' border='0' cellpadding='0' cellspacing='0'
				class='border'>
				<tr class='tdbg'>
					<td width='80' align='right'>
						<strong>频道搜索：</strong>
					</td>
					<td>
						<select name='Field' size='1'>
							<option value='Title' selected>
								频道标题
							</option>
							<option value='Content'>
								频道内容
							</option>
							<option value='Inputer'>
								录入者
							</option>
						</select>
						<select name='ParentID'>
							<option value=''>
								所有栏目
							</option>
                              <%
									String showClass="";
									ArticleClassDao articleClassDao=new ArticleClassDaoImpl();
									showClass=articleClassDao.queryAllTop(0,0,Integer.parseInt(session.getAttribute("AdminID").toString()));
									out.println(showClass);
								   %>
						</select>
						<input type='text' name='keyword' size='20' value='关键字'
							maxlength='50' onFocus='this.select();'>
						<input type='submit' name='Submit' value='搜索'>
					</td>
				</tr>
			</table>
		</form>
		<br>
		<b>说明：</b>
		<br>
		&nbsp;&nbsp;&nbsp;&nbsp;频道属性中的各项含义：
		<font color=blue>顶</font>----固顶频道，
		<font color=red>热</font>----热门频道，
		<font color=green>荐</font>----推荐频道，
		<font color=blue>图</font>----首页图片频道，
		<br>
		<br>
	</body>
</html>
