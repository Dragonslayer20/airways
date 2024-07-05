<%@ page import="java.util.*"%>

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
	
	var password=document.getElementById("password").value;
	if (password==null || password=="")
	  {
	  document.getElementById("password").focus();
	  alert("Login password must be filled out");
	  return false;
	  }
	
	var lcontact=document.getElementById("lcontact").value;
	if (lcontact==null || lcontact=="")
	  {
	  document.getElementById("lcontact").focus();
	  alert("Contact Addr must be filled out");
	  return false;
	  }
	
	var ldoa=document.getElementById("ldoa").value;
	if (ldoa==null || ldoa=="")
	  {
	  document.getElementById("ldoa").focus();
	  alert("Date of Appt. must be filled out");
	  return false;
	  }
	
	var x=document.getElementById("gmail").value;
	  var atpos=x.indexOf("@");
	  var dotpos=x.lastIndexOf(".");
	  if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length)
	  {
	  alert("Not a valid e-mail address");
	  document.getElementById("gmail").focus();
	  return false;
	  }
	
	
	
}
</script>

</head>
<center>
<body background="imag1.bmp"  >
	<br>
	<u><b><font color="black" size="5">Registration of Pilot</font></b></u>
	
	<br>

	<%!
Date dt;
int dd,dm,dy;
String dat;
%>

	<%
dt=new Date();
dd=dt.getDate();
dm=dt.getMonth()+1;
dy=dt.getYear()+1900;
dat=dd+"/"+dm+"/"+dy;
%>

	
	<form method=post action="ipoilet1.jsp">
		<table border=0>

			<tr>
				<td><b>Login Name</b></td>
				<td><input type="text" name="lname" size="10" id="lname"></td>
			</tr>

			<tr>
				<td><b>Login Password</b></td>
				<td><input type="password" name="lpwd" size="10" id="password"></td>
			</tr>

			<tr>
				<td><b>Contact Address</b></td>
				<td><textarea name="lcontact" size="10" id="lcontact"></textarea></td>
			</tr>

			<tr>
				<td><b>Date of Joining</b></td>
				<td><input type="text" name="ldor" size="10" value=<%= dat%>
					disabled></td>
			</tr>

			<tr>
				<td><b>Date of Appointment</b></td>
				<td><input type=text name="ldoa" size="10" id="ldoa"></td>
			</tr>

			<tr>
				<td><b>Licence Type</b></td>

				<td><select name="llic">
						<option value="SPL">SPL</option>
						<option value="PPL">PPL</option>
						<option value="CPL">CPL</option>
				</select></td></tr>
                 <tr>
                    <td><b>Email id</b></td>  
                    <td><input type="text" name="gmail" size="10" id="gmail"></td>
			</tr>
			<tr>
				<td><input type="submit" value="Register" onclick="return validate_reg()"></td>
				<td><input type="reset"></td>
			</tr>
		</table>
	</form>
	</center>
</html>









