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
<body bgcolor=white>
	<%
rs=stmt.executeQuery("select leaveID from lmstab");

out.println("<b><center><font color=black size=5>ENTITLEMENT OF LEAVES</font></center></b><br><br><br>");


out.println("<form method=post action='chleave.jsp'><b><center>Select leave<select name='spt'></b>");

while(rs.next())
{
out.println("<option>"+rs.getString(1)+"</option>");
};

out.println("</select><br><br><br><center>Apply Leave <input type=radio name=r1 value=1>");

out.println("Understand Leave <input type=radio name=r1 checked value=2>");


out.println("<br><br><input type=submit  value=submit>");
out.println("</form></body></html>");
con.close();
%>