
<%@ page language="java" import="java.sql.*" %>
<html>

<body bgcolor="pink">

<br><br><div align="right">
<b><a href="alogout.jsp">LOGOUT</a></b></div>
<align="left">
<b><a href="ahome.jsp">HOME</a></b>


<%
try
{

Class.forName("com.mysql.jdbc.Driver");
Connection c =DriverManager.getConnection("jdbc:MySql://localhost:3306/db","root","root");
ResultSet rs;
Statement s = c.createStatement();
%>
<center><h1><u><b>ORDERED BOOKS</b></u></h1></center>
<center>
<br>
<table width="1100" height="97" border="1" bgcolor="FF33CC">
<tr bgcolor="FF0066">
<td><div align="center"><strong>ORDER ID</strong></td></div>
<td><div align="center"><strong>USER NAME</strong></td></div>
<td><div align="center"><strong>EMAIL ID</strong></td></div>
<td><div align="center"><strong>PHONE NUMBER</strong></td></div>
<td><div align="center"><strong>ACCOUNT DATE</strong></td></div>
<td><div align="center"><strong>BOOK CODE
</strong></div></td>
<td><div align="center"><strong>BOOK NAME </strong></td></div>
<td><div align="center"><strong>AUTHOR NAME </strong></div></td>
<td><div align="center"><strong>EDITION </strong></td>
<td><div align="center"><strong>QUANTITY</strong></td></div>
<td><div align="center"><strong> RATE</strong></td></div>
<td><div align="center"><strong>DATE ADDED</strong></td></div>
<td><div align="center"><strong>TOTAL </strong></td></div>
<td><div align="center"><strong>AMOUNT </strong></td></div>
</tr>
</center>
<%
 rs =s.executeQuery("select * from userlogin u, ubookview b,amt a where u.oid=b.oid and u.oid=a.oid order by u.oid");
while(rs.next())
{
%>
<center>
<tr>
<td><div align="center"><%=rs.getInt("oid")%></div></td>
<td><div align="center"><%=rs.getString("uname")%></td>
<td><div align="center"><%=rs.getString("eid")%></td>
<td><div align="center"><%=rs.getLong("pno")%></td>
<td><div align="center"><%=rs.getTimestamp("dateadd")%></td>
<td><div align="center"><%=rs.getString("code")%></td>
<td><div align="center"><%= rs.getString("b_name")%></td>
<td><div align="center"><%= rs.getString("a_name")%></td>
<td><div align="center"><%= rs.getString("edtn")%></td>
<td><div align="center"><%= rs.getInt("qty")%></td>
<td><div align="center"><%= rs.getInt("rate")%></td>
<td><div align="center"><%=rs.getTimestamp("dateadd")%></td>
<td><div align="center"><%= rs.getInt("total")%></td>
<th><div align="center"><%= rs.getInt("amt")%></th>
</tr>
<%}%>

</table>
<%}
catch(Exception e)
{
out.println(e);
}
%>
</body>
</html>