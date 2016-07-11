<%@ page language="java"  pageEncoding="utf-8"%>
<%@ include file="../PubPackage.jsp"%>
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
if (request.getParameter("ClassID") == null
		|| "".equals(request.getParameter("ClassID"))) {
			JS.AlertCode(response, "参数传递错误！");
			JS.goBack(response, -1);
		}
classID=Integer.parseInt(request.getParameter("ClassID"));
SiteClassDao scdao=new SiteClassDaoImpl();
SiteClass sc=scdao.queryByID(classID);


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
		<table width='100%'>
			<tr>
				<td align='left'>
					您现在的位置：
					<a href='Admin_Class.jsp'>栏目管理</a>&nbsp;&gt;&gt;&nbsp;修改栏目
				</td>
			</tr>
		</table>
		<form name='form1' method='post' action='Admin_SiteClass_ModfySave.jsp?Action=Modfy&ClassID=<%=classID %>' onsubmit='return check()'>
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
                                String AdminID=session.getAttribute("AdminID").toString();								
								List<SiteClass> sclist=scdao.queryOneTop(0,Integer.parseInt(AdminID));
								for(SiteClass psc:sclist){
								%>
								<option value="<%=psc.getClassID() %>" <%if(psc.getClassID()==sc.getParentID()){out.print("selected='selected'");} %> >
								<% for(int i=0;i<psc.getDepth();i++){out.print("&nbsp;&nbsp;┣");} %>
								<%=psc.getClassName() %>
								</option>
								<%
								}
								%>
                            </select>
                              <font color=blue>不能指定为外部栏目</font> </td>
                        </tr>
                          <tr class='tdbg'>
                          <td width='300' class='tdbg5'><strong>栏目名称：</strong> </td>
                          <td><input name='ClassName' type='text' size='20' maxlength='20' value="<%=sc.getClassName() %>">
                              <font color=red>*</font> </td>
                        </tr>
                        <tr class='tdbg'>
                        <td width='300' class='tdbg5'><strong>栏目模型：</strong> </td>
                        <td>                        
                        <select name="ModelID"> 
                        <option value="0">选择模型</option>
                        <% List<Model> mlist=DAOFactory.getModelDao().queryModel(Integer.parseInt(session.getAttribute("SiteID").toString())); 
                        for(Model m:mlist){
                        %>
                        <option value="<%=m.getModelID() %>" <%if(sc.getModelID()==m.getModelID()){out.print("selected='selected'");} %> ><%=m.getModelName() %></option>
                        <%
                        }
                        %>                        
                        </select>
                        </td>
                        </tr>
                        <tr class='tdbg'>
                        <td width='300' class='tdbg5'><strong>在导航栏：</strong> </td>
                        <td><input type="radio" value="1" name="IsShow" <%if(sc.getIsShow()==1){out.print("checked='checked'");} %> >显示在导航栏&nbsp; 
                            <input type="radio" value="0" name="IsShow" <%if(sc.getIsShow()==0){out.print("checked='checked'");}%> >不显示在导航栏 </td>
                        </tr>
                        <tr class='tdbg'>
                        <td width='300' class='tdbg5'><strong>是否单页：</strong> </td>
                        <td><input type="radio" value="1" name="IsPage" <%if(sc.getIsPage()==1){out.print("checked='checked'");}%>>是&nbsp; 
                            <input type="radio" value="0" name="IsPage" <%if(sc.getIsPage()==0){out.print("checked='checked'");}%>> 否 </td>
                        </tr>
                         <tr class='tdbg'>
                        <td width='300' class='tdbg5'><strong>是否外链接：</strong> </td>
                        <td><input type="radio" value="1" name="IsOutsideLink" <%if(sc.getIsOutsideLink()==1){out.print("checked='checked'");}%>>是&nbsp; 
                           <input type="radio" value="0" name="IsOutsideLink" <%if(sc.getIsOutsideLink()==0){out.print("checked='checked'");}%>> 否 </td>
                        </tr>
                        <tr class='tdbg'>
                        <td width='300' class='tdbg5'><strong>链接地址：</strong> </td>
                        <td><input type="text" name="LinkURL" value="<%=sc.getLinkURL() %>"> </td>
                        </tr>
                        <tr class='tdbg'>
                          <td class='tdbg5'><strong>栏目目录：</strong></td>
                          <td><input name="ClassDir" type="text" id="ClassDir" size="20" value="<%=sc.getClassDir() %>">
                          <font color=red>*</font></td>
                        </tr>
                        <tr class='tdbg'>
                          <td width='300' class='tdbg5'><strong>栏目说明：</strong> <br>
                            用于在栏目页详细介绍栏目信息，支持HTML </td>
                          <td><textarea name='Readme' cols='60' rows='3' id='Readme'><%=sc.getReadme() %></textarea></td>
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
							onClick="window.location.href='Admin_SiteClass.jsp'"
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

