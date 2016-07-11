<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="../PubPackage.jsp"%>
<%
ResultSet rs = DAOFactory.getQuestionDaoInstance().showAllQuestion();
%>
<html>
	<head>
		<title>模拟管理</title>
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
								<b>模 拟 考 试 管 理</b>
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
				<a href='Admin_Question.jsp'>试题管理首页</a>&nbsp;</td>
			</tr>
		</table>
		<SCRIPT language=javascript>
function unselectall(){
    if(document.myform.chkAll.checked){
 document.myform.chkAll.checked = document.myform.chkAll.checked&0;
    }
}
function CheckAll(form){
  for (var i=0;i<form.elements.length;i++){
    var e = form.elements[i];
    if (e.Name != 'chkAll'&&e.disabled==false)
       e.checked = form.chkAll.checked;
    }
  }
function ConfirmDel(){
 if(document.myform.Action.value=='Del'){
     if(confirm('确定要删除选中的调查吗？'))
         return true;
     else
         return false;
 }
}
</SCRIPT>
		<br>
		<br>
		<table width='100%' border='0' align='center' cellpadding='0'
			cellspacing='0'>
			<tr>
				<td height='22'>
					您现在的位置：模拟考试管理&nbsp;&gt;&gt;&nbsp;试题管理首页
				</td>
			</tr>
		</table>
		<table width='100%' border='0' cellpadding='0' cellspacing='0'>
			<tr>
				<form name='myform' method='Post' action='Admin_Question_Modfy.jsp'
					onsubmit='return ConfirmDel();'>
				<td>
					<table class='border' border='0' cellspacing='1' width='100%'
						cellpadding='0'>
						<tr class='title'>
							<td width='30' height='22' align='center'>
								<strong>选中</strong>							</td>
							<td width='30' height='22' align='center'>
								<strong>ID</strong>							</td>
							<td width="195" height='22' align='center'><strong>所属试卷</strong></td>
							<td width="640" align='center'><strong>题目名称</strong></td>
							<td width="72" align='center'><strong>试题类型</strong></td>
							<td width='70' height='22' align='center'>
								<strong>试题状态</strong>							</td>
							<td width='124' height='22' align='center'>
								<strong>得分</strong>							</td>
							<td width='79' height='22' align='center'>
								<strong>操作</strong>							</td>
						</tr>
						<%
						   int pageSize=20; 
                           int rowCount; //总的记录数 
                           int pageCount; //总的页数 
                           int currPage; //当前页数 
						   String strPage; 
                           strPage=request.getParameter("page"); 
						   if (strPage==null){ 
							currPage=1; 
							} 
							else{ 
							currPage=Integer.parseInt(strPage); 
							if (currPage<1) currPage=1; 
							} 
							rs.last();
							rowCount = rs.getRow();//取得总记录数
							pageCount=(rowCount+pageSize-1)/pageSize; //计算总页数
							if (currPage>pageCount) currPage=pageCount; 							
							int thepage=(currPage-1)*pageSize; 
							int n=0; 
						 rs.absolute(thepage+1); 
						 rs.previous();
						while (rs.next()&&n<pageSize) {
						%>
						<tr class='tdbg' onMouseOut="this.className='tdbg'"
							onmouseover="this.className='tdbgmouseover'">
							<td width='30' align='center'>
								<input name='ID' type='checkbox' onclick='unselectall()'
									value='<%=rs.getInt("ID")%>'>							</td>
							<td width='30' align='center'>
								<%=rs.getInt("ID")%>							</td>
							<td><%=DAOFactory.getTestDaoInstance().getTestName(rs.getInt("TestID")) %></td>
							<td><a href='Admin_Question_Modfy.jsp?Action=Modify&ID=1'><%=rs.getString("Title")%></a></td>
							<td align='center'><%
							switch(rs.getInt("Type"))
							{
							case 1:out.println("判断题");break;
							case 2:out.println("单选题");break;
							case 3:out.println("多选题");break;
							
							}
							
							 %></td>
							<td width='70' align='center'>
								<%
								if (rs.getInt("Status") == 1) {
								%>
								<font color=green>启用</font>
								<%
								} else {
								%>
								停用
								<%
								}
								%>						  </td>
							<td align='center'>
								<%=rs.getString("Score")%>							</td>
							<td width='79' align='center'><a
									href='Admin_Question_Modfy.jsp?Action=Modfy&ID=<%=rs.getInt("ID")%>'>修改</a>&nbsp;
								<a
									href='Admin_Question_Modfy.jsp?Action=Del&ID=<%=rs.getInt("ID")%>'
									onClick="return confirm('确定要删除此试卷吗？');">删除</a>&nbsp;	</td>
						</tr>
						<%
						n++;
						}
						%>
						<tr><td colspan=8> 
						</td></tr>
					</table>
					
					<table width='100%' border='0' cellpadding='0' cellspacing='0'>
						<tr>
							<td width='130' height='30'>
								<input name='chkAll' type='checkbox' id='chkAll'
									onclick='CheckAll(this.form)' value='checkbox'>
								选中所有的试题
							</td>
							<td>
								<input type='submit' value='删除选定的试题' name='submit'
									onClick="document.myform.Action.value='NumDel'">
								&nbsp;&nbsp;

								<input name='Action' type='hidden' id='Action' value=''>
							</td>
						</tr>
					</table>
				</td>
				</form>	
			</tr>
			<tr>
			<td>
				<div class="show_page">
			共
			<b><%=rowCount %></b> 个试题&nbsp;&nbsp;
			<%
			if(pageCount>1){
			   out.println("<a href=Admin_ Question.jsp?page=1>首页</a> <a href=Admin_Question.jsp?page="+(currPage-1)+">上一页</a>");
			   }
			else
			{
			    out.println("首页 上一页");
			    }
			 %>
			&nbsp;
			<%
			if(currPage<pageCount)
			{
			   out.println("<a href=Admin_Question.jsp?page="+(currPage+1)+">下一页</a> <a href=Admin_Question.jsp?page="+pageCount+">尾页</a>");
			   }
			else
			{
			   out.println("下一页 尾页");
			   }
			 %>
			<strong><font color=red>1</font>/1</strong>页 &nbsp;
			<input type='text' name='MaxPerPage' size='3' maxlength='4'
				value='<%=pageSize %>'
				onKeyPress="if (event.keyCode==13) window.location='Admin_Article.asp?ChannelID=1&Action=Manage&ManageType=Check&ClassID=0&SpecialID=0&Field=&keyword=&Status=0&Created=&PayStatus=False&OnTop=&IsElite=&IsHot=&page=1&MaxPerPage='+this.value;">
			篇文章/页&nbsp;
			
		</div>	
			</td>
			</tr>
		</table>

	</body>
</html>
