	<%@ page language="java" import="java.sql.*" %>
<html>
<body>
                  
       <%    
try
	{
        String uname=request.getParameter("uname");

	String pass=request.getParameter("pass");
	
%>
<a href="logout.jsp">LOGOUT</a>
<%
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection c=DriverManager.getConnection
	("jdbc:mysql://localhost:3306/db","root","root");
	PreparedStatement pst=c.prepareStatement("Select uname,pword from admin where uname=? and pword=?");
           pst.setString(1,uname);
            pst.setString(2,pass);

       ResultSet rs=pst.executeQuery();
        
           if(rs.next())
               response.sendRedirect("ahome.jsp");
           else
             {

              response.sendRedirect("alogin.html");
             }
             }
	
	catch(Exception e)
	{out.print(e);
	}%>

	</body>
	</html>