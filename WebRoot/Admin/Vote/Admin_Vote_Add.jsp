<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="../PubPackage.jsp"%>
<%
if(request.getParameter("Action")!=null)
{
 String action=request.getParameter("Action");
 if("SaveAdd".equals(action))
 {
  Vote vote=new Vote();
  vote.setTitle(request.getParameter("Title"));
  vote.setSelect1(request.getParameter("select1"));
  int answer1=0;
  if(!(request.getParameter("answer1")==null||"".equals(request.getParameter("answer1"))))
    answer1=Integer.parseInt(request.getParameter("answer1"));
  vote.setAnswer1(answer1);
  vote.setSelect2(request.getParameter("select2"));
  int answer2=0;
  if(!(request.getParameter("answer2")==null||"".equals(request.getParameter("answer2"))))
    answer2=Integer.parseInt(request.getParameter("answer2"));
  vote.setAnswer1(answer2);
  vote.setSelect3(request.getParameter("select3"));
  int answer3=0;
  if(!(request.getParameter("answer3")==null||"".equals(request.getParameter("answer3"))))
    answer3=Integer.parseInt(request.getParameter("answer3"));
  vote.setAnswer3(answer3);
  vote.setSelect4(request.getParameter("select4"));
  int answer4=0;
  if(!(request.getParameter("answer4")==null||"".equals(request.getParameter("answer4"))))
    answer4=Integer.parseInt(request.getParameter("answer4"));
  vote.setAnswer4(answer4);
  vote.setSelect5(request.getParameter("select5"));
  int answer5=0;
  if(!(request.getParameter("answer5")==null||"".equals(request.getParameter("answer5"))))
    answer5=Integer.parseInt(request.getParameter("answer5"));
  vote.setAnswer5(answer5);
  vote.setSelect6(request.getParameter("select6"));
  int answer6=0;
  if(!(request.getParameter("answer6")==null||"".equals(request.getParameter("answer6"))))
    answer6=Integer.parseInt(request.getParameter("answer6"));
  vote.setAnswer6(answer6);
  vote.setSelect7(request.getParameter("select7"));
  int answer7=0;
  if(!(request.getParameter("answer7")==null||"".equals(request.getParameter("answer7"))))
    answer7=Integer.parseInt(request.getParameter("answer7"));
  vote.setAnswer7(answer7);
  vote.setSelect8(request.getParameter("select8"));
  int answer8=0;
  if(!(request.getParameter("answer8")==null||"".equals(request.getParameter("answer8"))))
    answer8=Integer.parseInt(request.getParameter("answer8"));
  vote.setAnswer8(answer8);
 int voteType=1;
 if(request.getParameter("VoteType")!=null)
   voteType=Integer.parseInt(request.getParameter("VoteType"));
 vote.setVoteType(voteType);
 vote.setVoteTime(request.getParameter("VoteTime"));
 vote.setEndTime(request.getParameter("EndTime"));
 int isSelected=0;
 if(request.getParameter("IsSelected")!=null)
   isSelected=Integer.parseInt(request.getParameter("IsSelected"));
 vote.setIsSelected(isSelected);    
  
 DAOFactory.getVoteDaoInstance().insertVote(vote);
 JS.goURL(response,"Admin_Vote.jsp");
 }

}

 %>
<html>
	<head>
		<title>调查管理</title>
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
								<b>网 站 调 查 管 理</b>
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
					<a href='Admin_Vote.jsp'>调查管理首页</a>&nbsp;|
					<a href="Admin_Vote_Add.jsp">&nbsp;添加新调查</a>
				</td>
			</tr>
		</table>
		<script language='JavaScript'>
function CheckForm(){
  if (document.myform.Title.value==''){
     alert('调查主题不能为空！');
     document.myform.Title.focus();
     return false;
  }
  return true;  
}
</script>
		<form method='POST' name='myform' onSubmit='return CheckForm();'
			action='Admin_Vote_Add.jsp' target='_self'>
			<table width='100%' border='0' align='center' cellpadding='2'
				cellspacing='1' class='border'>
				<tr class='title'>
					<td height='22' class='title' colspan=4 align=center>
						<b>添 加 调 查</b>
					</td>
				</tr>
				<tr class='tdbg'>
					<td align='right'>
						调查主题：
					</td>
					<td colspan='3'>
						<textarea name='Title' cols='60' rows='4'></textarea>
					</td>
				</tr>
				<tr class='tdbg'>
					<td width='20%' align='right'>
						选项1：
					</td>
					<td width='35%'>
						<input type='text' name='select1' size='36'>
					</td>
					<td width='10%' align='right'>
						票数：
					</td>
					<td width='35%' width='80'>
						<input type='text' name='answer1' size='10'>
					</td>
				</tr>
				<tr class='tdbg'>
					<td width='20%' align='right'>
						选项2：
					</td>
					<td width='35%'>
						<input type='text' name='select2' size='36'>
					</td>
					<td width='10%' align='right'>
						票数：
					</td>
					<td width='35%' width='80'>
						<input type='text' name='answer2' size='10'>
					</td>
				</tr>
				<tr class='tdbg'>
					<td width='20%' align='right'>
						选项3：
					</td>
					<td width='35%'>
						<input type='text' name='select3' size='36'>
					</td>
					<td width='10%' align='right'>
						票数：
					</td>
					<td width='35%' width='80'>
						<input type='text' name='answer3' size='10'>
					</td>
				</tr>
				<tr class='tdbg'>
					<td width='20%' align='right'>
						选项4：
					</td>
					<td width='35%'>
						<input type='text' name='select4' size='36'>
					</td>
					<td width='10%' align='right'>
						票数：
					</td>
					<td width='35%' width='80'>
						<input type='text' name='answer4' size='10'>
					</td>
				</tr>
				<tr class='tdbg'>
					<td width='20%' align='right'>
						选项5：
					</td>
					<td width='35%'>
						<input type='text' name='select5' size='36'>
					</td>
					<td width='10%' align='right'>
						票数：
					</td>
					<td width='35%' width='80'>
						<input type='text' name='answer5' size='10'>
					</td>
				</tr>
				<tr class='tdbg'>
					<td width='20%' align='right'>
						选项6：
					</td>
					<td width='35%'>
						<input type='text' name='select6' size='36'>
					</td>
					<td width='10%' align='right'>
						票数：
					</td>
					<td width='35%' width='80'>
						<input type='text' name='answer6' size='10'>
					</td>
				</tr>
				<tr class='tdbg'>
					<td width='20%' align='right'>
						选项7：
					</td>
					<td width='35%'>
						<input type='text' name='select7' size='36'>
					</td>
					<td width='10%' align='right'>
						票数：
					</td>
					<td width='35%' width='80'>
						<input type='text' name='answer7' size='10'>
					</td>
				</tr>
				<tr class='tdbg'>
					<td width='20%' align='right'>
						选项8：
					</td>
					<td width='35%'>
						<input type='text' name='select8' size='36'>
					</td>
					<td width='10%' align='right'>
						票数：
					</td>
					<td width='35%' width='80'>
						<input type='text' name='answer8' size='10'>
					</td>
				</tr>
				<tr class='tdbg'>
					<td align='right'>
						调查类型：
					</td>
					<td colspan='3'>
						<select name='VoteType' id='VoteType'>
							<option value='1' selected>
								单选
							</option>
							<option value='2'>
								多选
							</option>
						</select>
					</td>
				</tr>
				<tr class='tdbg'>
					<td align='right'>
						发布时间：
					</td>
					<td colspan='3'>
					<% 
	//取得但前时间
	GregorianCalendar gc = new GregorianCalendar();
	String nowDateTime = Integer.toString(gc
	.get(GregorianCalendar.YEAR))
	+ "-"
	+ Integer.toString(gc.get(GregorianCalendar.MONTH) + 1)
	+ "-"
	+ Integer.toString(gc.get(GregorianCalendar.DAY_OF_MONTH))
	+ " "
	+ Integer.toString(gc.get(GregorianCalendar.HOUR_OF_DAY))
	+ ":"
	+ Integer.toString(gc.get(GregorianCalendar.MINUTE))
	+ ":" + Integer.toString(gc.get(GregorianCalendar.SECOND));
	%>
						<input name='VoteTime' type='text' id='VoteTime'
							value='<%=nowDateTime %>' size='20' maxlength='20'>
					</td>
				</tr>
				<tr class='tdbg'>
					<td align='right'>
						终止时间：
					</td>
					<td colspan='3'>
						<input name='EndTime' type='text' id='EndTime'
							value='<%=nowDateTime %>' size='20' maxlength='20'>
					</td>
				</tr>
				<tr class='tdbg'>
					<td align='right'>
						&nbsp;
					</td>
					<td colspan='3'>
						<input name='IsSelected' type='checkbox' id='IsSelected'
							value='1' checked>
						启用本调查
					</td>
				</tr>
				<tr class='tdbg'>
					<td colspan=4 align=center>
						<input name='Action' type='hidden' id='Action' value='SaveAdd'>
						<input name='Submit' type='submit' id='Submit' value=' 添 加 '>
						&nbsp;
						<input name='Reset' type='reset' id='Reset' value=' 清 除 '>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
<!-- Powered by: PowerEasy 2005 -->
