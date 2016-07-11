<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="../PubPackage.jsp"%>
<%
   String adminPopNum="POP000110";
		if(!DAOFactory.getAdminDaoInstance().checkAdminPopedom(Integer.parseInt(session.getAttribute("AdminID").toString()),adminPopNum))
		{
		 JS.ErrCode(response,"你没有足够的权限！请与管理员联系！");
		 JS.goBack(response,-1);
		 return;
		}
	SpecialDao specialDao = new SpecialDaoImpl();
	List<Special> li=specialDao.quaryAllSpecial();
%>
<html>
	<head>
		<title>文章专题管理</title>
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
		<table width='100%' border='0' align='center' cellpadding='2'
			cellspacing='1' class='border'>
			<tr class='title'>
				<td width="20" height='22' align='center'>
					<strong>ID</strong>				</td>
				<td width="604" height='22' align='center'>
					<strong>专题名称</strong>				</td>
				<td width='103' align='center'>
					<strong>专题目录</strong>				</td>
				<td width='90' align='center'>
					<strong>打开方式</strong>				</td>
				<td width='78' align='center'>
					<strong>推荐专题</strong>				</td>
				<td width='182' align='center'>
					<strong>专题提示</strong>				</td>
				<td width='161' height='22' align='center'>
					<strong>常规操作</strong>				</td>
			</tr>
			<%
			
				//获取记录总数
				int pageSize = 20;
				int rowCount; //总的记录数 
				int pageCount; //总的页数 
				int currPage; //当前页数 
				String strPage;
				strPage = request.getParameter("page");
				if (strPage == null) {
					currPage = 1;
				} else {
					currPage = Integer.parseInt(strPage);
					if (currPage < 1)
						currPage = 1;
				}
				
				rowCount = li.size();//取得总记录数
				pageCount = (rowCount + pageSize - 1) / pageSize; //计算总页数
				if (currPage > pageCount)
					currPage = pageCount;
				int thepage = (currPage - 1) * pageSize;			 
			 int k=thepage;
			 if(k<0){k=0;}			 
			 for(int n=0;k<rowCount&&n<pageSize;n++){
			 Special sp=li.get(k);
			%>
			<tr class='tdbg' onMouseOut="this.className='tdbg'"
				onmouseover="this.className='tdbgmouseover'">
				<td align='center'>
				<%=sp.getSpecialID() %>
				</td>
				<td align='center'>
					<%=sp.getSpecialName() %>
				</td>
				<td width='103' align='center'>
					<%=sp.getSpecialDir() %>
			  </td>
				<td width='90' align='center'>
					<%
					if(sp.getOpenType()==0){
					out.println("原窗口打开");
					}else{
					out.println("新窗口打开");
					}
					%>
			  </td>
				<td width='78' align='center'>
				<%
				  if(sp.getIsElite() ==0){
				    out.println("否");
				  }else{
				    out.println("<font color=green>是</font>");	
				    }			
				%>	
			  </td>
				<td width='182'>
					<%=sp.getTips() %>
			  </td>
				<td width='161' align='center'>
					<a href='Admin_Special_Modfy.jsp?SpecialID=<%=sp.getSpecialID() %>'>修改</a>&nbsp;&nbsp;
					<a href='Admin_Special_ModfySave.jsp?Action=Del&SpecialID=<%=sp.getSpecialID() %>'
						onClick="return confirm('确定要删除此专题吗？删除此专题后原属于此专题的文章将不属于任何专题。');">删除</a>&nbsp;&nbsp;
					<a href='Admin_Special_ModfySave.jsp?Action=Clear&SpecialID=<%=sp.getSpecialID() %>'
						onClick="return confirm('确定要清空此专题中的文章吗？本操作将原属于此专题的文章改为不属于任何专题。');">清空</a>				</td>
			</tr>
			<%n++;
              k++;		      
			  } 	
			%>
		</table>
		<div class="show_page">
			共
			<b><%=rowCount %></b> 个专题&nbsp;&nbsp;
           <%
			if(pageCount>1){
			   out.println("<a href=Admin_Special.jsp?page=1>首页</a> <a href=Admin_Special.jsp?page="+(currPage-1)+">上一页</a>");
			}else{
			   out.println("首页 上一页");
			}%>
			&nbsp;
			<%
			if(currPage<pageCount){
			   out.println("<a href=Admin_Special.jsp?page="+(currPage+1)+">下一页</a> <a href=Admin_Special.jsp?page="+pageCount+">尾页</a>");
			}else{
			   out.println("下一页 尾页");
			}%>
           &nbsp;页次：
			<strong><font color=red><%=currPage %></font>/<%=pageCount %></strong>页 &nbsp;
			
		</div>

	</body>
</html>
