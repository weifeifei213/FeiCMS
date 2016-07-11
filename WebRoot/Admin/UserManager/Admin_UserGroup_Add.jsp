<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.megalith.vo.QyskUsergroup"%>
<%@ include file="../PubPackage.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String Action =request.getParameter("Action");
log.error("进入添加用户组页面");//生成日志内容

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>会员组管理</title>
<meta http-equiv='Content-Type' content='text/html; charset=gb2312'>
<link href='../CSS/Admin_Style.css' rel='stylesheet' type='text/css'>
</head>
<body leftmargin='2' topmargin='0' marginwidth='0' marginheight='0'>
<table width='100%' border='0' align='center' cellpadding='2' cellspacing='1' class='border'>
  <tr class='topbg'> 
    <td height='22' colspan='10'><table width='100%'><tr class='topbg'><td align='center'><b><br>.会 员 组 管 理</b></td><td width='60' align='right'><a href='http://go.powereasy.net/go.aspx?UrlID=10042' target='_blank'><img src='images/help.gif' border='0'></a></td></tr></table></td>
  </tr>
  <tr class='tdbg'>
    <td width='70' height='30'>管理导航：</td>
    <td height='30'><a href='?'>会员组管理首页</a>&nbsp;|&nbsp;<a href='?Action=Add'>新增会员组</a> </td>
  </tr>
</table>
<script language=javascript>
function CheckSubmit(){
  if(document.form1.GroupName.value==''){
      alert('会员组名称不能为空！');
   document.form1.GroupName.focus();
      return false;
    }
    GetClassPurview();
}
</script>
<%
if(Action!=null&&!"".equals(Action)&&Action.equals("Add")){
StringBuffer StrGroupSetting=new StringBuffer();

//获取所有的GroupSetting的值
Enumeration  Names=request.getParameterNames();
while(Names.hasMoreElements()){
String StrName=(String)Names.nextElement();
if(StrName.startsWith("GroupSetting")){
StrGroupSetting.append("|"+StrName+","+request.getParameter(StrName));
}
}


String Channellist="";
if(request.getParameterValues("Channel")!=null)
   {
    String Channel[]=request.getParameterValues("Channel");
    for(int i=0;i<Channel.length;i++)
   {
   StrGroupSetting.append("|Channel,"+Channel[i]);   
   }
   }

String GroupName=request.getParameter("GroupName");
String GroupIntro =request.getParameter("GroupIntro");
String GroupType =request.getParameter("GroupType");

System.out.print(""+StrGroupSetting.toString()+"================");

QyskUsergroup ug=new QyskUsergroup();
ug.setGroupName(GroupName);
ug.setGroupIntro(GroupIntro);
ug.setGroupType(Short.parseShort(GroupType));
ug.setGroupSetting(StrGroupSetting.toString());
ug.setDayInputMax(Integer.parseInt(request.getParameter("DayInputMax")));

int groupId= DAOFactory.getQyskUserGroupDao().insertPhotoClass(ug);

log.error("添加用户组成功----groupID:"+groupId+"----准备执行页面跳转");//生成日志内容
JS.goURL(response,"Admin_UserGroup_SetPurview.jsp?GroupID="+groupId);

}
 %>


<% if(Action==null){ %>

<form method='post' action='Admin_UserGroup_Add.jsp?Action=Add' name='form1' onSubmit='javascript:return CheckSubmit();' >
  <table width='100%' border='0' align='center' cellpadding='2' cellspacing='1' class='border'>
    <tr class='title'>
      <td height='22' colspan='3'><div align='center'>新 增 会 员 组</div></td>
    </tr>
    <tr class='tdbg'>
      <td width='15%' class='tdbg5' align='right'>会员组名称：</td>
      <td><input name='GroupName' type='text' id='GroupName' size='20' maxlength='20'><font color='#FF0000'>*</font></td>
    </tr>
    <tr class='tdbg'>
      <td width='15%' class='tdbg5' align='right'>会员组说明：</td>
      <td><input name='GroupIntro' type='text' id='GroupIntro' size='50' maxlength='200'><font color='#FF0000'>*</font></td>
    </tr>
    <tr class='tdbg'>
      <td width='15%' class='tdbg5' align='right'>组 类 型：</td>
      <td><select name='GroupType' id='GroupType'>
                            <option value='3'>注册会员</option>
                            <option value='4'>代 理 商</option>
          </select><font color='#FF0000'>*</font></td>
    </tr>
    <tr class='tdbg'>
      <td width='15%' class='tdbg5' align='right'>发布权限：</td>
      <td>
<input name='GroupSetting1' type='checkbox' value='GS00001'>在发布信息需要审核的频道，此组会员发布信息不需要审核<br>
<input name='GroupSetting2' type='checkbox' value='GS00002'>可以修改和删除已审核的（自己的）信息<br>
<input name='GroupSetting22' type='checkbox' value='GS00003'>发表信息时可以设置是否显示评论链接<br>
<input name='GroupSetting24' type='checkbox' value='GS00004'>发表信息时HTML编辑器为高级模式（默认为简洁模式）<br>
每天最多发布<input name='DayInputMax' type='text' value='0' size='6' maxlength='6' style='text-align: center;'>条信息（不想限制请设置为<b>0</b>）。
</tr>
    <tr class='tdbg'>
    <td width='15%' class='tdbg5' align='right'>评论权限：</td>
         <td><input name='GroupSetting5' type='checkbox' value='GS00005'>可以评论自己的发布的文章<br>
         <input name='GroupSetting6' type='checkbox' value='GS00006'>发布的评论不需要审核</td>
    </tr>
   
    <tr class='tdbg'>
      <td colspan='3'>
        <table width='100%' border='0' cellspacing='10' cellpadding='0'>
          <tr>
            <td colspan='2' align='center'>频 道 权 限 详 细 设 置</td>
          </tr>
          <tr valign='top'>
           <td>
           <fieldset>
   <legend>此会员组【<font color='red'>拥有权限的</font>】频道：</legend>
    <table width="100%" >
    <tr><td>
   
    </td></tr> 
    </table>    
   </fieldset></td>
          </tr>
            <tr>
                <td align='center'>
                    <input type='hidden' name='Action' value='SaveAdd'>
                    <input type='submit' value='下一步'>
                    <input type='button' name='cancel' value=' 取 消 ' onClick="JavaScript:window.location.href='Admin_UserGroup.jsp'">
                </td>
            </tr>
  </table>
  </td>
  </tr>
  </table>
</form>
<%}
%>
</body></html>
