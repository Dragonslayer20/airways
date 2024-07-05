<%@   page import="java.sql.*;"%>

<html>
<body bgcolor=white>
	<b><center>
			<font color=black size=5>ALTER PILOT</font>
		</center></b>
	<br>
	<br>
	<br>

	<%!
int  tpid;
Connection con;
Statement stmt;
ResultSet rs;
String st;
String tlname,tlpwd,tlcontact,tldoa,tllic;
%>

	<%
tpid=Integer.parseInt((String)session.getAttribute("spid"));
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
tlname=request.getParameter("lname");
tlpwd=request.getParameter("lpwd");
tlcontact=request.getParameter("lcontact");
tldoa=request.getParameter("ldoa");
tllic=request.getParameter("llic");

stmt.executeUpdate("update pilots set lname='"+tlname+"', lpwd='"+tlpwd+"', lcontact='" + tlcontact+"', ldoa='"+tldoa+"', llic='"+tllic+"' WHERE lid="+tpid);
con.close();
out.println("<font color=red size=4>Record Updated Sucessfully for Pilot </font><font color=blue size=4>"+tpid+"</font>");
}
catch(Exception e)
{
out.println("<font color=red size=4>UPDATION FAILED!TRY AGAIN.</font>");
}
%>