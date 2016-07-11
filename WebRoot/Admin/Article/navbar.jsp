<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<table width='100%' border='0' align='center' cellpadding='2'
			cellspacing='1' class='border'>
			<tr class='topbg'>
				<td height='22' colspan='10'>
					<table width='100%'>
						<tr class='topbg'>
							<td align='center'>
								<b>文章中心管理----所有文章</b>
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
					<a href='Admin_Article_AddWord.jsp'>上传WORD</a>&nbsp;|&nbsp;
					<a href='Admin_Article_Check.jsp'>审核文章</a>&nbsp;|&nbsp;
					<a href='Admin_Article_Recyclebin.jsp'>文章回收站管理</a>
				</td>
			</tr>			
			<tr class='tdbg'>
				<td width='70' height='30'>
					<strong>文章选项：</strong>
				</td>
			  <td><form name='form3' method='Post' action='Admin_Article_List.jsp?Action=Search'>		  
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
				<%
				for(SiteClass sc:sclist){
				%>
				<a href="Admin_Article_List.jsp?Action=Search&ClassID=<%=sc.getClassID() %>"><%=sc.getClassName() %></a>&nbsp;|&nbsp;
				<%
				}
				%>				
				</td>
			</tr>
		</table>
