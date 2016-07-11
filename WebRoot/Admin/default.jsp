<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="PubPackage.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String AdminID=session.getAttribute("AdminID").toString(); 
String Admin_Name=session.getAttribute("AdminName").toString();
Admin adm=DAOFactory.getAdminDaoInstance().showAdmin(Integer.parseInt(AdminID));
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>网站配置</title>
		<meta http-equiv='Content-Type' content='text/html; charset=utf-8'>
		<link href='CSS/Admin_Style.css' rel='stylesheet' type='text/css'>		
  </head>  
  <body leftmargin='2' topmargin='0' marginwidth='0' marginheight='0'>    
   <br/>
		<b>我的个人信息</b>							
		<table width='100%' border='0' cellpadding='5' cellspacing='1'
				Class='border'>
				<tr>
					<td class='tdbg'>
					<table width='95%' border='0' align='center' cellpadding='2'
							cellspacing='1' bgcolor='#FFFFFF'>
							<tbody id='Tabs' style='display:'>
								<tr class='tdbg'>
									<td  class='tdbg5'>										
									 用户名：<strong><%=Admin_Name %></strong>																			
									</td>
								</tr>
								<tr class='tdbg'>	
									<td class='tdbg5'>
									用户身份：<%=AdminID %>
									</td>
							    </tr>
								<tr class='tdbg'>	
									<td class='tdbg5'>
									上次登录时间：<%=adm.getLastLoginTime() %>
									</td>
								</tr>
								<tr class='tdbg'>	
									<td class='tdbg5'>
									上次登录IP：<%=adm.getLastLoginIP() %>
									</td>									
								</tr>
						</tbody>
					</table>
					</td>
				</tr>
		</table>		
		<b>安全提示</b>							
		<table width='100%' border='0' cellpadding='5' cellspacing='1'
				Class='border'>
				<tr>
					<td class='tdbg'>
					</td>
				</tr>
		</table>		
		<b>快捷方式</b>							
		<table width='100%' border='0' cellpadding='5' cellspacing='1'	Class='border'>
				<tr>
					<td class='tdbg'>
					<table width='95%' border='0' align='center' cellpadding='2'
							cellspacing='1' bgcolor='#FFFFFF'>
							<tbody id='Tabs' style='display:'>
								<tr class='tdbg'>
									
								</tr>
								<tr class='tdbg'>	
									
							    </tr>								
						</tbody>
					</table>
					</td>
				</tr>
		</table>		
		<b>系统信息</b>							
		<table width='100%' border='0' cellpadding='5' cellspacing='1'
				Class='border'>
				<tr>
					<td class='tdbg'>
					<table width='95%' border='0' align='center' cellpadding='2'
							cellspacing='1' bgcolor='#FFFFFF'>
							<tbody id='Tabs' style='display:'>
								<tr class='tdbg'>
									<td  class='tdbg5'>										
									<strong>程序版本：FeiCMS v1.0</strong>																			
									</td>
								</tr>
								<tr class='tdbg'>	
									<td class='tdbg5'>
									<strong>操作系统：<%=System.getProperty("os.name") %></strong>	
									</td>
							    </tr>
								<tr class='tdbg'>	
									<td class='tdbg5'>
									<strong>服务器软件：<%=application.getServerInfo()  %></strong>
									</td>
								</tr>
								<tr class='tdbg'>	
									<td class='tdbg5'>
									<strong>MySQL版本：MySQL5.0</strong>
									</td>									
								</tr>
						</tbody>
					</table>
					</td>
				</tr>
		</table>		
		<b>开发团队</b>					
		<table width='100%' border='0' cellpadding='5' cellspacing='1'
				Class='border'>
				<tr>
					<td class='tdbg'>
					<table width='95%' border='0' align='center' cellpadding='2'
							cellspacing='1' bgcolor='#FFFFFF'>
							<tbody id='Tabs' style='display:'>
								<tr class='tdbg'>
									<td  class='tdbg5'>										
									<strong>版权所有：魏飞飞</strong>																			
									</td>
								</tr>
								<tr class='tdbg'>	
									<td class='tdbg5'>
									<strong>总策划：魏飞飞</strong>	
									</td>
							    </tr>
								<tr class='tdbg'>	
									<td class='tdbg5'>
									<strong>开发与团队支持：木鱼</strong>
									</td>
								</tr>
								<tr class='tdbg'>	
									<td class='tdbg5'>
									<strong>UI设计：木鱼</strong>
									</td>									
								</tr>
						</tbody>
					</table>
					</td>
				</tr>
		</table>		
		<b>授权信息</b>							
		<table width='100%' border='0' cellpadding='5' cellspacing='1'
				Class='border'>
				<tr>
					<td class='tdbg'>
					<table width='95%' border='0' align='center' cellpadding='2'
							cellspacing='1' bgcolor='#FFFFFF'>
							<tbody id='Tabs' style='display:'>
								<tr class='tdbg'>
									<td  class='tdbg5'>										
									<strong>程序版本：FeiCMS v1.0</strong>																			
									</td>
								</tr>
								<tr class='tdbg'>	
									<td class='tdbg5'>
									<strong>授权类型：商业授权版</strong>	
									</td>
							    </tr>
								<tr class='tdbg'>	
									<td class='tdbg5'>
									<strong>序列号：</strong>
									</td>
								</tr>								
						</tbody>
					</table>
					</td>
				</tr>
		</table>		
				
  </body>
</html>
