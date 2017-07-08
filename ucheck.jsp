	<%@ page language="java" import="java.sql.*" %>
<html>
<body>
<%! 
int id;
%>
<% 
String uname=request.getParameter("uname");
String pword=request.getParameter("pword");
	   try
	{
       Class.forName("com.mysql.jdbc.Driver");
	Connection c=DriverManager.getConnection
("jdbc:mysql://localhost:3306/db","root","root");
Statement s = c.createStatement();PreparedStatement pst=c.prepareStatement("Select oid,uname,pword from userlogin where uname=? and pword=?");
           pst.setString(1,uname);
           pst.setString(2,pword);
ResultSet rs=pst.executeQuery();
if(rs.next())
{
id=rs.getInt("oid");
session.setAttribute("oid",id);
response.sendRedirect("uhome.jsp");
}
else
{
response.sendRedirect("ulogin.html");
}
}	
catch(Exception e)
	{
out.print(e);
	}%>



	</body>
	</html>