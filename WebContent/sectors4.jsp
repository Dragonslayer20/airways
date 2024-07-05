<%@   page import="java.sql.*;"%>

<html>
<body background="air6.gif">
	<b><center>
			<font color=black size=5>List Sectors</font>
		</center></b>
	<br>
	<br>
	<br>

	<%!
String tsname,tsid,tdoo,tsc;

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
rs=stmt.executeQuery("select * from sectors");
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
			<td>sector country</td>
			<td>Date of Oprn</td>
		</tr>

		<%
while(rs.next())
{
tsid=rs.getString("sid");
tsname=rs.getString("sname");
tsc=rs.getString("scountry");
tdoo=rs.getString("doo");
%>
		<tr>
			<td><%= tsid %></td>
			<td><%= tsname %></td>
			<td><%= tsc %></td>
			<td><%= tdoo %></td>

		</tr>
		<%
}
con.close();
%>
	</table>
</html>









