<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="PubPackage.jsp"%>
<%
if(request.getParameter("Action")!=null)
{
  String action=request.getParameter("Action");
  if("SaveModify".equals(action))
  {
   int adminID=Integer.parseInt(request.getParameter("ID"));
   int purview=Integer.parseInt(request.getParameter("Purview"));
   
   String popNum[]=request.getParameterValues("popNum");
   
   String adminPopList="";
   String purview_ViewList="";
   String purview_InputList="";
   String purview_CheckList="";
   String purview_ManageList="";
   
   if(request.getParameterValues("Purview_View")!=null)
   {
    String purview_View[]=request.getParameterValues("Purview_View");
    for(int i=0;i<purview_View.length;i++)
   {
   purview_ViewList=purview_ViewList+purview_View[i]+",";
   
   }
   }
   if(request.getParameterValues("Purview_Input")!=null)
   {
     String purview_Input[]=request.getParameterValues("Purview_Input");
      for(int i=0;i<purview_Input.length;i++)
   {
   purview_InputList=purview_InputList+purview_Input[i]+",";
   
   }
   
   }
  if(request.getParameterValues("Purview_Check")!=null)
  {
   String purview_Check[]=request.getParameterValues("Purview_Check");
   for(int i=0;i<purview_Check.length;i++)
   {
   purview_CheckList=purview_CheckList+purview_Check[i]+",";
   
   }
   
   }
   if(request.getParameterValues("Purview_Manage")!=null)
   {
   String purview_Manage[]=request.getParameterValues("Purview_Manage");
    for(int i=0;i<purview_Manage.length;i++)
   {
   purview_ManageList=purview_ManageList+purview_Manage[i]+",";
   
   }
  }
  

   for(int i=0;i<popNum.length;i++)
   {
   adminPopList+=popNum[i]+",";
   }
  
  System.err.println("POP=== "+popNum.length+"::"+adminPopList); 
   
  Admin admin=new Admin();
  admin.setId(adminID);
  admin.setPurview(purview);
  admin.setAdminPopList(adminPopList);
  admin.setArrClass_Check(purview_CheckList);
  admin.setArrClass_Input(purview_InputList);
  admin.setArrClass_View(purview_ViewList);
  admin.setArrClass_Manage(purview_ManageList);
  
  DAOFactory.getAdminDaoInstance().updateAdminPop(admin);
  
  JS.goURL(response,"Admin_Admin.jsp");
  }

}
if(request.getParameter("ID")==null||"".equals(request.getParameter("ID")))
{
 JS.ErrCode(response,"参数传递错误！");
 JS.goBack(response,-1);
 return ;
}
int adminID=Integer.parseInt(request.getParameter("ID"));
Admin admin=DAOFactory.getAdminDaoInstance().showAdmin(adminID);



 String purview_View=null==admin.getArrClass_View()?"":admin.getArrClass_View();
 
 String purview_Input=null==admin.getArrClass_Input()?"":admin.getArrClass_Input();
 String purview_Check=null==admin.getArrClass_Check()?"":admin.getArrClass_Check();
 String purview_Manage=null==admin.getArrClass_Manage()?"":admin.getArrClass_Manage();
%>
<html>
	<head>
		<title>管理员管理</title>
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
								<b>管 理 员 管 理</b>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr class='tdbg'>
				<td width='70' height='30'>
					<strong>管理导航：</strong>
				</td>
				<td height='30'>
					<a href='Admin_Admin.jsp'>管理员管理首页</a>&nbsp;|&nbsp;
					<a href='Admin_Admin_Add.jsp'>新增管理员</a>
				</td>
			</tr>
		</table>
		<SCRIPT language=javascript>
function SelectAll(form){
  for (var i=0;i<form.AdminPurview_Others.length;i++){
    var e = form.AdminPurview_Others[i];
    if (e.disabled==false)
       e.checked = form.chkAll.checked;
    }
}
function CheckAdd(){
  if(document.form1.username.value==''){
      alert('用户名不能为空！');
   document.form1.username.focus();
      return false;
    }
  if(document.form1.Password.value==''){
      alert('密码不能为空！');
   document.form1.Password.focus();
      return false;
    }
  if((document.form1.Password.value)!=(document.form1.PwdConfirm.value)){
      alert('初始密码与确认密码不同！');
   document.form1.PwdConfirm.select();
   document.form1.PwdConfirm.focus();
      return false;
    }
  if (document.form1.Purview[1].checked==true){
 GetClassPurview();
  }
}
function CheckModifyPwd(){
  if(document.form1.Password.value==''){
      alert('密码不能为空！');
   document.form1.Password.focus();
      return false;
    }
  if((document.form1.Password.value)!=(document.form1.PwdConfirm.value)){
      alert('初始密码与确认密码不同！');
   document.form1.PwdConfirm.select();
   document.form1.PwdConfirm.focus();
      return false;
    }
}
</SCRIPT>
		<form method='post' action='Admin_Admin_ModifyPurview.jsp?ID=<%=adminID %>' name='form1'
			onsubmit='javascript:return CheckAdd();'>
			<table width='100%' border='0' align='center' cellpadding='2'
				cellspacing='1' class='border'>
				<tr class='title'>
					<td height='22' colspan='2'>
						<div align='center'>
							<strong>修改管理员权限</strong>
						</div>
					</td>
				</tr>
				<tr class='tdbg'>
					<td width='12%' align='right' class='tdbg'>
						<strong>管理员名：</strong>
					</td>
					<td width='88%' class='tdbg'>
						<%=admin.getAdminName() %>
					</td>
				</tr>
				<tr class='tdbg'>
					<td width='12%' align='right' class='tdbg'>
						<strong>权限设置： </strong>
					</td>
					<td width='88%' class='tdbg'>
					<%
					if(admin.getPurview()==1)
					{
					 %>
						<input name='Purview' type='radio' value='1' checked
							onClick="PurviewDetail.style.display='none';dept.style.display='none'">
						超级管理员：拥有所有权限。某些权限（如管理员管理、网站信息配置、网站选项配置等管理权限）只有超级管理员才有。
						<br>
						<input type='radio' name='Purview' value='2' 
							onClick="PurviewDetail.style.display='block';dept.style.display='none'">
						普通管理员：需要详细指定每一项管理权限
						<br>
						<input type='radio' name='Purview' value='3' 
							onClick="PurviewDetail.style.display='block';dept.style.display='block'">
						申报管理员：需要详细指定每一项管理权限
					<%}else if(admin.getPurview()==2){ %>
					  <input name='Purview' type='radio' value='1' 
							onClick="PurviewDetail.style.display='none';dept.style.display='none'">
						超级管理员：拥有所有权限。某些权限（如管理员管理、网站信息配置、网站选项配置等管理权限）只有超级管理员才有。
						<br>
						<input type='radio' name='Purview' value='2' checked
							onClick="PurviewDetail.style.display='block';dept.style.display='none'">
						普通管理员：需要详细指定每一项管理权限
						<br>
						<input type='radio' name='Purview' value='3' 
							onClick="PurviewDetail.style.display='block';dept.style.display='block'">
						申报管理员：需要详细指定每一项管理权限
					
					<%}else if(admin.getPurview()==3){ %>
					<input name='Purview' type='radio' value='1' 
							onClick="PurviewDetail.style.display='none';dept.style.display='none'">
						超级管理员：拥有所有权限。某些权限（如管理员管理、网站信息配置、网站选项配置等管理权限）只有超级管理员才有。
						<br>
						<input type='radio' name='Purview' value='2' 
							onClick="PurviewDetail.style.display='block';dept.style.display='none'">
						普通管理员：需要详细指定每一项管理权限
						<br>
						<input type='radio' name='Purview' value='3' checked
							onClick="PurviewDetail.style.display='block';dept.style.display='block'">
						申报管理员：需要详细指定每一项管理权限
					<%} %>
					</td>
				</tr>
				<tr id="dept" class='tdbg' <%if(admin.getPurview()==3){out.print("style='display: block'");} %>>
					<td width='12%' align='right' class='tdbg'>
						<strong>所属部门：</strong>
					</td>
					<td width='88%' class='tdbg'><select id="sendmessage" name="sendmessage">
					<%=index.getSendMessage(""+admin.getSendmessageid())%></select>
					</td>
				</tr>
				
				<tr class='tdbg'>
					<td colspan='2'>
						<table id='PurviewDetail' 
						<%if(admin.getPurview()==1){out.print("style='display: none'");} %>
						width='100%' border='0' cellspacing='10'
							cellpadding='0' >
							<tr>
								<td colspan='2' align='center'>
									<strong>管 理 员 权 限 详 细 设 置</strong>
								</td>
							</tr>
							<tr valign='top'>
								<td>
									<fieldset>
										<legend>
											此管理员在【
											<font color='red'>文章中心 </font>】频道的权限：
										</legend>
										<table width='100%'>
											<tr id='table_Article'>
												<td width="12%" height="30">
													<input name="popNum" type="checkbox" id="popNum" value="POP000101"  <%if(admin.getAdminPopList().indexOf("POP000101")>=0){out.print("checked");} %>>
													添加栏目												</td>
												<td width="13%">
													<input name="popNum" type="checkbox" id="popNum" value="POP000102" <%if(admin.getAdminPopList().indexOf("POP000102")>=0){out.print("checked");} %>>
													修改栏目												</td>
												<td width="14%">
													<input name="popNum" type="checkbox" id="popNum" value="POP000103" <%if(admin.getAdminPopList().indexOf("POP000103")>=0){out.print("checked");} %>>
													删除栏目												</td>
												<td width="14%">
													<input name="popNum" type="checkbox" id="popNum" value="POP000104" <%if(admin.getAdminPopList().indexOf("POP000104")>=0){out.print("checked");} %>>
													栏目操作												</td>
												<td width="13%">&nbsp;											  </td>
												<td width="34%">&nbsp;											  </td>
											</tr>
											<tr id='table_Article'>
												<td height="30">
													<input name="popNum" type="checkbox" id="popNum" value="POP000105"  <%if(admin.getAdminPopList().indexOf("POP000105")>=0){out.print("checked='checked'");} %>>
													文章列表												
													
													</td>
												<td height="30">
													<input name="popNum" type="checkbox" id="popNum" value="POP000106" <%if(admin.getAdminPopList().indexOf("POP000106")>=0){out.print("checked");} %>>
													添加文章												</td>
												<td height="30">
													<input name="popNum" type="checkbox" id="popNum" value="POP000107" <%if(admin.getAdminPopList().indexOf("POP000107")>=0){out.print("checked");} %>>
													删除文章												</td>
												<td height="30">
													<input name="popNum" type="checkbox" id="popNum" value="POP000108" <%if(admin.getAdminPopList().indexOf("POP000108")>=0){out.print("checked");} %>>
													修改文章												</td>
												<td height="30">
													<input name="popNum" type="checkbox" id="popNum" value="POP000109" <%if(admin.getAdminPopList().indexOf("POP000109")>=0){out.print("checked");} %>>
													查询文章												</td>
												<td height="30">&nbsp;											  </td>
											</tr>
											<tr id='table_Article'>
												<td height="30">
													<input name="popNum" type="checkbox" id="popNum" value="POP000110" <%if(admin.getAdminPopList().indexOf("POP000110")>=0){out.print("checked");} %>>
													专题列表												</td>
												<td height="30">
													<input name="popNum" type="checkbox" id="popNum" value="POP000111" <%if(admin.getAdminPopList().indexOf("POP000111")>=0){out.print("checked");} %>>
													增加专题												</td>
												<td height="30">
													<input name="popNum" type="checkbox" id="popNum" value="POP000112" <%if(admin.getAdminPopList().indexOf("POP000112")>=0){out.print("checked");} %>>
													删除专题												</td>
												<td height="30">
													<input name="popNum" type="checkbox" id="popNum" value="POP000113" <%if(admin.getAdminPopList().indexOf("POP000113")>=0){out.print("checked");} %>>
													修改专题												</td>
												<td height="30">&nbsp;											  </td>
												<td height="30">&nbsp;											  </td>
											</tr>
											<tr id='table_Article'>
												<td height="30">
													<input name="popNum" type="checkbox" id="popNum" value="POP000114" <%if(admin.getAdminPopList().indexOf("POP000114")>=0){out.print("checked");} %>>
													专题新闻管理												</td>
												<td height="30">
													<input name="popNum" type="checkbox" id="popNum" value="POP000115" <%if(admin.getAdminPopList().indexOf("POP000115")>=0){out.print("checked");} %>>
													删除专题新闻												</td>
												<td height="30">
													<input name="popNum" type="checkbox" id="popNum" value="POP000116" <%if(admin.getAdminPopList().indexOf("POP000116")>=0){out.print("checked");} %>>
													专题新闻操作												</td>
												<td height="30">&nbsp;											  </td>
												<td height="30">&nbsp;											  </td>
												<td height="30">&nbsp;											  </td>
											</tr>
											<tr id='table_Article'>
												<td height="30">
													<input name="popNum" type="checkbox" id="popNum" value="POP000117" <%if(admin.getAdminPopList().indexOf("POP000117")>=0){out.print("checked");} %>>
													文章审核管理												</td>
												<td height="30">
													<input name="popNum" type="checkbox" id="popNum" value="POP000118" <%if(admin.getAdminPopList().indexOf("POP000118")>=0){out.print("checked");} %>>
													审核文章												</td>
												<td height="30">
													<input name="popNum" type="checkbox" id="popNum" value="POP000119" <%if(admin.getAdminPopList().indexOf("POP000119")>=0){out.print("checked");} %>>
													删除未审核文章												</td>
												<td height="30">
													<input name="popNum" type="checkbox" id="popNum" value="POP000120" <%if(admin.getAdminPopList().indexOf("POP000120")>=0){out.print("checked");} %>>
													退稿操作												</td>
												<td height="30">&nbsp;											  </td>
												<td height="30">&nbsp;											  </td>
											</tr>
										</table>
</fieldset>
</td></tr>
<tr valign='top'><td>
<fieldset>
										<legend>
											此管理员在【
											<font color="red">模拟考试 </font>】频道的权限：
										</legend>
										<table width='100%'>
											<tr>
												<td width='12%'>
													<input name="popNum" type="checkbox" id="popNum" value="POP000201" <%if(admin.getAdminPopList().indexOf("POP000201")>=0){out.print("checked");} %>>
													试卷操作												</td>
												<td width='13%'>
													<input name="popNum" type="checkbox" id="popNum" value="POP000202" <%if(admin.getAdminPopList().indexOf("POP000202")>=0){out.print("checked");} %>>
													添加试卷												</td>
												<td width='14%'>
													<input name="popNum" type="checkbox" id="popNum" value="POP000203" <%if(admin.getAdminPopList().indexOf("POP000203")>=0){out.print("checked");} %>>
													删除试卷												</td>
												<td width='14%'>
													<input name="popNum" type="checkbox" id="popNum" value="POP000204" <%if(admin.getAdminPopList().indexOf("POP000204")>=0){out.print("checked");} %>>
													修改试卷												</td>
												<td width='47%'>&nbsp;											  </td>
											</tr>
											<td width='12%'>
												<input name="popNum" type="checkbox" id="popNum" value="POP000205" <%if(admin.getAdminPopList().indexOf("POP000205")>=0){out.print("checked");} %>>
												添加试题											</td>
											<td width='13%'>
												<input name="popNum" type="checkbox" id="popNum" value="POP000206" <%if(admin.getAdminPopList().indexOf("POP000206")>=0){out.print("checked");} %>>
												删除试题											</td>
											<td width='14%'>
<input name="popNum2" type="checkbox" id="popNum2" value="POP000207">												
修改试题											</td>
											<td width='14%'>&nbsp;											</td>
											<td width='47%'>&nbsp;											</td>
											</tr>
										</table>
			</fieldset>
			</td></tr>
			<tr valign='top'><td>
<fieldset>
										<legend>
											此管理员在【<font color="red"> 网站留言</font> 】频道的权限：										</legend>
										<table width='100%'>
											<tr>
												<td width='12%'>
													<input name="popNum" type="checkbox" id="popNum" value="POP000208" <%if(admin.getAdminPopList().indexOf("POP000208")>=0){out.print("checked");} %>>
													留言操作</td>
												<td width='13%'>
													<input name="popNum" type="checkbox" id="popNum" value="POP000209" <%if(admin.getAdminPopList().indexOf("POP000209")>=0){out.print("checked");} %>>
													查看留言												</td>
												<td width='14%'>
													<input name="popNum" type="checkbox" id="popNum" value="POP000210" <%if(admin.getAdminPopList().indexOf("POP000210")>=0){out.print("checked");} %>>
													删除试卷												</td>
												<td width='14%'>
													<input name="popNum" type="checkbox" id="popNum" value="POP000211" <%if(admin.getAdminPopList().indexOf("POP000210")>=0){out.print("checked");} %>>
													删除留言												</td>
												<td width='47%'><input name="popNum" type="checkbox" id="popNum" value="POP000212" <%if(admin.getAdminPopList().indexOf("POP000212")>=0){out.print("checked");} %>>
回复留言 </td>
											</tr>
										</table>
			</fieldset>
			</td></tr>
<tr valign='top'><td>
									<fieldset>
										<legend>
											此管理员的其他网站管理权限：
											<input name='chkAll' type='checkbox' id='chkAll' value='Yes'
												onclick='SelectAll(this.form)'>
											选中所有权限
										</legend>
										<table width='100%' border='0' cellspacing='1' cellpadding='2'>
											<tr>
												<td width='16%'>
													<input name='popNum' type='checkbox'
														id='popNum' value='POP000213' checked>
													修改自己密码												</td>
												<td width='16%'><input name='popNum' type='checkbox'
														id='popNum' value='POP000214'  <%if(admin.getAdminPopList().indexOf("POP000214")>=0){out.print("checked");} %>>
网站公告管理 </td>
												<td width='16%'><input name='popNum' type='checkbox'
														id='popNum' value='POP000215'  <%if(admin.getAdminPopList().indexOf("POP000215")>=0){out.print("checked");} %>>
网站调查管理 </td>
												<td width='16%'><input name='popNum' type='checkbox'
														id='popNum' value='POP000216'   <%if(admin.getAdminPopList().indexOf("POP000216")>=0){out.print("checked");} %>>
友情链接管理 </td>
												<td width='16%'><input name='popNum' type='checkbox'
														id='popNum' value='POP000217'   <%if(admin.getAdminPopList().indexOf("POP000217")>=0){out.print("checked");} %>>
网站缓存管理 </td>
												<td width='16%'>
													<input name='popNum' type='checkbox'
														id='popNum' value='POP000218'   <%if(admin.getAdminPopList().indexOf("POP000218")>=0){out.print("checked");} %>>
													网站信息配置</td>
											</tr>
										</table>
										
									</fieldset>
									</td></tr>
									<Tr valign="top"><td>
									<fieldset>
										<legend>
											此管理员在【 <font color="red">文章栏目</font> 】频道的权限：										</legend>
										<table width='100%'>
											<tr>
												<td width='50%'>
												<table width='100%' border='0' cellspacing='1' cellpadding='2'
				class='border'>
				<tr align='center' class='title' height='22'>
					<td>
						<strong>栏目名称</strong>
					</td>
					<td width='30'>
						<strong>查看</strong>
					</td>
					<td width='30'>
						<strong>录入</strong>
					</td>
					<td width='30'>
						<strong>审核</strong>
					</td>
					<td width='30' height='22'>
						<strong>管理</strong>
					</td>
				</tr>
			<% 
			//显示文章分类
			DbConnection conn=null;
			ResultSet rs=null;
			String strNbsp="";
			String strSql="select ClassName,ClassID,ClassDir from article_class where Depth=0";
			try{
			conn=new DbConnection();
			rs=conn.executeQuerySql(strSql);
			while(rs.next()){
			%>
				
				<tr class='tdbg'>
					<td>
						<img src='Images/Folder/tree_folder4.gif' width='15' height='15'
							valign='abvmiddle'>
						<b><%=rs.getString("ClassName") %></td>
					<%
						System.out.print(purview_View);
					 %>
					<td width='30' align='center'>
						<input name='Purview_View' type='checkbox' id='Purview_View'
							value='<%=rs.getInt("ClassID")%>' <%if(purview_View.indexOf(Integer.toString(rs.getInt("ClassID")))>=0){out.print("checked");} %>>
					</td>
					<td width='30' align='center'>
						<input name='Purview_Input' type='checkbox' id='Purview_Input'
							value='<%=rs.getInt("ClassID")%>' <%if(purview_Input.indexOf(Integer.toString(rs.getInt("ClassID")))>=0){out.print("checked");} %>>
					</td>
					<td width='30' align='center'>
						<input name='Purview_Check' type='checkbox' id='Purview_Check'
							value='<%=rs.getInt("ClassID")%>' <%if(purview_Check.indexOf(Integer.toString(rs.getInt("ClassID")))>=0){out.print("checked");} %>>
					</td>
					<td width='30' align='center'>
						<input name='Purview_Manage' type='checkbox' id='Purview_Manage'
							value='<%=rs.getInt("ClassID")%>' <%if(purview_Manage.indexOf(Integer.toString(rs.getInt("ClassID")))>=0){out.print("checked");} %>>
					</td>
					
				</tr>
			
				<%
				
			out.println(DAOFactory.getArticleClassDaoInstance().queryChildClass(rs.getInt("ClassID"),strNbsp,purview_View,purview_Input,purview_Check,purview_Manage));
			}			 
			}
			catch(Exception ex)
			{
			    out.println("<tr class=tdbg><td colspan=3 align=center>"+ex+"</td></tr>");
			}
			rs.close();
			conn.closeConnection();
			%>
				</table>
												</td>
												<td width="50%">注：栏目权限采用继承制度，即在某一栏目拥有某项管理权限，则在此栏目的所有子栏目中都拥有这项管理权限，并可在子栏目中指定更多的管理权限。 </td>
											</tr>
										</table>
			</fieldset>
									
									</td></tr>

				</table>
					<table  align="center" >	
			
				<tr>
					<td height='40' colspan='2' align='center' class='tdbg'>
						<input name='Action' type='hidden' id='Action' value='SaveModify'>
						<input name='Scode' type='hidden' id='Scode' value='btwbv515fro'>
						<input type='submit' name='Submit' value=' 修 改 '
							style='cursor:hand;'>
						&nbsp;
						<input name='Cancel' type='button' id='Cancel' value=' 取 消 '
							onClick="window.location.href='Admin_Admin.jsp';"
							style='cursor:hand;'>
					</td>
				</tr>
				
			</table>
		</form>
</body>
</html>
<!-- Powered by: PowerEasy 2005 -->
