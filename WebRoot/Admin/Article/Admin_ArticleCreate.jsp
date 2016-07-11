<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="../PubPackage.jsp"%>
<%
if(request.getParameter("Action")==null||"".equals(request.getParameter("Action")))
{
 String action=request.getParameter("Action");
 if("SaveAdd".equals(action))
 {
  int classID=0;
  if(request.getParameter("ClassID")!=null)
    classID=Integer.parseInt(request.getParameter("ClassID"));
  String title=request.getParameter("Title").trim();
  String keyword=request.getParameter("Keyword").trim();
  String content=request.getParameter("Content");
  int includePic=0;
  if(!(request.getParameter("IncludePic")==null||"".equals(request.getParameter("IncludePic"))))
    includePic=Integer.parseInt(request.getParameter("IncludePic"));
  String defaultPicUrl=request.getParameter("DefaultPicUrl").trim();
  int includeFile=0;
  if(!(request.getParameter("IncludeFile")==null||"".equals(request.getParameter("IncludeFile"))))
   includeFile=Integer.parseInt("IncludeFile");
  String uploadFiles=request.getParameter("UploadFiles").trim();
  int paginationType=0;
  if(request.getParameter("PaginationType")!=null)
    paginationType=Integer.parseInt(request.getParameter("PaginationType"));  
  int maxCharPerPage=0;
  if(request.getParameter("MaxCharPerPage")!=null)
    maxCharPerPage=Integer.parseInt(request.getParameter("MaxCharPerPage"));
  int status=0;
  if(request.getParameter("Status")!=null)
    status=Integer.parseInt(request.getParameter("Status"));
  String specialID=request.getParameter("SpecialID");
  int onTop=0;
  if(request.getParameter("OnTop")!=null)
    onTop=Integer.parseInt(request.getParameter("OnTop"));
  int elite=0;
  if(request.getParameter("Elite")!=null)
    elite=Integer.parseInt(request.getParameter("Elite"));
    String updateTime=request.getParameter("UpdateTime");
    Article article=new Article();
    article.setTitle(title);
    article.setClassID(classID);
    article.setKeyword(keyword);
    article.setContent(content);
    article.setIncludePic(includePic);
    article.setDefaultPicUrl(defaultPicUrl);
    article.setIncludeFile(includeFile);
    article.setUploadFiles(uploadFiles);
    article.setPaginationType(paginationType);
    article.setStatus(status);
    article.setMaxCharPerPage(maxCharPerPage);
    article.setSpecialID(specialID);
    article.setOnTop(onTop);
    article.setElite(elite);
    article.setUpdateTime(updateTime);
    DAOFactory.getArticleDAOInstance().insertArticle(article); 
   }
}
 %>

