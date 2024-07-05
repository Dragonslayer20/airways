<%@   page import="java.sql.*;"%>

<html>
<body bgcolor=white>
	<b><center>
			<font color=black size=5>List Leave Status</font>
		</center></b>
	<br>
	<br>
	<br>

<%
String tsname,tsid,tdoo;
int tpid;
Connection con=null;
Statement stmt=null;
ResultSet rs=null;
%>

<%
try
{
tpid=Integer.parseInt(session.getAttribute("lvid").toString());
System.out.println("************************"+tpid);
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/airline","root","");
stmt=con.createStatement();
rs=stmt.executeQuery("select * from lappd where pid="+tpid);
//System.out.println(rs.getString("ltype"));
}
catch(Exception e)
{
out.println("Error : " + e.getMessage());
}
%>
	<table align=center border>
		<tr>
			<td>Leave Type</td>
			<td>Date.App</td>
			<td>Leave From</td>
			<td>No. Days</td>
			<td>Status</td>
			<td>Leave ID</td>
		</tr>

<%

while(rs.next())
{
String f1,f2,f3,f4,f5;
int f6;
f1=rs.getString("ltype");
f2=rs.getString("dola");
f3=rs.getString("dolf");
f4=rs.getString("dolt");
f5=rs.getString("lstatus");
f6=rs.getInt("leaveid");
%>
		<tr>
			<td><%= f1 %></td>
			<td><%= f2 %></td>
			<td><%= f3 %></td>
			<td><%= f4%></td>
			<td><%= f5%></td>
			<td><%= f6%></td>

		</tr>
		<%
}
con.close();
%>
	</table>
</html>









