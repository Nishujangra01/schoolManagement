<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.util.logging.Level" %>
<%@page import="java.util.logging.Logger" %>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.util.ArrayList" %>
 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Student</title>
</head>
<body>
    
<div class="form-group">
                <div  class="col-sm-4"></div>
                <div  class="col-sm-4">
                    <h2 style="text-align: center">Teacher Details</h2>
                </div>
            </div>
            <div class="col-sm-2">
                        <a href="adminHome.jsp"><Button class="btn btn-success" style="width: 80px;">Home</Button></a>
                    </div>
	<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">Registation No:</th>
      <th scope="col">Teacher Name:</th>
      <th scope="col">Subject:</th>
      <th scope="col">Address:</th>
      <th scope="col">Phone:</th>
 
    </tr>
  </thead>
  <tbody>
  <% 
  	    Connection con;
                PreparedStatement pst;
                ResultSet rs;
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/learneracademy?autoReconnect=true&useSSL=false" ,"root", "12345");
 
  	String query = "Select * from teacher";
	 pst = con.prepareStatement(query);
	 rs = pst.executeQuery();
	
	while(rs.next()){
		%>
		<tr>
		<th scope="row"><%= rs.getString("regno") %></th>
		<td><%=rs.getString("teachername")%></td>
		<td><%=rs.getString("subject")%></td>
		<td><%=rs.getString("address")%></td>
		<td><%=rs.getString("phone")%></td>
		
		<td><a class="btn btn-success" href="EditTeacher.jsp?id=<%=rs.getString("regno") %>" role="button">Edit</a><a class="btn btn-danger" href="removeTeacher.jsp?id=<%=rs.getString("regno") %>" role="button">Remove</a></td>
		</tr>
	<% }%>	
 
  </tbody>
</table>
 
</body>
</html>