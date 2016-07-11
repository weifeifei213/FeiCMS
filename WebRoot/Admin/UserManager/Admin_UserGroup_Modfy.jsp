<%@ page language="java"  pageEncoding="utf-8"%>
<%@page import="com.megalith.vo.QyskUsergroup"%>
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
String GroupID=request.getParameter("GroupID");
QyskUsergroup ug=DAOFactory.getQyskUserGroupDao().quaryOneUserGroup(Integer.parseInt(GroupID));
//获取权限参数
String purview_Check="";
String purview_View=ug.getArrClassBrowse();
String purview_Input=ug.getArrClassInput();
String purview_GroupSetting=ug.getGroupSetting();
String purview_Manage=ug.getArrClassView();
%>
<html>
	<head>
		<title>文章中心管理----会员组管理</title>
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
								<b>图片系统管理----会员组管理</b>
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
				<a href='Admin_PhotoClass_Add.jsp'>添加图片会员组</a>&nbsp;</td>
			</tr>
		</table>
		<br>
		<table width='100%'>
			<tr>
				<td align='left'>
					您现在的位置：
					<a href='Admin_PhotoClass.jsp'>会员组管理</a>&nbsp;&gt;&gt;&nbsp;修改会员组
				</td>
			</tr>
		</table>
		<form name='form1' method='post' action='Admin_UserGroup_ModfySave.jsp?Action=Modfy&GroupID=<%=GroupID %>' onsubmit='return check()'>
		 <table width='100%' border='0' align='center' cellpadding='2' cellspacing='1' class='border'>
    <tr class='title'>
      <td height='22' colspan='3'><div align='center'>新 增 会 员 组</div></td>
    </tr>
    <tr class='tdbg'>
      <td width='15%' class='tdbg5' align='right'>会员组名称：</td>
      <td><input name='GroupName' type='text' id='GroupName' size='20' maxlength='20' value="<%=ug.getGroupName() %>"><font color='#FF0000'>*</font></td>
    </tr>
    <tr class='tdbg'>
      <td width='15%' class='tdbg5' align='right'>会员组说明：</td>
      <td><input name='GroupIntro' type='text' id='GroupIntro' size='50' maxlength='200' value="<%=ug.getGroupIntro() %>"><font color='#FF0000'>*</font></td>
    </tr>
    <tr class='tdbg'>
      <td width='15%' class='tdbg5' align='right'>组 类 型：</td>
      <td><select name='GroupType' id='GroupType' >
                            <option value='3' <%if(ug.getGroupType()==3){out.print("selected='selected'");} %>  >注册会员</option>
                            <option value='4' <%if(ug.getGroupType()==4){out.print("selected='selected'");} %> >代 理 商</option>
                        </select><font color='#FF0000'>*</font></td>
    </tr>
    <tr class='tdbg'>
      <td width='15%' class='tdbg5' align='right'>发布权限：</td>
      <td>
<input name='GroupSetting1' type='checkbox' value='GS00001' <%if(purview_GroupSetting.indexOf("GS00001")>=0){out.print("checked");} %>>在发布信息需要审核的频道，此组会员发布信息不需要审核<br>
<input name='GroupSetting2' type='checkbox' value='GS00002' <%if(purview_GroupSetting.indexOf("GS00002")>=0){out.print("checked");} %>>可以修改和删除已审核的（自己的）信息<br>
<input name='GroupSetting22' type='checkbox' value='GS00003' <%if(purview_GroupSetting.indexOf("GS00003")>=0){out.print("checked");} %>  >发表信息时可以设置是否显示评论链接<br>
<input name='GroupSetting24' type='checkbox' value='GS00004' <%if(purview_GroupSetting.indexOf("GS00004")>=0){out.print("checked");} %>>发表信息时HTML编辑器为高级模式（默认为简洁模式）<br>
每天最多发布<input name='DayInputMax' type='text' value='0' size='6' maxlength='6' style='text-align: center;'>条信息（不想限制请设置为<b>0</b>）。
</tr>
    <tr class='tdbg'>
    <td width='15%' class='tdbg5' align='right'>评论权限：</td>
         <td><input name='GroupSetting5' type='checkbox' value='GS00005' <%if(purview_GroupSetting.indexOf("GS00005")>=0){out.print("checked");} %> >可以评论自己的发布的文章<br>
         <input name='GroupSetting6' type='checkbox' value='GS00006'<%if(purview_GroupSetting.indexOf("GS00006")>=0){out.print("checked");} %> >发布的评论不需要审核</td>
    </tr>
   
    <tr class='tdbg'>
      <td colspan='3'>
        <table width='100%' border='0' cellspacing='10' cellpadding='0'>
          <tr>
            <td colspan='2' align='center'>频 道 权 限 详 细 设 置</td>
          </tr>
          <tr valign='top'>
           <td>
           <fieldset>
   <legend>此会员组【<font color='red'>拥有权限的</font>】频道：</legend>
    <table width="100%" >
     <tr><td>
    
    </td></tr> 
    </table>    
   </fieldset></td>
          </tr>
           <tr valign='top'>
           <td>
           <fieldset>
   <legend>此会员组【<font color='red'>拥有权限的</font>】栏目：</legend>    
        <input type="hidden" name="GroupID" id="GroupID" value="<%=request.getParameter("GroupID")%>" >
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
						<img src='../Images/Folder/tree_folder4.gif' width='15' height='15'
							valign='abvmiddle'>
						<b><%=rs.getString("ClassName") %></b> </td>
					<td width='30' align='center'>
						<input name='Purview_View' type='checkbox' id='Purview_View'
							value='<%=rs.getInt("ClassID")%>' <%if(purview_View.indexOf(rs.getInt("ClassID")+"")>=0){out.print("checked");} %>>
					</td>
					<td width='30' align='center'>
						<input name='Purview_Input' type='checkbox' id='Purview_Input'
							value='<%=rs.getInt("ClassID")%>' <%if(purview_Input.indexOf(rs.getInt("ClassID")+"")>=0){out.print("checked");} %>>
					</td>
					<td width='30' align='center'>
						<input name='Purview_Manage' type='checkbox' id='Purview_Manage'
							value='<%=rs.getInt("ClassID")%>' <%if(purview_Manage.indexOf(rs.getInt("ClassID")+"")>=0){out.print("checked");} %>>
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
			
			<tr>
			<td colspan="6">
			<font color='#0000FF'>注：</font><br>1、栏目权限采用继承制度，即在某一栏目拥有某项权限，则在此栏目的所有子栏目中都拥有这项权限，并可在子栏目中指定更多的权限。<br>2、灰色并且选中的项目，说明该栏目为开放栏目，会员组在此栏目拥有浏览和查看权限。<br><br><font color='red'>权限含义：</font><br>浏览－－指可以浏览此栏目的信息列表<br>查看－－指可以查看此栏目中的信息的内容<br>发布－－指可以在此栏目中发布信息
			</td>
			</tr>    
    </table>    
   </fieldset></td>
          </tr>
          
          
          
            <tr>
                <td align='center'>
                    <input type='hidden' name='Action' value='SaveAdd'>
                    <input type='submit' value='提交修改'>
                    <input type='button' name='cancel' value=' 取 消 ' onClick="JavaScript:window.location.href='Admin_UserGroup.jsp'">
                </td>
            </tr>
  </table>
  </td>
  </tr>
  </table>	
			
			
		</form>
<script language=javascript>
function CheckSubmit(){
  if(document.form1.GroupName.value==''){
      alert('会员组名称不能为空！');
   document.form1.GroupName.focus();
      return false;
    }
    GetClassPurview();
}
</script>
	</body>
</html>

