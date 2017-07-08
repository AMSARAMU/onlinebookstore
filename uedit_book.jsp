<%@ page language="java" import="java.sql.*" %>
<html>
<body bgcolor="dark blue">
<%!
int sno1;
String sno,update_book;
%><% 
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection c =DriverManager.getConnection("jdbc:MySql://localhost:3306/db","root","root");
Statement s = c.createStatement();
String sno=request.getParameter("sno"); 
if(sno!=null)
 sno1=Integer.parseInt(sno);
ResultSet rs=s.executeQuery("Select * from ubookview where sno='"+sno1+"'");


while(rs.next())
{ 
%><br><br><div align="right">

<b><a href="ulogout.jsp">LOGOUT</a></b></div>
<b><align="left"></div>
<a href="uhome.jsp">HOME</a></b>

<br><br>
<center><h1><u><b>EDIT BOOKS</b></u></h1>
<form name="book" id="book" action="uupdate.jsp" method="post">
<table width="332" height="252" border="0" align="center" cellpadding="2" cellspacing="2">
<tr>
<th height="33" colspan="2"><div align="center">
<%
String update_book=(String)session.getAttribute("update_book");
session.removeAttribute("update_book");
if(update_book!=null)out.print(update_book);
%>

</div></th>
</tr>
<tr>
<td><b>BOOK CODE</b></td>
<td><input name="code" type="text" id="code"  value="<%=rs.getString(3)%>" readonly="readonly"/></td>
</tr>
<tr>
<td><br><b>BOOK NAME</b></td>
<td><br><input name="bname" type="text" id="bname"  value="<%=rs.getString(4)%>" readonly="readonly"/></td>
</tr>
<tr>
<td><br><b>AUTHOR NAME</b></td>
<td><br><input name="aname" type="text" id="aname" value="<%=rs.getString(5)%>" readonly="readonly"/></td>
</tr>
<tr>
<td><br><b>EDITION</b></td>
<td><br><input name="edtn" type="text" id="edtn" value="<%=rs.getString(6)%>" readonly="readonly"/></td>
</tr>
<tr>
<td><br><b>QUANITY</b></td>
<td><br><input name="qty" type="text" id="qty"value="<%=rs.getInt(7)%>"/></td>
</tr>
<tr>
<td><br><b>RATE</b></td>
<td><br><input name="rate" type="text" id="rate" value="<%=rs.getInt(8)%>" readonly="readonly" /></td>
</tr>
</table>
<%}%>

<input type="hidden" name="sno1" value="<%=sno1%>"/>
<br><b><input name="s" type="submit"   value="ORDER" /></b></form>
<form action="pview.jsp">
<b><input  type="submit" value="VIEW" /></b></form>
<b><a href="uview_book.jsp">GO BACK</a></b>
<%
}
catch(Exception e)
{
out.println(e);
}
%>
</body>
</html>

