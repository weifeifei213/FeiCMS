<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../PubPackage.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
	
	if (!(request.getParameter("Action") == null || "".equals(request.getParameter("Action")))) {
		String action = request.getParameter("Action");
		if ("SaveAdd".equals(action)) {
			int classID = 0;
			if (request.getParameter("ClassID") == null	|| "".equals(request.getParameter("ClassID"))) {
				JS.ErrCode(response, "请选择新闻分类！");
				JS.goBack(response, -1);
			} else {
				classID = Integer.parseInt(request.getParameter("ClassID"));
				if (!DAOFactory.getAdminDaoInstance().checkAdminInputPop(
					Integer.parseInt(session.getAttribute("AdminID").toString()), classID)) {
					JS.ErrCode(response, "你没有足够的权限在此栏目添加文章！请与管理员联系！");
					JS.goBack(response, -1);
					return;
				}
			}
			String title = request.getParameter("Title").trim();
			String keyword = request.getParameter("Keyword").trim();
			String content = request.getParameter("Content");
			int includePic = 0;
			if (!(request.getParameter("IncludePic") == null || "".equals(request.getParameter("IncludePic")))) {
				includePic = Integer.parseInt(request.getParameter("IncludePic"));
			}
			String defaultPicUrl = request.getParameter("DefaultPicUrl").trim();
			int includeFile = 0;
			if (!(request.getParameter("IncludeFile") == null || "".equals(request.getParameter("IncludeFile")))) {
				includeFile = Integer.parseInt(request.getParameter("IncludeFile"));
			}
			String uploadFiles = request.getParameter("UploadFiles").trim();
			int paginationType = 0;
			if (request.getParameter("PaginationType") != null) {
				paginationType = Integer.parseInt(request.getParameter("PaginationType"));
			}
			int maxCharPerPage = 0;
			if (request.getParameter("MaxCharPerPage") != null)
				maxCharPerPage = Integer.parseInt(request.getParameter("MaxCharPerPage"));
			int status = 0;
			if (request.getParameter("Status") != null) {
				status = Integer.parseInt(request.getParameter("Status"));
			}
			String specialID = "";
			if (!(request.getParameterValues("SpecialID") == null || "".equals(request.getParameterValues("SpecialID")))) {
				String spID[] = request.getParameterValues("SpecialID");
				for (int i = 0; i < spID.length; i++) {
					specialID = specialID + spID[i] + ",";
				}
			}
			int onTop = 0;
			if (!(request.getParameter("OnTop") == null || "".equals(request.getParameter("OnTop")))){
			onTop = Integer.parseInt(request.getParameter("OnTop"));
			}				
			int elite = 0;
			if (!(request.getParameter("Elite") == null || "".equals(request.getParameter("Elite")))){
			elite = Integer.parseInt(request.getParameter("Elite"));
			}
				
			String updateTime = request.getParameter("UpdateTime");
			String CreateTime = request.getParameter("UpdateTime");
			//URL
			String URL=request.getParameter("URL");
			//ReadPoint
			String ReadPoint=request.getParameter("ReadPoint");
			//Abstract
			String Abstract=request.getParameter("Abstract");						
			//ListOrder
			String ListOrder=request.getParameter("ListOrder");
			//IsLink
			String IsLink=request.getParameter("IsLink");
			

			Article article = new Article();
			article.setTitle(title);
			article.setClassID(classID);
			article.setKeyword(keyword);
			article.setInputer((String) session.getAttribute("AdminName"));
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
			article.setCreateTime(CreateTime);
			article.setAbstract(Abstract);
			article.setURL(URL);
			article.setIsLink(Integer.parseInt(IsLink));
			article.setListOrder(Integer.parseInt(ListOrder));
			article.setReadPoint(Integer.parseInt(ReadPoint));
			article.setDeleted(0);
			article.setHits(0);

			DAOFactory.getArticleDAOInstance().insertArticle(article);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>文章管理</title>
		<meta http-equiv='Content-Type' content='text/html; charset=utf-8'>
		<link href='../CSS/Admin_Style.css' rel='stylesheet' type='text/css'>
		<link href='../CSS/Admin_Main.css' rel='stylesheet' type='text/css'>
	</head>
	<body leftmargin='2' topmargin='0' marginwidth='0' marginheight='0'>
		<table width='100%' border='0' align='center' cellpadding='2'
			cellspacing='1' class='border'>
			<tr class='topbg'>
				<td height='22' colspan='10'>
					<table width='100%'>
						<tr class='topbg'>
							<td align='center'>
								<b><br>内容管理----保存文章</b>
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
					<a href='Admin_Article_Check.jsp'>审核文章</a>&nbsp;|&nbsp;
					<a href='Admin_Article_Recyclebin.jsp'>文章回收站管理</a>
				</td>
			</tr>
		</table>
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
					<%=title%>
				</td>
			</tr>
			<tr class='tdbg'>
				<td width='100' align='right' class='tdbg5'>
					<strong>关 键 字：</strong>
				</td>
				<td width='400'>
					<%=keyword%>
				</td>
			</tr>
			<tr class='tdbg'>
				<td width='100' align='right' class='tdbg5'>
					<strong>文章状态：</strong>
				</td>
				<td width='400'>
					<%
								if (status == -1)
									out.println("草稿");
								if (status == 0)
									out.println("待审核");
								if (status == 1)
									out.println("已审核");
					%>
				</td>
			</tr>
			<tr class='tdbg' align='center'>
				<td height='30' colspan='2'>
					【
					<a href='Admin_Article_Add.jsp'>继续添加文章</a>】&nbsp;【
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

