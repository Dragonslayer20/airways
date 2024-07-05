<%@   page import="java.sql.*,java.util.*;"%>


<%!
String tsid,tsname,tdoo , tsc;


Connection con;
Statement stmt2;
ResultSet rs;
java.util.Date dt;
int dd,dm,dy;
String dat;
%>

<%
dt=new java.util.Date();
dd=dt.getDate();
dm=dt.getMonth()+1;
dy=dt.getYear()+1900;
dat=dd+"/"+dm+"/"+dy;
%>
<body bgcolor="white">
	<%
try
{
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/airline","root","");
stmt2=con.createStatement();
try
{
tsid=request.getParameter("sid");
tsname=request.getParameter("sname");
tdoo=dat;
tsc=request.getParameter("sc");
if(tsid!="" && tsname!=""&& tdoo!="")
{
try
{
stmt2.executeUpdate("insert into sectors values('"+tsid+"','"+tsname+"','"+tsc+"','"+tdoo+"')");
out.println("<b><font color=black size=4>New Sector Registered.");
con.close();
}
catch(Exception e1)
{
out.println("Error :Validation Failed! Unable To Register. All Fields are Mandatory" );
}
}
else
out.println("Error :Validation Failed! Unable To Register. All Fields are Mandatory" );
}
catch(Exception e2)
{
out.println("Error :Validation Failed! Unable To Register."+ e2.getMessage()  );
}
}
catch(Exception e)
{
out.println("Error : Database Connection" + e.getMessage());
}

%>

</body>


