<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="../PubPackage.jsp"%>
<%
	String action = request.getParameter("Action");
	//保存修改
	if(action.equals("SaveModfy")){
	  if(request.getParameter("ArticleID") == null|| "".equals(request.getParameter("ArticleID"))){
			JS.AlertCode(response, "参数传递错误！");
			JS.goBack(response, -1);
			return;
		}else{
			int classID = 0;
			if (request.getParameter("ClassID") == null||"".equals(request.getParameter("ClassID")))
			{
			 JS.ErrCode(response,"请选择新闻分类！");
		     JS.goBack(response,-1);
			}else{
			classID = Integer.parseInt(request.getParameter("ClassID"));
			if(!DAOFactory.getAdminDaoInstance().checkAdminInputPop(Integer.parseInt(session.getAttribute("AdminID").toString()),classID))
		    {
		       JS.ErrCode(response,"你没有足够的权限！请与管理员联系！");
			   JS.goBack(response,-1);
			   return;
		    }
			}
			String title = request.getParameter("Title").trim();
			String keyword = request.getParameter("Keyword").trim();						
			String content = request.getParameter("Content");
			
			int includePic = 0;
			if (!(request.getParameter("IncludePic") == null || "".equals(request.getParameter("IncludePic")))){
			includePic = Integer.parseInt(request.getParameter("IncludePic"));
			}		    
			String defaultPicUrl = request.getParameter("DefaultPicUrl").trim();
			int includeFile = 0;
			if (!(request.getParameter("IncludeFile") == null || "".equals(request.getParameter("IncludeFile")))){
			includeFile = Integer.parseInt(request.getParameter("IncludeFile"));
			}		    
			String uploadFiles = request.getParameter("UploadFiles").trim();
			int paginationType = 0;
			if (request.getParameter("PaginationType") != null){
			paginationType = Integer.parseInt(request.getParameter("PaginationType"));
			}		    
			int maxCharPerPage = 0;
			if (request.getParameter("MaxCharPerPage") != null){
			maxCharPerPage = Integer.parseInt(request.getParameter("MaxCharPerPage"));
			}		    
			int status = 0;
			if (request.getParameter("Status") != null){
			 status = Integer.parseInt(request.getParameter("Status"));
			}		   
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
			if (!(request.getParameter("OnTop") == null||"".equals(request.getParameter("OnTop")))){
			onTop = Integer.parseInt(request.getParameter("OnTop"));
			}		       
			int elite = 0;
			if (!(request.getParameter("Elite") == null||"".equals(request.getParameter("Elite")))){
			elite = Integer.parseInt(request.getParameter("Elite"));
			}
			String updateTime = request.getParameter("UpdateTime");
			
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
		       
			
	        int articleID=0;
			articleID=Integer.parseInt(request.getParameter("ArticleID"));			
			Article article = new Article();
			article.setArticleID(articleID);
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
			article.setAbstract(Abstract);
			article.setURL(URL);
			article.setReadPoint(Integer.parseInt(ReadPoint));
			article.setListOrder(Integer.parseInt(ListOrder));
			article.setIsLink(Integer.parseInt(IsLink));
					
			DAOFactory.getArticleDAOInstance().updateArticle(article);
			JS.goURL(response,"Admin_Article_List.jsp");
		}
	}
	if (action.equals("Del")) {
	    String adminPopNum="POP000107";
		if(!DAOFactory.getAdminDaoInstance().checkAdminPopedom(Integer.parseInt(session.getAttribute("AdminID").toString()),adminPopNum))
		{
		 JS.ErrCode(response,"你没有足够的权限！请与管理员联系！");
		 JS.goBack(response,-1);
		 return;
		}
		if(request.getParameter("ArticleID") == null|| "".equals(request.getParameter("ArticleID"))) {
			JS.AlertCode(response, "参数传递错误！");
			JS.goBack(response, -1);
			return;
		}else{
			int articleID = Integer.parseInt(request.getParameter("ArticleID"));
			DAOFactory.getArticleDAOInstance().recArticle(articleID);
			JS.goURL(response, "Admin_Article_List.jsp");

		}
	}
	if(action.equals("SetOnTop")) {
		if (request.getParameter("ArticleID") == null|| "".equals(request.getParameter("ArticleID"))) {
			JS.AlertCode(response, "参数传递错误！");
			JS.goBack(response, -1);
			return;
		}else{
			int articleID = Integer.parseInt(request.getParameter("ArticleID"));			
			DAOFactory.getArticleDAOInstance().setOnTop(articleID, "set");
			JS.goURL(response, "Admin_Article_List.jsp");
		}

	}
	if (action.equals("NoOnTop")) {
		if (request.getParameter("ArticleID") == null|| "".equals(request.getParameter("ArticleID"))) {
			JS.AlertCode(response, "参数传递错误！");
			JS.goBack(response, -1);
			return;
		} else {
			int articleID = Integer.parseInt(request.getParameter("ArticleID"));			
			DAOFactory.getArticleDAOInstance().setOnTop(articleID, "no");
			JS.goURL(response, "Admin_Article_List.jsp");
		}
	}
	
	if (action.equals("SetElite")) {
		if (request.getParameter("ArticleID") == null|| "".equals(request.getParameter("ArticleID"))) {
			JS.AlertCode(response, "参数传递错误！");
			JS.goBack(response, -1);
			return;
		} else {
			int articleID = Integer.parseInt(request.getParameter("ArticleID"));			
			DAOFactory.getArticleDAOInstance().setElite(articleID, "set");
			JS.goURL(response, "Admin_Article_List.jsp");

		}

	}
	if (action.equals("NoElite")) {
		if (request.getParameter("ArticleID") == null
		|| "".equals(request.getParameter("ArticleID"))) {
			JS.AlertCode(response, "参数传递错误！");
			JS.goBack(response, -1);
			return;
		} else {
			int articleID = Integer.parseInt(request.getParameter("ArticleID"));			
			DAOFactory.getArticleDAOInstance().setElite(articleID, "no");
			JS.goURL(response, "Admin_Article_List.jsp");

		}

	}
	//批量将文章移到回收站
	if(action.equals("NumDel"))
	{
         String adminPopNum="POP000107";
			if(!DAOFactory.getAdminDaoInstance().checkAdminPopedom(Integer.parseInt(session.getAttribute("AdminID").toString()),adminPopNum))
			{
			 JS.ErrCode(response,"你没有足够的权限！请与管理员联系！");
			 JS.goBack(response,-1);
			 return;
			}
        
         if(request.getParameterValues("ArticleID")==null||"".equals(request.getParameterValues("ArticleID")))
         {
           JS.AlertCode(response,"至少选择一条记录删除！");
           JS.goBack(response,-1);
         }
         else
         {
	      String articleID[]=request.getParameterValues("ArticleID");
		  for(int i=0;i<articleID.length;i++)
		  {
		    DAOFactory.getArticleDAOInstance().recArticle(Integer.parseInt(articleID[i]));
		  }
		  JS.goURL(response,"Admin_Article_List.jsp");
		  }

	}
	//审核通过新闻
	if (action.equals("SetPassed")) {
	    String adminPopNum="POP000118";
		if(!DAOFactory.getAdminDaoInstance().checkAdminPopedom(Integer.parseInt(session.getAttribute("AdminID").toString()),adminPopNum))
		{
		 JS.ErrCode(response,"你没有足够的权限！请与管理员联系！");
		 JS.goBack(response,-1);
		 return;
		}
		if (request.getParameter("ArticleID") == null|| "".equals(request.getParameter("ArticleID"))) {
			JS.AlertCode(response, "参数传递错误！");
			JS.goBack(response, -1);
			return;
		} else {		
			int articleID = Integer.parseInt(request.getParameter("ArticleID"));
			DAOFactory.getArticleDAOInstance().checkArticle(articleID, "set");			
			int getNum = Integer.parseInt(request.getParameter("getNum"));
			DAOFactory.getArticleDAOInstance().checkArticle(articleID,"setNum");			
			System.out.println("文章编号："+articleID);			
			Article art=DAOFactory.getArticleDAOInstance().queryOneArticle(articleID);			
			//得到文章作者
			String Inputer=art.getInputer();			
			System.out.println("作者 ："+Inputer);
			
			//得到作者所属部门
			Admin admin=DAOFactory.getAdminDaoInstance().getAdminInfo(Inputer);
			
			System.out.println("作者所属部门 编号  ："+admin.getSendmessageid());
			
			SendMessage sendMessage=DAOFactory.getSendMessageDaoInstance().queryOneSendMessage(admin.getSendmessageid());
			
			//修改该部门应得分数
		    int deptNum=sendMessage.getFenshu();
		    
		    System.out.println("分数1===："+deptNum);
		    	
		    if(getNum==0){
		    getNum=1;
		    }
		    System.out.println("分数2== getNum=："+getNum);
			deptNum += getNum;
			System.out.println("分数=和 ==："+deptNum);
			sendMessage.setFenshu(deptNum);
			System.out.println("部门名称："+sendMessage.getDeptname()+" 分数： "+sendMessage.getFenshu());
			
			DAOFactory.getSendMessageDaoInstance().upDateSendMessage(sendMessage);
						
			JS.goURL(response, "Admin_Article_Check.jsp");

		}

	}
	//直接退回保存为草稿
	if (action.equals("Reject")) {
	    String adminPopNum="POP000120";
		if(!DAOFactory.getAdminDaoInstance().checkAdminPopedom(Integer.parseInt(session.getAttribute("AdminID").toString()),adminPopNum))
		{
		 JS.ErrCode(response,"你没有足够的权限！请与管理员联系！");
		 JS.goBack(response,-1);
		 return;
		}
		if (request.getParameter("ArticleID") == null
		|| "".equals(request.getParameter("ArticleID"))) {
			JS.AlertCode(response, "参数传递错误！");
			JS.goBack(response, -1);
			return;
		} else {
			int articleID = Integer.parseInt(request
			.getParameter("ArticleID"));
			DAOFactory.getArticleDAOInstance().checkArticle(articleID, "get");
			JS.goURL(response, "Admin_Article_Check.jsp");

		}

	}
	//批量审核新闻
	if(action.equals("NumSetPassed"))
	{
	    String adminPopNum="POP000118";
		if(!DAOFactory.getAdminDaoInstance().checkAdminPopedom(Integer.parseInt(session.getAttribute("AdminID").toString()),adminPopNum))
		{
		 JS.ErrCode(response,"你没有足够的权限！请与管理员联系！");
		 JS.goBack(response,-1);
		 return;
		}
	    if(request.getParameterValues("ArticleID")==null||"".equals(request.getParameterValues("ArticleID")))
         {
           JS.AlertCode(response,"至少选择一条记录！");
           JS.goBack(response,-1);
         }
         else
         {
	      String articleID[]=request.getParameterValues("ArticleID");
		  for(int i=0;i<articleID.length;i++)
		  {
		    DAOFactory.getArticleDAOInstance().checkArticle(Integer.parseInt(articleID[i]),"set");
		  }
		  JS.goURL(response,"Admin_Article_List.jsp");
		  }
	
	
	}
	//批量取消新闻审核NumCancelPassed
	if(action.equals("NumCancelPassed"))
	{
	    String adminPopNum="POP000118";
		if(!DAOFactory.getAdminDaoInstance().checkAdminPopedom(Integer.parseInt(session.getAttribute("AdminID").toString()),adminPopNum))
		{
		 JS.ErrCode(response,"你没有足够的权限！请与管理员联系！");
		 JS.goBack(response,-1);
		 return;
		}
	    
	    if(request.getParameterValues("ArticleID")==null||"".equals(request.getParameterValues("ArticleID")))
         {
           JS.AlertCode(response,"至少选择一条记录！");
           JS.goBack(response,-1);
         }
         else
         {
	      String articleID[]=request.getParameterValues("ArticleID");
		  for(int i=0;i<articleID.length;i++)
		  {
		    DAOFactory.getArticleDAOInstance().checkArticle(Integer.parseInt(articleID[i]),"no");
		  }
		  JS.goURL(response,"Admin_Article_List.jsp");
		  }
	
	
	}
	//彻底删除
	if(action.equals("ConfirmDel"))
	{
			if (request.getParameter("ArticleID") == null
		|| "".equals(request.getParameter("ArticleID"))) {
			JS.AlertCode(response, "参数传递错误！");
			JS.goBack(response, -1);
			return;
		} else {
			int articleID = Integer.parseInt(request
			.getParameter("ArticleID"));
			DAOFactory.getArticleDAOInstance().delArticle(articleID);
			JS.goURL(response, "Admin_Article_Recyclebin.jsp");

		}
	
	}
	//批量彻底删除
	if(action.equals("NumConfirmDel"))
	{
	  if(request.getParameterValues("ArticleID")==null||"".equals(request.getParameterValues("ArticleID")))
         {
           JS.AlertCode(response,"至少选择一条记录！");
           JS.goBack(response,-1);
         }
         else
         {
	      String articleID[]=request.getParameterValues("ArticleID");
		  for(int i=0;i<articleID.length;i++)
		  {
		    DAOFactory.getArticleDAOInstance().delArticle(Integer.parseInt(articleID[i]));
		  }
		  JS.goURL(response,"Admin_Article_Recyclebin.jsp");
		  }
	
	}
	//还原文章
	if(action.equals("Restore"))
	{
	  	if (request.getParameter("ArticleID") == null
		|| "".equals(request.getParameter("ArticleID"))) {
			JS.AlertCode(response, "参数传递错误！");
			JS.goBack(response, -1);
			return;
		} else {
			int articleID = Integer.parseInt(request
			.getParameter("ArticleID"));
			DAOFactory.getArticleDAOInstance().restoreArticle(articleID,"one");
			JS.goURL(response, "Admin_Article_Recyclebin.jsp");

		}
	
	}
	//批量还原
	if(action.equals("NumRestore"))
	{
	if(request.getParameterValues("ArticleID")==null||"".equals(request.getParameterValues("ArticleID")))
         {
           JS.AlertCode(response,"至少选择一条记录！");
           JS.goBack(response,-1);
         }
         else
         {
	      String articleID[]=request.getParameterValues("ArticleID");
		  for(int i=0;i<articleID.length;i++){
		    DAOFactory.getArticleDAOInstance().restoreArticle(Integer.parseInt(articleID[i]),"one");
		     }
		  JS.goURL(response,"Admin_Article_Recyclebin.jsp");
		  }
	
	
	}
	//还原所有文章
	if(action.equals("NumRestoreAll"))
	{
	  DAOFactory.getArticleDAOInstance().restoreArticle(0,"all");
      JS.goURL(response,"Admin_Article_Recyclebin.jsp");	
	}
	// 清空回收站
	if(action.equals("ClearRecyclebin"))
	{	
	DAOFactory.getArticleDAOInstance().clearRecyclebin();
	JS.goURL(response,"Admin_Article_Recyclebin.jsp");
	}
%>
