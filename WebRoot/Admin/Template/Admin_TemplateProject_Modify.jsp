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
String ID=request.getParameter("ID");
if(null!=ID&&!"".equals(ID)){
TemplateProject tp=DAOFactory.getTemplateProjectDao().getTemplateProject(ID);

%>
<html>
	<head>
		<title>模板管理--修改模板方案</title>
		<link href='../CSS/Admin_Style.css' rel='stylesheet' type='text/css'>
		<link href='../CSS/Admin_Main.css' rel='stylesheet' type='text/css'>
	</head>
	<body leftmargin='2' topmargin='0' marginwidth='0' marginheight='0'>
		<table width='100%' border='0' align='center' cellpadding='2'
			cellspacing='1' class='border'>
			<tr class='topbg'>
				<td height='22' colspan='10'>
					<table width='100%'>
						<tr class='topbg'>
							<td align='center'>
								<b>模板管理--修改模板方案</b>
							</td>							
						</tr>
					</table>
				</td>
			</tr>
			<tr class='tdbg'>
				<td width='70' height='30'><strong>管理导航：</strong></td>
				<td height='30'>
				<a href='Admin_TemplateProject.jsp'>模板方案管理</a>&nbsp;|&nbsp;
				<a href='Admin_TemplateProject_Add.jsp'>新建模板方案</a>&nbsp;</td>
			</tr>
		</table>
		<br>
		<table width='100%'>
			<tr>
				<td align='left'>
					您现在的位置：
					<a href='Admin_Class.jsp'>模板方案管理</a>&nbsp;&gt;&gt;&nbsp;修改方案
				</td>
			</tr>
		</table>
		<form name='form1' method='post' action='Admin_TemplateProject_ModifySave.jsp'>
		<input type="hidden" name="TemplateProjectID" value="<%=tp.getTemplateProjectID() %>">
			<table width='100%' border='0' align='center' cellpadding='5'
				cellspacing='0' class='border'>
				<tr align='center'>
				  <td class='tdbg' ' valign='top'>
				    <table width='95%' align='center' cellpadding='2' cellspacing='1'
							bgcolor='#FFFFFF'>
                      <tbody id='Tabs' style='display:'>
                        <tr class='tdbg'>
                          <td width='300' class='tdbg5'><strong>方案名称：</strong> </td>
                          <td><input name='TemplateProjectName' type='text' class="input1" value="<%=tp.getTemplateProjectName() %>" ><font color=red>*</font></td>
                        </tr>
                        <tr class='tdbg'>
                          <td width='300' class='tdbg5'><strong>方案目录：</strong> </td>
                          <td><input name='TemplateProjectURL' type='text' class="input1"  value="<%=tp.getTemplateProjectURL() %>" >
                              <font color=red>*</font><font color=blue>例如：default </font>  </td>
                        </tr>
                        <tr class='tdbg'>
                          <td class='tdbg5'><strong>状态设置：</strong></td>
                          <td>
                          <input name="IsDefault" type="checkbox" id="IsDefault" value="1" <%if(tp.getIsDefault()==1){out.print("checked=checked");} %>  >默认&nbsp;&nbsp;
                          <input name="Enable" type="checkbox" id="Enable" value="1" <%if(tp.getEnable()==1){out.print("checked=checked");} %>>启用
                          </td>
                        </tr>
                        <tr class='tdbg'>
                          <td width='300' class='tdbg5'><strong>方案描述：</strong> <br>
                            请认真填写描述信息，方便日后维护 </td>
                          <td><textarea name='Intro' cols='60' rows='3' id='Intro'><%=tp.getIntro() %> </textarea></td>
                        </tr>
                      </tbody>
                    </table>
                    </td>
				</tr>
			</table>
			<table width='100%' border='0' align='center'>
				<tr class='tdbg'>
					<td height='40' colspan='2' align='center'>
						<input name='Action' type='hidden' id='Action' value='SaveAdd'>						
						<input name='Add' type='submit' value=' 添 加 ' style='cursor:hand;'>
						&nbsp;&nbsp;
						<input name='Cancel' type='button' id='Cancel' value=' 取 消 '
							onClick="window.location.href='Admin_TemplateProject.jsp'"
							style='cursor:hand;'>
					</td>
				</tr>
			</table>
		</form>

	</body>
</html>
<%}%>