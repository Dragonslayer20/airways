<%@ page import="java.sql.*,java.util.*"%>
<html>
<body bgcolor=white>
	<b><center>
			<font color=black size=5>LEAVE APPLICATION STATUS</font>
		</center></b>
	<br>
	<br>
	<br>

	<%!
int  tpid;
String ltyp;
Connection con;
Statement stmt,stmt2;
ResultSet rs,rs2;
int dd,dm,dy;
java.util.Date dt;
String dat;
%>

	<%
dt=new java.util.Date();
dd=dt.getDate();
dm=dt.getMonth()+1;
dy=dt.getYear()+1900;
dat=dd+"/"+dm+"/"+dy;
%>

	<%
tpid=Integer.parseInt(request.getParameter("pid"));
%>

	<%
try
{
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/airline","root","");
stmt=con.createStatement();
stmt2=con.createStatement();
ResultSet rs;
}
catch(Exception e)
{
out.println("Error : " + e.getMessage());
}
%>
	<%
try
{
String lf,lto;
rs=stmt.executeQuery("select * from lappd where leaveid="+tpid+" and lstatus='Pending'");
out.println("<form method=post action='setstat.jsp'><table>");
if(rs.next())
{
String tt;

String lst;
int ttid;
ttid=rs.getInt("pid");
out.println("<tr><td>Pilot ID </td><td> <input type=text value="+ttid+" disabled></td></tr>");
tt=""+ttid;
session.setAttribute("lpid",tt);
lst=rs.getString("ltype");

session.setAttribute("lst",lst);
out.println("<tr><td>Leave Type </td><td> <input type=text value="+lst+" disabled></td></tr>");

out.println("<tr><td>Leave App Dated </td><td> <input type=text value="+rs.getString("dola")+" disabled></td></tr>");

String dolf;
dolf=rs.getString("dolf");

out.println("<tr><td>Leave From </td><td> <input type=text value="+dolf+" disabled></td></tr>");

String nd;
nd=rs.getString("dolt");
session.setAttribute("nd",nd);
out.println("<tr><td>No.Days </td><td> <input type=text value="+nd+" disabled></td></tr>");

out.println("<tr><td>Status </td><td> <input type=text value="+rs.getString("lstatus")+" disabled></td></tr>");

out.println("<tr><td>Set Status </td><td> <select name='stat'><option>Grant</option><option>Deny</option></select>");

String leaid;
leaid=""+rs.getInt("leaveid");
session.setAttribute("leaid",leaid);
out.println("<tr><td>Leave ID </td><td> <input type=text value="+leaid+"  disabled></td></tr>");

out.println("<tr><td></td><td><input type=submit value='Apply'></td></tr></table></form>");

rs2=stmt2.executeQuery("select * from schedule where pid="+ttid+" and sdat='"+dolf+"'");

if(rs2.next())
{
out.println("<b><font color=red size=5><center>Pilot has a Schedule for that Day.");
}
con.close();
}
else
out.println("Pilot Leave Status Already Set. Changes cannot be made");
}
catch(Exception e1)
{
out.println("Pilot Leave Status Already Set. Changes cannot be made"+e1.getMessage());
}
%>