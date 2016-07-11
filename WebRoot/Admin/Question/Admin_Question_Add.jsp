<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="PubPackage.jsp"%>
<%
String adminPopNum="POP000205";
if(!DAOFactory.getAdminDaoInstance().checkAdminPopedom(Integer.parseInt(session.getAttribute("AdminID").toString()),adminPopNum))
{
JS.ErrCode(response,"你没有足够的权限！请与管理员联系！");
JS.goBack(response,-1);
}
if(request.getParameter("ID")==null||"".equals(request.getParameter("ID")))
{
  JS.AlertCode(response,"参数传递错误！");
  JS.goBack(response,-1);
  return;
}
String testID=request.getParameter("ID");
if(request.getParameter("Action")!=null)
{
 String action=request.getParameter("Action");
 if("SaveAdd".equals(action))
 {
  Question question=new Question();
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
 DAOFactory.getQuestionDaoInstance().insertQuestion(question);
 JS.goURL(response,"Admin_Question.jsp");
 }

}

 %>
<html>
	<head>
		<title>调查管理</title>
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
			action='Admin_Question_Add.jsp?ID=<%=testID %>'  target='_self'>
			<table width='100%' border='0' align='center' cellpadding='2'
				cellspacing='1' class='border'>
				<tr class='title'>
					<td height='22' class='title' colspan=4 align=center>
						<b>添 加 试 题 </b>					</td>
				</tr>
				<tr class='tdbg'>
					<td width="244" align='right'>所属试卷：</td>
					<td colspan='3'><input name="TestName" type="text" id="TestName" size="50" value=<%=DAOFactory.getTestDaoInstance().getTestName(Integer.parseInt(testID))%>  readonly></td>
				</tr>
				<tr class='tdbg'>
				  <td width="244" align='right'>题 目：</td>
				  <td colspan='3'><textarea name='Title' cols='60' rows='4'></textarea></td>
			  </tr>
				<tr class='tdbg'>
					<td align='right'>试题类型及答案：					</td>
					<td colspan='2'><input type="radio" name="Type" checked="checked" value="1"  >
					  判断题&nbsp;&nbsp;</td>
				    <td ><input type="radio" name="Answer" value="0">
对
  <input type="radio" name="Answer" value="-1">
错 </td>
				</tr>
				<tr class='tdbg'>
				  <td rowspan="4" align='right'>&nbsp;</td>
				  <td colspan='2' rowspan="4"><input type="radio" name="Type" value="2">
				    单选题&nbsp;&nbsp;</td>
			      <td><input type="radio" name="Answer" value="1">
A:
  <input name="SelA" type="text" id="SelA" size="60">  </td>
			  </tr>
				<tr class='tdbg'>
				  <td><input type="radio" name="Answer" value="2">
B:
  <input name="SelB" type="text" id="SelB" size="60"></td>
			  </tr>
				<tr class='tdbg'>
				  <td><input type="radio" name="Answer" value="3">
C:
  <input name="SelC" type="text" id="SelC" size="60"></td>
			  </tr>
				<tr class='tdbg'>
				  <td><input type="radio" name="Answer" value="4">
D:
  <input name="SelD" type="text" id="SelD" size="60"></td>
			  </tr>
				<tr class='tdbg'>
				  <td rowspan="4" align='right'>&nbsp;</td>
				  <td colspan='2' rowspan="4"><input type="radio" name="Type" value="3">
				    多选题&nbsp;&nbsp;</td>
			      <td><input name="Selects" type="checkbox" id="Selects" value="A">
A:
  <input name="DSelA" type="text" id="DSelA" size="60"></td>
			  </tr>
				<tr class='tdbg'>
				  <td><input name="Selects" type="checkbox" id="Selects" value="B">
B:
  <input name="DSelB" type="text" id="DSelB" size="60"></td>
			  </tr>
				<tr class='tdbg'>
				  <td><input name="Selects" type="checkbox" id="Selects" value="C">
C:
  <input name="DSelC" type="text" id="DSelC" size="60"></td>
			  </tr>
				<tr class='tdbg'>
				  <td><input name="Selects" type="checkbox" id="Selects" value="D">
D:
  <input name="DSelD" type="text" id="DSelD" size="60"></td>
			  </tr>
				
				<tr class='tdbg'>
					<td align='right'>得分：					</td>
					<td colspan='3'>
						<input name='Score' type='text' id='Score' size='5' maxlength='20'>
						分					</td>
				</tr>
				<tr class='tdbg'>
					<td align='right'>&nbsp;					</td>
					<td colspan='3'>
						<input name='IsSelected' type='checkbox' id='IsSelected'
							value='1' checked>
						启用本试题</td>
				</tr>
				<tr class='tdbg'>
					<td colspan=4 align=center>
						<input name='Action' type='hidden' id='Action' value='SaveAdd'>
						<input name='Submit' type='submit' id='Submit' value=' 添 加 '>
						&nbsp;
						<input name='Reset' type='reset' id='Reset' value=' 清 除 '>					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
<!-- Powered by: PowerEasy 2005 -->
