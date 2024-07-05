<%@   page import="java.sql.*;"%>
<html>
<center>
	<h3>Leave Maintenance</h3>
	<br>
	<form method=post action='leavest.jsp'>

		<%!
String tlname,tlpwd,tlcontact,tldor,tldoa,tllic;
int  tlid,lvid;
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
stmt=con.createStatement();
rs=stmt.executeQuery("select * from lappd where lstatus='Pending' and pid>1000");
}
catch(Exception e)
{
out.println("Error : " + e.getMessage());
}
%>
		<form method=post action=leavest.jsp>
			<table align=center border>
				<tr>
					<td>Pilot ID</td>
					<td>Ltype</td>
					<td>Date.Appp</td>
					<td>Leave From</td>
					<td>No.Days</td>
					<td>Lid</td>
				<tr>
					<%
try
{
while(rs.next())
{
String f1,f2,f3;
int f4,f5,f6;
f6=rs.getInt("pid");
f1=rs.getString("ltype");
f2=rs.getString("dola");
f3=rs.getString("dolf");
f4=rs.getInt("dolt");
f5=rs.getInt("leaveid");

%>
				
				<tr>
					<td><%= f6 %></td>
					<td><%= f1 %></td>
					<td><%= f2 %></td>
					<td><%= f3 %></td>
					<td><%= f4 %></td>
					<td><%= f5%></td>
				</tr>
				<%
}
con.close();
}
catch(Exception e3)
{
out.println(e3.getMessage());
}
%>

			</table>
			<%
out.println("Leave Id <input type=text name=pid size=10>"  );
out.println("<input type=submit value=Submit></form>");
%>
		
</center>
</html>