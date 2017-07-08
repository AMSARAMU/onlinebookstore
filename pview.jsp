
<%@ page language="java" import="java.sql.*" %>
<html>
<head>
<script type="text/javascript">
function del()
{
if(confirm("Do You Want to Delete this book?"))
{
}
else
{
return false;
}
}
</script>
</head>
<body bgcolor="pink">
<%!
int x,sno1,mytot,oid;
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

String delete_book=request.getParameter("delete_book");

if("yes".equals(delete_book))
{
String code=request.getParameter("code");
Class.forName("com.mysql.jdbc.Driver");
	Connection c=DriverManager.getConnection
	("jdbc:mysql://localhost:3306/db","root","root");
Statement s=c.createStatement();
 x=s.executeUpdate("Delete from ubookview where sno="+sno1);
}
%>

<%
int oid=(Integer)session.getAttribute("oid");
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
<% if(x==1)
{
%> <tr bgcolor="FF0033">
<th height="35" colspan="9"><div>
book (<%=code%>) deleted successfully
</div>
</th>
</tr>
<%}%>
<tr bgcolor="FF0066">
<td><div align="center"><strong>SLNO
</strong></div></td>
<td><div align="center"><strong>BOOK CODE
</strong></div></td>
<td><div align="center"><strong>BOOK NAME </strong></td></div>
<td><div align="center"><strong>AUTHOR NAME </strong></div></td>
<td><div align="center"><strong>EDITION </strong></td>
<td><div align="center"><strong>QUANTITY</strong></td></div>
<td><div align="center"><strong> RATE</strong></td></div>
<td><div align="center"><strong>DATE ADDED</strong></td></div>

<td><div align="center"><strong>TOTAL </strong></td></div>

<td colspan="2"><div align="center"><strong>ACTION</strong></div></td>
</tr>
</center>
<%int icount=0;
 rs =s.executeQuery("select * from ubookview where oid='"+oid+"'");
while(rs.next())
{
sno1=rs.getInt("sno");
code=rs.getString("code");

%>
<center>
<tr>
<td><div align="center"><%=++icount%></div></td>
<td><div align="center"><%= code%></td>
<td><div align="center"><%= rs.getString("b_name")%></td>
<td><div align="center"><%= rs.getString("a_name")%></td>
<td><div align="center"><%= rs.getString("edtn")%></td>
<td><div align="center"><%= rs.getInt("qty")%></td>
<td><div align="center"><%= rs.getInt("rate")%></td>
<td><div align="center"><%= rs.getTimestamp("dateadd")%></td><center>
<td><div align="center"><%= rs.getInt("total")%></td>

<td><div align="center"><b><a href="uedit_book.jsp?sno=<%=sno1%>">EDIT</a></b></div></td>
<td><div align="center"><b><a href="pview.jsp?delete_book=yes&sno=<%=sno1%>&code=<%=code%>" onclick="return del()">DELETE</a></b></div></td>
</tr>
<% }%>

<tr>
<td colspan="8"><div align="center"><strong>TOTAL</strong></td></div>
<td><input  type="text"   value="<%=(Integer) session.getAttribute("mytot")%>" readonly="readonly" /></td>

</tr>
</table>
<form action="uview_book.jsp">
<br><b><input type="submit" value="ADD BOOKS"></b></form>
<form  action="finalise.jsp">
<br><b><input type="submit" value="ORDERS COMPLETED"></b></form>
</center>

<%
}
catch(Exception e)
{
out.println(e);
}
%>
</body>
</html>