<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="PubPackage.jsp"%>
<HTML>
	<HEAD>
		<TITLE>管理导航菜单</TITLE>
		<META http-equiv=Content-Type content="text/html; charset=utf-8">
		<LINK href="CSS/Admin_left.css" type=text/css rel=stylesheet>
		<META content="MSHTML 6.00.6000.16481" name=GENERATOR>
		<SCRIPT language=javascript1.2>
		function showsubmenu(sid)
		{
		whichEl = eval("submenu" + sid);
		if (whichEl.style.display == "none")
		{
		eval("submenu" + sid + ".style.display=\"\";");
		}
		else
		{
		eval("submenu" + sid + ".style.display=\"none\";");
		}
		}
		</SCRIPT>
	</HEAD>
	<BODY leftMargin=0 topMargin=0 marginwidth="0" marginheight="0">
		<TABLE cellSpacing=0 cellPadding=0 width=180 align=center border=0>
			<TBODY>
				<TR>
					<TD vAlign=top height=44>
						<IMG src="Images/title.gif">
					</TD>
				</TR>
			</TBODY>
		</TABLE>
		<TABLE cellSpacing=0 cellPadding=0 width=180 align=center>
			<TBODY>
				<TR>
					<TD class=menu_title id=menuTitle0
						onmouseover="this.className='menu_title2';"
						onmouseout="this.className='menu_title';"
						background=Images/title_bg_quit.gif height=26>
						&nbsp;&nbsp;
						<A href="Site/Admin_SiteConfig.jsp" target=main><B><SPAN
								class=glow>管理首页</SPAN>
						</B>
						</A><SPAN class=glow> | </SPAN><B><A href="Admin_Logout.jsp" target=_top ><SPAN class=glow>退出</a></SPAN>
						</B>
						
					</TD>
				</TR>
				<TR>
					<TD id=submenu0 background=Images/title_bg_admin.gif height=97>
						<DIV style="WIDTH: 180px">
							<TABLE cellSpacing=0 cellPadding=0 width=130 align=center>
								<TBODY>
									<TR>
										<TD height=25>
										
											您的用户名：<%=session.getAttribute("AdminName") %>
										</TD>
									</TR>
									<TR>
										<TD height=25>
										<%
										Admin admin=new Admin();
										admin=DAOFactory.getAdminDaoInstance().getAdminInfo((String)session.getAttribute("AdminName"));
										if(admin.getPurview()==1)
										{								
										 %>
										   您的身份：超级管理员
										<%}else{ %>
										   您的身份：普通管理员
										<% }%>
										</TD>
									</TR>
								</TBODY>
							</TABLE>
						</DIV>
						<DIV style="WIDTH: 167px">
							<TABLE cellSpacing=0 cellPadding=0 width=130 align=center>
								<TBODY>
									<TR>
										<TD height=20></TD>
									</TR>
								</TBODY>
							</TABLE>
						</DIV>
					</TD>
				</TR>
			</TBODY>
		</TABLE>
		<TABLE cellSpacing=0 cellPadding=0 width=167 align=center>
			<TBODY>
				<TR>
					<TD class=menu_title id=menuTitle1
					    onmouseover="this.className='menu_title2'" style="CURSOR: hand"
						onClick="showsubmenu(1)"
						onmouseout="this.className='menu_title'"
						background=Images/admin_left_1.gif height="28"><A 
      href="Article/Admin_Article_List.jsp" 
      target=main><SPAN class=glow>内容管理</SPAN></A></TD>
				</TR>
				<TR>
					<TD id="submenu1" style="display: none"  align=right>
						<DIV class=sec_menu style="WIDTH: 165px">
							<TABLE cellSpacing=0 cellPadding=0 width=132 align=center>
								<TBODY>
									<TR>
										<TD height=20>
											<A href="Article/Admin_Article_Add.jsp" target=main>添加文章</A>										</TD>
									</TR>
									<TR>
										<TD height=20>
											<A href="Article/Admin_Article_MyArticle.jsp" target="main">我添加的文章</A>										</TD>
									</TR>									
									<TR>
										<TD height=20>
											<A href="Article/Admin_Article_AddWord.jsp" target="main">word文章上传</A>										</TD>
									</TR>
									<TR>
										<TD height=20>
											<A href="Article/Admin_Article_List.jsp" target=main>文章管理</A></TD>
									</TR>
									<TR>
										<TD height=20><a href="Article/Admin_Article_Check.jsp" target="main">文章审核</a></TD>
									</TR>
									<TR>
										<TD height=20>
											<A href="Article/Admin_Article_Recyclebin.jsp" target=main>文章回收站</A>										</TD>
									</TR>
									<TR>
										<TD height=20>
											<A href="Article/Admin_Article_Tohtml.jsp" target=main>文章生成管理</A>										</TD>
									</TR>																
									<TR>
										<TD height=20>
											<A href="SiteClass/Admin_SiteClass.jsp" target=main>栏目管理</A> |
											<A href="Special/Admin_Special.jsp" target=main>专题管理</A>		 								</TD>
									</TR>
								</TBODY>
							</TABLE>
						</DIV>
						<DIV style="WIDTH: 158px">
							<TABLE cellSpacing=0 cellPadding=0 width=130 align=center>
								<TBODY>
									<TR>
										<TD height=4></TD>
									</TR>
								</TBODY>
							</TABLE>
						</DIV>
					</TD>
				</TR>
			</TBODY>
		</TABLE>		
		<TABLE cellSpacing=0 cellPadding=0 width=167 align=center>
			<TBODY>
				<TR>
					<TD class=menu_title id=menuTitle201
						onmouseover="this.className='menu_title2';" style="CURSOR: hand"
						onClick="showsubmenu(3)"
						onmouseout="this.className='menu_title';"
						background=Images/admin_left_01.gif height=28>
						<A href="Site/Admin_SiteConfig.jsp" target=main><SPAN
							class=glow>图片系统管理</SPAN>						</A>					</TD>
				</TR>
				<TR>
					<TD id=submenu3 style="DISPLAY: none" align=right>
						<DIV class=sec_menu style="WIDTH: 165px">
							<TABLE cellSpacing=0 cellPadding=0 width=130 align=center>
								<TBODY>								
								<TR>
								<TD height=20>
								<A href="Photo/Admin_Photo_Add.jsp" target=main>添加图片</A> 
								</TD>
									</TR>
									<TR>
								<TD height=20>
								<A href="Photo/Admin_Photo_List.jsp" target=main>图片管理</A> 
																				</TD>
									</TR>
									<TR>
								<TD height=20>
								<A href="Photo/Admin_Photo_Check.jsp" target=main>图片审核</A> 
																				</TD>
									</TR>
									<TR>
								<TD height=20>
								<A href="Photo/Admin_Photo_Recyclebin.jsp" target=main>图片回收站</A> 
																				</TD>
									</TR>
								</TBODY>
							</TABLE>
						</DIV>
						<DIV style="WIDTH: 167px">
							<TABLE cellSpacing=0 cellPadding=0 width=130 align=center>
								<TBODY>
									<TR>
										<TD height=5></TD>
									</TR>
								</TBODY>
							</TABLE>
						</DIV>
					</TD>
				</TR>
			</TBODY>
		</TABLE>	
		<TABLE cellSpacing=0 cellPadding=0 width=167 align=center>
			<TBODY>
				<TR>
					<TD class=menu_title id=menuTitle201
						onmouseover="this.className='menu_title2';" style="CURSOR: hand"
						onClick="showsubmenu(5)"
						onmouseout="this.className='menu_title';"
						background=Images/admin_left_01.gif height=28>
						<A href="Site/Admin_SiteConfig.jsp" target=main><SPAN
							class=glow>系统管理</SPAN>						</A>					</TD>
				</TR>
				<TR>
					<TD id=submenu5 style="DISPLAY: none" align=right>
						<DIV class=sec_menu style="WIDTH: 165px">
							<TABLE cellSpacing=0 cellPadding=0 width=130 align=center>
								<TBODY> 
									<TR>
										<TD height=20>
											<A href="Site/Admin_SiteConfig.jsp" target=main>网站信息配置</A></TD>
									</TR>
									
									
									<TR>
										<TD height=20><A href="Admin_Admin.jsp" target=main>管理员管理</A></TD>
									</TR>
									<TR>
									  <TD height=20><A href="GuestBook/Admin_GuestBook.jsp" target=main>网站留言管理</A></TD>
								  </TR>
									
									<TR>
										<TD height=20>
											<A href="Announce/Admin_Announce.jsp" target=main>网站公告管理</A>										</TD>
									</TR>
										<TR>
										<TD height=20>
											<A href="FriendSite/Admin_FriendSite.jsp" target=main>友情链接管理</A>										</TD>
									</TR>
									
									<TR>
										<TD height=20>
											<A href="Vote/Admin_Vote.jsp" target=main>网站调查管理</A>										</TD>
									</TR> 
									
									<TR>
										<TD height=20><A href="Admin_Admin.jsp" target=main>管理员管理</A></TD>
									</TR>
									<TR>
										<TD height=20><A href="Channel/Admin_Channel.jsp" target=main>频道管理</A></TD>
									</TR>							
								</TBODY>
							</TABLE>
						</DIV>
						<DIV style="WIDTH: 167px">
							<TABLE cellSpacing=0 cellPadding=0 width=130 align=center>
								<TBODY>
									<TR>
										<TD height=5></TD>
									</TR>
								</TBODY>
							</TABLE>
						</DIV>
					</TD>
				</TR>
				
			</TBODY>
		</TABLE>
		
		
		
		<TABLE cellSpacing=0 cellPadding=0 width=167 align=center>
			<TBODY>
				<TR>
					<TD class=menu_title id=menuTitle201
						onmouseover="this.className='menu_title2';" style="CURSOR: hand"
						onClick="showsubmenu(6)"
						onmouseout="this.className='menu_title';"
						background=Images/admin_left_02.gif height=28>
						<A href="Site/Admin_SiteConfig.jsp" target=main><SPAN
							class=glow>用户管理</SPAN>						</A>					</TD>
				</TR>
				<TR>
					<TD id=submenu6 style="DISPLAY: none" align=right>
						<DIV class=sec_menu style="WIDTH: 165px">
							<TABLE cellSpacing=0 cellPadding=0 width=130 align=center>
								<TBODY> 
									<TR>
										<TD height=20>
											<A href="UserManager/Admin_User.jsp" target=main>会员管理</A></TD>
									</TR>
									<TR>
										<TD height=20>
											<A href="UserManager/Admin_UserGroup.jsp" target=main>会员组管理</A></TD>
									</TR>
								</TBODY>
							</TABLE>
						</DIV>
						<DIV style="WIDTH: 167px">
							<TABLE cellSpacing=0 cellPadding=0 width=130 align=center>
								<TBODY>
									<TR>
										<TD height=5></TD>
									</TR>
								</TBODY>
							</TABLE>
						</DIV>
					</TD>
				</TR>
				
			</TBODY>
		</TABLE>
		
			
			<TABLE cellSpacing=0 cellPadding=0 width=167 align=center>
			<TBODY>
				<TR>
					<TD class=menu_title id=menuTitle201
						onmouseover="this.className='menu_title2';" style="CURSOR: hand"
						onClick="showsubmenu(9)"
						onmouseout="this.className='menu_title';"
						background=Images/admin_left_02.gif height=28>
						<A href="Site/Admin_Site.jsp" target=main><SPAN
							class=glow>站点显示管理</SPAN>						</A>					</TD>
				</TR>
				<TR>
					<TD id=submenu9 style="DISPLAY: none" align=right>
						<DIV class=sec_menu style="WIDTH: 165px">
							<TABLE cellSpacing=0 cellPadding=0 width=130 align=center>
								<TBODY> 
									<TR>
										<TD height=20>
											<A href="Site/Admin_Site.jsp" target=main>站点管理</A></TD>
									</TR>									
									<TR>
										<TD height=20>
											<A href="Template/Admin_TemplateProject.jsp" target=main>模板管理</A></TD>
									</TR>
									<TR>
										<TD height=20>
											<A href="Model/Admin_Model.jsp" target=main>模型管理</A></TD>
									</TR>
								</TBODY>
							</TABLE>
						</DIV>
						<DIV style="WIDTH: 167px">
							<TABLE cellSpacing=0 cellPadding=0 width=130 align=center>
								<TBODY>
									<TR>
										<TD height=5></TD>
									</TR>
								</TBODY>
							</TABLE>
						</DIV>
					</TD>
				</TR>
				
			</TBODY>
		</TABLE>
		<TABLE cellSpacing=0 cellPadding=0 width=167 align=center>
			<TBODY>
				<TR>
					<TD class=menu_title id=menuTitle208
						onmouseover="this.className='menu_title2';"
						onmouseout="this.className='menu_title';"
						background=Images/admin_left_04.gif height=28>
						<SPAN>系统信息</SPAN>
					</TD>
				</TR>
				<TR>
					<TD align=right>
						<DIV class=sec_menu style="WIDTH: 165px">
							<TABLE cellSpacing=0 cellPadding=0 width=130 align=center>
								<TBODY>
									<TR>
										<TD height=20>
											<br>
											技术支持：庆阳时空互联网传媒有限公司<BR>
											魏飞飞:18298831901
											<br>
											<br>
										</TD>
									</TR>
								</TBODY>
							</TABLE>
						</DIV>
					</TD>
				</TR>
			</TBODY>
		</TABLE>
	</BODY>
</HTML>
