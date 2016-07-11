<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../PubPackage.jsp"%>
<%
String adminPopNum="POP000106";
List<SiteClass> sclist=DAOFactory.getSiteClassDao().queryTopClassList();
if(!DAOFactory.getAdminDaoInstance().checkAdminPopedom(Integer.parseInt(session.getAttribute("AdminID").toString()),adminPopNum))
{
 JS.ErrCode(response,"你没有足够的权限！请与管理员联系！");
 JS.goBack(response,-1);
 return;
}
		if (!(request.getParameter("Action") == null|| "".equals(request.getParameter("Action")))) {
		String action = request.getParameter("Action");
		if ("SaveAdd".equals(action)) {
			int classID = 0;
			if (request.getParameter("ClassID") == null||"".equals(request.getParameter("ClassID")))
			{
			 JS.ErrCode(response,"请选择新闻分类！");
		     JS.goBack(response,-1);
			}else{
			classID = Integer.parseInt(request.getParameter("ClassID"));
		    if(!DAOFactory.getAdminDaoInstance().checkAdminInputPop(Integer.parseInt(session.getAttribute("AdminID").toString()),classID))
		    {
		       JS.ErrCode(response,"你没有足够的权限在此栏目添加文章！请与管理员联系！");
			   JS.goBack(response,-1);
			   return;
		    }
			}
			String title = request.getParameter("Title").trim();
			String keyword = request.getParameter("Keyword").trim();			
			//文章内容
			String content = request.getParameter("Content");			
			//WordFileUrl			
			String WordFileUrl=request.getParameter("WordFileUrl");
			TransformFiletoHtml  th=new TransformFiletoHtml();			
		    String url = this.getServletContext().getRealPath("/");			
			String docfile=url+ WordFileUrl;			
			System.out.println("Word 文档路径 :"+docfile);			
			String htmlfile=url+ WordFileUrl.replace(".doc",".html");			
			//word 转化成 html 
			th.wordToHtml(docfile,htmlfile);			
			WebContent  wc=new WebContent();			
		    String htm=wc.getOneHtml("file:///"+htmlfile);		    
		    Date d=new Date();		
		    SimpleDateFormat sdf = new SimpleDateFormat("yyyy");		    
		    String htmlfilename=htmlfile.substring(htmlfile.indexOf(sdf.format(d)),htmlfile.length());
		    
		    String path = request.getContextPath();
            String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
		    
			String oldChar=htmlfilename.replace(".html",".files");
			String newChar=basePath+"UserFiles/File/"+oldChar;
			
			//替换一些无用的样式
			htm =htm.replace(oldChar, newChar);
			htm =htm.replace("src","   src");	
			htm =htm.replace("spanstyle","span   style");
			htm =htm.replace("spanlang","span   lang");	
			htm =htm.replace("<u><span lang=EN-US>","<U><SPAN lang=EN-US><SPAN style=\"mso-spacerun: yes\">");
			htm =htm.replace("</span></u>","</SPAN></SPAN></U>");
			htm =htm.replace("EN-US","  EN-US  ");	
			htm =htm.replace("width","  width");
			htm =htm.replace("class","  class");
			htm =htm.replace("class","  class");		   
			htm =htm.replace("?","\\u3007");
		    
		    System.out.print(htm);	
			content=htm;			
			System.out.println(htmlfilename);
			//删除word文档源文件
			File deldoc=new File(docfile);
            deldoc.delete();
			//删除HTML文档源文件
			File delhtml=new File(htmlfile);
			delhtml.delete();
		
			 //添加文章内容结束			 
			int includePic = 0;
			if (!(request.getParameter("IncludePic") == null || "".equals(request.getParameter("IncludePic"))))
		includePic = Integer.parseInt(request.getParameter("IncludePic"));
			String defaultPicUrl = request.getParameter("DefaultPicUrl").trim();
			int includeFile = 0;
			if (!(request.getParameter("IncludeFile") == null || "".equals(request.getParameter("IncludeFile"))))
		includeFile = Integer.parseInt(request.getParameter("IncludeFile"));
			String uploadFiles = request.getParameter("UploadFiles").trim();
			int paginationType = 0;
			if (request.getParameter("PaginationType") != null)
		paginationType = Integer.parseInt(request.getParameter("PaginationType"));
			int maxCharPerPage = 0;
			if (request.getParameter("MaxCharPerPage") != null)
		maxCharPerPage = Integer.parseInt(request.getParameter("MaxCharPerPage"));
			int status = 0;
			if (request.getParameter("Status") != null)
		    status = Integer.parseInt(request.getParameter("Status"));
			String specialID = "";
			if(!(request.getParameterValues("SpecialID")==null||"".equals(request.getParameterValues("SpecialID"))))
			{
			String spID[]=request.getParameterValues("SpecialID");
			for(int i=0;i<spID.length;i++)
			{
			specialID=specialID+spID[i]+",";			
			}
			}
			int onTop = 0;
			if (!(request.getParameter("OnTop") == null||"".equals(request.getParameter("OnTop"))))
		       onTop = Integer.parseInt(request.getParameter("OnTop"));
			int elite = 0;
			if (!(request.getParameter("Elite") == null||"".equals(request.getParameter("Elite"))))
		       elite = Integer.parseInt(request.getParameter("Elite"));
			String updateTime = request.getParameter("UpdateTime");
			Article article = new Article();
			article.setTitle(title);
			article.setClassID(classID);
			article.setKeyword(keyword);
			article.setInputer((String)session.getAttribute("AdminName"));
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
%>
<html>
	<head>
		<title>文章管理</title>
		<meta http-equiv='Content-Type' content='text/html; charset=utf-8'>
		<link href='../CSS/Admin_Style.css' rel='stylesheet' type='text/css'>	
	</head>
	<body leftmargin='2' topmargin='0' marginwidth='0' marginheight='0'>
		<%@include  file="navbar.jsp" %>
		<br>
		<br>
		<table class='border' align='center' border='0' cellpadding='2'
			cellspacing='1'>
			<tr class='title'>
				<td height='22' align='center' colspan='2'>
					<b>添加文章成功</b>
				</td>
			</tr>
			<tr class='tdbg'>
				<td width='100' align='right' class='tdbg5'>
					<strong>文章标题：</strong>
				</td>
				<td width='400'>
					<%=title %>
				</td>
			</tr>
			<tr class='tdbg'>
				<td width='100' align='right' class='tdbg5'>
					<strong>关 键 字：</strong>
				</td>
				<td width='400'>
					<%=keyword %>
				</td>
			</tr>
			<tr class='tdbg'>
				<td width='100' align='right' class='tdbg5'>
					<strong>文章状态：</strong>
				</td>
				<td width='400'>
					<%
					if(status==-1)
					    out.println("草稿");
					if(status==0)
					   out.println("待审核");
					if(status==1)
					   out.println("已审核");
					
					
					 %>
				</td>
			</tr>
			<tr class='tdbg' align='center'>
				<td height='30' colspan='2'>
					【
					<a
						href='Admin_Article_Add.jsp'>继续添加文章</a>】&nbsp;【
					<a href='Admin_Article_List.jsp'>文章管理</a>】
				</td>
			</tr>
		</table>
	</body>
</html>
<%
	}

	}

%>
