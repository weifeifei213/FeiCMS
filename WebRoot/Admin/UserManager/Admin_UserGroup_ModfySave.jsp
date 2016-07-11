<%@ page language="java" pageEncoding="utf-8"%>
<%@page import="com.megalith.vo.ArticleClass"%>
<%@page import="com.megalith.vo.QyskUsergroup"%>
<%@ include file="../PubPackage.jsp"%>
<%
	String action = request.getParameter("Action");
	Qysk_UserGroupDao ugdao = new Qysk_UserGroupDaoImpl();

	if (action.equals("Del")) {
		String adminPopNum = "POP000103";
		if (!DAOFactory.getAdminDaoInstance().checkAdminPopedom(
				Integer.parseInt(session.getAttribute("AdminID")
						.toString()), adminPopNum)) {
			JS.ErrCode(response, "你没有足够的权限！请与管理员联系！");
			JS.goBack(response, -1);
			return;
		}
		if (request.getParameter("GroupID") == null
				|| "".equals(request.getParameter("GroupID"))) {
			JS.AlertCode(response, "参数传递错误！");
			JS.goBack(response, -1);
		} else {
			int groupID = Integer.parseInt(request
					.getParameter("GroupID"));
			ugdao.delUserGroup(groupID);

			JS.goURL(response, "Admin_UserGroup.jsp");

		}
	}

	if (action.equals("Modfy")) {
		if (request.getParameter("GroupID") == null
				|| "".equals(request.getParameter("GroupID"))) {
			JS.AlertCode(response, "参数传递错误！");
			JS.goBack(response, -1);
		} else {
			ArticleClass articleClass = new ArticleClass();
			QyskUsergroup ug = new QyskUsergroup();
			int GroupID = Integer.parseInt(request
					.getParameter("GroupID"));

			StringBuffer StrGroupSetting = new StringBuffer();

			//获取所有的GroupSetting的值
			Enumeration Names = request.getParameterNames();
			while (Names.hasMoreElements()) {
				String StrName = (String) Names.nextElement();
				if (StrName.startsWith("GroupSetting")) {
					StrGroupSetting.append("|" + StrName + ","
							+ request.getParameter(StrName));
				}
			}

			String Channellist = "";
			if (request.getParameterValues("Channel") != null) {
				String Channel[] = request
						.getParameterValues("Channel");
				for (int i = 0; i < Channel.length; i++) {
					StrGroupSetting.append("|Channel," + Channel[i]);
				}
			}

			String GroupName = request.getParameter("GroupName");
			String GroupIntro = request.getParameter("GroupIntro");
			String GroupType = request.getParameter("GroupType");		

			//获取权限参数
			String adminPopList = "";
			String purview_ViewList = "";
			String purview_InputList = "";			
			String purview_ManageList = "";

			if (request.getParameterValues("Purview_View") != null) {
				String listpurview_View[] = request
						.getParameterValues("Purview_View");
				for (int i = 0; i < listpurview_View.length; i++) {
					purview_ViewList = purview_ViewList
							+ listpurview_View[i] + ",";

				}
			}
			if (request.getParameterValues("Purview_Input") != null) {
				String listpurview_Input[] = request
						.getParameterValues("Purview_Input");
				for (int i = 0; i < listpurview_Input.length; i++) {
					purview_InputList = purview_InputList
							+ listpurview_Input[i] + ",";

				}

			}
			if (request.getParameterValues("Purview_Manage") != null) {
				String listpurview_Manage[] = request
						.getParameterValues("Purview_Manage");
				for (int i = 0; i < listpurview_Manage.length; i++) {
					purview_ManageList = purview_ManageList
							+ listpurview_Manage[i] + ",";

				}
			}
			
			ug.setGroupId(GroupID);
			ug.setGroupName(GroupName);
			ug.setGroupIntro(GroupIntro);
			
			ug.setGroupType(Short.parseShort(GroupType));			
			ug.setDayInputMax(Integer.parseInt(request
					.getParameter("DayInputMax")));
					
			ug.setGroupSetting(StrGroupSetting.toString());		
			ug.setArrClassBrowse(purview_ViewList);
			ug.setArrClassInput(purview_InputList);
			ug.setArrClassView(purview_ManageList);

            DAOFactory.getQyskUserGroupDao().updateUserGroup(ug);


			JS.goURL(response, "Admin_UserGroup.jsp");

		}

	}
%>
