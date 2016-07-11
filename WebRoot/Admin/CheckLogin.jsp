<%
if(session.getAttribute("AdminName")==null||"".equals(session.getAttribute("AdminName")))
{
 response.sendRedirect("Admin_Login.jsp");
}

%>