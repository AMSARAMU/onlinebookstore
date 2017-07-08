	<%@ page language="java" import="java.sql.*" %>
<html>
<body>
                  
            <%
        String code=request.getParameter("code");
	String bname=request.getParameter("bname");
	String aname=request.getParameter("aname");
         String edtn=request.getParameter("edtn");
        int qty=Integer.parseInt(request.getParameter("qty"));


 int rate=Integer.parseInt(request.getParameter("rate"));



	
	try
	{
	Class.forName("com.mysql.jdbc.Driver");
	Connection c=DriverManager.getConnection
	("jdbc:mysql://localhost:3306/db","root","root");


Timestamp dateadd=new Timestamp(new java.util.Date().getTime());

    
	PreparedStatement pstmt=c.prepareStatement("insert into bookstore (code,bname,aname,edtn,qty,rate,dateadd)values(?,?,?,?,?,?,?)");

pstmt.setString(1,code);
pstmt.setString(2,bname);
pstmt.setString(3,aname);
pstmt.setString(4,edtn);
pstmt.setInt(5,qty);
pstmt.setInt(6,rate);
pstmt.setTimestamp(7,dateadd);
pstmt.executeUpdate();

c.close();
session.setAttribute("book","book ("+code+") added successfully");
response.sendRedirect("sentry.jsp");



	}
	catch(Exception e)
	{out.print(e);
	}

	%>

	</body>
	</html>