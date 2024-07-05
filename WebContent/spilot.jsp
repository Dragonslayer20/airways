<%@   page import="java.sql.*;"%>

<%!
Connection con;
Statement stmt;
ResultSet rs;
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
<html>
<body background="imag1.bmp"  >
	<%
rs=stmt.executeQuery("select lid from pilots where lid!=1000");

out.println("<b><center><font color=black size=5>ALTER/RETIRE PILOT</font></center></b><br><br><br>");

out.println("<form method=post action=vpilot.jsp><b><center>Select a Pilot <select name=spt></b>");
while(rs.next())
{
out.println("<option>"+rs.getString(1)+"</option>");
}
out.println("</select><br><br><br><center>Alter <input type=radio name=r1 value=1>Retire <input type=radio name=r1 checked value=2><br><br><br>");

out.println("<input type=submit value=Process><input type=reset>");	
out.println("</form></body></html>");
con.close();
%>