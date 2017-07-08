<html>
<body bgcolor="gray">
<br><br><div align="right"><b>
<a href="alogout.jsp">LOGOUT</a></b>
<b><align="left"></div>
<a href="ahome.jsp">HOME</a></b>

<center><h1><u><br>STOCK ENTRY</u></h1></center>
<br>
<form name="book" id="book" action="abstore.jsp" method="post" onSubmit="return validate(this)" >
<table width="332" height="252" border="0" align="center" cellpadding="2" cellspacing="2">
<tr>
<th height="33" colspan="2"><div align="center">

<%
String book=(String)session.getAttribute("book");
session.removeAttribute("book");
if(book!=null)out.print(book);
%>


<center>
<table>
<tr>
<td><br><b>BOOK CODE</b></td>
<td><br><input type="text" name="code" required></td>
</tr>
<tr>
<td><br><b>BOOK NAME</b></td>
<td><br><input type="text" name="bname" required></td>
</tr>
<tr>
<td><br><b>AUTHOR NAME</b></td>
<td><br><input type="text" name="aname" required></td>
</tr>
<td>
<br><b>EDITION</b></td>
<td><br><input type="text" name="edtn" required></td>
</tr>
<td>
<br><b>QUANTITY</b></td>
<td><br><input type="text" name="qty" required></td>
</tr>
<tr>
<td><br><b>RATE</b></td>
<td><br><input type="text" name="rate" required></td>
</tr>

</table>

<br><br><input type="submit" value="STORE"></form>
<form action="aview_book.jsp">
<br><input type="submit" value="VIEW"></form>
</center>

</body>
</html>
