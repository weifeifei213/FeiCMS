<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="../PubPackage.jsp"%>
<%
if(!(request.getParameter("Action")==null||"".equals(request.getParameter("Action"))))
{

 String className=request.getParameter("ClassName");
 String readMe=request.getParameter("ReadMe");
 int id=Integer.parseInt(request.getParameter("id"));
 
FriendSiteClass fsc =new FriendSiteClass();
fsc.setClassName(className);
fsc.setReadMe(readMe);
fsc.setClassID(id);
DAOFactory.getFriendSiteClassDao().insertSiteClass(fsc);
JS.goURL(response,"Admin_FriendSite_Class.jsp");
}

int classID;
if(request.getParameter("ClassID")==null||"".equals(request.getParameter("ClassID"))){
classID=0;
}else{
classID=Integer.parseInt(request.getParameter("ClassID"));
}
%>

<html>
	<head>
		<title>友情链接管理</title>
		<meta http-equiv='Content-Type' content='text/html; charset=utf-8'>
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
								<b>友 情 链 接 管 理</b>
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
					<a href='Admin_FriendSite.jsp'>友情链接管理首页</a>&nbsp;|&nbsp;
					<a href='Admin_FriendSite_Add.jsp'>添加友情链接</a>&nbsp;|&nbsp;
					<a href='Admin_FriendSite_Class.jsp'>链接类别管理</a>&nbsp;|&nbsp;
					<a href='Admin_FriendSite_ClassAdd.jsp'>添加链接类别&nbsp;</a>
				</td>
			</tr>
		</table>
		<form name='myform' method='post' action='Admin_FriendSite_ClassAdd.jsp'>
			<table width='100%' border='0' align='center' cellpadding='2'
				cellspacing='1' class='border'>
				<tr class='title'>
					<td height='22' colspan='2' align='center'>
						<strong>添加友情链接类别</strong>
					</td>
				</tr>
				<tr class='tdbg'>
					<td width='350' class='tdbg'>
						<strong>栏目名称：</strong>
					</td>
					<td class='tdbg'>
					<select name='id'>
                              <option value='0'> 无（做为一级栏目） </option>
                              <%
								Admin admin=DAOFactory.getAdminDaoInstance().showAdmin(Integer.parseInt(session.getAttribute("AdminID").toString()))  ;  
								
								String showClass="";
								ArticleClassDao articleClassDao=new ArticleClassDaoImpl();
								if(admin.getPurview()!=1){
								String viewList=admin.getArrClass_View();
								String view=viewList.substring(0,viewList.length()-1);
								
								}else{
								
								
								}	
								
								   %>
                              
                            </select>
					</td>
				</tr>
				<tr class='tdbg'>
					<td width='350' class='tdbg'>
						<strong>类别名称：</strong>
					</td>
					<td class='tdbg'>
						<input name='ClassName' type='text' id='ClassName' size='49'
							maxlength='30'>
					</td>
				</tr>
				<tr class='tdbg'>
					<td width='350' class='tdbg'>
						<strong>类别说明</strong>
						<br>
						鼠标移至类别名称上时将显示设定的说明文字（不支持HTML）
					</td>
					<td class='tdbg'>
						<textarea name='ReadMe' cols='40' rows='5' id='ReadMe'></textarea>
					</td>
				</tr>
				<tr class='tdbg'>
					<td colspan='2' align='center' class='tdbg'>
						<input name='Action' type='hidden' id='Action'
							value='SaveAddClass'>
						<input type='submit' name='Submit' value=' 添 加 '>
						&nbsp;&nbsp;
						<input name='Cancel' type='button' id='Cancel' value=' 取 消 '
							onClick="window.location.href='Admin_FriendSite_ClassAdd.jsp'"
							style='cursor:hand;'>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
