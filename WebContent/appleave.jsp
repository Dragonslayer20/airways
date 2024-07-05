<%@ page import="java.sql.*,java.util.*"%>
<html>

<head>

<script type="text/javascript">

function validate_reg()
{   

	var lfrom=document.getElementById("lfrom").value;
	if (lfrom==null || lfrom=="")
	  {
	  document.getElementById("lfrom").focus();
	  alert("Leave From must be filled out");
	  return false;
	  }
	
	var lto=document.getElementById("lto").value;
	if (lto==null || lto=="")
	  {
	  document.getElementById("lto").focus();
	  alert("No.Days must be filled out");
	  return false;
	  }
}
</script>
</head>



<body bgcolor=white>
	<b><center>
			<font color=black size=5>ENTITLEMENT OF LEAVES</font>
		</center></b>
	<br>
	<br>
	<br>

	<%!
int  tpid;
String ltyp;
Connection con;
Statement stmt;
ResultSet rs;
int dd,dm,dy;
java.util.Date dt;
String dat;
%>

	<%
dt=new java.util.Date();
dd=dt.getDate();
dm=dt.getMonth()+1;
dy=dt.getYear()+1900;
dat=dd+"/"+dm+"/"+dy;
%>

	<%
tpid=Integer.parseInt(session.getAttribute("lvid").toString());
ltyp=(String)session.getAttribute("lv");
System.out.println("@@@@@@@@@@@@@@"+tpid);
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
rs=stmt.executeQuery("select * from pleave where pid="+tpid);

if (rs.next())
{
%>

	<form method=post action='applyl.jsp'>
		Date.Application<input type=text value=<%= dat %> disabled><br>
		Pilot ID <input type=text value=<%= rs.getInt("pid") %> disabled><br>
		<th><b>Current Leaves Available Status
				<table border>
					<TR>
						<td>NACC</td>
						<td>NCAS</td>
						<td>NENC</td>
						<td>NENS</td>
						<td>NSPE</td>
						<td>NSIC</td>
					</TR>
					<TR>
						<td><%= rs.getInt("nacc") %></td>
						<td><%= rs.getInt("ncas") %></td>
						<td><%= rs.getInt("nenc") %></td>
						<td><%= rs.getInt("nens") %></td>
						<td><%= rs.getInt("nspe") %></td>
						<td><%= rs.getInt("nsic") %></td>
					</TR>

					<tr>
						<td>Leave Type</td>
						<td><input type=text value=<%= ltyp %> name='ltyp' disabled></td>
					</tr>
					<tr>
						<td>Leave From</td>
						<td><input type=text name='lfrom' id="lfrom"></td>
						<td>dd/mm/yyyy</td>
					</tr>
					<tr>
						<td>No.Days</td>
						<td><input type=text name='lto' id="lto"></td>
					</tr>

				</table>
				<br> <input type=submit value="Apply" onclick="return validate_reg()">
	</form>
</html>

<%
}
else
out.println("Incorrect data");
con.close();
}
catch(Exception e1)
{
out.println("Error : Invalid Login Data / Connection Unavailable!"  + e1.getMessage() );
}
%>
