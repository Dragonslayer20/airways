<%@   page import="java.sql.*;"%>

<html>
<body bgcolor=white>
	<b><center>
			<font color=black size=5>List Sectors</font>
		</center>
	</b>
	<br>
	<br>
	<br>

	<%!
String tsname,tsid,tdoo;
int tpid;
Connection con;
Statement stmt;
ResultSet rs;
%>

	<%
try
{
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/airline","root","");
stmt=con.createStatement();
rs=stmt.executeQuery("select distinct sid,sname from sectors");
}
catch(Exception e)
{
out.println("Error : " + e.getMessage());
}
%>
	<table align=center border>
		<tr>
			<td>Sector ID</td>
			<td>Sector Name</td>
		</tr>

		<%
while(rs.next())
{
tsid=rs.getString("sid");
tsname=rs.getString("sname");

%>
		<tr>
			<td><%= tsid %></td>
			<td><%= tsname %></td>

		</tr>
		<%
}
con.close();
out.println("</table><form method=post action='sched1.jsp'>");
out.println("<center>Choose Sector ID<input type=text name=secid size=10>");
out.println("<br><br><input type=submit value=Submit></center></form>");
%>
	</table>
</html>









