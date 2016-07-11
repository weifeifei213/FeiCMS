package com.jwebsite.pub;
import java.io.*;
import javax.servlet.*;
public class EncodingFilter implements Filter

{
	public void init(FilterConfig filterConfig) throws ServletException
{
	System.out.println("** 过滤器初始化...") ;
}

public void doFilter(ServletRequest request,ServletResponse response,FilterChain chain) throws IOException,ServletException
{
	request.setCharacterEncoding("utf-8") ;
    chain.doFilter(request,response) ;
}
public void destroy()
{
	System.out.println("** 过滤器销毁...") ;
}

}
