	<%@ page language="java" import="java.sql.*" %>
<html>
<body>
                  
            <%
        
	
        
	String uname=request.getParameter("uname");
	
	String pass=request.getParameter("pass");
        String eid=request.getParameter("eid");
	long pno=Long.parseLong(request.getParameter("pno"));

	try
	{
	Class.forName("com.mysql.jdbc.Driver");
	Connection c=DriverManager.getConnection
	("jdbc:mysql://localhost:3306/db","root","root");
	Timestamp dateadd=new Timestamp(new java.util.Date().getTime());
	PreparedStatement pstmt=c.prepareStatement("insert into userlogin (uname,pword,eid,pno,dateadd)values(?,?,?,?,?)");
 pstmt.setString(1,uname);
pstmt.setString(2,pass);
pstmt.setString(3,eid);
pstmt.setLong(4,pno);
pstmt.setTimestamp(5,dateadd);
pstmt.executeUpdate();
c.close();
	response.sendRedirect("ulogin.html");
	}
	catch(Exception e)
	{out.print(e);
	}
	%>
	</body>
	</html>