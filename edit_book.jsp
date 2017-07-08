<%@ page language="java" import="java.sql.*" %>
<html>
<body bgcolor="violet">
<%!
int sno1;
String sno,aupdate;
%><% 
try
{
String sno=request.getParameter("sno"); 
if(sno!=null)
 sno1=Integer.parseInt(sno);


Class.forName("com.mysql.jdbc.Driver");
Connection c =DriverManager.getConnection("jdbc:MySql://localhost:3306/db","root","root");
Statement s = c.createStatement();
ResultSet rs=s.executeQuery("Select * from bookstore where sno='"+sno1+"'");


while(rs.next())
{ 
%><br><br><div align="right">

<b><a href="alogout.jsp">LOGOUT</a></b></div>
<b><align="left"></div>
<a href="ahome.jsp">HOME</a></b>

<br><br>
<center><h1><u><b>EDIT BOOKS</b></u></h1>
<br>
<form name="book" id="book" action="aupdate.jsp" method="post">
<table width="332" height="252" border="0" align="center" cellpadding="2" cellspacing="2">
<tr>
<th height="33" colspan="2"><div align="center">
<%
String aupdate=(String)session.getAttribute("aupdate");
session.removeAttribute("aupdate");
if(aupdate!=null)out.print(aupdate);
%>

</div></th>
</tr>
<tr>
<td><b>BOOK CODE</b></td>
<td><input name="code" type="text" id="code"  value="<%=rs.getString(2)%>"/></td>
</tr>
<tr>
<td><br><b>BOOK NAME</b></td>
<td><br><input name="bname" type="text" id="bname"  value="<%=rs.getString(3)%>" /></td>
</tr>
<tr>
<td><br><b>AUTHOR NAME</b></td>
<td><br><input name="aname" type="text" id="aname" value="<%=rs.getString(4)%>" /></td>
</tr>
<tr>
<td><br><b>EDITION</b></td>
<td><br><input name="edtn" type="text" id="edtn" value="<%=rs.getString(5)%>" /></td>
</tr>
<tr>
<td><br><b>QUANITY</b></td>
<td><br><input name="qty" type="text" id="qty"value="<%=rs.getInt(6)%>" /></td>
</tr>
<tr>
<td><br><b>RATE</b></td>
<td><br><input name="rate" type="text" id="rate"value="<%=rs.getInt(7)%>" /></td>
</tr>
</table>
<%}%>
<tr>
<td class="submission" colspan="6">
<input type="hidden" name="sno1" value="<%=sno1%>"/>
<br><br><input name="s" type="submit" id="s" class="button" value="UPDATE" /></form>

</td>
</tr>
<tr>
<td class="submission" colspan="2"><div align="center"><b><a href="aview_book.jsp">VIEW BOOKS</a></b></div></td>
</tr>
</table>
<%
}
catch(Exception e)
{
out.println(e);
}
%>
</body>
</html>

