<%@ page import="java.util.*"%>

<html>

<head>

<script type="text/javascript">

function validate_reg()
{   

	var sid=document.getElementById("sid").value;
	if (sid==null || sid=="")
	  {
	  document.getElementById("sid").focus();
	  alert("Sector ID be filled out");
	  return false;
	  }
	
	var sname=document.getElementById("sname").value;
	if (sname==null || sname=="")
	  {
	  document.getElementById("sname").focus();
	  alert("Sector Name be filled out");
	  return false;
	  }
	
	var sc=document.getElementById("sc").value;
	if (sc==null || sc=="")
	  {
	  document.getElementById("sc").focus();
	  alert("sector country be filled out");
	  return false;
	  }
	
}
</script>
</head>
<body background="air6.gif">
	<b><font color="black" size="5"> <center>Introduce a
				Sector</center></font></b>
	

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

	<form method="post" action="isector.jsp">
		<table border="0" align="center">

			<tr>
				<td>Sector ID</td>
				<td><input type="text" name="sid" size="10" id="sid"></td>
			</tr>
			<tr>
				<td>Sector Name</td>
				<td><input type="text" name="sname" size="10" id="sname"></td>
			</tr>
			<tr>
				<td>Sector Country</td>
				<td><input type="text" name="sc" size="10" id="sc"></td>
			</tr>
			<tr>
				<td>Date of Operation</td>
				<td><input type="text" name="doo" size="10" value=<%= dat%>
					disabled="disabled"></td>
			</tr>


			<tr>
				<td><input type=submit value="Register" onclick="return validate_reg()"></td>
				<td><input type=reset></td>
			</tr>
		</table>
	</form>
	</body>
</html>









