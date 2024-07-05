<%@   page import="java.sql.*;"%>

<html>

<head>

<script type="text/javascript">

function validate_reg()
{   

	var fcode=document.getElementById("fcode").value;
	if (fcode==null || fcode=="")
	  {
	  document.getElementById("fcode").focus();
	  alert("Flight Code must be filled out");
	  return false;
	  }
}
</script>

</head>


<body bgcolor=white>
	<b><center>
			<font color=black size=5>Flights Available</font>
		</center></b>
	<br>
	<br>
	<br>

	<%!
String tsname,tsid,tsecid,tsrc;
int tpid;
Connection con;
Statement stmt;
ResultSet rs;
%>

	<%
try
{
tsecid=request.getParameter("secid");
System.out.println(tsecid+"/////////////////");
session.setAttribute("secid",tsecid);
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/airline","root","");
stmt=con.createStatement();
rs=stmt.executeQuery("select * from flights");
}
catch(Exception e)
{
out.println("Error : " + e.getMessage());
}
%>
	<%
out.println("<form method=post action='sched2.jsp'>");
out.println("<center>Operating Sector <input type=text value=" + tsecid + " disabled><br><br>");
%>
	<table align=center border>
		<tr>
			<td>Flight Code</td>
			<td>FlightName</td>
			<td>Destination</td>
		</tr>

		<%
while(rs.next())
{
tsid=rs.getString("fno");
tsname=rs.getString("fname");
tsrc=rs.getString("dest");
%>
		<tr>
			<td><%= tsid %></td>
			<td><%= tsname %></td>
			<td><%= tsrc %></td>
		</tr>
		<%
}
con.close();
out.println("</table>");
out.println("<br><center>Choose Flight Code <input type=text name='fcode' size=10 id='fcode' >");
out.println("<br><br><input type='submit' value=Submit onclick='return validate_reg()'></center></form>");
%>
	</table>
</html>









