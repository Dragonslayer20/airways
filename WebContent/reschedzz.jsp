<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@   page import="java.sql.*;"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body bgcolor="white">
	<b><center>
			<font color="black" size="5">FLIGHTS TO BE RESCHEDULED</font>
		</center></b>
	<br>
	<br>
	<br>
	<%
  int tscid=Integer.parseInt(request.getParameter("scid"));
  int fcode=Integer.parseInt(request.getParameter("fcode"));
  int tpid=Integer.parseInt(request.getParameter("spid"));
  String tsdat=request.getParameter("sdat");

try
{
	Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/airline","root","");
Statement stmt=con.createStatement();
stmt.executeUpdate("update schedule set  sid='"+tscid+"',fcode='"+fcode+"', pid='"+tpid+"',sdat='"+tsdat+"' where pid='"+tpid+"'");
out.println("<b><font color=black size=4>Reschedule done");
}
catch(Exception e1)
{
	System.out.println("******************************************************came here1");
out.println("Error :Connection Unavailable!"+ e1.getMessage()  );
}
%>

</body>
</html>