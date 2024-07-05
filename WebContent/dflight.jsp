<%@   page import="java.sql.*;"%>

<html>
<body bgcolor=white>
	<b><center>
			<font color=black size=5>DELETE FLIGHT</font>
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
tpid=(String)session.getAttribute("fid");
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

stmt.executeUpdate("DELETE  from flights  WHERE fno='"+tpid+"'");
con.close();
out.println("<font color=red size=4>Flight Deleted Successfully</font><font color=blue size=4>"+tpid+"</font>");
}
catch(Exception e)
{
out.println("<font color=red size=4>DELETION FAILED!TRY AGAIN.</font>" + e.getMessage());
}
%>