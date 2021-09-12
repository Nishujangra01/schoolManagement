<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.util.logging.Level" %>
<%@page import="java.util.logging.Logger" %>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.util.ArrayList" %>
 
 
<html>
    <head>    
        <title>Student Registration Form</title>
        
        </head>
    <body>
        
         <%
             
            Connection con;     
            String msg = "";
            String color = "";
   
    
   	    if(request.getMethod().compareToIgnoreCase("post")==0)
   		{
   			try
   			{
                               
   				String name = request.getParameter("name");
   	   			String rollno = request.getParameter("rollno");
   	   			String standard = request.getParameter("standard");
   	   			String phone = request.getParameter("phone");
   	   			
   	   			 Class.forName("com.mysql.jdbc.Driver");
                                 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/learneracademy?autoReconnect=true&useSSL=false" ,"root", "12345");
   	   			 String query = "update student set name = ?, standard =? ,phone= ? where rollno = ?";
   	   	
   	   			PreparedStatement pst = con.prepareStatement(query);
   	   			
   	   			
   	   			pst.setString(1, name);
                                pst.setString(2, rollno);
   	   			pst.setString(3, standard);
   	   			pst.setString(4, phone);
   	   			
   	   			pst.executeUpdate();
   	   			
   	   			color = "green";
   	   			msg = "Student Updateddddd Succesfully";
   	   			
   	   			
   			}catch(Exception ex){
   				ex.printStackTrace();
   				color = "red";
   				msg = "Error Occured";
   			}
   		}
    %>    
        
 
        
    <div class="form-group col-12 p-0">
        
	<h4 style="color:<%= color %>"><%= msg %></h4>
	</div>
        
        <form id="form" method="post" action="EditStudent.jsp" class="form-horizontal">
            
             <% 
                          
                            PreparedStatement pst;
                            ResultSet rs;
 
                            Class.forName("com.mysql.jdbc.Driver");
                            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/learneracademy?autoReconnect=true&useSSL=false" ,"root", "12345");
                             
                           String name = request.getParameter("id");
                           
                            pst = con.prepareStatement("select * from student where name = ?");
                            pst.setString(1, name);
                            rs = pst.executeQuery();
                            
                            while(rs.next())
                            {
                    
                    %>   
         	
            <div class="form-group">
                <div  class="col-sm-4"></div>
                <div  class="col-sm-4">
                    <h2 style="text-align: center">Student Details</h2>
                </div>
            </div>
            <hr/>
			<div class="form-group">
                 <div  class="col-sm-4"></div>
                  <div  class="col-sm-4 mx-auto">
                  	<label >Name:</label>
  			<input type="text" name="name" class="form-control" id="name"  value="<%= rs.getString("name") %>">
                  </div>
			</div>
			<div class="form-group">
                 <div  class="col-sm-4"></div>
                  <div  class="col-sm-4 mx-auto">
                  	<label>Rollno:</label>
  					<input type="text" name="rollno" class="form-control" id="rollno" value="<%= rs.getString("rollno") %>">
                  </div>
			</div>
			<div class="form-group">
                            <div  class="col-sm-4"></div>
                            <div  class="col-sm-4 mx-auto">
                                        <label>Standard:</label>
  					<input type="text" name="standard" class="form-control" id="standard" value="<%= rs.getString("standard") %>">
                            </div>
			</div>
            
			<div class="form-group">
                            <div  class="col-sm-4"></div>
                            <div  class="col-sm-4 mx-auto">
                                    <label>Phone</label>
  				    <input type="text" name="phone" class="form-control" id="phone" value="<%= rs.getString("phone") %>">
                            </div>
			</div>
			
		
            <br/>
            
            <div class="form-group" align="right">
             
                <div class="col-sm-6">
                    <div class="col-sm-2">
                    <Button class="btn btn-success" style="width: 80px;">Submit</Button>
                      
                    </div>
                    <div class="col-sm-4">
                    </div>
                    
                </div>
            </div>
            
             <% } %>
        </form>
        <div class="col-sm-12"  align="right">
            <a href="adminHome.jsp"><Button class="btn btn-success" style="width: 80px;">Home</Button></a>
        </div>
    </body>
</html>