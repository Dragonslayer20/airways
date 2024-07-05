<%@   page import="java.sql.*;"%>

<html>

<head>

<script type="text/javascript">

function validate_reg()
{   

	var dat=document.getElementById("dat").value;
	if (dat==null || dat=="")
	  {
	  document.getElementById("dat").focus();
	  alert("Schedule Date be filled out");
	  return false;
	  }
}
</script>

</head>

<body bgcolor=white>
	<b><center>
			<font color=black size=5>Flights Available</font>
		</center></b>
	<br>
	<br>
	<br>

	<%!
String tsname,tsid,tsecid,tsrc,tdest,tfcode,tat,tdt;
int tpid;
Connection con;
Statement stmt,stmt2;
ResultSet rs,rs2;
%>

	<%
try
{
tsecid=(String)session.getAttribute("secid");
tfcode=request.getParameter("fcode");
session.setAttribute("fcode",tfcode);

Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/airline","root","");
stmt=con.createStatement();
stmt2=con.createStatement();
rs=stmt.executeQuery("select * from flights");
}
catch(Exception e)
{
out.println("Error : " + e.getMessage());
}
%>
	<%
out.println("<form method=post action='sched3.jsp'>");
out.println("<center>Operating Sector <input type=text value=" + tsecid + " disabled><br><br>");
out.println("<center>Operating Flight <input type=text value=" + tfcode + " disabled><br><br>");
%>
	<table align=center border>
		<tr>
			<td>FlightName</td>
			<td>Source</td>
			<td>Destination</td>
			<td>Arr.Time</td>
			<td>Dep. Time</td>
		</tr>

		<%
if(rs.next())
{
tsname=rs.getString("fname");
tsrc=rs.getString("src");
tdest=rs.getString("dest");
tat=rs.getString("atime");
tdt=rs.getString("dtime");
%>
		<tr>
			<td><%= tsname %></td>
			<td><%= tsrc %></td>
			<td><%= tdest %></td>
			<td><%= tat %></td>
			<td><%= tdt %></td>
		</tr>
		<%
}
out.println("</table>");
rs2=stmt2.executeQuery("select * from pilots where lid!=1000");
out.println("<br><br>Select Pilot To Fly<select name=lid>");
while(rs2.next())
{
out.println("<option>"+rs2.getString("lid")+"</option>");
}
out.println("</select><br><br>Schedule Date<input type=text name='dat' id='dat'>");
out.println("<br><br><input type='submit' value='Submit' onclick='return validate_reg()' ></center></form>");
con.close();
%>
	</table>
</html>









