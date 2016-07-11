<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ include file="../PubPackage.jsp"%>
<% 
String adminPopNum="POP000117";
if(!DAOFactory.getAdminDaoInstance().checkAdminPopedom(Integer.parseInt(session.getAttribute("AdminID").toString()),adminPopNum))
{
JS.ErrCode(response,"你没有足够的权限！请与管理员联系！");
JS.goBack(response,-1);
}
ArticleClassDaoImpl acd=new ArticleClassDaoImpl(); 
DbConnection conn=new DbConnection();
String showTopClass=acd.showAllTopClass(); 

String inputer = (String) session.getAttribute("AdminName");

String strSql="";
if(inputer!=null&&!"".equals(inputer)&&(inputer.equals("admin"))){
strSql="select * from  Photo  where DelTF=0 ";

}else{
 strSql = "select * from  Photo  where DelTF=0 and Inputer='"
			+ inputer + "'";

}

int status=0;
if(request.getParameter("Status")!=null)
   {
    status=Integer.parseInt(request.getParameter("Status"));
   }
strSql=strSql+" and Status="+status;
      
if(request.getParameter("Action")!=null)
{
  
   if(request.getParameter("Tid")!=null)
   {
   strSql=strSql+" and Tid="+Integer.parseInt(request.getParameter("Tid"));
   strSql=strSql+" or Tid in (select ClassID from article_class where ParentID="+Integer.parseInt(request.getParameter("Tid"))+")";
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
                strSql=strSql+" and Tid="+parentID+" and Title like '%"+keyword+"%'";                           
			 else
			    strSql=strSql+" and  Title like '%"+keyword+"%'";
			   
     }
    if(field.equals("Content"))
    {
              if(parentID!=0)
			    strSql=strSql+"and Tid="+parentID+" and Title like '%"+keyword+"%'";
			 else
			    strSql=strSql+"and  Content like '%"+keyword+"%'";
    }
    if(field.equals("Inputer"))
    {
              if(parentID!=0)
			    strSql=strSql+"and Tid="+parentID+" and Title like '%"+keyword+"%'";
			 else
			    strSql=strSql+"and  Inputer like '%"+keyword+"%'";
    }
   
   }
}
strSql=strSql+" order by ID ";
System.out.println(strSql);
ResultSet rs=conn.executeQuerySql(strSql);


%>
<html>
	<head>
		<title>图片管理</title>
		<meta http-equiv='Content-Type' content='text/html; charset=utf-8'>
		<link href='../CSS/Admin_Style.css' rel='stylesheet' type='text/css'>
		  <style>
        .topdiv{
            display: none;
            position: absolute;
            top: 0%;
            left: 0%;
            width: 1300;
            height: 500;
            background-color: gray;
            z-index:1001;
            }
        .belowdiv {
            display: none;
            position: absolute;
            top: 25%;
            left: 40%;
            width: 300;
            height: 200;
            padding: 16px;
            border-top:solid,16px,red;
            border-left:1px;
            border-right:1px;
            border-bottom:1px;
            background-color: white;
            z-index:1002;
            overflow: auto;
        }
    </style>
    <script type="text/javascript">
  
     function throwGO(){
   
		var form=document.form2;
	
		var ID= document.getElementById("PhotoID").value;
			var getNum=document.getElementById("getNum").value;
			
				form.action="Admin_Photo_ModfySave.jsp?Action=SetPassed&PhotoID="+ID+"&getNum="+getNum;
				form.submit();

    
    
    }
    </script>
	</head>
	<body leftmargin='2' topmargin='0' marginwidth='0' marginheight='0'>	
		<table width='100%' border='0' align='center' cellpadding='2'
			cellspacing='1' class='border'>
			<tr class='topbg'>
				<td height='22' colspan='10'>
					<table width='100%'>
						<tr class='topbg'>
							<td align='center'>
								<b>图片中心管理----图片审核</b>
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
					<a href='Admin_Photo_List.jsp'>图片管理首页</a>&nbsp;|&nbsp;
					<a
						href='Admin_Photo_Add.jsp'>添加图片</a>&nbsp;|&nbsp;
					<a href='Admin_Photo_Check.jsp'>审核图片</a>&nbsp;|&nbsp;
					<a
						href='Admin_Photo_Recyclebin.jsp'>图片回收站管理</a>
				</td>
			</tr>
			<form name='form3' method='Post' id="form2"
				action='Admin_Photo_Check.jsp?Action=Search'>
			<tr class='tdbg'>
				<td width='70' height='30'>
					<strong>图片选项：</strong>
				</td>
			  <td>&nbsp;&nbsp;
			    <%
			    switch(status)
			    {
			    case 9:
			     %>
                    <input name='Status' type='radio' onclick='submit();' value='-1'>
					草稿&nbsp;&nbsp;&nbsp;&nbsp;
				  <input name='Status' type='radio' onclick='submit();' value='0'>
					待审核&nbsp;&nbsp;&nbsp;&nbsp;
					<input name='Status' type='radio' onclick='submit();' value='1'>
		             已审核&nbsp;&nbsp;&nbsp;
		       <% 
		       break;
		       case 0:
		       %>
                   <input name='Status' type='radio' onclick='submit();' value='-1'>
					草稿&nbsp;&nbsp;&nbsp;&nbsp;
				  <input name='Status' type='radio' onclick='submit();' value='0' checked>
					待审核&nbsp;&nbsp;&nbsp;&nbsp;
					<input name='Status' type='radio' onclick='submit();' value='1'>
		             已审核&nbsp;&nbsp;&nbsp;
		       <% 
		       break;
		       case -1: 
		       %>	
		       	     <input name='Status' type='radio' onclick='submit();' value='-1' checked>
					草稿&nbsp;&nbsp;&nbsp;&nbsp;
				  <input name='Status' type='radio' onclick='submit();' value='0' >
					待审核&nbsp;&nbsp;&nbsp;&nbsp;
					<input name='Status' type='radio' onclick='submit();' value='1'>
		             已审核&nbsp;&nbsp;&nbsp; 
		        <%
		        break;
		        case 1: 
		        %>  
		         <input name='Status' type='radio' onclick='submit();' value='-1' >
					草稿&nbsp;&nbsp;&nbsp;&nbsp;
				  <input name='Status' type='radio' onclick='submit();' value='0' >
					待审核&nbsp;&nbsp;&nbsp;&nbsp;
					<input name='Status' type='radio' onclick='submit();' value='1' checked>
		             已审核&nbsp;&nbsp;&nbsp; 
		       
		      <%
		      break;
		      }
		       %>
		      </td>
			
			</tr>
			</form>
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
     if(confirm('确定要删除选中的图片吗？本操作将把选中的图片移到回收站中。必要时您可从回收站中恢复！'))
         return true;
     else
         return false;
 }
 else if(document.myform.Action.value=='ConfirmDel'){
     if(confirm('确定要彻底删除选中的图片吗？彻底删除后将不能恢复！'))
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
     if(confirm('确定要将选中的图片从其所属专题中删除吗？操作成功后图片将不属于任何专题。'))
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
					您现在的位置：&nbsp;图片中心管理&nbsp;&gt;&gt;&nbsp;
					<a
						href='Admin_Article_Check.jsp'>图片审核</a>&nbsp;&gt;&gt;&nbsp;所有图片！</td>
				
			</tr>
		</table>
		<table width='100%' border='0' cellpadding='0' cellspacing='0'>
			<tr>
				<form name='myform' method='Post' action='Admin_Photo_ModfySave.jsp' onsubmit='return ConfirmDel();'>
				<td>
					<table class='border' border='0' cellspacing='1' width='100%'
						cellpadding='0'>
						<tr class='title' height='22'>
							<td height='22' width='30' align='center'>
								<strong>选中</strong>							</td>
							<td width='25' align='center'>
								<strong>ID</strong>							</td>
							<td width="543" align='center'>
								<strong>图片标题</strong>							</td>
							<td width='73' align='center'>
								<strong>录入者</strong>							</td>
							<td width='65' align='center'>
								<strong>点击数</strong>							</td>
							<td width='113' align='center'>
								<strong>图片属性</strong>							</td>
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
						   while(rs.next()&&n<pageSize)
						  {
						
						 %>
						<tr class='tdbg' onMouseOut="this.className='tdbg'"
							onMouseOver="this.className='tdbgmouseover'">
							<td width='30' height="36" align='center'>
								<input name='PhotoID' type='checkbox'
									onclick='CheckItem(this)' id='PhotoID' value=<%=rs.getInt("ID") %>>
							</td>
							<td width='25' align='center'>
								<%=rs.getInt("ID") %>
							</td>
							<td>
								[<font
									color='gray'>
									<%
									if(acd.queryClassNameByID(rs.getInt("Tid")).equals(""))
									  out.println("不属于任何栏目"); 
									else
									{
									%>
									<a href=Admin_Photo_List.jsp?Tid=<%=rs.getInt("Tid")%>>
									<%
									  out.println(acd.queryClassNameByID(rs.getInt("Tid"))); 
									  }
									%></a></font>]&nbsp;
								<a href='Admin_Photo_Modfy.jsp?PhotoID=<%=rs.getInt("ID") %>'
									title=<%=rs.getString("Title") %>><%=rs.getString("Title") %></a>							</td>
							<td width='73' align='center'>
								<%=rs.getString("Inputer") %>						  </td>
							<td width='65' align='center'>
								<%=rs.getInt("Hits") %>						  </td>
							<td width='113' align='center'>
								<%
								if(rs.getInt("IsTop")!=0)
								 out.println("<font color=red>固</font>");
								 %>
								 &nbsp;&nbsp;
						  <% 
								if(rs.getInt("Recommend")!=0)
								 out.println("<font color=red>推</font>");
								
								%>						  </td>
							<td width='74' align='center'>
								<font color=red>
								 <%
								 switch(rs.getInt("Status"))
								 {
								 case -1:out.println("草稿");break;
								 case  0:out.println("待审核");break;
								 case  1:out.println("审核通过");break;
								 }
								
								 %>
						  </font>						  </td>
							<td width='61' align='center'>
							<%
							if(rs.getInt("IfTohtml")==1)
							{
							out.println("√");
							}
							else
							{
							out.println("<b><font color=red>×</font></b>");
							}
							
							 %>
						  </td>
							<td width='238' align='center'>
								<a href='Admin_Photo_ModfySave.jsp?Action=Reject&PhotoID=<%=rs.getInt("ID") %>'>直接退稿</a>&nbsp;&nbsp;
								<a href='Admin_Photo_ModfySave.jsp?Action=SetPassed&PhotoID=<%=rs.getInt("ID") %>'>审核</a>&nbsp;&nbsp;
								 <a href="javascript:void(0)" onclick="document.getElementById('top').style.display='block';document.getElementById('below').style.display='block'">通过</a>
								 
						  </td>
						</tr>
						<div id="top" class="topdiv"></div>
        <div id="below" class="belowdiv" >图片评分
 请为该图片评分<a href = "javascript:void(0)" onclick = "document.getElementById('top').style.display='none';document.getElementById('below').style.display='none'"><b><font color=red>×</font></b></a>
<br/>
图片评分：<input type="text" name="getNum" id="getNum" value="1" size="4"/>
<br/>
<input type="button" onclick="throwGO();" value="通过">
<a href = "javascript:history.go(-1);" > 返回 </a>



</div>
<div id="Div1" class="topdiv">dddiv1</div>
<div id="Div2"  class="belowdiv">

</div>
						<%
						}
					
						%>
					</table>
					<table width='100%' border='0' cellpadding='0' cellspacing='0'>
						<tr>
							<td width='200' height='30'>
								<input name='chkAll' type='checkbox' id='chkAll'
									onclick='CheckAll(this.form)' value='checkbox'>
								选中本页显示的所有图片
							</td>
							<td>
								<input name='submit3' type='submit' value=' 批量删除 '
									onClick="document.myform.Action.value='NumDel'">
								&nbsp;&nbsp;
<input name='submit1' type='submit' value=' 审核通过 '
									onClick="document.myform.Action.value='SetPassed'">
								&nbsp;&nbsp;
								<input name='submit2' type='submit' value=' 取消审核 '
									onClick="document.myform.Action.value='CancelPassed'">
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
			<b><%=rowCount %></b> 篇图片&nbsp;&nbsp;
			<%
			if(pageCount>1){
			   out.println("<a href=Admin_Photo_Check.jsp?page=1>首页</a> <a href=Admin_Photo_Check.jsp?page="+(currPage-1)+">上一页</a>");
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
			   out.println("<a href=Admin_Photo_Check.jsp?page="+(currPage+1)+">下一页</a> <a href=Admin_Photo_Check.jsp?page="+pageCount+">尾页</a>");
			   }
			else
			{
			   out.println("下一页 尾页");
			   }
			 %>
			<strong><font color=red>1</font>/1</strong>页 &nbsp;
			<input type='text' name='MaxPerPage' size='3' maxlength='4'
				value='<%=pageSize %>'
				onKeyPress="if (event.keyCode==13) window.location='Admin_Photo.asp?ChannelID=1&Action=Manage&ManageType=Check&ClassID=0&SpecialID=0&Field=&keyword=&Status=0&Created=&PayStatus=False&OnTop=&IsElite=&IsHot=&page=1&MaxPerPage='+this.value;">
			篇图片/页&nbsp;
			
		</div>
		<br>
		<form method='Post' name='SearchForm'
			action='Admin_Photo_Check.jsp?Action=Search&Type=All'>
			<table width='100%' border='0' cellpadding='0' cellspacing='0'
				class='border'>
				<tr class='tdbg'>
					<td width='80' align='right'>
						<strong>图片搜索：</strong>
					</td>
					<td>
						<select name='Field' size='1'>
							<option value='Title' selected>
								图片标题
							</option>
							<option value='Content'>
								图片内容
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
									String showClass="";
									ArticleClassDao articleClassDao=new ArticleClassDaoImpl();
									showClass=articleClassDao.queryAllTop(0,0);
									out.println(showClass);
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
		&nbsp;&nbsp;&nbsp;&nbsp;图片属性中的各项含义：
		<font color=blue>顶</font>----固顶图片，
		<font color=red>热</font>----热门图片，
		<font color=green>荐</font>----推荐图片，
		<font color=blue>图</font>----首页图片图片，
		<br>
		<br> 
		

	</body>
</html>
