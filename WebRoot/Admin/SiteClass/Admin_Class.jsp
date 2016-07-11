<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="../PubPackage.jsp"%>
<%
String adminPopNum="POP000104";
if(!DAOFactory.getAdminDaoInstance().checkAdminPopedom(Integer.parseInt(session.getAttribute("AdminID").toString()),adminPopNum))
{
 JS.ErrCode(response,"你没有足够的权限！请与管理员联系！");
 JS.goBack(response,-1);
 return;
}
%>
<html>
	<head>
		<title>文章中心管理----栏目管理</title>
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
								<b>文章中心管理----栏目管理</b>
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
					<a href='Admin_Class.jsp'>文章栏目管理首页</a>&nbsp;|&nbsp;
				<a href='Admin_Class_Add.jsp'>添加文章栏目</a>&nbsp;</td>
			</tr>
		</table>
		<br>
		<table width='100%' border='0' align='center' cellpadding='0'
			cellspacing='1' class='border'>
			<tr class='title' height='22'>
				<td width='30' align='center'>
					<strong>ID</strong>				</td>
				<td align='center'>
					<strong>栏目名称及目录</strong>				</td>
				<td width='380' align='center'>
					<strong>操作选项</strong>				</td>
			</tr>
			<% 
			//获取管理员管理的相应部门
			Admin admin=DAOFactory.getAdminDaoInstance().showAdmin(Integer.parseInt(session.getAttribute("AdminID").toString()))  ; 
		
			//显示文章分类
			ArticleClassDaoImpl articleClassDao=new ArticleClassDaoImpl();
			DbConnection conn=null;
			ResultSet rs=null;
			String strNbsp="";
			String strSql="select ClassName,ClassID,ClassDir from site_class where Depth=0 and ParentID=0";
			if(admin.getPurview()!=1){ 
				String viewList=admin.getArrClass_View();
			String view=viewList.substring(0,viewList.length()-1); 
			 strSql=strSql+" and ClassID in ("+view+")";
			System.out.println(strSql);
			}
			try{
			conn=new DbConnection();
			rs=conn.executeQuerySql(strSql);
			while(rs.next()){
			%>
			<tr class='tdbg' onMouseOut="this.className='tdbg'"
				onmouseover="this.className='tdbgmouseover'">
				<td width='30' align='center'>
					<%=rs.getInt("ClassID")%></td>
				<td>
					<img src='Images/Folder/tree_folder3.gif' width='15' height='15'
						valign='abvmiddle'>
					<b><a
						href='Admin_Class_Modfy.jsp?ClassID=<%=rs.getInt("ClassID") %>'
						title=''><%=rs.getString("ClassName") %></a>&nbsp;&nbsp;[<%=rs.getString("ClassDir") %>] </td>
				<td align='left' width='380'>
					&nbsp;
					<a href='Admin_Class_Add.jsp?ClassID=<%=rs.getInt("ClassID")%>'>添加子栏目</a>&nbsp;|&nbsp;
					<a href='Admin_Class_ModfySave.jsp?Action=Clear&ClassID=<%=rs.getInt("ClassID")%>'
						onClick='return ConfirmDel3();'>清空</a>&nbsp;|&nbsp;
					<a href='Admin_Class_ModfySave.jsp?Action=Del&ClassID=<%=rs.getInt("ClassID")%>'
						onClick='return ConfirmDel2();'>删除</a>				</td>
			</tr>
			<%
			out.println(articleClassDao.showAllChild(rs.getInt("ClassID"),strNbsp));
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
		
		<script language='JavaScript' type='text/JavaScript'>
			function ConfirmDel1(){
			   alert('此栏目下还有子栏目，必须先删除下属子栏目后才能删除此栏目！');
			   return false;}
			function ConfirmDel2(){
			   if(confirm('删除栏目操作将删除此栏目中的所有子栏目和文章，并且不能恢复！确定要删除此栏目吗？'))
			     return true;
			   else
			     return false;}
			function ConfirmDel3(){
			   if(confirm('清空栏目将把栏目（包括子栏目）的所有文章放入回收站中！确定要清空此栏目吗？'))
			     return true;
			   else
			     return false;}
         </script>
		<br>
	</body>
</html>
