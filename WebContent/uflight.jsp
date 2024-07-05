<%@   page import="java.sql.*;"%>

<html>
<body bgcolor=white>
	<b><center>
			<font color=black size=5>ALTER FLIGHT</font>
		</center></b>
	<br>
	<br>
	<br>

	<%!
String  tpid;
Connection con;
Statement stmt;
ResultSet rs;
String st;
String tsrc,tdest,tat,tdt;
int trjf,tryf;
%>

	<%
tpid=(String)session.getAttribute("fid");
%>

	<%
try
{
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/airline","root","");
stmt=con.createStatement();
}
catch(Exception e)
{
out.println("Error : " + e.getMessage());
}
%>

	<%
try
{
tsrc=request.getParameter("lsrc");
tdest=request.getParameter("ldest");
tat=request.getParameter("lat");
tdt=request.getParameter("ldt");
trjf=Integer.parseInt(request.getParameter("lrj"));
tryf=Integer.parseInt(request.getParameter("lry"));

stmt.executeUpdate("update flights set src='"+tsrc+"', dest='"+tdest+"', atime='" + tat+"', dtime='"+tdt+"', rj="+trjf    +", ry="+tryf   +" WHERE fno='"+tpid+"'");
con.close();
out.println("<font color=red size=4>Record Updated Sucessfully for Flight </font><font color=blue size=4>"+tpid+"</font>");
}
catch(Exception e)
{
out.println("<font color=red size=4>UPDATION FAILED!TRY AGAIN.</font>");
}
%>