<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="PubPackage.jsp"%>
<%
String adminPopNum="POP000207";
if(!DAOFactory.getAdminDaoInstance().checkAdminPopedom(Integer.parseInt(session.getAttribute("AdminID").toString()),adminPopNum))
{
JS.ErrCode(response,"你没有足够的权限！请与管理员联系！");
JS.goBack(response,-1);
}
if(request.getParameter("Action")!=null)
{
 String action=request.getParameter("Action");
 if("ModfySave".equals(action))
 {
  Question question=new Question();
  String id=request.getParameter("ID");
  String testID=request.getParameter("TestID");
  String title=request.getParameter("Title");
  String type=request.getParameter("Type");
  int answer=-1;
  if(!(request.getParameter("Answer")==null||"".equals(request.getParameter("Answer"))))
  {
   answer=Integer.parseInt(request.getParameter("Answer"));
  
  }
  String strSel="";
  if(!(request.getParameter("Selects")==null||"".equals(request.getParameter("Selects"))))
  {
  String selects[] =request.getParameterValues("Selects");
  for(int i=0;i<selects.length;i++)
  {
   strSel=strSel+selects[i];
  } 
  }
  int score=0;
  if(!(request.getParameter("Score")==null||"".equals(request.getParameter("Score"))))
  {
   score=Integer.parseInt(request.getParameter("Score"));
  }
  String selA="";
  if(!(request.getParameter("SelA")==null||"".equals(request.getParameter("SelA"))))
  {
   selA=request.getParameter("SelA");
  }
  String selB="";
  if(!(request.getParameter("SelB")==null||"".equals(request.getParameter("SelB"))))
  {
   selB=request.getParameter("SelB");
   }
     String selC="";
  if(!(request.getParameter("SelC")==null||"".equals(request.getParameter("SelC"))))
  {
   selC=request.getParameter("SelC");
   }
    String selD="";
  if(!(request.getParameter("SelD")==null||"".equals(request.getParameter("SelD"))))
  {
   selD=request.getParameter("SelD");
   }
   String dselA="";
  if(!(request.getParameter("DSelA")==null||"".equals(request.getParameter("DSelA"))))
  {
   dselA=request.getParameter("DSelA");
   }
   String dselB="";
  if(!(request.getParameter("DSelB")==null||"".equals(request.getParameter("DSelB"))))
  {
   dselB=request.getParameter("DSelB");
   }
   String dselC="";
  if(!(request.getParameter("DSelC")==null||"".equals(request.getParameter("DSelC"))))
  {
   dselC=request.getParameter("DSelC");
   }
      String dselD="";
  if(!(request.getParameter("DSelD")==null||"".equals(request.getParameter("DSelD"))))
  {
   dselD=request.getParameter("DSelD");
   }
 int isSelected=0;
 if(request.getParameter("IsSelected")!=null)
   isSelected=Integer.parseInt(request.getParameter("IsSelected"));
question.setTestID(Integer.parseInt(testID));
question.setId(Integer.parseInt(id));
question.setTitle(title);
question.setType(Integer.parseInt(type));
question.setAnswer(answer);
question.setSelects(strSel);
question.setStatus(isSelected);
question.setScore(score);
question.setSelA(selA);
question.setSelB(selB);
question.setSelC(selC);
question.setSelD(selD);
question.setDSelA(dselA);
question.setDSelB(dselB);
question.setDSelC(dselC);
question.setDSelD(dselD);
 DAOFactory.getQuestionDaoInstance().updateQuestion(question);
 JS.goURL(response,"Admin_Question.jsp");
 }
 if("Del".equals(action))
 {
  
  if(request.getParameter("ID")==null||"".equals(request.getParameter("ID")))
  {
  JS.AlertCode(response,"参数传递错误！");
  JS.goBack(response,-1);
  return;
   }
   else
   {
   String id=request.getParameter("ID");
   DAOFactory.getQuestionDaoInstance().delQuestion(Integer.parseInt(id));
   JS.goURL(response,"Admin_Question.jsp");
   }
 
 
 }
 if("NumDel".equals(action))
 {
   
  if(request.getParameterValues("ID")==null||"".equals(request.getParameterValues("ID")))
  {
  JS.AlertCode(response,"至少选择一条记录！");
  JS.goBack(response,-1);
  return;
   }
   else
   {
   String id[]=request.getParameterValues("ID");
   for(int i=0;i<id.length;i++)
   {
   
    DAOFactory.getQuestionDaoInstance().delQuestion(Integer.parseInt(id[i]));
    
   }
   
   JS.goURL(response,"Admin_Question.jsp");
   
   }
 
 
 
 }
if("Modfy".equals(action))
{
  if(request.getParameter("ID")==null||"".equals(request.getParameter("ID")))
{
  JS.AlertCode(response,"参数传递错误！");
  JS.goBack(response,-1);
  return;
}
String id=request.getParameter("ID");
Question question=DAOFactory.getQuestionDaoInstance().showQuestion(Integer.parseInt(id));


 %>
<html>
	<head>
		<title>试题管理</title>
		<meta http-equiv='Content-Type' content='text/html; charset=utf-8'>
		<link href='CSS/Admin_Style.css' rel='stylesheet' type='text/css'>
	</head>
	<body leftmargin='2' topmargin='0' marginwidth='0' marginheight='0'>
		<table width='100%' border='0' align='center' cellpadding='2'
			cellspacing='1' class='border'>
			<tr class='topbg'>
				<td height='22' colspan='10'>
					<table width='100%'>
						<tr class='topbg'>
							<td align='center'>
								<b>模 拟 考 试 管 理</b>							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr class='tdbg'>
				<td width='70' height='30'>
					<strong>管理导航：</strong>
				</td>
				<td>
				<a href='Admin_Question.jsp'>试题管理首页</a>&nbsp;</td>
			</tr>
		</table>
		<script language='JavaScript'>
function CheckForm(){
  if (document.myform.Title.value==''){
     alert('试题题目不能为空！');
     document.myform.Title.focus();
     return false;
  }
  return true;  
}
</script>
		<form method='POST' name='myform' onSubmit='return CheckForm();'
			action='Admin_Question_Modfy.jsp?ID=<%=id %>&TestID=<%=question.getTestID() %>'  target='_self'>
			<table width='100%' border='0' align='center' cellpadding='2'
				cellspacing='1' class='border'>
				<tr class='title'>
					<td height='22' class='title' colspan=4 align=center>
						<b>修 改 试 题 </b>					</td>
				</tr>
				<tr class='tdbg'>
					<td width="244" align='right'>所属试卷：</td>
					<td colspan='3'><input name="TestName" type="text" id="TestName" size="50" value=<%=DAOFactory.getTestDaoInstance().getTestName(question.getTestID())%>  readonly></td>
				</tr>
				<tr class='tdbg'>
				  <td width="244" align='right'>题 目：</td>
				  <td colspan='3'><textarea name='Title' cols='60' rows='4'><%=question.getTitle() %></textarea></td>
			  </tr>
			  <%
			  String sel1="";
			  String sel2="";
			  String sel3="";
			  switch(question.getType())
			  {
			  case 1:sel1="checked";break;
			  case 2:sel2="checked";break;
			  case 3:sel3="checked";break;
			  
			  }
			  String chk1="";
			  String chk2="";
			  String chk3="";
			  String chk4="";
			  String chk5="";
			  String chk6="";
			  switch(question.getAnswer())
			  {
			  case -1:chk1="checked";break;
			  case 0:chk2="checked";break;
			  case 1:chk3="checked";break;
			  case 2:chk4="checked";break;
			  case 3:chk5="checked";break;
			  case 4:chk6="checked";break;
			 
			  
			  }
			 
			  
			   %>

				<tr class='tdbg'>
					<td align='right'>试题类型及答案：</td>
					<td colspan='2'><input type="radio" name="Type" value="1"  <%=sel1 %>>
					  判断题&nbsp;&nbsp;</td>
				    <td ><input type="radio" name="Answer" value="0" <%=chk1 %>>
对
  <input type="radio" name="Answer" value="-1" <%=chk2 %>>
错 </td>
				</tr>
				<tr class='tdbg'>
				  <td rowspan="4" align='right'>&nbsp;</td>
				  <td colspan='2' rowspan="4"><input type="radio" name="Type" value="2" <%=sel2 %>>
				    单选题&nbsp;&nbsp;</td>
			      <td><input type="radio" name="Answer" value="1" <%=chk3 %>>
A:
  <input name="SelA" type="text" id="SelA" size="60" value=<%=question.getSelA() %>>  </td>
			  </tr>
				<tr class='tdbg'>
				  <td><input type="radio" name="Answer" value="2" <%=chk4 %>>
B:
  <input name="SelB" type="text" id="SelB" size="60" value=<%=question.getSelB() %>></td>
			  </tr>
				<tr class='tdbg'>
				  <td><input type="radio" name="Answer" value="3" <%=chk5 %>>
C:
  <input name="SelC" type="text" id="SelC" size="60" value=<%=question.getSelC() %>></td>
			  </tr>
				<tr class='tdbg'>
				  <td><input type="radio" name="Answer" value="4" <%=chk6 %>>
D:
  <input name="SelD" type="text" id="SelD" size="60" value=<%=question.getSelD() %>></td>
			  </tr>
				<tr class='tdbg'>
				  <td rowspan="4" align='right'>&nbsp;</td>
				  <td colspan='2' rowspan="4"><input type="radio" name="Type" value="3" <%=sel3 %>>
				    多选题&nbsp;&nbsp;</td>
			      <td><input name="Selects" type="checkbox" id="Selects" value="A" <%if(question.getSelects().indexOf("A")>=0&&!"".equals(question.getDSelA())){out.print("checked");} %>>
A:
  <input name="DSelA" type="text" id="DSelA" size="60"  value=<%=question.getDSelA() %> ></td>
			  </tr>
				<tr class='tdbg'>
				  <td><input name="Selects" type="checkbox" id="Selects" value="B" <%if(question.getSelects().indexOf("B")>=0&&!"".equals(question.getDSelB())){out.print("checked");} %>>
B:
  <input name="DSelB" type="text" id="DSelB" size="60" value=<%=question.getDSelB() %>></td>
			  </tr>
				<tr class='tdbg'>
				  <td><input name="Selects" type="checkbox" id="Selects" value="C" <%if(question.getSelects().indexOf("C")>=0&&!"".equals(question.getDSelC())){out.print("checked");} %>>
C:
  <input name="DSelC" type="text" id="DSelC" size="60" value=<%=question.getDSelC() %>></td>
			  </tr>
				<tr class='tdbg'>
				  <td><input name="Selects" type="checkbox" id="Selects" value="D" <%if(question.getSelects().indexOf("D")>=0&&!"".equals(question.getDSelD())){out.print("checked");} %>>
D:
  <input name="DSelD" type="text" id="DSelD" size="60" value=<%=question.getDSelD() %>></td>
			  </tr>
				
				<tr class='tdbg'>
					<td align='right'>得分：					</td>
					<td colspan='3'>
						<input name='Score' type='text' id='Score' size='5' maxlength='20' value=<%=question.getScore() %>>
						分					</td>
				</tr>
				<tr class='tdbg'>
					<td align='right'>&nbsp;					</td>
					<td colspan='3'>
						<input name='IsSelected' type='checkbox' id='IsSelected'
							value='1' <%if(question.getStatus()==1){out.println("checked");} %>>
						启用本试题</td>
				</tr>
				<tr class='tdbg'>
					<td colspan=4 align=center>
						<input name='Action' type='hidden' id='Action' value='ModfySave'>
						<input name='Submit' type='submit' id='Submit' value=' 修 改 '>
						&nbsp;
						<input name='Reset' type='reset' id='Reset' value=' 清 除 '>					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
<% 
}
}
%>
