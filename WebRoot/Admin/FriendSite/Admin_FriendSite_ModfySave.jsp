<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="../PubPackage.jsp"%>
<%
if(!(request.getParameter("Action")==null||"".equals(request.getParameter("Action"))))
{
  String action=request.getParameter("Action");
  int id;
  if("Save".equals(action))
  {
    int classID;
   if(request.getParameter("ID")==null||"".equals(request.getParameter("ID")))
   {
     JS.AlertCode(response,"参数传递错误！");
     JS.goBack(response,-1);
     return;
   }
   else
   {
    id=Integer.parseInt(request.getParameter("ID"));
   }
   FriendSite friendSite=new FriendSite();
 
  if(request.getParameter("ClassID")==null||"".equals(request.getParameter("ClassID")))
    classID=0;
  else
    classID=Integer.parseInt(request.getParameter("ClassID"));
    
  String siteName=request.getParameter("SiteName").trim();
  String siteUrl=request.getParameter("SiteUrl").trim();
  String logoUrl=request.getParameter("DefaultPicUrl").trim();
  String siteEmail=request.getParameter("SiteEmail").trim();
  String siteIntro=request.getParameter("SiteIntro").trim();
  String upDateTime=request.getParameter("UpdateTime").trim();
  friendSite.setID(id);
  friendSite.setClassID(classID);
  friendSite.setSiteName(siteName);
  friendSite.setSiteUrl(siteUrl);
  friendSite.setLogoUrl(logoUrl);
  friendSite.setSiteEmail(siteEmail);
  friendSite.setSiteIntro(siteIntro);
  friendSite.setUpdateTime(upDateTime);
  System.out.println(id);
  DAOFactory.getFriendSiteDao().updateFs(friendSite);
  JS.goURL(response,"Admin_FriendSite.jsp");
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
    id=Integer.parseInt(request.getParameter("ID"));
   }
  FriendSite friendSite=new FriendSite();
  friendSite.setID(id);
  DAOFactory.getFriendSiteDao().delFs(friendSite);
  JS.goURL(response,"Admin_FriendSite.jsp");
 }
 if("NumDel".equals(action))
 {
  String fsID[]=request.getParameterValues("ID");
  for(int i=0;i<fsID.length;i++)
  {
    FriendSite friendSite=new FriendSite();
    friendSite.setID(Integer.parseInt(fsID[i]));
    DAOFactory.getFriendSiteDao().delFs(friendSite);
  }
  JS.goURL(response,"Admin_FriendSite.jsp");
 }
 }
%>

