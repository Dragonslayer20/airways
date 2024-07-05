<%@   page import="java.sql.*;"%>

<html>
<body bgcolor=white>
	<b><center>
			<font color=black size=5>DELETE FLIGHT</font>
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
rs=stmt.executeQuery("select * from flights where fno='"+tpid+"'");
if (rs.next())
{
%>

	<form method=post action="dflight.jsp">
		<table border=0>

			<tr>
				<td>Flight No</td>
				<td><input type=text name="lfno" size=10
					value=<%= rs.getString("fno")%> disabled></td>
				<td>Flight Name</td>
				<td><input type=text name="lfname" size=10
					value=<%= rs.getString("fname")%> disabled></td>
			</tr>

			<tr>
				<td>Source</td>
				<td><input type=text name="lsrc" size=10
					value=<%= rs.getString("src")%> disabled></td>
				<td>Destination</td>
				<td><input type=text name="ldest" size=10
					value=<%= rs.getString("dest")%> disabled></td>
			</tr>

			<tr>
				<td>Arr.Time</td>
				<td><input type=text name="lat" size=10
					value=<%= rs.getString("atime")%> disabled></td>
				<td>Dep.Time</td>
				<td><input type=text name="ldt" size=10
					value=<%= rs.getString("dtime")%> disabled></td>
			</tr>

			<tr>
				<td>Exe.Class Seats</td>
				<td><input type=text name="lnsj" size=10
					value=<%= rs.getInt("nsg")%> disabled></td>
				<td>Eco.Class Seats</td>
				<td><input type=text name="lnsy" size=10
					value=<%= rs.getInt("nsy")%> disabled></td>
			</tr>

			<tr>
				<td>Exe.Class Fare</td>
				<td><input type=text name="lrj" size=10
					value=<%= rs.getInt("rj")%> disabled></td>
				<td>Eco.Class Fare</td>
				<td><input type=text name="lry" size=10
					value=<%= rs.getInt("ry")%> disabled></td>
			</tr>

			<tr>
				<td>Date of Intro</td>
				<td><input type=text name="ldoi" size=10
					value=<%= rs.getString("doi")%> disabled></td>
			</tr>

		</table>
		<center>
			<input type=submit value='Delete'>
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