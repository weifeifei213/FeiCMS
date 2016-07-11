<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ include file="../PubPackage.jsp"%>
<% 

int status=9;
List<SiteClass> sclist=null; 

String strSql="select * from  article  where Deleted=1 ";
if(request.getParameter("Action")!=null)
{
   if(request.getParameter("Status")!=null)
   {
    status=Integer.parseInt(request.getParameter("Status"));
    strSql=strSql+" and Status="+status;   
   }
   if(request.getParameter("ClassID")!=null)
   {
   strSql=strSql+" and (ClassID="+Integer.parseInt(request.getParameter("ClassID"));
   strSql=strSql+" or ClassID in (select ClassID from article_class where ParentID="+Integer.parseInt(request.getParameter("ClassID"))+"))";
   }
   if(request.getParameter("Type")!=null){
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
strSql=strSql+" order by ArticleID ";
System.out.println(strSql);
List<Article>  li=DAOFactory.getArticleDAOInstance().executeQuery(strSql);
%>
<html>
	<head>
		<title>文章管理</title>
		<meta http-equiv='Content-Type' content='text/html; charset=utf-8'>
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
								<b>文章中心管理----回收站管理</b>
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
					<a href='Admin_Article_List.jsp'>文章管理首页</a>&nbsp;|&nbsp;
					<a href='Admin_Article_Add.jsp'>添加文章</a>&nbsp;|&nbsp;
					<a href='Admin_Article_Check.jsp'>审核文章</a>&nbsp;|&nbsp;
					<a href='Admin_Article_Recyclebin.jsp'>文章回收站管理</a>
				</td>
			</tr>			
			<tr class='tdbg'>
				<td width='70' height='30'>
					<strong>文章选项：</strong>
				</td>
			  <td>
			  <form name='form3' method='Post'
				action='Admin_Article_Recyclebin.jsp?Action=Search'>
			  &nbsp;&nbsp;
			      <input name='Status' type='radio' onclick='submit();' value='-1' <%if(status==-1){out.print("checked");} %>>
					草稿&nbsp;&nbsp;&nbsp;&nbsp;
				  <input name='Status' type='radio' onclick='submit();' value='0' <%if(status==0){out.print("checked");} %>>
					待审核&nbsp;&nbsp;&nbsp;&nbsp;
				  <input name='Status' type='radio' onclick='submit();' value='1' <%if(status==1){out.print("checked");} %>>
		                                已审核&nbsp;&nbsp;&nbsp;	
		        </form>	     
		      </td>			
			</tr>
			
		</table>
		<SCRIPT language=javascript>
function CheckItem(CB){
  var tagname=(arguments.length>1)?arguments[1]:'TR';
  if(document.myform.chkAll.checked){
    document.myform.chkAll.checked = document.myform.chkAll.checked&0;
  }
  if (CB.checked){hL(CB,tagname)};else{dL(CB,tagname)};
  var TB=TO=0;
  for (var i=0;i<myform.elements.length;i++) {
    var e=myform.elements[i];
    if ((e.name != 'chkAll') && (e.type=='checkbox')) {
      TB++;
      if (e.checked) TO++;
    }
  }
  myform.chkAll.checked=(TO==TB)?true:false;
}
function CheckAll(form){
  var tagname=(arguments.length>1)?arguments[1]:'TR';
  for (var i=0;i<form.elements.length;i++){
    var e = form.elements[i];
    if (e.name != 'chkAll' && e.disabled == false && e.type == 'checkbox') {
      e.checked = form.chkAll.checked;
      if (e.checked){hL(e,tagname)};else{dL(e,tagname)};
    }
  }
}
function hL(E,tagname){
  while (E.tagName!=tagname) {E=E.parentElement;}
  E.className='tdbg2';
}
function dL(E,tagname){
  while (E.tagName!=tagname) {E=E.parentElement;}
  E.className='tdbg';
}
function ConfirmDel(){
 if(document.myform.Action.value=='Del'){
     if(confirm('确定要删除选中的文章吗？本操作将把选中的文章移到回收站中。必要时您可从回收站中恢复！'))
         return true;
     else
         return false;
 }
 else if(document.myform.Action.value=='ConfirmDel'){
     if(confirm('确定要彻底删除选中的文章吗？彻底删除后将不能恢复！'))
         return true;
     else
         return false;
 }
 else if(document.myform.Action.value=='ClearRecyclebin'){
     if(confirm('确定要清空回收站？一旦清空将不能恢复！'))
         return true;
     else
         return false;
 }
 else if(document.myform.Action.value=='DelFromSpecial'){
     if(confirm('确定要将选中的文章从其所属专题中删除吗？操作成功后文章将不属于任何专题。'))
         return true;
     else
         return false;
 }
}
</SCRIPT>
		<br>
		<table width='100%' border='0' align='center' cellpadding='2'
			cellspacing='1' class='border'>
			<tr class='title'>
				<td height='22'>
				</td>
			</tr>
		</table>
		<br>
		<table width='100%' border='0' align='center' cellpadding='0'
			cellspacing='0'>
			<tr>
				<td height='22'>
					您现在的位置：&nbsp;文章中心管理&nbsp;&gt;&gt;&nbsp;
					文章回收站管理&nbsp;&gt;&gt;&nbsp;所有文章！</td>
				
			</tr>
		</table>
		<table width='100%' border='0' cellpadding='0' cellspacing='0'>
			<tr>
				<form name='myform' method='Post' action='Admin_Article_ModfySave.jsp' onsubmit='return ConfirmDel();'>
				<td>
					<table class='border' border='0' cellspacing='1' width='100%'
						cellpadding='0'>
						<tr class='title' height='22'>
							<td height='22' width='30' align='center'>
								<strong>选中</strong>							</td>
							<td width='25' align='center'>
								<strong>ID</strong>							</td>
							<td width="543" align='center'>
								<strong>文章标题</strong>							</td>
							<td width='73' align='center'>
								<strong>录入者</strong>							</td>
							<td width='65' align='center'>
								<strong>点击数</strong>							</td>
							<td width='113' align='center'>
								<strong>文章属性</strong>							</td>
							<td width='74' align='center'>
								<strong>审核状态</strong>							</td>
							<td width='61' align='center'><strong>已生成</strong></td>
							<td width='238' align='center'><STRONG>常规管理操作</STRONG></td>
						</tr>
						<%
						//获取记录总数
						   int pageSize=20; 
                           int rowCount; //总的记录数 
                           int pageCount; //总的页数 
                           int currPage; //当前页数 
						   String strPage; 
                           strPage=request.getParameter("page"); 
						   if(strPage==null){ 
							currPage=1; 
							}else{ 
							currPage=Integer.parseInt(strPage); 
							if(currPage<1) currPage=1; 
							}							
							rowCount = li.size();//取得总记录数
							pageCount=(rowCount+pageSize-1)/pageSize; //计算总页数
							if (currPage>pageCount) currPage=pageCount; 							
							int thepage=(currPage-1)*pageSize;							
							int k=thepage+1;
							if(k<0){k=0;}
						    
						    for(int n=0;k<rowCount&&n<pageSize;n++)
						  {			
						    Article art=li.get(k);				
						 %>
						<tr class='tdbg' onMouseOut="this.className='tdbg'"
							onMouseOver="this.className='tdbgmouseover'">
							<td width='30' height="36" align='center'>
								<input name='ArticleID' type='checkbox'
									onclick='CheckItem(this)' id='ArticleID' value=<%=art.getArticleID() %>>
							</td>
							<td width='25' align='center'>
								<%=art.getArticleID() %>
							</td>
							<td>
								[<font	color='gray'>
									<%
									SiteClass sc=DAOFactory.getSiteClassDao().queryByID(art.getClassID());								
									if(null==sc){
									  out.println("不属于任何栏目"); 
									}else{
									%>
									<a href=Admin_Article_List.jsp?Action=Search&ClassID=<%=sc.getClassID()%>>
									<%
									out.print(sc.getClassName());									   
									}%></a></font>]&nbsp;
								<a href='Admin_Article_Modfy.jsp?ArticleID=<%=art.getArticleID() %>'
									title=<%=art.getTitle() %> ><%=art.getTitle() %></a></td>
							<td width='73' align='center'>
								<%=art.getInputer() %>						  </td>
							<td width='65' align='center'>
								<%=art.getHits() %>						  </td>
							<td width='113' align='center'>
								<%
								if(art.getOnTop()!=0)
								 out.println("<font color=red>固</font>");
								 %>
								 &nbsp;&nbsp;
						       <% 
								if(art.getElite()!=0)
								 out.println("<font color=red>推</font>");								
								%> </td>
							<td width='74' align='center'>
								<font color=red>
								 <%
								 switch(art.getStatus())
								 {
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
							<td width='61' align='center'>
							
						  </td>
							<td width='238' align='center'>
								<a	href='Admin_Article_ModfySave.jsp?Action=ConfirmDel&ArticleID=<%=art.getArticleID() %>'
									onClick="return confirm('确定要彻底删除此文章吗？彻底删除后将无法还原！');">彻底删除</a>
								<a	href='Admin_Article_ModfySave.jsp?Action=Restore&ArticleID=<%=art.getArticleID() %>'>还原</a>
						  </td>
						</tr>
						<%                      
						k++; } 
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
								<input name='submit1' type='submit' id='submit1'
									onClick="document.myform.Action.value='NumConfirmDel'"
									value=' 彻底删除 '>
								&nbsp;
								<input name='Submit2' type='submit' id='Submit2'
									onClick="document.myform.Action.value='ClearRecyclebin'"
									value='清空回收站'>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<input name='Submit3' type='submit' id='Submit3'
									onClick="document.myform.Action.value='NumRestore'"
									value='还原选定的文章'>
								&nbsp;
								<input name='Submit4' type='submit' id='Submit4'
									onClick="document.myform.Action.value='NumRestoreAll'"
									value='还原所有文章'>
								<input name='Action' type='hidden' id='Action' value=''>
						  </td>
						</tr>
					</table>
				</td>
				</form>
			</tr>
		</table>
		<div class="show_page">
			共
			<b><%=rowCount %></b> 篇文章&nbsp;&nbsp;
			<%
			if(pageCount>1){
			   out.println("<a href=Admin_Article_Recyclebin.jsp?page=1>首页</a> <a href=Admin_Article_Recyclebin.jsp?page="+(currPage-1)+">上一页</a>");
			   }else{
			    out.println("首页 上一页");
			    }
			 %>
			&nbsp;
			<%
			if(currPage<pageCount)
			{
			   out.println("<a href=Admin_Article_Recyclebin.jsp?page="+(currPage+1)+">下一页</a> <a href=Admin_Article_Recyclebin.jsp?page="+pageCount+">尾页</a>");
			}else{
			   out.println("下一页 尾页");
			}
			 %>
			<strong><font color=red>1</font>/1</strong>页 &nbsp;
			<input type='text' name='MaxPerPage' size='3' maxlength='4'
				value='<%=pageSize %>'>
			篇文章/页&nbsp;
			
		</div>
		<br>
		<form method='Post' name='SearchForm'
			action='Admin_Article_Recyclebin.jsp?Action=Search&Type=All'>
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
		<font color=green>荐</font>----推荐文章，
		<font color=blue>图</font>----首页图片文章，
		<br>
		<br>
	</body>
</html>
