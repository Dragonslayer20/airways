<%@   page import="java.sql.*;"%>

<html>
<body bgcolor="white">
	<b><center>
			<font color="black" size="5">FLIGHTS TO BE RESCHEDULED</font>
		</center></b>
	<br>
	<br>
	<br>

	<%!
int tscid,tpid;
String tsdat;
String f1,f2,f3,f4;
int  f5,f6;
Connection con;
Statement stmt,stmt1,stmt2;
ResultSet rs,rs1,rs2;
%>

	<%
tscid=Integer.parseInt(request.getParameter("scid"));
	System.out.println("qqqqqqqqqq"+tscid);
tpid=Integer.parseInt(request.getParameter("spid"));
tsdat=request.getParameter("sdat");

out.println("<form method=post action=resched2.jsp><table align=center>");
out.println("<tr><td>Schedule ID </td><td><input type=text name=schdid value="+tscid+" disabled></td></tr>"); 
out.println("<tr><td>Pilot ID </td><td><input type=text name=pid value="+tpid+" disabled></td></tr>"); 
out.println("<tr><td>Schedule Date </td><td><input type=text name=sdat  value="+tsdat+" disabled></td></tr>"); 
out.println("</table>");
try
{
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/airline","root","");
stmt=con.createStatement();
stmt1=con.createStatement();
stmt2=con.createStatement();

rs1=stmt1.executeQuery("select * from sectors where pid  not in  (select pid from schedule)");
}
catch(Exception e)
{
out.println("Error : " + e.getMessage());
}
%>

	<h3>
		<center>Pilots Not Having a Schedule</center>
	</h3>
	<table align="center" >
		<tr>
			<td>Pilot ID</td>
			<td>Sector</td>
		</tr>

		<%
 while(rs1.next())
 {
f2=rs1.getString("sid");
 f6=rs1.getInt("pid");
%>

<tr>
		<td><%= f6 %></td> 
 			<td><%= f2 %></td> 
		</tr> 

	<% 
}
%>
	</table>

	<h3>
		<center>Pilots Not Having a Schedule and No Leave Granted</center>
	</h3>
	<table align="center">
		<tr>
			<td>Pilot ID</td>
			<td>Sector</td>
		</tr>

		<%
rs2=stmt2.executeQuery("select * from schedule,sectors where sdat<>'"+tsdat+"'  and schedule.pid<>"+tpid+" and schedule.pid not in (select pid from lappd where dolf='"+tsdat+"' and lstatus='Grant' ) and schedule.pid=sectors.pid");
%>

		<%
while(rs2.next())
{
f6=rs2.getInt("pid");
f2=rs2.getString("sid");
%>

		<tr>
			<td><%= f6 %></td>
			<td><%= f2 %></td>
		</tr>

		<%
}
%>
	</table>



	<%
con.close();
%>
	
	<center>
		Specify Pilot ID <input type="text" name="rpid" size="10"> <input
			type="submit">
	</center>


	</body>
</html>









