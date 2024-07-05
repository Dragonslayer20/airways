<%@   page import="java.sql.*;"%>

<html>
<body bgcolor=white>
	<b><center>
			<font color=black size=5> RESCHEDULE STATUS</font>
		</center></b>
	<br>
	<br>
	<br>

	<%!
int tscid,tpid;
String tsdat;
String f1;
int  f2,f3,f4;
Connection con;
Statement stmt,stmt1,stmt2,stmt3;
ResultSet rs,rs1,rs2;
%>

	<%
f3=Integer.parseInt(request.getParameter("schdid"));
f2=Integer.parseInt(request.getParameter("pid"));
f4=Integer.parseInt(request.getParameter("rpid"));
tsdat=request.getParameter("sdat");

try
{
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/airline","root","");
stmt=con.createStatement();
stmt1=con.createStatement();
stmt2=con.createStatement();
stmt3=con.createStatement();

stmt1.executeUpdate("insert into reschedule values("+f3+ ","+f2+","+f4+",'"+tsdat+"')");

stmt3.executeUpdate("update schedule set status='R' where schedid="+f3);

rs=stmt.executeQuery("select * from schedule where pid="+f2);


if( rs.next())
stmt2.executeUpdate("insert into schedule values("+f3+",'"+rs.getString(2)+"','"+rs.getString(3)+"',"+f4+",'"+tsdat+"','S')" );

out.println("Re-Schedule Done.");
con.close();
}
catch(Exception e)
{
out.println("Error : " + e.getMessage());
}
%>