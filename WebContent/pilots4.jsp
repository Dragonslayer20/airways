<%@   page import="java.sql.*;"%>

<html>
<body background="imag1.bmp"  >
	<b><center>
			<font color=black size=5>VIEW PILOT</font>
		</center></b>
	<br>
	<br>
	<br>

	<%!
String tlname,tlpwd,tlcontact,tldor,tldoa,tllic;
int  tlid;
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
rs=stmt.executeQuery("select * from pilots where lid!=1000");
}
catch(Exception e)
{
out.println("Error : " + e.getMessage());
}
%>
	<table align=center border>
		<tr>
			<td>Lid</td>
			<td>Lname</td>
			<td>Lpwd</td>
			<td>Lcontact</td>
			<td>Ldor</td>
			<td>Ldoa</td>
			<td>Llic</td>
		</tr>

		<%
while(rs.next())
{
tlname=rs.getString("lname");
tlpwd=rs.getString("lpwd");
tlid=rs.getInt("lid");
tlcontact=rs.getString("lcontact");
tldor=rs.getString("ldor");
tldoa=rs.getString("ldoa");
tllic=rs.getString("llic");
%>
		<tr>
			<td><%= tlid %></td>
			<td><%= tlname %></td>
			<td><%= tlpwd %></td>
			<td><%= tlcontact %></td>
			<td><%= tldor%></td>
			<td><%= tldoa%></td>
			<td><%= tllic %></td>
		</tr>
		<%
}
con.close();
%>
	</table>
</html>









