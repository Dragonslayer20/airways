<%@   page import="java.sql.*;"%>

<%!
Connection con;
Statement stmt;
ResultSet rs;
String lid;
%>

<%
try
{
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/airline","root","");
stmt=con.createStatement();
}
catch(Exception e)
{
out.println("Error : " + e.getMessage());
}
%>

<html>
<body bgcolor=white>
	<%
lid=(String)session.getAttribute("lv");
rs=stmt.executeQuery("select leavedesc,leavemean from lmstab where leaveID='"+lid+"'");

out.println("<b><center><font color=black size=5>LEAVE DESCRIPTION</font></center></b><br><br><br>");


if(rs.next())
{
out.println("<b>Leave Type : "+rs.getString(1)+"<br>");
out.println(rs.getString(2));
}

out.println("</form></body></html>");
con.close();
%>