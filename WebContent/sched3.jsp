<%@   page import="java.sql.*;"%>

<html>
<body bgcolor="white">
	<b><center>
			<font color="black" size="5">Confirm Schedule</font>
		</center></b>
	<br>
	<br>
	<br>

	<%!
String tsecid,tfcode,tdt,tpid;
int tscid;
Connection con;
Statement stmt,stmt2,stmt3,stmt4;
ResultSet rs,rs2,rs3;
%>

	<%
try
{
tsecid=(String)session.getAttribute("secid");
tfcode=(String)session.getAttribute("fcode");
tpid=request.getParameter("lid");
tdt=request.getParameter("dat");
System.out.println(tpid);
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/airline","root","");
stmt=con.createStatement();
stmt2=con.createStatement();
stmt3=con.createStatement();
stmt4=con.createStatement();
System.out.println(tpid+"$$$$$$$$$$"+tdt);
rs=stmt.executeQuery("select * from schedule where pid=" + tpid + " and sdat='"+tdt+"'");
}
catch(Exception e)
{
out.println("Error : " + e.getMessage());
}
%>

<%
if(rs.next())
{
out.println("<b>This Pilot has an Existing Schedule on that Date for flight</b> " + rs.getString("fcode")+" operating for sector "+rs.getString("sid"));
}
else
{
rs2=stmt2.executeQuery("select * from lappd where pid="+tpid+" and dolf='"+tdt+"'");
if(rs2.next())
{
//leave applied
String lad;
lad=rs2.getString("lstatus");
if(lad.equals("Grant"))
out.println("Pilot On Leave Cannot Schedule");
else
{
out.println("Pilot Applied For Leave but yet to be finalized. Proceed to Schedule");
//
tscid=0;
rs3=stmt3.executeQuery("select max(schedid) from schedule");
try
{
if(rs3.next())
tscid=rs3.getInt(1)+1;
}
catch(Exception e1)
{
tscid=1;
out.println("error123 " + e1.getMessage());
}
stmt4.executeUpdate("insert into schedule values("+tscid+",'"+tsecid+"','"+tfcode+"',"+tpid+",'"+tdt+"')");
out.println("Schedule Done");
//
}
}
else
{
//not applied
rs3=stmt3.executeQuery("select max(schedid) from schedule");
try
{
if (rs3.next())
tscid=rs3.getInt(1)+1;
}
catch(Exception e1)
{
tscid=1;
out.println("error234 " + e1.getMessage());
}
stmt4.executeUpdate("insert into schedule values("+tscid+",'"+tsecid+"','"+tfcode+"',"+tpid+",'"+tdt+"','S')");
out.println("Schedule Done");
}
}

con.close();
%>
	
	</body>
</html>









