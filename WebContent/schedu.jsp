<%@   page import="java.sql.*;"%>

<html>
<body bgcolor=white>
	<b><center>
			<font color=black size=5>Schedule for Pilot</font>
		</center></b>
	<br>
	<br>
	<br>

	<%!
int lvid;
int tpid;
Connection con;
Statement stmt;
ResultSet rs;
%>

	<%
try
{
lvid=Integer.parseInt((String)session.getAttribute("lvid"));
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/airline","root","");
out.println("<center>Pilot ID : " + lvid+"<br><br>");
stmt=con.createStatement();
rs=stmt.executeQuery("select * from schedule where pid="+lvid+" and status='S'");
}
catch(Exception e)
{
out.println("Error : " + e.getMessage());
}
%>
	<table align=center border>
		<tr>
			<td>Schd ID</td>
			<td>Sector ID</td>
			<td>Flight Code</td>
			<td>Date of Sched</td>
		</tr>

		<%
while(rs.next())
{
%>
		<tr>
			<td><%= rs.getInt("schedid") %></td>
			<td><%= rs.getString("sid")%></td>
			<td><%= rs.getString("fcode") %></td>
			<td><%= rs.getString("sdat")%></td>

		</tr>
		<%
}
con.close();
%>
	</table>
</html>









