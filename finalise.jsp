	<%@ page language="java" import="java.sql.*,java.util.*" %>
<html>
<body>
<%!
int tot;
%>
<%
int oid=(Integer)session.getAttribute("oid");
	try
	{
	Class.forName("com.mysql.jdbc.Driver");
	Connection c=DriverManager.getConnection
("jdbc:mysql://localhost:3306/db","root","root");
Statement s = c.createStatement();
ResultSet rs =s.executeQuery("Select sum(total) from ubookview where oid='"+oid+"'"); 
while(rs.next())
{
tot=rs.getInt(1);

}
PreparedStatement pstmt=c.prepareStatement("insert into amt (oid,amt)values(?,?)");
pstmt.setInt(1,oid);
pstmt.setInt(2,tot);
pstmt.executeUpdate();

session.setAttribute("mytot",tot);
response.sendRedirect("pview.jsp");
c.close();
	}
	catch(Exception e)
	{out.print(e);
	}

	%>

	</body>
	</html>