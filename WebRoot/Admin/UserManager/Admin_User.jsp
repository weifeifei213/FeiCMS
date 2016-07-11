<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ include file="../PubPackage.jsp"%>
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String adminPopNum="POP000105";
if(!DAOFactory.getAdminDaoInstance().checkAdminPopedom(Integer.parseInt(session.getAttribute("AdminID").toString()),adminPopNum))
{
 JS.ErrCode(response,"你没有足够的权限！请与管理员联系！");
 JS.goBack(response,-1);
 return;
}

String sql="from QyskUser o where 1=1 order by o.userId desc";
List li=DAOFactory.getUserDao().queryUser(sql);

String Action =request.getParameter("Action");
String Type=request.getParameter("Type");

//检索
if(Action!=null&&Action.equals("Search")&&Type!=null&&Type.equals("All")){
String field=request.getParameter("Field");
if(field!=null&&field.equals("Title")){
  sql="from QyskUser o where o.title like '%"+request.getParameter("keyword")+"%' and o.deleted=0 order by o.userId desc";
 li=DAOFactory.getUserDao().queryUser(sql);
}
if(field!=null&&field.equals("Content")){
  sql="from QyskUser o where o.houseQiTa like '%"+request.getParameter("keyword")+"%' and o.deleted=0 order by o.userId desc";
  li=DAOFactory.getUserDao().queryUser(sql);
}
if(field!=null&&field.equals("Inputer")){
  sql="from QyskUser o where o.editor like '%"+request.getParameter("keyword")+"%' and o.deleted=0 order by o.userId desc";
  li=DAOFactory.getUserDao().queryUser(sql);
}
}



%>
<html>
	<head>
		<title>会员管理</title>
		<meta http-equiv='Content-Type' content='text/html; charset=gb2312'>
		<link href='<%=basePath %>Admin/CSS/Admin_Style.css' rel='stylesheet' type='text/css'>
	</head>
	<body leftmargin='2' topmargin='0' marginwidth='0' marginheight='0'>
		<table width='100%' border='0' align='center' cellpadding='2'
			cellspacing='1' class='border'>
			<tr class='topbg'>
				<td height='22' colspan='10'>
					<table width='100%'>
						<tr class='topbg'>
							<td align='center'>
								<b>会员中心管理----所有会员</b>
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
					<a href='Admin_Photo_List.jsp'>会员管理首页</a>&nbsp;|&nbsp;
					<a href='Admin_Photo_Add.jsp'>添加会员</a>&nbsp;|&nbsp;
					<a href='Admin_Photo_Check.jsp'>审核会员</a>&nbsp;|&nbsp;
					<a href='Admin_Photo_Recyclebin.jsp'>会员回收站管理</a>
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
     if(confirm('确定要彻底删除选中的会员吗？彻底删除后将不能恢复！'))
         return true;
     else
         return false;
 }
 else if(document.myform.Action.value=='ConfirmDel'){
     if(confirm('确定要彻底删除选中的会员吗？彻底删除后将不能恢复！'))
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
     if(confirm('确定要将选中的会员从其所属专题中删除吗？操作成功后会员将不属于任何专题。'))
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
			
				
				</td>
			</tr>
		</table>
		<br>
		<table width='100%' border='0' align='center' cellpadding='0'
			cellspacing='0'>
			<tr>
				<td height='22'>
					您现在的位置：&nbsp;会员中心管理&nbsp;&gt;&gt;所有会员！</td>
				
			</tr>
		</table>
		<table width='100%' border='0' cellpadding='0' cellspacing='0'>
			<tr>
				<form name='myform' method='Post' action='Admin_Photo_ModfySave.jsp' onsubmit='return ConfirmDel();'>
				<td>
					<table class='border' border='0' cellspacing='1' width='100%'
						cellpadding='0'>
						<tr class='title' height='22'>
							<td height='22' width='30' align='center'>
								<strong>选中</strong>							</td>
							<td width='25' align='center'>
								<strong>ID</strong>							</td>
							<td width="150" align='center'>
								<strong>用户名</strong>							</td>
							<td width="150" align='center'>
								<strong>验证邮箱</strong>				</td>	
								
							<td width='73' align='center'>
								<strong>联系电话</strong>							</td>
							<td width='65' align='center'>
								<strong>地址</strong>							</td>
							<td width='113' align='center'>
								<strong>注册时间</strong>							</td>
							<td width='74' align='center'>
								<strong>审核状态</strong>							</td>
							<td width='238' align='center'><STRONG>常规管理操作</STRONG></td>
						</tr>
						<%
						//获取记录总数
						   int pageSize=15; 
                           int rowCount; //总的记录数 
                           int pageCount; //总的页数 
                           int currPage; //当前页数 
						   String strPage;                                       
                           
                           if(null!=request.getParameter("page")){ 
                            strPage=request.getParameter("page");                           
                            session.setAttribute("strPage",strPage);
                           }                           
                           strPage=(String)session.getAttribute("strPage");
						   if (strPage==null){ 
							currPage=1; 
							} 
							else{ 
							currPage=Integer.parseInt(strPage); 
							if (currPage<1) currPage=1; 
							} 
							
							rowCount = li.size();//取得总记录数
							pageCount=(rowCount+pageSize-1)/pageSize; //计算总页数
							if (currPage>pageCount) currPage=pageCount; 							
							int thepage=(currPage-1)*pageSize; 
							int n=0; 
						
						 int k=thepage;						 
						 if(k<0){k=0;}
						 if(li!=null)
						 while(li.size()>0&&k<li.size()&&n<pageSize)
						  {
					       n++;
					       User user=(User)li.get(k);					       
						 %>
						<tr class='tdbg' onMouseOut="this.className='tdbg'"
							onMouseOver="this.className='tdbgmouseover'">
							<td width='30' height="36" align='center'>
								<input name='UserID' type='checkbox'
									onclick='CheckItem(this)' id='UserID' value=<%=user.getUserID() %>>							</td>
							<td width='25' align='center'><%=user.getUserID() %></td>
							<td>
							<%=user.getUserName() %>
							</td>	
							<td align="center"><%=user.getEmail() %></td>
							<td align="center">
												 
							</td>
							<td align="center"><% %></td>
							<td align="center" style="color: red;">
							<%=user.getRegTime() %>
							</td>
							<td align="center"><%=DAOFactory.getUserGroupDao().quaryOneUserGroup(user.getGroupID()).getGroupName()  %></td>
						    <td align="center">
						    <a href="<%=basePath %>Admin_user.do?oper=DeleteQyskUserAdmin&uid=<%=user.getUserID() %>">删除</a>						    
						    <a href="<%=basePath %>Admin_user.do?oper=HouseCsEditAdmin&uid=<%=user.getUserID() %>">编辑</a>	
						    <% if(user.getGroupID()==7){%><a href="<%=basePath %>Admin_user.do?oper=statusQyskUserAdmin&status=Passed&uid=<%=user.getUserID() %>">审核</a>	<%}%>
						    <a href="<%=basePath %>Admin/UserManager/Admin_User_SetPurview.jsp?uid=<%=user.getUserID() %>">授权</a>		    
						    <a href="<%=basePath %>Admin/UserManager/AutoLoginUser.jsp?UserID=<%=user.getUserID() %>" target="_blank">登录</a>		    
						   
						   
						   </td>
						<%						
                       k++;
						} 
						%>
					</table>
					<table width='100%' border='0' cellpadding='0' cellspacing='0'>
						<tr>
							<td width='200' height='30'>
								<input name='chkAll' type='checkbox' id='chkAll'
									onclick='CheckAll(this.form)' value='checkbox'>
								选中本页显示的所有会员
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
			<b><%=rowCount %></b> 篇会员&nbsp;&nbsp;
			<%
			if(currPage>1){
			   out.println("<a href=Admin_User.jsp?page=1>首页</a> <a href=Admin_User.jsp?page="+(currPage-1)+">上一页</a>");
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
			   out.println("<a href=Admin_User.jsp?page="+(currPage+1)+">下一页</a> <a href=Admin_User.jsp?page="+pageCount+">尾页</a>");
			   }
			else
			{
			   out.println("下一页 尾页");
			   }
			 %>
			<strong><font color=red><%=currPage %></font>/<%=pageCount %></strong>页 &nbsp;
			<input type='text' name='MaxPerPage' size='3' maxlength='4'
				value='<%=pageSize %>'
				onKeyPress="if (event.keyCode==13) window.location='Admin_User.jsp?page='+this.value;">
			篇会员/页&nbsp;
			
		</div>
		<br>
		<form method='Post' name='SearchForm'
			action='Admin_User.jsp?Action=Search&Type=All'>
			<table width='100%' border='0' cellpadding='0' cellspacing='0'
				class='border'>
				<tr class='tdbg'>
					<td width='80' align='right'>
						<strong>信息搜索：</strong>
					</td>
					<td>
						<select name='Field' size='1'>
							<option value='Title' selected>
								信息标题
							</option>
							<option value='Content'>
								信息内容
							</option>
							<option value='Inputer'>
								录入者
							</option>
						</select>						
						<input type='text' name='keyword' size='20' value='关键字'
							maxlength='50' onFocus='this.select();'>
						<input type='submit' name='Submit' value='搜索'>
					</td>
				</tr>
			</table>
		</form>
				
	</body>
</html>

