<%@   page import="java.sql.*;"%>

<html>
<body bgcolor=white>
	<b><center>
			<font color=black size=5>REMOVE SECTOR</font>
		</center></b>
	<br>
	<br>
	<br>

	<%!
String  tpid;
Connection con;
Statement stmt;
ResultSet rs;
%>

	<%
tpid=(String)session.getAttribute("rid");
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

	<%
try
{

stmt.executeUpdate("DELETE  from sectors  WHERE sid='"+tpid+"'");
con.close();
out.println("<font color=red size=4>Sector removed from list Successfully</font><font color=blue size=4>"+tpid+"</font>");
}
catch(Exception e)
{
out.println("<font color=red size=4>DELETION FAILED!TRY AGAIN.</font>" + e.getMessage());
}
%>