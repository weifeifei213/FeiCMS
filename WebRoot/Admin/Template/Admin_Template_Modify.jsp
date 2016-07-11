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
Template tp=DAOFactory.getTemplateDao().getTemplate(ID);

String Action=request.getParameter("Action");
String ProjectID=tp.getProjectID().toString();

TemplateProject Tpp=DAOFactory.getTemplateProjectDao().getTemplateProject(ProjectID);
List<Model> mlist=DAOFactory.getModelDao().queryModel(0);

%>
<html>
	<head>
		<title>模板管理--新建模板</title>
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
								<b>模板管理--新建模板</b>
							</td>							
						</tr>
					</table>
				</td>
			</tr>
			<tr class='tdbg'>
				<td width='70' height='30'><strong>管理导航：</strong></td>
				<td height='30'>
				<a href='Admin_Template.jsp'>模板管理</a>&nbsp;|&nbsp;
				<a href='Admin_Template_Add.jsp'>新建模板</a>&nbsp;</td>
			</tr>
		</table>
		<br>
		<table width='100%'>
			<tr>
				<td align='left'>
					您现在的位置：
					<a href='Admin_Class.jsp'>模板管理</a>&nbsp;&gt;&gt;&nbsp;新建模板
				</td>
			</tr>
		</table>
		<form name='form1' method='post' action='Admin_Template_ModifySave.jsp'>
		<input type="hidden" name="TemplateID" value="<%=tp.getTemplateID() %>">
			<table width='100%' border='0' align='center' cellpadding='5'
				cellspacing='0' class='border'>
				<tr align='center'>
				  <td class='tdbg' ' valign='top'>
				    <table width='95%' align='center' cellpadding='2' cellspacing='1'
							bgcolor='#FFFFFF'>
                      <tbody id='Tabs' style='display:'>
                        <tr class='tdbg'>
                          <td width='300' class='tdbg5'><strong>方案名称：</strong> </td>
                          <td><%=Tpp.getTemplateProjectName() %>
                          <input type="hidden" name="ProjectID" value="<%=Tpp.getTemplateProjectID() %>">
                            </td>
                        </tr>
                        <tr class='tdbg'>
                          <td width='300' class='tdbg5'><strong>模板名称：</strong> </td>
                          <td><input name='TemplateName' type='text' size='20' maxlength='20' value="<%=tp.getTemplateName() %>"><font color=red>*</font></td>
                        </tr>
                        <tr class='tdbg'>
                          <td width='300' class='tdbg5'><strong>模板模型：</strong> </td>
                          <td><select name='ModelID'><option value="0">请选择模型</option>
                          <% for(Model m:mlist){
                          %>
                          <option value="<%=m.getModelID().toString() %>" <%if(m.getModelID()==tp.getModelID()){out.print("selected='selected'");} %> ><%=m.getModelName() %></option>
                          <%
                          }  %>
                           </select>
                              <font color=red>*</font>  </td>
                        </tr>
                         <tr class='tdbg'>
                          <td width='300' class='tdbg5'><strong>模板类型：</strong> </td>
                          <td><select name='TemplateType' >
                          	  <option value="0" <%if(tp.getTemplateType()==0){out.print("selected='selected'");} %>>请选择类型 </option>
                              <option value="1" <%if(tp.getTemplateType()==1){out.print("selected='selected'");} %>>主页</option>
                              <option value="2" <%if(tp.getTemplateType()==2){out.print("selected='selected'");} %>>列表页</option>
                              <option value="3" <%if(tp.getTemplateType()==3){out.print("selected='selected'");} %>>内容页</option>
                           </select>
                              <font color=red>*</font>  </td>
                        </tr>
                         <tr class='tdbg'>
                          <td width='300' class='tdbg5'><strong>模板内容：</strong> <br></td>
                          <td></td>
                        </tr>
                        <tr class='tdbg'>
                        <td colspan="3">
                        <textarea name='TemplateContent' class="textarea1" cols='60' rows='3' id='Intro'></textarea></td></tr>
                        <tr class='tdbg'>
                          <td class='tdbg5'><strong>状态设置：</strong></td>
                          <td>
                          <input name="IsDefault" type="checkbox" id="IsDefault" value="1">默认&nbsp;&nbsp;
                          <input name="IsDefaultInProject" type="checkbox" id="IsDefaultInProject" value="1">方案中默认
                          </td>
                        </tr>
                       
                      </tbody>
                    </table>
                    </td>
				</tr>
			</table>
			<table width='100%' border='0' align='center'>
				<tr class='tdbg'>
					<td height='40' colspan='2' align='center'>
						<input name='Action' type='hidden' id='Action' value='ModifySave'>						
						<input name='Add' type='submit' value=' 添 加 ' style='cursor:hand;'>
						&nbsp;&nbsp;
						<input name='Cancel' type='button' id='Cancel' value=' 取 消 '
							onClick="window.location.href='Admin_Template.jsp'"
							style='cursor:hand;'>
					</td>
				</tr>
			</table>
		</form>

	</body>
</html>
