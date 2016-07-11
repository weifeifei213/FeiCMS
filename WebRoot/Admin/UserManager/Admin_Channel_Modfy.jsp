<%@ page language="java"  pageEncoding="utf-8"%>
<%@ include file="../PubPackage.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 %>	
<%
String adminPopNum="POP000102";
if(!DAOFactory.getAdminDaoInstance().checkAdminPopedom(Integer.parseInt(session.getAttribute("AdminID").toString()),adminPopNum))
{
 JS.ErrCode(response,"你没有足够的权限！请与管理员联系！");
 JS.goBack(response,-1);
 return;
}
int classID=0;
int parentID=0;
String className="";
String classDir="";
String readme="";
if (request.getParameter("ClassID") == null
		|| "".equals(request.getParameter("ClassID"))) {
			JS.AlertCode(response, "参数传递错误！");
			JS.goBack(response, -1);
		}
else
{
classID=Integer.parseInt(request.getParameter("ClassID"));

ArticleClassDao acd=new ArticleClassDaoImpl();
ResultSet rs=acd.queryByID(classID);
if(rs.next())
{
 className=rs.getString("ClassName");
 parentID=rs.getInt("ParentID");
 classDir=rs.getString("ClassDir");
 readme=rs.getString("Readme");

}
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
								<b>图片系统管理----栏目管理</b>
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
					<a href='Admin_PhotoClass.jsp'>图片系统管理首页</a>&nbsp;|&nbsp;
				<a href='Admin_PhotoClass_Add.jsp'>添加图片栏目</a>&nbsp;</td>
			</tr>
		</table>
		<br>
		<table width='100%'>
			<tr>
				<td align='left'>
					您现在的位置：
					<a href='Admin_PhotoClass.jsp'>栏目管理</a>&nbsp;&gt;&gt;&nbsp;修改栏目
				</td>
			</tr>
		</table>
		<form name='form1' method='post' action='Admin_Class_ModfySave.jsp?Action=Modfy&ClassID=<%=classID %>' onsubmit='return check()'>
			<table width='100%' border='0' align='center' cellpadding='5'
				cellspacing='0' class='border'>
				<tr align='center'>
				  <td class='tdbg' ' valign='top'>
				    <table width='95%' align='center' cellpadding='2' cellspacing='1'
							bgcolor='#FFFFFF'>
                      <tbody id='Tabs' style='display:'>
                        
                        <tr class='tdbg'>
                          <td width='300' class='tdbg5'><strong>栏目名称：</strong> </td>
                          <td><input name='ClassName' type='text' size='20' maxlength='20' value=<%=className %>>
                              <font color=red>*</font> </td>
                        </tr>
                        <tr class='tdbg'>
                          <td class='tdbg5'><strong>栏目权值：</strong></td>
                          <td><input name="ClassDir" type="text" id="ClassDir" size="20" value=<%=classDir %>>
                          <font color=red>*</font></td>
                        </tr>
                       
                      </tbody>
                    </table>				  </td>
				</tr>
			</table>
			<table width='100%' border='0' align='center'>
				<tr class='tdbg'>
					<td height='40' colspan='2' align='center'>
						<input name='Add' type='submit' value=' 修 改 ' style='cursor:hand;'>
						&nbsp;&nbsp;
						<input name='Cancel' type='button' id='Cancel' value=' 取 消 '
							onClick="window.location.href='Admin_Class_Modfy.jsp'"
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

