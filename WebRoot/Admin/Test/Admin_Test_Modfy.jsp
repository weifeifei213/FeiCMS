<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="PubPackage.jsp"%>
<%
String adminPopNum="POP000204";
if(!DAOFactory.getAdminDaoInstance().checkAdminPopedom(Integer.parseInt(session.getAttribute("AdminID").toString()),adminPopNum))
{
JS.ErrCode(response,"你没有足够的权限！请与管理员联系！");
JS.goBack(response,-1);
}
if(request.getParameter("Action")!=null)
{
 String action=request.getParameter("Action");
 if("SaveModfy".equals(action))
 {
  Test test =new Test();
   if(request.getParameter("ID")==null||"".equals(request.getParameter("ID")))
	 {
	 JS.ErrCode(response,"参数传递错误");
	 JS.goBack(response,-1);
	 return;
	 }
  int testID=Integer.parseInt(request.getParameter("ID"));
  String title=request.getParameter("Title");
  String readme=request.getParameter("ReadMe");
  String createTime=request.getParameter("CreateTime");
  String endTime=request.getParameter("EndTime");
 int isSelected=0;
 if(request.getParameter("IsSelected")!=null)
   isSelected=Integer.parseInt(request.getParameter("IsSelected"));
test.setTestName(title);
test.setReadMe(readme);
test.setCreateTime(createTime);
test.setEndTime(endTime);
test.setStatus(isSelected);
test.setID(testID);
  
 DAOFactory.getTestDaoInstance().updateTest(test);
 JS.goURL(response,"Admin_Test.jsp");
 }
if("Del".equals(action))
{
 adminPopNum="POP000203";
if(!DAOFactory.getAdminDaoInstance().checkAdminPopedom(Integer.parseInt(session.getAttribute("AdminID").toString()),adminPopNum))
{
JS.ErrCode(response,"你没有足够的权限！请与管理员联系！");
JS.goBack(response,-1);
}
 if(request.getParameter("ID")==null||"".equals(request.getParameter("ID")))
 {
   JS.ErrCode(response,"参数传递错误！");
   JS.goBack(response,-1);
   return; 
 }
 else
 {
 int id=Integer.parseInt(request.getParameter("ID"));
 DAOFactory.getTestDaoInstance().delTest(id);
 JS.goURL(response,"Admin_Test.jsp");
 
 }
 }
 if("NumDel".equals(action))
{
  adminPopNum="POP000203";
if(!DAOFactory.getAdminDaoInstance().checkAdminPopedom(Integer.parseInt(session.getAttribute("AdminID").toString()),adminPopNum))
{
JS.ErrCode(response,"你没有足够的权限！请与管理员联系！");
JS.goBack(response,-1);
}
  if(request.getParameterValues("ID")==null||"".equals(request.getParameterValues("ID")))
  {
  JS.ErrCode(response,"至少选择一条记录删除！");
  JS.goBack(response,-1);
  return;
  }
  String id[]=request.getParameterValues("ID");
  for(int i=0;i<id.length;i++)
  {
    DAOFactory.getTestDaoInstance().delTest(Integer.parseInt(id[i]));
  }
  JS.goURL(response,"Admin_Test.jsp");


}
 if("Modfy".equals(action))
 {
	 if(request.getParameter("ID")==null||"".equals(request.getParameter("ID")))
	 {
	 JS.ErrCode(response,"参数传递错误");
	 JS.goBack(response,-1);
	 return;
	 }
	 int testID=Integer.parseInt(request.getParameter("ID"));
	 Test test=DAOFactory.getTestDaoInstance().queryTest(testID);
 


 %>
<html>
	<head>
		<title>调查管理</title>
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
								<b>模 拟 考 试 管 理</b>							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr class='tdbg'>
				<td width='70' height='30'>
					<strong>管理导航：</strong>
				</td>
				<td>
					<a href='Admin_Test.jsp'>试卷管理首页</a>&nbsp;|
					<a href="Admin_Test_Add.jsp">添加新试卷</a>
				</td>
			</tr>
		</table>
		<script language='JavaScript'>
function CheckForm(){
  if (document.myform.Title.value==''){
     alert('调查主题不能为空！');
     document.myform.Title.focus();
     return false;
  }
  return true;  
}
</script>
		<form method='POST' name='myform' onSubmit='return CheckForm();'
			action='Admin_Test_Modfy.jsp?ID=<%=testID %>' target='_self'>
			<table width='100%' border='0' align='center' cellpadding='2'
				cellspacing='1' class='border'>
				<tr class='title'>
					<td height='22' class='title' colspan=4 align=center>
						<b>修 改 试 卷 </b>					</td>
				</tr>
				<tr class='tdbg'>
					<td width="20%" align='right'>
						试卷名称：					</td>
					<td width="45" colspan='3'>
						<textarea name='Title' cols='60' rows='4'><%=test.getTestName() %></textarea>					</td>
				</tr>
				
				<tr class='tdbg'>
					<td align='right'>试卷说明：					</td>
					<td colspan='3'><textarea name='ReadMe' cols='60' rows='6' id="ReadMe"><%=test.getReadMe() %></textarea></td>
				</tr>
				<tr class='tdbg'>
					<td align='right'>
						发布时间：					</td>
					<td colspan='3'>
					
						<input name='CreateTime' type='text' id='CreateTime'
							value='<%=test.getCreateTime() %>' size='20' maxlength='20'>					</td>
				</tr>
				<tr class='tdbg'>
					<td align='right'>
						终止时间：					</td>
					<td colspan='3'>
						<input name='EndTime' type='text' id='EndTime'
							value='<%=test.getEndTime() %>' size='20' maxlength='20'>					</td>
				</tr>
				<tr class='tdbg'>
					<td align='right'>&nbsp;					</td>
					<td colspan='3'>
						<input name='IsSelected' type='checkbox' id='IsSelected'
							value='1' 
							<%
							if(test.getStatus()==1)
							{
							out.println("checked");
							}
							%>>
						启用本试卷</td>
				</tr>
				<tr class='tdbg'>
					<td colspan=4 align=center>
						<input name='Action' type='hidden' id='Action' value='SaveModfy'>
						<input name='Submit' type='submit' id='Submit' value=' 修 改 '>
						&nbsp;
						<input name='Reset' type='reset' id='Reset' value=' 清 除 '>					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
<%
 }
}
 %>
