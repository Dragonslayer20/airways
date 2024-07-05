<%@ page import="java.sql.*,java.util.*"%>
<html>
<body bgcolor=white>
	<b><center>
			<font color=black size=5>LEAVE APPLICATION STATUS SET</font>
		</center></b>
	<br>
	<br>
	<br>
	<%!
int  tpid;
String ltyp;
Connection con;
Statement stmt,stmt2;
ResultSet rs;
%>

	<%
tpid=Integer.parseInt((String)session.getAttribute("lpid"));
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
String stat;
stat=request.getParameter("stat");

int leaid;
leaid=Integer.parseInt((String)session.getAttribute("leaid"));

String stt;
stt="update lappd set lstatus='"+stat +"'  where pid="+tpid+" and leaveid="+leaid;
//out.println(stt);
stmt.executeUpdate("update lappd set lstatus='"+stat +"'  where pid="+tpid+" and leaveid="+leaid);

if(stat.equals("Grant"))
{
String lst;
lst=(String)session.getAttribute("lst");

int nd;
nd=Integer.parseInt((String)session.getAttribute("nd"));

String ust;
ust="";
int ndays;
ndays=nd;

if(lst.equals("ACC"))
ust="nacc=nacc - " + ndays;

if(lst.equals("CAS"))
ust="ncas=ncas - " + ndays;

if(lst.equals("ENC"))
ust="nenc=nenc - " + ndays;

if(lst.equals("ENS"))
ust="nens=nens - " + ndays;

if(lst.equals("PRE"))
ust="npre=npre - " + ndays;

if(lst.equals("SIC"))
ust="nsic=nsic - " + ndays;

if(lst.equals("SPE"))
ust="nspe=nspe - " + ndays;


String ttt;
ttt="update pleave set "+ust+" where pid=" + tpid;
//out.println(ttt);
stmt2.executeUpdate(ttt);

}
out.println("<b><font color=red size=5>Leave Status set to "+stat);
con.close();
}
catch(Exception e1)
{
out.println("Error : Invalid Data / Check Leave Dates / Connection Availability!" +e1.getMessage());
}
%>