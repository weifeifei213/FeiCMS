<%@ page language="java" pageEncoding="utf-8"%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.megalith.vo.QyskParticipant"%>
<%@ include file="../PubPackage.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 %>	
<%
String adminPopNum="POP000108";
if(!DAOFactory.getAdminDaoInstance().checkAdminPopedom(Integer.parseInt(session.getAttribute("AdminID").toString()),adminPopNum))
{
 JS.ErrCode(response,"你没有足够的权限！请与管理员联系！");
 JS.goBack(response,-1);
 return;
}

QyskParticipant par=null;
if(request.getParameter("ParId")==null)
{
  JS.ErrCode(response,"参数传递错误！");
  JS.goBack(response,-1);
  }
  else
  {
  int ParId=Integer.parseInt(request.getParameter("ParId"));
  try{
   par=DAOFactory.getQyskParticipantDao().quaryOneParticipant(ParId);
   
  
%>
<html>
	<head>
		<title>图片管理</title>
		<meta http-equiv='Content-Type' content='text/html; charset=utf-8'>
		<link href='../CSS/Admin_Style.css' rel='stylesheet' type='text/css'>
				
		<script src="../../js/prototype.js"></script>
		<script src="../../js/checklogin.js"></script>
		
	</head>
	<body leftmargin='2' topmargin='0' marginwidth='0' marginheight='0'>
		<table width='100%' border='0' align='center' cellpadding='2'
			cellspacing='1' class='border'>
			<tr class='topbg'>
				<td height='22' colspan='10'>
					<table width='100%'>
						<tr class='topbg'>
							<td align='center'>
								<b>选手管理</b>
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
					<a href='Admin_Participant.jsp'>选手管理首页</a>&nbsp;|&nbsp;
					
				</td>
			</tr>
		</table>
		<script language='JavaScript'></script>
		<br>
		<table width='100%'>
			<tr>
				<td align='left'>
					您现在的位置：
					<a href='Admin_Participant.jsp'>选手管理</a>&nbsp;&gt;&gt;&nbsp;选手详情
				</td>
			</tr>
		</table>
		<form method='POST' name='myform' onSubmit='return CheckForm();'
			action='Admin_Photo_ModfySave.jsp?PhotoID=<%=ParId %>' target='_self'>
			<table width='100%' border='0' align='center' cellpadding='5'
				cellspacing='0' class='border'>
				<tr align='center'>
					<td class='tdbg' height='200' valign='top'>
						<table width='98%' border='0' cellpadding='2' cellspacing='1'
							bgcolor='#FFFFFF'>
							<tbody id='Tabs' style='display:'>
								<tr class='tdbg'>
									<td width='120' align='right' class='tdbg5'>
										选手编号：
									</td>
									<td>
								     <%=par.getNumber() %> 							
									</td>
								</tr>
								<tr class='tdbg'>
									<td width='120' align='right' class='tdbg5'>
										选手姓名：
									</td>
									<td>
										<%=par.getName() %>									
									</td>
								</tr>
								<tr class='tdbg'>
									<td width='120' align='right' class='tdbg5'>
										性别：
									</td>
									<td>
									<%=par.getSex() %>										
									</td>
								</tr>
						       <tr class='tdbg'>
									<td width='120' align='right' class='tdbg5'>
										年龄：
									</td>
									<td>
									<%=par.getAge() %>										
									</td>
								</tr>
						      <tr class='tdbg'>
									<td width='120' align='right' class='tdbg5'>
										身份证号：
									</td>
									<td>
									<%=par.getIdcard() %>										
									</td>
								</tr>
						<tr class='tdbg'>
									<td width='120' align='right' class='tdbg5'>
										联系电话：
									</td>
									<td>
									<%=par.getPhone() %>										
									</td>
								</tr>
						<tr class='tdbg'>
									<td width='120' align='right' class='tdbg5'>
										通讯地址：
									</td>
									<td>
									<%=par.getAddress() %>										
									</td>
								</tr>
						<tr class='tdbg'>
									<td width='120' align='right' class='tdbg5'>
										邮政编码：
									</td>
									<td>
									<%=par.getZipcode() %>										
									</td>
								</tr>
						<tr class='tdbg'>
									<td width='120' align='right' class='tdbg5'>
										Email：
									</td>
									<td>
									<%=par.getEmail() %>										
									</td>
								</tr>
						<tr class='tdbg'>
									<td width='120' align='right' class='tdbg5'>
										QQ号码：
									</td>
									<td>
									<%=par.getQq() %>										
									</td>
								</tr>
						<tr class='tdbg'>
									<td width='120' align='right' class='tdbg5'>
										照片：
									</td>
									<td>
									
									<img alt="<%=par.getName() %>" src="<%=par.getFace() %>	">									
									</td>
								</tr>
						<tr class='tdbg'>
									<td width='120' align='right' class='tdbg5'>
										个人简介：
									</td>
									<td>
									<%=par.getMyNote() %>										
									</td>
								</tr>
						
							
						</table>
					</td>
				</tr>
			</table>
			
			<br>
		</form>
	</body>
</html>
<%
   }

  catch(Exception ex)
  {
  System.out.println(ex);
  }
}


%>