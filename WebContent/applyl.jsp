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
tpid=Integer.parseInt((String)session.getAttribute("lvid"));
ltyp=(String)session.getAttribute("lv");
%>

	<%
try
{
	Class.forName("com.mysql.jdbc.Driver");
    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/airline","root","");
stmt=con.createStatement();
stmt2=con.createStatement();
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
lf=request.getParameter("lfrom");
lto=request.getParameter("lto");
int leaveid;

rs2=stmt2.executeQuery("select max(leaveid) from lappd");

if(rs2.next())
leaveid=rs2.getInt(1)+1;
else
leaveid=3000;

stmt.executeUpdate("insert into lappd values("+tpid+",'"+ltyp+"','"+dat+"','"+lf+"','"+lto+"','Pending',"+leaveid +")");

out.println("Leave Application Submitted Successfully");
con.close();
}
catch(Exception e1)
{
out.println("Error : Invalid Data / Check Leave Dates / Connection Availability!" +e1.getMessage());
}
%>