<%@   page import="java.sql.*,java.util.*;"%>


<%!
String tlname,tlpwd,tlcontact,tldor,tldoa,tllic;
int ruid;
Connection con;
Statement stmt1,stmt2;
ResultSet rs;
java.util.Date dt;
int dd,dm,dy;
String dat;
%>

<%
dt=new java.util.Date();
dd=dt.getDate();
dm=dt.getMonth()+1;
dy=dt.getYear()+1900;
dat=dd+"/"+dm+"/"+dy;
%>
<body bgcolor=white>
	<%
try
{
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/airline","root","");
stmt1=con.createStatement();
stmt2=con.createStatement();

tlname=request.getParameter("lname");
tlpwd=request.getParameter("lpwd");
tlcontact=request.getParameter("lcontact");
tldor=dat;
tldoa=request.getParameter("ldoa");
tllic=request.getParameter("llic");
}
catch(Exception e)
{
out.println("Error : " + e.getMessage());
}
%>

	<%

try
{
rs=stmt1.executeQuery("select max(lid) from pilots ");
if (rs.next())
{
ruid=rs.getInt(1)+1;

stmt2.executeUpdate("insert into pilots values('"+tlname+"','"+tlpwd+"',"+ruid+",'"+tlcontact+"','"+tldor+ "','"+tldoa+"','"+tllic+"')"  );
out.println("<b><font color=black size=4>Congratulations! Your Regn No : " + ruid);
out.println("<p>You can now login using your Regno & Pwd.");
}
else
ruid=1000;

con.close();
}
catch(Exception e1)
{
out.println("Error :Connection Unavailable!"+ e1.getMessage()  );
}
%>

</body>


