<%@   page import="java.sql.*;"%>

<html>
<body background="air.bmp">
	<b>
         <center>
			<font color=black size=5>VIEW FLIGHTS</font>
		</center>
</b>
	<br>
	<br>
	<br>

	<%!
String tfcode,tfname,tfsrc,tfdest,tfat,tfdt,tfdoi;
int tfjnos,tfynos,tfjfare,tfyfare;
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
rs=stmt.executeQuery("select * from flights");
}
catch(Exception e)
{
out.println("Error : " + e.getMessage());
}
%>
	<table align=center border>
		<tr>
			<td>Fcode</td>
			<td>Fname</td>
			<td>Src</td>
			<td>Dest</td>
			<td>Arr.timer</td>
			<td>Dep.Time</td>
			<td>Exe.Seats</td>
			<td>Eco.Seats</td>
			<td>Exe.Fare</td>
			<td>Eco.Fare</td>
			<td>Date.Intro</td>
		</tr>

		<%
while(rs.next())
{
tfcode=rs.getString("fno");
tfname=rs.getString("fname");
tfsrc=rs.getString("src");
tfdest=rs.getString("dest");
tfat=rs.getString("atime");
tfdt=rs.getString("dtime");
tfjnos=Integer.parseInt(rs.getString("nsg"));
tfynos=Integer.parseInt(rs.getString("nsy"));
tfjfare=Integer.parseInt(rs.getString("rj"));
tfyfare=Integer.parseInt(rs.getString("ry"));
tfdoi=rs.getString("doi");
%>
		<tr>
			<td><%= tfcode %></td>
			<td><%= tfname %></td>
			<td><%= tfsrc %></td>
			<td><%= tfdest %></td>
			<td><%= tfat%></td>
			<td><%= tfdt%></td>
			<td><%= tfjnos %></td>
			<td><%= tfynos %></td>
			<td><%= tfjfare %></td>
			<td><%= tfyfare %></td>
			<td><%= tfdoi %></td>

		</tr>
		<%
}
con.close();
%>
	</table>
</html>









