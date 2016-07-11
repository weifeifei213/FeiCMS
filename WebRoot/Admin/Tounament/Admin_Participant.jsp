<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ include file="../PubPackage.jsp"%>
<% 
String adminPopNum="POP000105";
if(!DAOFactory.getAdminDaoInstance().checkAdminPopedom(Integer.parseInt(session.getAttribute("AdminID").toString()),adminPopNum))
{
 JS.ErrCode(response,"你没有足够的权限！请与管理员联系！");
 JS.goBack(response,-1);
 return;
}
ArticleClassDaoImpl acd=new ArticleClassDaoImpl(); 
DbConnection conn=new DbConnection();
String showTopClass=""; 
Admin admin=DAOFactory.getAdminDaoInstance().showAdmin(Integer.parseInt(session.getAttribute("AdminID").toString()))  ;  
	
int status=9;
String strSql=" select p.*,v.* from qysk_participant p left JOIN qysk_vote v on p.id =v.par_id order by v.voteNumber desc";	
ResultSet rs=conn.executeQuerySql(strSql);
%>
<html>
	<head>
		<title>选手管理</title>
		<meta http-equiv='Content-Type' content='text/html; charset=gb2312'>
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
								<b>比赛频道----选手统计</b>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr class='tdbg'>
				<td width='70' height='30'>
					<strong>管理导航：</strong>
				</td>
				<td colspan='5'>
					<a href='Admin_Participant.jsp'>选手管理</a>&nbsp;|&nbsp;
					
				</td>
			</tr>
			
		</table>
		<SCRIPT language=javascript>
       </SCRIPT>
		<br>
		<table width='100%' border='0' align='center' cellpadding='2'
			cellspacing='1' class='border'>
			<tr class='title'>
				<td height='22'>
				<%
				if(showTopClass.equals("")||showTopClass==null)
				  out.println("还没有任何栏目，请首先添加栏目。");
				else
				  out.println(showTopClass);
				%>
				
				</td>
			</tr>
		</table>
		<br>
		<table width='100%' border='0' align='center' cellpadding='0'
			cellspacing='0'>
			<tr>
				<td height='22'>
					您现在的位置：&nbsp;图片中心管理&nbsp;&gt;&gt;所有图片！</td>
				
			</tr>
		</table>
		<table width='100%' border='0' cellpadding='0' cellspacing='0'>
			<tr>
				<form name='myform' method='Post' action='Admin_Participant_ModfySave.jsp' onsubmit='return ConfirmDel();'>
				<td>
					<table class='border' border='0' cellspacing='1' width='100%'
						cellpadding='0'>
						<tr class='title' height='22'>
							<td height='22' width='30' align='center'>
								<strong>选中</strong>							</td>
							<td width='25' align='center'>
								<strong>ID</strong>							</td>
							<td width="100" align='center'>
								<strong>昵称</strong>							</td>
							<td width="50" align='center'>
								<strong>姓名</strong>						</td>	
								
							<td width='73' align='center'>
								<strong>性别</strong>							</td>
							<td width='65' align='center'>
								<strong>年龄</strong>							</td>
							<td width='113' align='center'>
								<strong>电话</strong>							</td>
							<td width='113' align='center'>
								<strong>得分</strong>							</td>
							<td width='74' align='center'>
								<strong>状态</strong>							</td>
							
						</tr>
						<%
						//获取记录总数
						   int pageSize=15; 
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
						 while(rs.next()&n<pageSize)
						  {
					       n++;
						 %>
						<tr class='tdbg' onMouseOut="this.className='tdbg'"
							onMouseOver="this.className='tdbgmouseover'">
							<td width='30' height="36" align='center'>
								<input name='PhotoID' type='checkbox'
									onclick='CheckItem(this)' id='PhotoID' value=<%=rs.getInt("id") %>>							</td>
							<td width='25' align='center'>
								<%=rs.getInt("id") %>							</td>
							<td>
								&nbsp;
								<a href='Admin_Participant_Modfy.jsp?ParId=<%=rs.getInt("id") %>'
									title=<%=rs.getString("nickname") %>><%=rs.getString("nickname") %></a></td>
							<td width='100' align='center'>
								<%=rs.getString("Name") %>						  </td>		
									
							<td width='73' align='center'>
								<%=rs.getString("sex") %>						  </td>
							<td width='65' align='center'>
								<%=rs.getInt("age") %>						  </td>
							<td width='113' align='center'>
							<%=rs.getString("Phone") %>
												  </td>
							<td width='74' align='center'>
								<font color=red>
								<%=rs.getString("voteNumber") %>
								
						  </font>						  </td>
						  <td width='74' align='center'>
								<font color=red>
								<%=rs.getString("p_status") %>
								
						  </font>						  </td>
							
						</tr>
						<%
						                      
						} 
						%>
					</table>
					
				</td>
				</form>
			</tr>
		</table>
		<div class="show_page">
			共
			<b><%=rowCount %></b> 篇图片&nbsp;&nbsp;
			<%
			if(currPage>1){
			   out.println("<a href=Admin_Participant.jsp?page=1>首页</a> <a href=Admin_Participant.jsp?page="+(currPage-1)+">上一页</a>");
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
			   out.println("<a href=Admin_Participant.jsp?page="+(currPage+1)+">下一页</a> <a href=Admin_Participant.jsp?page="+pageCount+">尾页</a>");
			   }
			else
			{
			   out.println("下一页 尾页");
			   }
			 %>
			<strong><font color=red><%=currPage %></font>/<%=pageCount %></strong>页 &nbsp;
			<input type='text' name='MaxPerPage' size='3' maxlength='4'
				value='<%=pageSize %>'
				onKeyPress="if (event.keyCode==13) window.location='Admin_Participant.jsp?page='+this.value;">
			篇图片/页&nbsp;
			
		</div>
		<br>
		<form method='Post' name='SearchForm'
			action='Admin_Participant.jsp?Action=Search&Type=All'>
			<table width='100%' border='0' cellpadding='0' cellspacing='0'
				class='border'>
				<tr class='tdbg'>
					<td width='80' align='right'>
						<strong>图片搜索：</strong>
					</td>
					<td>
						<select name='Field' size='1'>
							<option value='Title' selected>
								选手姓名
							</option>
							<option value='Content'>
								选手编号
							</option>
							<option value='Inputer'>
								录入者
							</option>
						</select>
						
						<input type='text' name='keyword' size='20' value='关键字'
							maxlength='50' onFocus='this.select();'>
						<input type='submit' name='Submit' value='搜索'>
					</td>
				</tr>
			</table>
		</form>
		<br>
		<b>说明：</b>
		<br>
		&nbsp;&nbsp;&nbsp;&nbsp;图片属性中的各项含义：
		<font color=blue>顶</font>----固顶图片，
		<font color=red>热</font>----热门图片，
		<font color=green>荐</font>----推荐图片，
		<font color=blue>图</font>----首页图片图片，
		<br>
		<br>
	</body>
</html>
