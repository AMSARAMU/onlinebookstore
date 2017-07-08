	<%@ page language="java" import="java.sql.*,java.util.*" %>
<html>
<body>
<%!
int total=0;
%>

<%
int oid=(Integer)session.getAttribute("oid");

String code=request.getParameter("code");
	String bname=request.getParameter("bname");
	String aname=request.getParameter("aname");
         String edtn=request.getParameter("edtn");
        int qty=Integer.parseInt(request.getParameter("qty"));
       int rate=Integer.parseInt(request.getParameter("rate"));
        total=qty*rate; 

	try
	{
	Class.forName("com.mysql.jdbc.Driver");
	Connection c=DriverManager.getConnection
	("jdbc:mysql://localhost:3306/db","root","root");


Timestamp dateadd=new Timestamp(new java.util.Date().getTime());
PreparedStatement pstmt=c.prepareStatement("insert into ubookview (oid,code,b_name,a_name,edtn,qty,rate,dateadd,total)values(?,?,?,?,?,?,?,?,?)");
pstmt.setLong(1,oid);
pstmt.setString(2,code);
pstmt.setString(3,bname);
pstmt.setString(4,aname);
pstmt.setString(5,edtn);
pstmt.setInt(6,qty);
pstmt.setInt(7,rate);
pstmt.setTimestamp(8,dateadd);
pstmt.setInt(9,total);

pstmt.executeUpdate();

c.close();
session.setAttribute("book","book ("+code+") added successfully");
response.sendRedirect("purchase.jsp");


	}

	catch(Exception e)
	{out.print(e);
	}

	%>

	</body>
	</html>