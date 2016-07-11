<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ include file="../PubPackage.jsp"%>
<%
String adminPopNum="POP000113";
if(!DAOFactory.getAdminDaoInstance().checkAdminPopedom(Integer.parseInt(session.getAttribute("AdminID").toString()),adminPopNum))
{
JS.ErrCode(response,"你没有足够的权限！请与管理员联系！");
JS.goBack(response,-1);
}
if (request.getParameter("SpecialID") == null
			|| "".equals(request.getParameter("Special"))) {
    JS.AlertCode(response, "参数传递错误！");
	JS.goBack(response, -1);
	return;
	}
int specialID=Integer.parseInt(request.getParameter("SpecialID"));
SpecialDao specialDao=new SpecialDaoImpl();
Special special=specialDao.quaryOneSpecial(specialID);
%>
<html>
	<head>
		<title>文章专题管理</title>
		<link href='../CSS/Admin_Style.css' rel='stylesheet' type='text/css'>
	    <style type="text/css">

        </style>
</head>
	<body leftmargin='2' topmargin='0' marginwidth='0' marginheight='0'>
		<table width='100%' border='0' align='center' cellpadding='2'
			cellspacing='1' class='border'>
			<tr class='topbg'>
				<td height='22' colspan='10'>
					<table width='100%'>
						<tr class='topbg'>
							<td align='center'>
								<b>文章中心管理----专题管理</b>
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
					<a href='Admin_Special.jsp'>文章专题管理首页</a>&nbsp;|&nbsp;
					<a href='Admin_Special_Add.jsp'>添加文章专题</a>&nbsp;
				</td>
			</tr>
		</table>
		
		<br>
		<table width='100%'>
			<tr>
				<td align='left'>
					您现在的位置：
					<a href='Admin_Special.jsp'>专题管理</a>&nbsp;&gt;&gt;&nbsp;添加专题
				</td>
			</tr>
		</table>
		<form method='post' action='Admin_Special_ModfySave.jsp?Action=ModfySave&SpecialID=<%=specialID %>'
			name='form1'>
			<table width='100%' border='0' align='center' cellpadding='2'
				cellspacing='1' class='border'>
				<tbody id='Tabs' style='display:'>
					<tr class='tdbg'>
						<td width='350' class='tdbg5'>
							<strong>专题名称：</strong>
						</td>
					  <td class='tdbg'>
							<input name='SpecialName' type='text' id='SpecialName' size='49'
								maxlength='30' value=<%=special.getSpecialName() %>>
						  &nbsp;
						    <span class="STYLE4">*</span></td>
					</tr>
					<tr class='tdbg'>
						<td width='350' class='tdbg5'>
							<strong>专题目录：</strong>
							<br>
							只能是英文，不能带空格或“\”、“/”等符号。
							<br>
							本功能需要服务器支持FSO。但即使你的服务器不支持FSO，也请认真录入，因为可以在换了空间再批量生成。
						</td>
					  <td class='tdbg'>
							<input name='SpecialDir' type='text' id='SpecialDir' size='49'
								maxlength='30' value=<%=special.getSpecialDir() %>>
						  &nbsp;
						    <span class="STYLE4">*</span></td>
					</tr>
					<tr class='tdbg'>
						<td width='350' class='tdbg5'>
							<strong>打开方式：</strong>
						</td>
						<td>
						<%
						 if(special.getOpenType()==0)
						{
						 %>
							<input name='OpenType' type='radio' value='0' checked>
							在原窗口打开&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input name='OpenType' type='radio' value='1'>
							在新窗口打开
							<%
						}else{
							 %>
							 <input name='OpenType' type='radio' value='0' >
							在原窗口打开&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input name='OpenType' type='radio' value='1' checked>
							在新窗口打开
						<%} %>
						</td>
					</tr>
					<tr class='tdbg'>
						<td width='350' class='tdbg5'>
							<strong>是否为推荐专题：</strong>
						</td>
						<td>
						<%
						if(special.getIsElite()==0)
						{
						 %>
							<input name='IsElite' type='radio' value='1' >
							是&nbsp;&nbsp;&nbsp;&nbsp;
							<input name='IsElite' type='radio' value='0'  checked>
							否
						<%
						}else{
						 %>
						 <input name='IsElite' type='radio' value='1' checked>
							是&nbsp;&nbsp;&nbsp;&nbsp;
							<input name='IsElite' type='radio' value='0'>
							否
						 
						 <%} %>
						</td>
					</tr>
					<tr class='tdbg'>
						<td width='350' class='tdbg5'>
							<strong>专题提示：</strong>
							<br>
							鼠标移至专题名称上时将显示设定的提示文字（不支持HTML）
						</td>
						<td class='tdbg'>
							<textarea name='Tips' cols='60' rows='3' id='Tips'><%=special.getTips() %></textarea>
						</td>
					</tr>
					<tr class='tdbg'>
						<td width='350' class='tdbg5'>
							<strong>专题说明：</strong>
							<br>
							用于专题页对专题进行说明（支持HTML）
						</td>
						<td class='tdbg'>
							<textarea name='Readme' cols='60' rows='3' id='Readme'><%=special.getReadMe() %></textarea>
						</td>
					</tr>
				</tbody>


				<tr class='tdbg'>
					<td colspan='2' align='center' class='tdbg'>
						<input type='submit' name='Submit' value=' 修 改 '>
						&nbsp;&nbsp;
						<input name='Cancel' type='button' id='Cancel' value=' 取 消 '
							onClick="window.location.href='Admin_Special_Modfy.jsp'"
							style='cursor:hand;'>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
<!-- Powered by: PowerEasy 2005 -->
