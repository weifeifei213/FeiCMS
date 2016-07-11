<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="../PubPackage.jsp"%>
<%
	String action = request.getParameter("Action");
	//保存修改
	if(action.equals("SaveModfy"))
	{
	  if (request.getParameter("PhotoID") == null
		|| "".equals(request.getParameter("PhotoID"))) {
			JS.AlertCode(response, "参数传递错误！");
			JS.goBack(response, -1);
			return;
		} else {
			int Tid = 0;
			if (request.getParameter("Tid") == null||"".equals(request.getParameter("Tid")))
			{
			 JS.ErrCode(response,"请选择新闻分类！");
		     JS.goBack(response,-1);
			}
			else
			{
			Tid = Integer.parseInt(request.getParameter("Tid"));
			if(!DAOFactory.getAdminDaoInstance().checkAdminInputPop(Integer.parseInt(session.getAttribute("AdminID").toString()),Tid))
		    {
		       JS.ErrCode(response,"你没有足够的权限！请与管理员联系！");
			   JS.goBack(response,-1);
			   return;
		    }
			}
			int PhotoId=Integer.parseInt(request.getParameter("PhotoID"));
			String title = request.getParameter("Title").trim();
			String keyword = request.getParameter("KeyWords").trim();
			String content = request.getParameter("Content");
			
			String Author =request.getParameter("Author");
			String Origin =request.getParameter("Origin");//图片来源
			String Rank =request.getParameter("Rank");//图片等级
			String Status=request.getParameter("Status");		
			
									
			String defaultPicUrl = request
					.getParameter("DefaultPicUrl").trim();//缩略图
			
			String initPicUrls=request.getParameter("PicUrls");
			
           	
			//获取所有备注
			//解析图片路径
			
			
			Enumeration notename=request.getParameterNames();
			String PicUrlArr[]=initPicUrls.split("\\|");
									
			int i_pic=1;
			String PicUrls="";
			while(notename.hasMoreElements()){
					
			String name=(String)notename.nextElement();
			if(name.startsWith("picNote_")){
			System.out.println("进入判断 picNote："+i_pic);	
			String value=request.getParameter(name);
			if(i_pic<PicUrlArr.length){  
			System.out.println("进入判断 arr.length"+i_pic);	
			
			PicUrls+=PicUrlArr[i_pic]+"|"+value+"|";
			 i_pic++;
			 }			
			}		
			
			}			
			
			System.out.println("图片路径json"+PicUrls);
			
			
			int status = 0;
			if (request.getParameter("Status") != null)
				status = Integer.parseInt(request
						.getParameter("Status"));
			String specialID = "";
			if (!(request.getParameterValues("SpecialID") == null || ""
					.equals(request.getParameterValues("SpecialID")))) {
				String spID[] = request.getParameterValues("SpecialID");
				for (int i = 0; i < spID.length; i++) {
					specialID = specialID + spID[i] + ",";

				}
			}
			int IsTop = 0;
			if (!(request.getParameter("IsTop") == null || ""
					.equals(request.getParameter("IsTop"))))
				IsTop = Integer.parseInt(request.getParameter("IsTop"));
				
			int elite = 0;
			
			if (!(request.getParameter("Elite") == null || ""
					.equals(request.getParameter("Elite"))))
				elite = Integer.parseInt(request.getParameter("Elite"));
				
			
			
		    Photo photo = new Photo();
		    photo.setID(PhotoId);			
			photo.setTitle(title);
			photo.setTid(Tid+"");
			photo.setKeyWords(keyword);
			photo.setAuthor(Author);
			photo.setPhotoUrl(defaultPicUrl);
			photo.setPicUrls(PicUrls);
			photo.setPictureContent(content);
			photo.setOrigin(Origin);
			photo.setRank(Rank);
			photo.setInputer((String)session.getAttribute("AdminName"));
			
			photo.setAddDate(request.getParameter("AddDate"));//录入时间
			photo.setModifyDate(request.getParameter("AddDate"));//修改时间
			
			photo.setPageNum(Integer.parseInt(request.getParameter("PageNum")));
			photo.setShowstyle(Integer.parseInt(request.getParameter("showstyle")));
			
			photo.setHits(Integer.parseInt(request.getParameter("Hits")));
			photo.setHitsByDay(Integer.parseInt(request.getParameter("HitsByDay")));
			photo.setHitsByMonth(Integer.parseInt(request.getParameter("HitsByMonth")));
			photo.setHitsByWeek(Integer.parseInt(request.getParameter("HitsByWeek")));
			photo.setScore(Integer.parseInt(request.getParameter("Score")));
			
			//固定和推荐
			if(null!=request.getParameter("IsTop")&&!"".equals(request.getParameter("IsTop"))){
			photo.setIsTop(Integer.parseInt(request.getParameter("IsTop")));
			}else{
			photo.setIsTop(0);
			}
			if(null!=request.getParameter("Recommend")&&!"".equals(request.getParameter("Recommend"))){
			photo.setRecommend(Integer.parseInt(request.getParameter("Recommend")));
			}else{
			photo.setRecommend(0);
			}
			if(null!=request.getParameter("SpecialID")&&!"".equals(request.getParameter("SpecialID"))){
			photo.setSpecialID(Integer.parseInt(request.getParameter("SpecialID")));
			}			
			//搜索引擎优化
			photo.setSEOTitle(title);
			photo.setSEOKeyWord(keyword);
			photo.setSEODescript(content);
			photo.setStatus(status);
			
			
			DAOFactory.getPhotoDao().updatePhoto(photo);
			JS.goURL(response,"Admin_Photo_List.jsp");
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
		if (request.getParameter("PhotoID") == null
		|| "".equals(request.getParameter("PhotoID"))) {
			JS.AlertCode(response, "参数传递错误！");
			JS.goBack(response, -1);
			return;
		} else {
			int PhotoID = Integer.parseInt(request
			.getParameter("PhotoID"));
			//移到回收站								
			DAOFactory.getPhotoDao().recPhoto(PhotoID);
			
			JS.goURL(response, "Admin_Photo_List.jsp");

		}
	}
	if (action.equals("SetOnTop")) {
		if (request.getParameter("PhotoID") == null
		|| "".equals(request.getParameter("PhotoID"))) {
			JS.AlertCode(response, "参数传递错误！");
			JS.goBack(response, -1);
			return;
		} else {
			int ID = Integer.parseInt(request
			.getParameter("PhotoID"));
			
			DAOFactory.getPhotoDao().SetIsTop(ID,"set");
			JS.goURL(response, "Admin_Photo_List.jsp");

		}

	}
	if (action.equals("NoOnTop")) {
		if (request.getParameter("PhotoID") == null
		|| "".equals(request.getParameter("PhotoID"))) {
			JS.AlertCode(response, "参数传递错误！");
			JS.goBack(response, -1);
			return;
		} else {
			int ID = Integer.parseInt(request
			.getParameter("PhotoID"));
			
			DAOFactory.getPhotoDao().SetIsTop(ID,"no");
			JS.goURL(response, "Admin_Photo_List.jsp");

		}

	}
	
	if (action.equals("SetElite")) {
		if (request.getParameter("PhotoID") == null
		|| "".equals(request.getParameter("PhotoID"))) {
			JS.AlertCode(response, "参数传递错误！");
			JS.goBack(response, -1);
			return;
		} else {
			int ID = Integer.parseInt(request
			.getParameter("PhotoID"));
			
			DAOFactory.getPhotoDao().SetRecommend(ID,"set");
			JS.goURL(response, "Admin_Photo_List.jsp");

		}

	}
	if (action.equals("NoElite")) {
		if (request.getParameter("PhotoID") == null
		|| "".equals(request.getParameter("PhotoID"))) {
			JS.AlertCode(response, "参数传递错误！");
			JS.goBack(response, -1);
			return;
		} else {
			int ID = Integer.parseInt(request
			.getParameter("PhotoID"));
			
			DAOFactory.getPhotoDao().SetRecommend(ID,"no");
			JS.goURL(response, "Admin_Photo_List.jsp");

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
        
         if(request.getParameterValues("PhotoID")==null||"".equals(request.getParameterValues("PhotoID")))
         {
           JS.AlertCode(response,"至少选择一条记录删除！");
           JS.goBack(response,-1);
         }
         else
         {
	      String ID[]=request.getParameterValues("PhotoID");
		  for(int i=0;i<ID.length;i++)
		  {
		    DAOFactory.getPhotoDao().recPhoto(Integer.parseInt(ID[i]));
		  }
		  JS.goURL(response,"Admin_Photo_List.jsp");
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
		if (request.getParameter("PhotoID") == null
		|| "".equals(request.getParameter("PhotoID"))) {
			JS.AlertCode(response, "参数传递错误！");
			JS.goBack(response, -1);
			return;
		} else 
		if(null!=request.getParameter("getNum"))
		{
		
			int ID = Integer.parseInt(request
			.getParameter("PhotoID"));
		//	DAOFactory.getArticleDAOInstance().checkArticle(articleID, "set");
			
			int getNum = Integer.parseInt(request.getParameter("getNum"));
			
			DAOFactory.getPhotoDao().CheckPhoto(ID,getNum,"setScore");
			
			System.out.println("文章编号："+ID);
			
			ResultSet rs =null;
			rs=DAOFactory.getPhotoDao().quaryOnePhotoRS(ID);
			
			//得到文章作者
			String Inputer="";
			if(rs.next()){
			 Inputer = rs.getString("Inputer");
			}
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
			rs.close();
			
			JS.goURL(response, "Admin_Photo_Check.jsp");

		}else{
			int ID = Integer.parseInt(request
			.getParameter("PhotoID"));
	  	DAOFactory.getPhotoDao().CheckPhoto(ID,"set");
		JS.goURL(response, "Admin_Photo_Check.jsp");
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
		if (request.getParameter("PhotoID") == null
		|| "".equals(request.getParameter("PhotoID"))) {
			JS.AlertCode(response, "参数传递错误！");
			JS.goBack(response, -1);
			return;
		} else {
			int ID = Integer.parseInt(request
			.getParameter("PhotoID"));
			DAOFactory.getPhotoDao().CheckPhoto(ID, "get");
			JS.goURL(response, "Admin_Photo_Check.jsp");

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
	    if(request.getParameterValues("PhotoID")==null||"".equals(request.getParameterValues("PhotoID")))
         {
           JS.AlertCode(response,"至少选择一条记录！");
           JS.goBack(response,-1);
         }
         else
         {
	      String ID[]=request.getParameterValues("PhotoID");
		  for(int i=0;i<ID.length;i++)
		  {
		   DAOFactory.getPhotoDao().CheckPhoto(Integer.parseInt(ID[i]),"set");
		  }
		  JS.goURL(response,"Admin_Photo_List.jsp");
		  }
	
	
	}
	//批量取消新闻审核NumCancelPassed
	if(action.equals("NumCancelPassed"))
	{
	    String adminPopNum="POP000118";
		if(!DAOFactory.getAdminDaoInstance().checkAdminPopedom(Integer.parseInt(session.getAttribute("PhotoID").toString()),adminPopNum))
		{
		 JS.ErrCode(response,"你没有足够的权限！请与管理员联系！");
		 JS.goBack(response,-1);
		 return;
		}
	    
	    if(request.getParameterValues("PhotoID")==null||"".equals(request.getParameterValues("PhotoID")))
         {
           JS.AlertCode(response,"至少选择一条记录！");
           JS.goBack(response,-1);
         }
         else
         {
	      String ID[]=request.getParameterValues("PhotoID");
		  for(int i=0;i<ID.length;i++)
		  {
		   
		     DAOFactory.getPhotoDao().CheckPhoto(Integer.parseInt(ID[i]),"no");
		  }
		  JS.goURL(response,"Admin_Photo_List.jsp");
		  }
	
	
	}
	//彻底删除
	if(action.equals("ConfirmDel"))
	{
			if (request.getParameter("PhotoID") == null
		|| "".equals(request.getParameter("PhotoID"))) {
			JS.AlertCode(response, "参数传递错误！");
			JS.goBack(response, -1);
			return;
		} else {
			int ID = Integer.parseInt(request
			.getParameter("PhotoID"));
			//删除图片文件
			System.out.println("=======================================");
			String url=pageContext.getServletContext().getRealPath("/");
			DAOFactory.getPhotoDao().delPhotofile(ID,url);
			
			//删除数据库记录
			DAOFactory.getPhotoDao().delPhoto(ID);
			
			JS.goURL(response, "Admin_Photo_Recyclebin.jsp");

		}
	
	}
	//批量彻底删除
	if(action.equals("NumConfirmDel"))
	{
	  if(request.getParameterValues("PhotoID")==null||"".equals(request.getParameterValues("PhotoID")))
         {
           JS.AlertCode(response,"至少选择一条记录！");
           JS.goBack(response,-1);
         }
         else
         {
	      String articleID[]=request.getParameterValues("PhotoID");
		  for(int i=0;i<articleID.length;i++)
		  {
		    DAOFactory.getArticleDAOInstance().delArticle(Integer.parseInt(articleID[i]));
		  }
		  JS.goURL(response,"Admin_Photo_Recyclebin.jsp");
		  }
	
	}
	//还原文章
	if(action.equals("Restore"))
	{
	  	if (request.getParameter("PhotoID") == null
		|| "".equals(request.getParameter("PhotoID"))) {
			JS.AlertCode(response, "参数传递错误！");
			JS.goBack(response, -1);
			return;
		} else {
			int ID = Integer.parseInt(request
			.getParameter("PhotoID"));
			
			DAOFactory.getPhotoDao().restorePhoto(ID,"one");
			JS.goURL(response, "Admin_Photo_Recyclebin.jsp");

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
	      String ID[]=request.getParameterValues("ArticleID");
		  for(int i=0;i<ID.length;i++)
		  {
		    DAOFactory.getPhotoDao().restorePhoto(Integer.parseInt(ID[i]),"one");
		  }
		  JS.goURL(response,"Admin_Photo_Recyclebin.jsp");
		  }
	
	
	}
	//还原所有文章
	if(action.equals("NumRestoreAll"))
	{
	  DAOFactory.getPhotoDao().restorePhoto(0,"all");
	  JS.goURL(response,"Admin_Photo_Recyclebin.jsp");
	
	}
	// 清空回收站
	if(action.equals("ClearRecyclebin"))
	{
	
	DAOFactory.getPhotoDao().clearRecyclebin();
	JS.goURL(response,"Admin_Photo_Recyclebin.jsp");
	}
%>
