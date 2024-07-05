<%@   page import="java.sql.*;"%>

<html>
<head>

<script type="text/javascript">

function validate_reg()
{   

	var sname=document.getElementById("sname").value;
	if (sname==null || sname=="")
	  {
	  document.getElementById("sname").focus();
	  alert("Sector Name must be filled out");
	  return false;
	  }
	
	var sc=document.getElementById("sc").value;
	if (sc==null || sc=="")
	  {
	  document.getElemesntById("sc").focus();
	  alert("Sector country must be filled out");
	  return false;
	  }
}
</script>
</head>



<body bgcolor=white>
	<b><center>
			<font color=black size=5>ALTER SECTOR</font>
		</center></b>
	<br>

	<%!
String  tpid;
Connection con;
Statement stmt;
ResultSet rs;
String st;
%>

	<%
tpid=(String)session.getAttribute("rid");
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
rs=stmt.executeQuery("select * from sectors where sid='"+tpid+"'");
if (rs.next())
{
%>

	<form method=post action="usector.jsp">
		<table border=0 align=center>

			<tr>
				<td>Sector ID</td>
				<td><input type=text name="sid" size=10
					value=<%= rs.getString("sid")%> disabled></td>
			</tr>
			<tr>
				<td>Sector Name</td>
				<td><input type=text name="sname" size=10
					value=<%= rs.getString("sname")%> id="sname"></td>
			</tr>
			<tr>
				<td>Sector Country</td>
				<td><input type=text name="sc" size=10
					value=<%= rs.getString("scountry")%> id="sc"></td>
			</tr>
			<tr>
				<td>Date of Open</td>
				<td><input type=text name="doo" size=10
					value=<%= rs.getString("doo")%> disabled></td>
			</tr>

		</table>
		<br>
		<br>
		<br>
		<center>
			<input type=submit value='Update' onclick="return validate_reg()">
		</center>
	</form>

	<%
}
else
out.println("Sector Not Found!");
con.close();
}
catch(Exception e1)
{
out.println("Error : Invalid Login Data / Connection Unavailable!" +e1.getMessage());
}
%>