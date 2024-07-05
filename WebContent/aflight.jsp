<%@   page import="java.sql.*;"%>

<html>
<head>

<script type="text/javascript">

function validate_reg()
{   

	var lsrc=document.getElementById("lsrc").value;
	if (lsrc==null || lsrc=="")
	  {
	  document.getElementById("lsrc").focus();
	  alert("Source must be filled out");
	  return false;
	  }
	
	
	
	var ldest=document.getElementById("ldest").value;
	if (ldest==null || ldest=="")
	  {
	  document.getElementById("ldest").focus();
	  alert("Destination must be filled out");
	  return false;
	  }
	
	var lat=document.getElementById("lat").value;
	if (lat==null || lat=="")
	  {
	  document.getElementById("lat").focus();
	  alert("Arrival time must be filled out");
	  return false;
	  }
	
	var ldt=document.getElementById("ldt").value;
	if (ldt==null || ldt=="")
	  {
	  document.getElementById("ldt").focus();
	  alert("Departure time must be filled out");
	  return false;
	  }
	
	var lrj=document.getElementById("lrj").value;
	if (lrj==null || lrj=="")
	  {
	  document.getElementById("lrj").focus();
	  alert("Exe.Class Fare time must be filled out");
	  return false;
	  }
	var lry=document.getElementById("lry").value;
	if (lry==null || lry=="")
	  {
	  document.getElementById("lry").focus();
	  alert("Eco.Class Fare time must be filled out");
	  return false;
	  }

}

</script>

</head>


<body bgcolor=white>
	<b><center>
			<font color=black size=5>ALTER FLIGHT</font>
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
rs=stmt.executeQuery("select * from flights where fno='"+tpid+"'");
if (rs.next())
{
%>

	<form method=post action="uflight.jsp">
		<table>

			<tr>
				<td>Flight No</td>
				<td><input type=text name="lfno" size=10
					value=<%= rs.getString("fno")%> disabled></td>
				<td>Flight Name</td>
				<td><input type=text name="lfname" size=10
					value=<%= rs.getString("fname")%> disabled></td>
			</tr>

			<tr>
				<td>Source</td>
				<td><input type=text name="lsrc" size=10
					value=<%= rs.getString("src")%> id="lsrc"></td>
				<td>Destination</td>
				<td><input type=text name="ldest" size=10
					value=<%= rs.getString("dest")%> id="ldest"></td>
			</tr>

			<tr>
				<td>Arr.Time</td>
				<td><input type=text name="lat" size=10
					value=<%= rs.getString("atime")%> id="lat"></td>
				<td>Dep.Time</td>
				<td><input type=text name="ldt" size=10
					value=<%= rs.getString("dtime")%> id="ldt"></td>
			</tr>

			<tr>
				<td>Exe.Class Seats</td>
				<td><input type=text name="lnsj" size=10
					value=<%= rs.getInt("nsg")%> disabled></td>
				<td>Eco.Class Seats</td>
				<td><input type=text name="lnsy" size=10
					value=<%= rs.getInt("nsy")%> disabled></td>
			</tr>

			<tr>
				<td>Exe.Class Fare</td>
				<td><input type=text name="lrj" size=10
					value=<%= rs.getInt("rj")%> id="lrj"></td>
				<td>Eco.Class Fare</td>
				<td><input type=text name="lry" size=10
					value=<%= rs.getInt("ry")%> id="lry"></td>
			</tr>

			<tr>
				<td>Date of Intro</td>
				<td><input type=text name="ldoi" size=10
					value=<%= rs.getString("doi")%> disabled></td>
			</tr>

		</table>
		<center>
			<input type=submit value='Update' onclick="return validate_reg()">
		</center>
	</form>

	<%
}
else
out.println("Flight Not Found!");
con.close();
}
catch(Exception e1)
{
out.println("Error : Invalid Login Data / Connection Unavailable!" +e1.getMessage());
}
%>