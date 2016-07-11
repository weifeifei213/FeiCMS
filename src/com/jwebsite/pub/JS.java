package com.jwebsite.pub;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;


public final class JS {

  private static String b = "<script languange=\"JavaScript\">";
  private static String e = "</script>";

  public static String alert(String alertStr){
    return b+"  window.alert('"+alertStr+"');"+e;
  }

  public static String go(String urlStr){
    return b+"  window.location.href='"+urlStr+"';"+e;
  }

  public static String go(int n){
    return b+"  history.go("+n+");"+e;
  }

  public static String code(String JScode){
    return b+ JScode +e;
  }//一般不用此方法

  //////////////////////////////////////////
  //用新的JS样式显示错误信息
  //注意：在使用本函数时，一定要初始化JS包，及相关路径
  //////////////////////////////////////////
  public static void ErrCode(HttpServletResponse response,String ErrInfo) throws ServletException,IOException{
	  PrintWriter out = response.getWriter();
	  ErrInfo = "alert('"+ErrInfo+"');";//添加新的JS特效
	  //out.println("<script language='javascript' src='../css_js/redialog.js'></script>");
	  out.println(b+ ErrInfo +e);
  }

  /////////////////////////////////////////
  //用新的JS样式显示提示信息
  //注意：在使用本函数时，一定要初始化JS包、及相关路径
  /////////////////////////////////////////
  public static void AlertCode(HttpServletResponse response,String AlertInfo) throws ServletException,IOException{
	  PrintWriter out = response.getWriter();
	  AlertInfo = "alert('"+AlertInfo+"');";
	  //out.println("<script language='javascript' src='../css_js/redialog.js'></script>");
	  out.println(b + AlertInfo + e);
  }

  /////////////////////////////////////////
  //跳转到制定页面
  /////////////////////////////////////////
  public static void goURL(HttpServletResponse response,String URLString) throws ServletException,IOException{
	  PrintWriter out = response.getWriter();
	  System.out.println("00000000000000000000000");
	  out.println(b+"  window.location.href='"+URLString+"';"+e);
	  
	
	  
  }

  /////////////////////////////////////////
  //返回到历史页面-1
  /////////////////////////////////////////
  public static void goBack(HttpServletResponse response,int n) throws ServletException,IOException{
	  PrintWriter out = response.getWriter();
	  out.println(b+"  history.go("+n+");"+e);
  }

}