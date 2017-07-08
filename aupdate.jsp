<%@ page language="java" import="java.sql.*" %>
<html>
<body bgcolor="violet">
<%!
int sno,qty1,rate1;

String sno1,code,bname,aname,edtn,qty,rate;
%>
<%
String sno1=request.getParameter("sno1");
if(sno1!=null)
sno=Integer.parseInt(request.getParameter("sno1"));
String code=request.getParameter("code");
	String bname=request.getParameter("bname");
	String aname=request.getParameter("aname");
         String edtn=request.getParameter("edtn");
        String qty=request.getParameter("qty");
if(qty!=null)
qty1=Integer.parseInt(request.getParameter("qty"));


String rate=request.getParameter("rate");
if(rate!=null)
rate1=Integer.parseInt(request.getParameter("rate"));
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection c=DriverManager.getConnection
("jdbc:mysql://localhost:3306/db","root","root");
Timestamp dateadd=new Timestamp(new java.util.Date().getTime());

PreparedStatement pstmt=c.prepareStatement("Update bookstore set code=?,bname=?,aname=?,edtn=?,qty=?,rate=?,dateadd=? where sno='"+sno1+"'");
pstmt.setString(1,code);
pstmt.setString(2,bname);
pstmt.setString(3,aname);
pstmt.setString(4,edtn);
pstmt.setInt(5,qty1);
pstmt.setInt(6,rate1);
pstmt.setTimestamp(7,dateadd);
pstmt.executeUpdate();
c.close();
session.setAttribute("aupdate","book ("+code+") updated successfully");
response.sendRedirect("edit_book.jsp");
}
catch(Exception e)
{
out.println(e);
}
%>


</body>
</html>




