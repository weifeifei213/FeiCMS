<%@ page language="java" pageEncoding="utf-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.megalith.hibernate.pojo.QyskUser"%>
<%@ include file="../PubPackage.jsp"%>
<%
String adminPopNum="POP000104";
if(!DAOFactory.getAdminDaoInstance().checkAdminPopedom(Integer.parseInt(session.getAttribute("AdminID").toString()),adminPopNum))
{
 JS.ErrCode(response,"你没有足够的权限！请与管理员联系！");
 JS.goBack(response,-1);
 return;
}
%>
<html>
	<head>
		<title>会员系统----会员组管理</title>
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
								<b>会员系统----会员管理</b>
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
					<a href='Admin_UserGroup.jsp'>会员系统管理首页</a>&nbsp;|&nbsp;
				    <a href='Admin_UserGroup_Add.jsp'>添加会员组</a>&nbsp;</td>
			</tr>
		</table>
		<br>
		<table width='100%' border='0' align='center' cellpadding='0'
			cellspacing='1' class='border'>
			<tr class='title' height='22'>
			<td height='22' width='30' align='center'>
			<strong>选中</strong>
			</td>
				<td width='30' align='center'>
					<strong>ID</strong>				</td>
				<td align='center'>
					<strong>会员组名</strong>				</td>
				<td  align='center'>
					<strong>会员组简介</strong></td>
					<td  align='center'>
					<strong>会员组类型</strong></td>
					<td  align='center'>
					<strong>会员数量</strong></td>				
					
					<td width='380' align='center'>
					<strong>操作选项</strong>				</td>
			</tr>
			<% 
				
			Qysk_UserDaoImpl quser=new Qysk_UserDaoImpl(QyskUser.class);
			DbConnection conn=null;
			ResultSet rs=null;
			String strNbsp="";
			String strSql="select * from qysk_usergroup order by GroupID asc";	
			//获取记录总数
						   int pageSize=15; 
                           int rowCount=0; //总的记录数 
                           int pageCount=0; //总的页数 
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
							
						
			
					
			try{
			conn=new DbConnection();
			rs=conn.executeQuerySql(strSql);	
			rs.last();
							rowCount = rs.getRow();//取得总记录数
							pageCount=(rowCount+pageSize-1)/pageSize; //计算总页数
							if (currPage>pageCount) currPage=pageCount; 							
							int thepage=(currPage-1)*pageSize; 
							int n=0; 		
			 rs.absolute(thepage+1); 
						 rs.previous();
						 
			while(rs.next()){
			n++;
			%>
			<tr class='tdbg' onMouseOut="this.className='tdbg'"
				onmouseover="this.className='tdbgmouseover'" align="center" >
				<td width='30'  align='center'>
								<input name='GroupID' type='checkbox'
									onclick='CheckItem(this)' id='GroupID' value='<%=rs.getInt("GroupID") %>' />
									</td>
				<td width='30' align='center'>
					<%=rs.getInt("GroupID")%></td>
				<td width="100" align="left">		
				
											
					<a
						href='Admin_PhotoClass_Modfy.jsp?ClassID=<%=rs.getInt("GroupID") %>'
						title=''><%=rs.getString("GroupName") %></a> </td>
				<td width="1000">									
					<%=rs.getString("GroupIntro") %></td>		
				<td width="200">	
					<%
					if(0==rs.getInt("GroupType")){out.print("等待邮件验证会员");}
					if(1==rs.getInt("GroupType")){out.print("等待管理员审核会员");}
					if(2==rs.getInt("GroupType")){out.print("默认会员组");}
					if(3==rs.getInt("GroupType")){out.print("注册会员");}
					if(4==rs.getInt("GroupType")){out.print("代理商");}
					if(5==rs.getInt("GroupType")){out.print("匿名投稿");}
					 %>							
					
					
				</td>		
				<td width="100">	
												
					<%//quser.countUserGroup(" and GroupID = "+rs.getInt("GroupID")) %>
					
				</td>	
						
						
				<td align='left' width='380'>
					&nbsp;
					
					<a href='Admin_UserGroup_Modfy.jsp?Action=Clear&GroupID=<%=rs.getInt("GroupID")%>'
						onClick='return ConfirmDel3();'>修改</a>&nbsp;|&nbsp;
						<% if(rs.getInt("GroupID")>8){
						%>
						<a href='Admin_UserGroup_ModfySave.jsp?Action=Del&GroupID=<%=rs.getInt("GroupID")%>'
						onClick='delcfm();'>删除</a>
						<%
						}else{
						%>
						<a href='#'
						onClick='delcfm();'>删除</a>
						<%
						} %>
						&nbsp;|&nbsp;
						<a href="">显示会员</a>	
									</td>
					
						
			</tr>
			<%
			
			}			 
			}
			catch(Exception ex)
			{
			out.println("<tr class=tdbg><td colspan=3 align=center>"+ex+"</td></tr>");
			}
			rs.close();
			conn.closeConnection();
			%>
		</table>
		
		<div class="show_page">
			共
			<b><%=rowCount %></b> 组&nbsp;&nbsp;
			<%
			if(currPage>1){
			   out.println("<a href=Admin_UserGroup.jsp?page=1>首页</a> <a href=Admin_UserGroup.jsp?page="+(currPage-1)+">上一页</a>");
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
			   out.println("<a href=Admin_UserGroup.jsp?page="+(currPage+1)+">下一页</a> <a href=Admin_UserGroup.jsp?page="+pageCount+">尾页</a>");
			   }
			else
			{
			   out.println("下一页 尾页");
			   }
			 %>
			<strong><font color=red><%=currPage %></font>/<%=pageCount %></strong>页 &nbsp;
			<input type='text' name='MaxPerPage' size='3' maxlength='4'
				value='<%=pageSize %>'
				onKeyPress="if (event.keyCode==13) window.location='Admin_UserGroup.jsp?page='+this.value;">
			组/页&nbsp;
			
		</div>
		
		
		<br>
			<script language="javascript">
    function delcfm() {
        if (!confirm("确认要删除？")) {
            window.event.returnValue = false;
        }
    }
</script>
	</body>
</html>
