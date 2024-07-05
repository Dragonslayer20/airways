<%@   page import="java.sql.*;"%>

<html>

<head>

<script type="text/javascript">

function validate_reg()
{   

	var scid=document.getElementById("scid").value;
	if (scid==null || scid=="")
	  {
	  document.getElementById("scid").focus();
	  alert("Schedule ID must be filled out");
	  return false;
	  }
	
	var spid=document.getElementById("spid").value;
	if (spid==null || spid=="")
	  {
	  document.getElementById("spid").focus();
	  alert("Pilot ID must be filled out");
	  return false;
	  }
	
	var fcode=document.getElementById("fcode").value;
	if (fcode==null || fcode=="")
	  {
	  document.getElementById("fcode").focus();
	  alert("Flifght code must be filled out");
	  return false;
	  }
	
	var sdat=document.getElementById("sdat").value;
	if (sdat==null || sdat=="")
	  {
	  document.getElementById("sdat").focus();
	  alert("Schedule Date must be filled out");
	  return false;
	  }
	
	
}
</script>
</head>

<body bgcolor="white">
	<b><center>
			<font color="black" size="5">FLIGHTS TO BE RESCHEDULED</font>
		</center></b>
	<br>
	<br>
	<br>

	<%!
String f1,f2,f3,f4;
int  f5,f6;
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
rs=stmt.executeQuery("select * from schedule");
}
catch(Exception e)
{
out.println("Error : " + e.getMessage());
}
%>
	<table align="center" border="1">
		<tr>
			<td>Pilot ID</td>
			<td>Schedule ID</td>
			<td>Sector</td>
			<td>Flight Code</td>
			<td>Schedule Date</td>
			</tr>
		<%
while(rs.next())
{
f1=rs.getString("schedid");
f2=rs.getString("sid");
f3=rs.getString("fcode");
f6=rs.getInt("pid");
f4=rs.getString("sdat");
System.out.println(f6+"#######");
%>
		<tr>
			<td><%=f6%></td>
			<td><%=f1%></td>
			<td><%=f2%></td>
			<td><%=f3%></td>
			<td><%=f4%></td>
		</tr>
		<%
}
con.close();
%>
	</table>

	<form method="post" action='reschedzz.jsp'>
		<table align="center">
			<tr>
				<td>Select Schedule ID</td>
				<td><input type="text" name="scid" id="scid"></td>
			</tr>
			
			<tr>
				<td>Select Flight Code</td>
				<td><input type="text" name="fcode" id="fcode"></td>
			</tr>

			<tr>
				<td>Specify Pilot ID</td>
				<td><input type="text" name='spid' id="spid"></td>
			</tr>

			<tr>
				<td>Specify Schedule Date</td>
				<td><input type="text" name='sdat' id="sdat"></td>
			</tr>
		</table>
		<center>
			<input type="submit"  value="Submit" onclick="return validate_reg()">
			</center>
			
	</form>
	</body>
</html>









