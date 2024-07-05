<%@   page import="java.sql.*;"%>

<html>

<head>

<script type="text/javascript">

function validate_reg()
{   

	var lname=document.getElementById("lname").value;
	if (lname==null || lname=="")
	  {
	  document.getElementById("lname").focus();
	  alert("Login Name must be filled out");
	  return false;
	  }
	
	var lpwd=document.getElementById("lpwd").value;
	if (lpwd==null || lpwd=="")
	  {
	  document.getElementById("lpwd").focus();
	  alert("Login Password must be filled out");
	  return false;
	  }
	
	var lcontact=document.getElementById("lcontact").value;
	if (lcontact==null || lcontact=="")
	  {
	  document.getElementById("lcontact").focus();
	  alert("Login Contact must be filled out");
	  return false;
	  }
	
	
	
	var ldoa=document.getElementById("ldoa").value;
	if (ldoa==null || ldoa=="")
	  {
	  document.getElementById("ldoa").focus();
	  alert("Date of Appt. must be filled out");
	  return false;
	  }
	
}
</script>
</head>
	

<body bgcolor=white>
	<b><center>
			<font color=black size=5>ALTER PILOT</font>
		</center></b>
	<br>
	<br>
	<br>

	<%!
int  tpid;
Connection con;
Statement stmt;
ResultSet rs;
String st;
%>

	<%
tpid=Integer.parseInt((String)session.getAttribute("spid"));
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
rs=stmt.executeQuery("select * from pilots where lid="+tpid);
if (rs.next())
{
%>

	<form method=post action="upilot.jsp">
		<table border=0>

			<tr>
				<td>Login Name</td>
				<td><input type=text name="lname" size=10
					value=<%= rs.getString("lname")%> id="lname"></td>
			</tr>

			<tr>
				<td>Login Pwd</td>
				<td><input type=password name="lpwd" size=10
					value=<%= rs.getString("lpwd")%> id="lpwd"></td>
			</tr>

			<tr>
				<td>Contact Addr</td>
				<td><input type=text name="lcontact" size=10
					value=<%= rs.getString("lcontact")%> id="lcontact"></td>
			</tr>

			<tr>
				<td>Date of Regn</td>
				<td><input type=text name="ldor" size=10
					value=<%= rs.getString("ldor")%> disabled></td>
			</tr>

			<tr>
				<td>Date of Appt.</td>
				<td><input type=text name="ldoa" size=10
					value=<%= rs.getString("ldoa")%> id="ldoa"></td>
			</tr>

			<tr>
				<td>Licence Type</td>

				<td>
					<%
st=rs.getString("llic");
%> <select name="llic">

						<%
if(st.equals("SPL"))
{
%>
						<option value="SPL" SELECTED>SPL</option>
						<option value="PPL">PPL</option>
						<option value="CPL">CPL</option>
						<%
}
if(st.equals("PPL"))
{
%>
						<option value="PPL" SELECTED>PPL</option>
						<option value="CPL">CPL</option>
						<option value="SPL">SPL</option>

						<%
}
if(st.equals("CPL"))
{
%>
						<option value="CPL" SELECTED>CPL</option>
						<option value="SPL">SPL</option>
						<option value="PPL">PPL</option>
						<%
}
%>
				</select>
				</td>
			</tr>
			<tr>
				<td><input type=submit value="Update" onclick="return validate_reg()"></td>
				<td><input type=reset></td>
			</tr>
		</table>
	</form>

	<%
}
else
out.println("Pilot Not Found!");
con.close();
}
catch(Exception e1)
{
out.println("Error : Invalid Login Data / Connection Unavailable!"  );
}
%>