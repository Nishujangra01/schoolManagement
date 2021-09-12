
<%
String username1 = request.getParameter("username");
String password1 = request.getParameter("password");
if (username1.equals("Admin") && password1.equals("Admin")) {
response.sendRedirect("adminHome.jsp");
} else {
	
	response.sendRedirect("errorLogin.html");
}
%>