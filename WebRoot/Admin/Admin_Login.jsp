<%@ page language="java"  pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.jwebsite.pub.*" %>
<%@page import="com.jwebsite.vo.Admin"%>
<% 

if(!(request.getParameter("Action")==null||"".equals(request.getParameter("Action"))))
{
 if(request.getParameter("admin_name")==null||"".equals(request.getParameter("admin_name")))
 {
  JS.ErrCode(response,"请输入用户名称！！");
  JS.goBack(response,-1);
  return;
 }
 if(request.getParameter("password")==null||"".equals(request.getParameter("password")))
 {
 JS.ErrCode(response,"请输入密码！！");
 JS.goBack(response,-1);
 return;
 }
 if(request.getParameter("VerifyCode")==null||"".equals(request.getParameter("VerifyCode")))
 {
 JS.ErrCode(response,"验证码不能为空！！");
 JS.goBack(response,-1);
 return;
}
 String admin_name=request.getParameter("admin_name");
 String password=request.getParameter("password");

 MD5 md5=new MD5(password);
 String admin_passwd=md5.compute();
 
System.out.print(admin_passwd);

String verifyCode=request.getParameter("VerifyCode");
 String rand=(String)session.getAttribute("rand");

  if(!DAOFactory.getAdminDaoInstance().checkAdmin(admin_name,admin_passwd))
  {
   JS.ErrCode(response,"用户名或密码错误!!");
   JS.goBack(response,-1);
   return;
  }else{
   Admin adm=new Admin();
   adm=DAOFactory.getAdminDaoInstance().getAdminInfo(admin_name);
   Admin admin=new Admin();
   admin.setLastLoginIP(request.getLocalAddr());
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
	
	admin.setLastLoginTime(nowDateTime);
	admin.setLoginTimes(adm.getLoginTimes()+1);
	admin.setAdminName(admin_name);
	DAOFactory.getAdminDaoInstance().setAdminLoginInfo(admin);
	session.setAttribute("AdminName",admin_name);
	session.setAttribute("AdminID",adm.getId());
	session.setAttribute("SiteID","1");
   JS.goURL(response,"Admin_Index.jsp");
  }
 
 }



%>
<HTML><HEAD>
<TITLE>后台登录</TITLE>
<META http-equiv=Content-Type content=text/html;charset=utf-8>
<STYLE>
.tableborder {
	BORDER-RIGHT: #737373 1px solid; BORDER-TOP: #bbbbbb 1px solid; BORDER-LEFT: #bbbbbb 1px solid; BORDER-BOTTOM: #737373 1px solid; BACKGROUND-COLOR: #d8dbd7
}
.setupheader {
	FONT-WEIGHT: bold; FONT-SIZE: 14px; COLOR: #ffffff; BACKGROUND-COLOR: #454545
}
.button {
	FONT-SIZE: 12px; CURSOR: pointer; COLOR: #000000; FONT-FAMILY: Tahoma, Verdana, Arial; HEIGHT: 22px
}
.topheader {
	PADDING-RIGHT: 3px; PADDING-LEFT: 3px; FONT-WEIGHT: bold; PADDING-BOTTOM: 3px; COLOR: #ffffff; PADDING-TOP: 3px; BACKGROUND-COLOR: #336699
}
.header_box {
	PADDING-RIGHT: 1px; PADDING-LEFT: 1px; PADDING-BOTTOM: -1px; VERTICAL-ALIGN: middle; PADDING-TOP: 1px; HEIGHT: 1px; BACKGROUND-COLOR: #ffffff;
}
.header_box1 {
	PADDING-RIGHT: 1px; PADDING-LEFT: 1px; PADDING-BOTTOM: 1px; VERTICAL-ALIGN: middle; PADDING-TOP: 1px; HEIGHT: 1px; BACKGROUND-COLOR: #ffffff;
}
.install_box {
	PADDING-RIGHT: 1px; PADDING-LEFT: 1px; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; BACKGROUND-COLOR: #d4d0c8
}
.firsthr {
	BACKGROUND-COLOR: #808080
}
.secondhr {
	BACKGROUND-COLOR: #ffffff
}
td {
	font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;
	font-size:12px;
}
</STYLE>
<META content="MSHTML 6.00.2900.5848" name=GENERATOR>
</HEAD>
<BODY topMargin=30>
<form action="Admin_Login.jsp?Action=Save" method="post" name="">
<TABLE class=tableborder cellSpacing=1 cellPadding=0 width=496 align=center border=0>
		  
  <TBODY>
  <TR>
    <TD>
      <DIV class=topheader>&nbsp;&nbsp;庆阳时空CMS后台登录 　　　　　　　　　　　　</DIV>
      <DIV class=header_box></DIV>
      <DIV class=install_box>
		    <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td colspan="3">&nbsp;</td>
              </tr>
              <tr> 
                <td width="48%" align="right">用户名: 
                  <input name="admin_name" type="text" style="width:92px" value=""></td>
                <td width="3%" align="left">&nbsp;</td>
                <td width="48%" align="left"> 记住用户名 
                  <input name="AutoGet" type="checkbox" id="AutoGet" value="1" ></td>
              </tr>
              <tr> 
                <td align="right"> 密　码: 
                  <input name="password" type="password" style="width:92px;FONT-SIZE:12px;"></td>
                <td align="left">&nbsp;</td>
                <td align="left"> 验　证　码: 
                  <input name="VerifyCode" type="text" size="4"> 
                  <img alt="验证码" src="ViImage.jsp">
                </td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
              </tr>
            </table>
      <TABLE cellSpacing=0 cellPadding=2 width="100%" border=0>
        <TBODY>
        <TR>
          <TD>
            <DIV class=firsthr style="HEIGHT: 1px"><IMG height=1 alt="" src="" 
            width=1></DIV>
            <DIV class=secondhr style="HEIGHT: 1px"><IMG height=1 alt="" src="" 
            width=1></DIV></TD></TR></TBODY></TABLE>
    <DIV align=right>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td align="right">
		  	<input class=button  type=submit value='  登录  '>&nbsp;&nbsp;
            <input class=button onClick="javascript:window.opener=null;window.close();" type=button value='  关闭   '>
            &nbsp;&nbsp;</td>
        </tr>
        <tr>
          <td align="right">&nbsp;</td>
        </tr>
      </table>
    </DIV></DIV></TD></TR>
</TBODY>
</TABLE></form>
<script language="JavaScript" type="text/javascript" >
CheckBrowerVersion();
//var ErrInfo='<%//Request("ErrInfo")%>';
function CheckBrowerVersion()
{
	var MajorVer=navigator.appVersion.match(/MSIE (.)/)[1];
	var MinorVer=navigator.appVersion.match(/MSIE .\.(.)/)[1];
	var IE6OrMore=MajorVer>= 5.5||(MajorVer>=5.5&&MinorVer>=5.5);
	if (!IE6OrMore)
	{
		alert('IE浏览器版本太低，系统将不能正常运行。点击确定将带你到下载地址！');
		location.href="http://nj.onlinedown.net/soft/17441.htm"
		document.all.BtnSubmit.disabled=true;
	}
}
//if (ErrInfo!='') alert(ErrInfo);
</script>

</BODY></HTML>



