	<%@ page language="java" import="java.sql.*" %>
<html>
<body>
                  
            <%
        
	
        
	String uname=request.getParameter("uname");
	
	String pass=request.getParameter("pass");
        String adrs=request.getParameter("adrs");
        String eid=request.getParameter("eid");
	String pno=request.getParameter("pno");
	try
	{
	Class.forName("com.mysql.jdbc.Driver");
	Connection c=DriverManager.getConnection
	("jdbc:mysql://localhost:3306/db","root","root");
	Statement s=c.createStatement();
	int r=s.executeUpdate("insert into admin values('"+uname+"','"+pass+"','"+adrs+"','"+eid+"','"+pno+"')");
	if(r>0)
response.sendRedirect("alogin.html");
	}
	catch(Exception e)
	{out.print(e);
	}
	%>
	</body>
	</html>