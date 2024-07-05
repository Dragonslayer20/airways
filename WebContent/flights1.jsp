<%@ page import="java.util.*"%>

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
	
	var fname=document.getElementById("fname").value;
	if (fname==null || fname=="")
	  {
	  document.getElementById("fname").focus();
	  alert("Flight Name must be filled out");
	  return false;
	  }
	
	var fsrc=document.getElementById("fsrc").value;
	if (fsrc==null || fsrc=="")
	  {
	  document.getElementById("fsrc").focus();
	  alert("Flight Source must be filled out");
	  return false;
	  }
	
	var fdest=document.getElementById("fdest").value;
	if (fdest==null || fdest=="")
	  {
	  document.getElementById("fdest").focus();
	  alert("Flight Destination must be filled out");
	  return false;
	  }
	
	var fat=document.getElementById("fat").value;
	if (fat==null || fat=="")
	  {
	  document.getElementById("fat").focus();
	  alert("Arrival Time must be filled out");
	  return false;
	  }
	
	var fdt=document.getElementById("fdt").value;
	if (fdt==null || fdt=="")
	  {
	  document.getElementById("fdt").focus();
	  alert("Departure Time must be filled out");
	  return false;
	  }
	
	
	var fjnos=document.getElementById("fjnos").value;
	if (fjnos==null || fjnos=="")
	  {
	  document.getElementById("fjnos").focus();
	  alert("Executive Class NOS must be filled out");
	  return false;
	  }
	
	var fynos=document.getElementById("fynos").value;
	if (fynos==null || fynos=="")
	  {
	  document.getElementById("fynos").focus();
	  alert("Economy Class NOS must be filled out");
	  return false;
	  }
	
	var fjfare=document.getElementById("fjfare").value;
	if (fjfare==null || fjfare=="")
	  {
	  document.getElementById("fjfare").focus();
	  alert("Executive Fare must be filled out");
	  return false;
	  }
	
	var fyfare=document.getElementById("fyfare").value;
	if (fyfare==null || fyfare=="")
	  {
	  document.getElementById("fyfare").focus();
	  alert("Economy Fare must be filled out");
	  return false;
	  }
	
}

</script>
</head>


<body background="air.bmp">
	<b><font color="black" size="5"> <center>Introduce a
				Flight</center></font></b>
	
	
	

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

	<form method="post" action="iflight.jsp">
		<table border="0" align="center">

			<tr>
				<td>Flight Code</td>
				<td><input type="text" name="fcode" size="10" id="fcode"></td>
				<td>Flight Name</td>
				<td><input type="text" name="fname" size="10" id="fname"></td>
			</tr>
			<tr>
				<td>Source</td>
				<td><input type="text" name="fsrc" size="10" id="fsrc"></td>
				<td>Destination</td>
				<td><input type="text" name="fdest" size="10" id="fdest"></td>
			</tr>
			<tr>
				<td>Arrival Time</td>
				<td><input type="text" name="fat" size="10" id="fat"></td>
				<td>Departure Time</td>
				<td><input type="text" name="fdt" size="10" id="fdt"></td>
			</tr>
			<tr>
				<td>Executive Class NOS</td>
				<td><input type="text" name="fjnos" size="10" id="fjnos"></td>
				<td>Economy Class NOS</td>
				<td><input type="text" name="fynos" size="10" id="fynos"></td>
			</tr>
			<tr>
				<td>Executive Fare</td>
				<td><input type="text" name="fjfare" size="10" id="fjfare"></td>
				<td>Economy Fare</td>
				<td><input type="text" name="fyfare" size="10" id="fyfare"></td>
			</tr>

			<tr>
				<td>Date of Into</td>
				<td><input type="text" name="fdoi" size="10" value="<%= dat%>" disabled="disabled"></td>
			</tr>


			<tr>
				<td><input type="submit" value="Register" onclick="return validate_reg()"></td>
				<td><input type="reset"></td>
			</tr>
		</table>
	</form>
	</body>
</html>









