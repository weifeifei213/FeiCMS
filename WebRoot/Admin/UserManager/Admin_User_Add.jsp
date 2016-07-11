<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../PubPackage.jsp"%>
<%
String adminPopNum="POP000101";
if(!DAOFactory.getAdminDaoInstance().checkAdminPopedom(Integer.parseInt(session.getAttribute("AdminID").toString()),adminPopNum))
{
 JS.ErrCode(response,"你没有足够的权限！请与管理员联系！");
 JS.goBack(response,-1);
 return;
}
int classID;
if(request.getParameter("ClassID")==null||"".equals(request.getParameter("ClassID")))
{
classID=0;
}
else
{
classID=Integer.parseInt(request.getParameter("ClassID"));
}

String action=request.getParameter("action");
//out.println(action);
if("add".equals(action))
{

 int parentID=Integer.parseInt(request.getParameter("ParentID"));
 String className=request.getParameter("ClassName");
 String classDir=request.getParameter("ClassDir");
 String readme=request.getParameter("Readme");
 String strSql=null;
 DbConnection conn=null;
 ResultSet rs=null;
 int parentDepth=0;
 int depth=0;
 //取的父类分类深度
 strSql="select Depth from article_class where ClassID="+parentID+"";
 conn=new DbConnection();
 rs=conn.executeQuerySql(strSql);
 if(rs.next())
 {
  parentDepth=rs.getInt("Depth");
 }
 if(parentID==0)
 {
 depth=0;
 }
 else
 {
 depth=parentDepth+1;
 }
 //插入数据
 strSql="insert into article_class (ClassName,ParentID,Depth,ClassDir,Readme) values ('"+className+"',"+parentID+","+depth+",'"+classDir+"','"+readme+"')";
 conn.executeSql(strSql);
 conn.closeConnection();
 response.sendRedirect("Admin_Class.jsp");
 
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
					<a href='Admin_User.jsp'>会员管理首页</a>&nbsp;|&nbsp;
				<a href='Admin_User_Add.jsp'>添加会员</a>&nbsp;</td>
			</tr>
		</table>
		<br>
		<table width='100%'>
			<tr>
				<td align='left'>
					您现在的位置：
					<a href='Admin_Class.jsp'>会员管理</a>&nbsp;&gt;&gt;&nbsp;添加会员
				</td>
			</tr>
		</table>
		<form name='form1' method='post' action='Admin_User_Add.jsp?action=Add'
			onsubmit='return check()'>
			<table width='100%' border='0' align='center' cellpadding='5'
				cellspacing='0' class='border'>
				<tr align='center'>
				  <td class='tdbg' ' valign='top'>
				    <table width='95%' align='center' cellpadding='2' cellspacing='1'
							bgcolor='#FFFFFF'>
                      <tbody id='Tabs' style='display:'>
                        <tr class='tdbg'>
                          <td width='300' class='tdbg5'><strong>所属栏目：</strong> </td>
                          <td><select name='ParentID'>
                              <option value='0'> 无（做为一级栏目） </option>
                                    <%
								Admin admin=DAOFactory.getAdminDaoInstance().showAdmin(Integer.parseInt(session.getAttribute("AdminID").toString()))  ;  
								
								String showClass="";
								ArticleClassDao articleClassDao=new ArticleClassDaoImpl();
								if(admin.getPurview()!=1){
								String viewList=admin.getArrClass_View();
								String view=viewList.substring(0,viewList.length()-1);
								showClass=articleClassDao.queryOneTop(view,classID,false);
									
								}else{
									showClass=articleClassDao.queryOneTop(0,classID);
								
								}	
									out.println(showClass);
								   %>
                              
                            </select>
                              <font color=blue>不能指定为外部栏目</font> </td>
                        </tr>
                        <tr class='tdbg'>
                          <td width='300' class='tdbg5'><strong>栏目名称：</strong> </td>
                          <td><input name='ClassName' type='text' size='20' maxlength='20'>
                              <font color=red>*</font> </td>
                        </tr>
                        <tr class='tdbg'>
                          <td class='tdbg5'><strong>栏目目录：</strong></td>
                          <td><input name="ClassDir" type="text" id="ClassDir" size="20">
                          <font color=red>*</font></td>
                        </tr>
                        <tr class='tdbg'>
                          <td width='300' class='tdbg5'><strong>栏目说明：</strong> <br>
                            用于在栏目页详细介绍栏目信息，支持HTML </td>
                          <td><textarea name='Readme' cols='60' rows='3' id='Readme'></textarea></td>
                        </tr>
                      </tbody>
                    </table>				  </td>
				</tr>
			</table>
			<table width='100%' border='0' align='center'>
				<tr class='tdbg'>
					<td height='40' colspan='2' align='center'>
						<input name='Action' type='hidden' id='Action' value='SaveAdd'>
						<input name='ChannelID' type='hidden' id='ChannelID' value='1'>
						<input name='Add' type='submit' value=' 添 加 ' style='cursor:hand;'>
						&nbsp;&nbsp;
						<input name='Cancel' type='button' id='Cancel' value=' 取 消 '
							onClick="window.location.href='Admin_Class.jsp?ChannelID=1'"
							style='cursor:hand;'>
					</td>
				</tr>
			</table>
		</form>
<script language='JavaScript' type='text/JavaScript'>
function check(){
  if (document.form1.ClassName.value==''){
   alert('栏目名称不能为空！');
   document.form1.ClassName.focus();
   return false;}
  
    if(document.form1.ClassDir.value==''){
      alert('栏目目录不能为空！');
      document.form1.ClassDir.focus();
      return false;
	 }
  
}
var tID=0;
function ShowTabs(ID){
  if(ID!=tID){
    TabTitle[tID].className='title5';
    TabTitle[ID].className='title6';
    Tabs[tID].style.display='none';
    Tabs[ID].style.display='';
    tID=ID;
  }
}
function HideTabTitle(displayValue,tempType){
  for (var i = 1; i < TabTitle.length; i++) {
    if(tempType==0&&i==2) {
        TabTitle[i].style.display='none';
    }
    else{
        TabTitle[i].style.display=displayValue;
    }
  }
}
</script>
	</body>
</html>
