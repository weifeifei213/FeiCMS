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
SiteClassDao scd=new SiteClassDaoImpl(); 

List<SiteClass> sclist=DAOFactory.getSiteClassDao().queryTopClassList();
Admin admin=DAOFactory.getAdminDaoInstance().showAdmin(Integer.parseInt(session.getAttribute("AdminID").toString()))  ;  
	
int status=9;
String strSql="select * from  article  where Deleted=0 ";

	if(admin.getPurview()!=1){ 
	String viewList=admin.getArrClass_View();
	String view=viewList.substring(0,viewList.length()-1);	
	 strSql=strSql+" and ClassID in ("+view+")";
	}
	
if(request.getParameter("Action")!=null)
{
   if(request.getParameter("Status")!=null)
   {
    status=Integer.parseInt(request.getParameter("Status"));
    strSql=strSql+" and Status="+status;   
   }   
   if(request.getParameter("ClassID")!=null)
   {   
   System.out.println("=========================="+strSql);
   if(!DAOFactory.getAdminDaoInstance().checkAdminViewPop(Integer.parseInt(session.getAttribute("AdminID").toString()),Integer.parseInt(request.getParameter("ClassID"))))
		    {
		       JS.ErrCode(response,"你没有足够的权限查看此栏目文章！请与管理员联系！");
			   JS.goBack(response,-1);
			   return;
		    }  
		
		   strSql=strSql+" and (ClassID="+Integer.parseInt(request.getParameter("ClassID"))+"";		
		 System.out.println("=========================="+strSql);
		 strSql=strSql+" or ClassID in (select ClassID from siteclass where ParentID="+Integer.parseInt(request.getParameter("ClassID"))+"))";
   }
   if(request.getParameter("Type")!=null)
    {
    String field="";
    if(request.getParameter("Field")!=null)
      field=request.getParameter("Field");
    String keyword=request.getParameter("keyword").trim();
    int parentID=0;
    if("".equals(request.getParameter("ParentID"))||request.getParameter("ParentID")==null)
      parentID=0;
    else
      parentID=Integer.parseInt(request.getParameter("ParentID"));
    if(field.equals("Title"))
     {
             if(parentID!=0) 
                strSql=strSql+" and ClassID="+parentID+" and Title like '%"+keyword+"%'";                           
			 else
			    strSql=strSql+" and  Title like '%"+keyword+"%'";
			   
     }
    if(field.equals("Content"))
    {
              if(parentID!=0)
			    strSql=strSql+"and ClassID="+parentID+" and Title like '%"+keyword+"%'";
			 else
			    strSql=strSql+"and  Content like '%"+keyword+"%'";
    }
    if(field.equals("Inputer"))
    {
              if(parentID!=0)
			    strSql=strSql+"and ClassID="+parentID+" and Title like '%"+keyword+"%'";
			 else
			    strSql=strSql+"and  Inputer like '%"+keyword+"%'";
    }
   
   }
}
strSql=strSql+" order by ArticleID desc";
System.out.println(strSql);
List<Article> alist=DAOFactory.getArticleDAOInstance().executeQuery(strSql);


%>
<html>
	<head>
		<title>文章管理</title>
		<meta http-equiv='Content-Type' content='text/html; charset=gb2312'>
		<link href='../CSS/Admin_Style.css' rel='stylesheet' type='text/css'>
	</head>
	<body leftmargin='2' topmargin='0' marginwidth='0' marginheight='0'>
		<%@include file="navbar.jsp" %>
		<br>
		<table width='100%' border='0' align='center' cellpadding='0'
			cellspacing='0'>
			<tr>
				<td height='22'>
					您现在的位置：&nbsp;文章中心管理&nbsp;&gt;&gt;所有文章！</td>				
			</tr>
		</table>
		<table width='100%' border='0' cellpadding='0' cellspacing='0'>
			<tr>				
				<td>
				<form name='myform' method='Post' action='Admin_Article_ModfySave.jsp' onsubmit='return ConfirmDel();'>
					<table class='border' border='0' cellspacing='1' width='100%'
						cellpadding='0'>
						<tr class='title' height='22'>
							<td height='22' width='30' align='center'>
								<strong>选中</strong></td>
							<td width='25' align='center'>
								<strong>ID</strong></td>
							<td width="543" align='center'>
								<strong>文章标题</strong></td>
							<td width="50" align='center'>
								<strong>分数</strong></td>								
							<td width='73' align='center'>
								<strong>录入者</strong></td>
							<td width='65' align='center'>
								<strong>点击数</strong></td>
							<td width='113' align='center'>
								<strong>文章属性</strong></td>
							<td width='74' align='center'>
								<strong>审核状态</strong></td>
							<td width='238' align='center'><STRONG>常规管理操作</STRONG></td>
						</tr>
						<%
						//获取记录总数
						   int pageSize=15; 
                           int rowCount; //总的记录数 
                           int pageCount; //总的页数 
                           int currPage; //当前页数 
						   String strPage; 
                           strPage=request.getParameter("page"); 
						   if(strPage==null){ 
							currPage=1; 
							}else{ 
							currPage=Integer.parseInt(strPage); 
							if (currPage<1) currPage=1; 
							}							
							rowCount = alist.size();//取得总记录数
							pageCount=(rowCount+pageSize-1)/pageSize; //计算总页数
							if (currPage>pageCount) currPage=pageCount; 							
							int thepage=(currPage-1)*pageSize;							
							int k=thepage;
							if(k<0){k=0;}						 
						 for(int n=0;k<rowCount&&n<pageSize;n++)
						  {
						  Article art=alist.get(k);					      
						 %>
						<tr class='tdbg' onMouseOut="this.className='tdbg'"
							onMouseOver="this.className='tdbgmouseover'">
							<td width='30' height="36" align='center'>
								<input name='ArticleID' type='checkbox'
									onclick='CheckItem(this)' id='ArticleID' value=<%=art.getArticleID() %>>							</td>
							<td width='25' align='center'>
								<%=art.getArticleID() %>							</td>
							<td>
								[<font
									color='gray'>
									<%
									SiteClass sc=DAOFactory.getSiteClassDao().queryByID(art.getClassID());
									if(null==sc)
									  out.println("不属于任何栏目"); 
									else
									{
									%>
									<a href=Admin_Article_List.jsp?Action=Search&ClassID=<%=sc.getClassID()%>>
									<%
									out.print(sc.getClassName());									   
									  }
									%></a></font>]&nbsp;
							<a href='Admin_Article_Modfy.jsp?ArticleID=<%=art.getArticleID() %>'
									title=<%=art.getTitle() %>><%=art.getTitle() %></a></td>
							<td width='10' align='center'>
								<%=art.getReadPoint() %>
							</td>								
							<td width='73' align='center'>
								<%=art.getInputer() %>
							</td>
							<td width='65' align='center'>
								<%=art.getHits() %>
							</td>
							<td width='113' align='center'>
								<%
								if(art.getOnTop()!=0)
								 out.println("<font color=red>固</font>");
								 %>
								 &nbsp;&nbsp;
						  		<% 
								if(art.getElite()!=0)
								 out.println("<font color=red>推</font>");								
								%>						  </td>
							<td width='74' align='center'>
								<font color=red>
								 <%
								 switch(art.getStatus()){
								 case -1:
								 out.println("草稿");
								 break;
								 case  0:
								 out.println("待审核");
								 break;
								 case  1:
								 out.println("审核通过");
								 break;
								 }								
								 %>
						  </font></td>
							<td width='238' align='center'>
								&nbsp;<a href='Admin_Article_Modfy.jsp?ArticleID=<%=art.getArticleID() %>'>修改</a>
								&nbsp;<a href='Admin_Article_ModfySave.jsp?Action=Del&ArticleID=<%=art.getArticleID() %>' onClick="return confirm('确定要删除此文章吗？删除后你还可以从回收站中还原。');">删除</a>
								&nbsp;
								<%
								if(art.getOnTop()==0){
								%>
								<a href='Admin_Article_ModfySave.jsp?Action=SetOnTop&ArticleID=<%=art.getArticleID() %>'>固顶</a>
								<%} else {%>
								<a href='Admin_Article_ModfySave.jsp?Action=NoOnTop&ArticleID=<%=art.getArticleID() %>'>取消固顶</a>
								<%}
								if(art.getElite()==0){
								%>
								&nbsp;<a href='Admin_Article_ModfySave.jsp?Action=SetElite&ArticleID=<%=art.getArticleID() %>'>设为推荐</a>
								<%
								}else{
								 %>
								 &nbsp;<a href='Admin_Article_ModfySave.jsp?Action=NoElite&ArticleID=<%=art.getArticleID() %>'>取消推荐</a>
								<%} %>						  </td>
						</tr>
						<%
						k++;                       
						} 
						%>
					</table>
					<table width='100%' border='0' cellpadding='0' cellspacing='0'>
						<tr>
							<td width='200' height='30'>
								<input name='chkAll' type='checkbox' id='chkAll'
									onclick='CheckAll(this.form)' value='checkbox'>
								选中本页显示的所有文章
							</td>
							<td>							
								<input name='submit3' type='submit' value=' 批量删除 '
									onClick="document.myform.Action.value='NumDel'">
								&nbsp;&nbsp;
								<input name='submit1' type='submit' value=' 审核通过 '
									onClick="document.myform.Action.value='NumSetPassed'">
								&nbsp;&nbsp;
								<input name='submit2' type='submit' value=' 取消审核 '
									onClick="document.myform.Action.value='NumCancelPassed'">
								<input name='Action' type='hidden' id='Action' value=''>
								
						  </td>
						</tr>
					</table>
					</form>
				</td>
				
			</tr>
		</table>
		<div class="show_page">
			共
			<b><%=rowCount %></b> 篇文章&nbsp;&nbsp;
			<%
			if(currPage>1){
			   out.println("<a href=Admin_Article_List.jsp?page=1>首页</a> <a href=Admin_Article_List.jsp?page="+(currPage-1)+">上一页</a>");
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
			   out.println("<a href=Admin_Article_List.jsp?page="+(currPage+1)+">下一页</a> <a href=Admin_Article_List.jsp?page="+pageCount+">尾页</a>");
			   }
			else
			{
			   out.println("下一页 尾页");
			   }
			 %>
			<strong><font color=red><%=currPage %></font>/<%=pageCount %></strong>页 &nbsp;
			<input type='text' name='MaxPerPage' size='3' maxlength='4'
				value='<%=pageSize %>'
				onKeyPress="if (event.keyCode==13) window.location='Admin_Article_List.jsp?page='+this.value;">
			篇文章/页&nbsp;
			
		</div>
		<br>
		<form method='Post' name='SearchForm'
			action='Admin_Article_List.jsp?Action=Search&Type=All'>
			<table width='100%' border='0' cellpadding='0' cellspacing='0'
				class='border'>
				<tr class='tdbg'>
					<td width='80' align='right'>
						<strong>文章搜索：</strong>
					</td>
					<td>
						<select name='Field' size='1'>
							<option value='Title' selected>
								文章标题
							</option>
							<option value='Content'>
								文章内容
							</option>
							<option value='Inputer'>
								录入者
							</option>
						</select>
						<select name='ParentID'>
							<option value=''>
								所有栏目
							</option>
                              <%							
                                String AdminID=session.getAttribute("AdminID").toString();                                
								SiteClassDao siteClassDao=new SiteClassDaoImpl();
								 sclist=siteClassDao.queryOneTop(0,Integer.parseInt(AdminID));
								for(SiteClass sc:sclist){
								%>
								<option value="<%=sc.getClassID() %>"  >
								<% for(int i=0;i<sc.getDepth();i++){out.print("&nbsp;&nbsp;┣");} %>
								<%=sc.getClassName() %>
								</option>
								<%
								}
								%>   
								   
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
		&nbsp;&nbsp;&nbsp;&nbsp;文章属性中的各项含义：
		<font color=blue>顶</font>----固顶文章，
		<font color=red>热</font>----热门文章，
		<font color=green>荐</font>----推荐文章，
		<font color=blue>图</font>----首页图片文章，
		<br>
		<br>
	</body>
</html>
