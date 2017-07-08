
<%@ page language="java" import="java.sql.*" %>
<html>
<body bgcolor="FFCC99">
<%!
int x,sno1;
String code,sno;
%>

<br><br><div align="right">
<b><a href="ulogout.jsp">LOGOUT</a></b></div>
<align="left">
<b><a href="uhome.jsp">HOME</a></b>
<% 

String sno=request.getParameter("sno");
if(sno!=null)
sno1=Integer.parseInt(request.getParameter("sno"));
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection c =DriverManager.getConnection("jdbc:MySql://localhost:3306/db","root","root");
ResultSet rs;
Statement s = c.createStatement();
%>
<center><h1><u><b>VIEW BOOKS</b></u></h1></center>
<center>
<br>
<table width="1100" height="97" border="1" bgcolor="FF6666">
</div>
<tr bgcolor="CC0000">
<td><div align="center"><strong>SLNO
</strong></div></td>
<td><div align="center"><strong>BOOK CODE
</strong></div></td>
<td><div align="center"><strong>BOOK NAME </strong></td></div>
<td><div align="center"><strong>AUTHOR NAME </strong></div></td>
<td><div align="center"><strong>EDITION </strong></td>
<td><div align="center"><strong>QUANTITY</strong></td></div>
<td><div align="center"><strong> RATE</strong></td></div>
<td><div align="center"><strong>DATE ADDED </strong></td></div>
<td colspan="2"><div align="center"><strong>ACTION</strong></div></td>
</tr>
</center>

<%int icount=0;
 rs =s.executeQuery("select * from bookstore order by code");
while(rs.next())
{
sno1=rs.getInt("sno");
code=rs.getString("code");

%>
<center>
<tr>
<td><div align="center"><%=++icount%></div></td>
<td><div align="center"><%= code%></td>
<td><div align="center"><%= rs.getString("bname")%></td>
<td><div align="center"><%= rs.getString("aname")%></td>
<td><div align="center"><%= rs.getString("edtn")%></td>
<td><div align="center"><%= rs.getInt("qty")%></td>
<td><div align="center"><%= rs.getInt("rate")%></td>
<td><div align="center"><%= rs.getTimestamp("dateadd")%></td><center>
<td><div align="center"><b><a href="purchase.jsp?sno=<%=sno1%>">PURCHASE</a></b></div></td>
</tr>
<% } %> 
</table>
</center>
<%}
catch(Exception e)
{
out.println(e);
}
%>
</body>
</html>