<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.megalith.hibernate.pojo.QyskCompany"%>
<%@page import="com.megalith.pub.BIZFactory"%>
<%@page import="com.megalith.hibernate.pojo.QyskUser"%>
<%@page import="com.megalith.pub.JS"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";


String UserID=request.getParameter("UserID");
QyskUser myuser=BIZFactory.getQyskUserBizInstance().GetUser(Integer.parseInt(UserID));
session.setAttribute("UserInstance",myuser);
JS.goURL(response,basePath+"UserManager/User_Index.jsp");
%>


