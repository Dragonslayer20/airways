<%@   page import="java.sql.*;"%>

<html>
<body bgcolor=white>
	<b><center>
			<font color=black size=5>ALTER SECTOR</font>
		</center></b>
	<br>
	<br>
	<br>

	<%!
String  trid;
Connection con;
Statement stmt;
ResultSet rs;
String sname,scountry;
int tpid;
%>

	<%

%>

	<%
try
{
	trid=(String)session.getAttribute("rid");
	System.out.println("zzzzzzzzzzzzzz"+trid);
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/airline","root","");
stmt=con.createStatement();
sname=request.getParameter("sname");
System.out.println("xxxxxxxxxxxxx"+sname);
scountry=request.getParameter("sc");

stmt.executeUpdate("update sectors set sname='"+sname+"',scountry='"+scountry+"' WHERE sid='"+trid+"'");
out.println("<font color=red size=4>Record Updated Sucessfully for Sector </font><font color=blue size=4></font>");
}
catch(Exception e)
{
out.println("Error : " + e.getMessage());
out.println("<font color=red size=4>UPDATION FAILED!TRY AGAIN.</font>");
}
%>

	