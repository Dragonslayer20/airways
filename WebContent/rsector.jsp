<%@   page import="java.sql.*;"%>

<html>
<body bgcolor=white>
	<b><center>
			<font color=black size=5>REMOVE SECTOR</font>
		</center></b>
	<br>

	<%!
String  tpid;
Connection con;
Statement stmt;
ResultSet rs;
String st;
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
rs=stmt.executeQuery("select * from sectors where sid='"+tpid+"'");
if (rs.next())
{
%>

	<form method=post action="dsector.jsp">
		<table border=0 align=center>
			<tr>
				<td>Sector ID</td>
				<td><input type=text name="sid" size=10
					value=<%= rs.getString("sid")%> disabled></td>
			</tr>
			<tr>
				<td>Sector Name</td>
				<td><input type=text name="sname" size=10
					value=<%= rs.getString("sname")%> disabled></td>
			</tr>
			<tr>
				<td>Sector country</td>
				<td><input type=text name="sc" size=10
					value=<%= rs.getString("scountry")%> disabled></td>
			</tr>
			<tr>
				<td>Date of Opern</td>
				<td><input type=text name="doo" size=10
					value=<%= rs.getString("doo")%> disabled></td>
			</tr>
		</table>
		<center>
			<input type=submit value='Remove'>
		</center>
	</form>

	<%
}
else
out.println("Flight Not Found!");
con.close();
}
catch(Exception e1)
{
out.println("Error : Invalid Login Data / Connection Unavailable!" +e1.getMessage());
}
%>