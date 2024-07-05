<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@   page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

<%@ page import="java.text.*" %>
        <%@ page import="java.sql.Date" %>   
        <%@ page language="java" %>
        <%@ page language = "java" %> 


<%@page import="javax.mail.*"%>    
<%@page import="javax.mail.internet.*"%> 
<%@page import="java.util.*" %>  
<%@page import="java.io.*"%>

<%!
String tlname,tlpwd,tlcontact,tldor,tldoa,tllic,tmail;
int ruid;
Connection con;
Statement stmt1,stmt2,stmt3;
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
//	System.out.println("******************************************************came here222222222222");
	Class.forName("com.mysql.jdbc.Driver");
//	System.out.println("laoded.......................");
    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/airline","root","");
  //System.out.println("******************************************************connection"+con);
  stmt1=con.createStatement();
 //System.out.println("******************************************************came here"+stmt1);
 stmt2=con.createStatement();
 stmt3=con.createStatement();

 tlname=request.getParameter("lname");
 tlpwd=request.getParameter("lpwd");
 tlcontact=request.getParameter("lcontact");
 tldor=dat;
 tldoa=request.getParameter("ldoa");
 tllic=request.getParameter("llic");
 tmail = request.getParameter("gmail");
}
catch(Exception e)
{
out.println("Error : " + e.getMessage());
}

try
{
System.out.println("second try");
rs=stmt1.executeQuery("select max(lid) from pilots ");
System.out.println("******************************************************came here"+rs);
if (rs.next())
{
ruid=rs.getInt(1)+1;
System.out.println(ruid+"xxxxxxxxxxxxxxxxxxxx");
int i = stmt2.executeUpdate("insert into pilots values('"+tlname+"','"+tlpwd+"',"+ruid+",'"+tlcontact+"','"+tldor+ "','"+tldoa+"','"+tllic+"','"+tmail+"')"  );
stmt3.executeUpdate("insert into pleave values("+ruid+",11,12,13,14,15,16,17)");

//out.println("<b><font color=red size=4>Congratulations! Your Regn No : " + ruid);
//out.println("<p>You can now login using your Regno & Pwd.");
out.println("<b><font color=black size=4>Pilot successfully registered");
}
}
catch(Exception e1)
{
	System.out.println("******************************************************came here1");
out.println("Error :Connection Unavailable!"+ e1.getMessage()  );
}
%>

</body>



</html>