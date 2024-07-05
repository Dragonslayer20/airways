<%@   page import="java.sql.*,java.util.*;"%>


<%!
String tfname,tfsrc,tfdest,tfat,tfdt,tfdoi;
int tfjnos,tfynos,tfjfare,tfyfare,tfcode;

Connection con;
Statement stmt1;
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
stmt1=con.createStatement();
//stmt2=con.createStatement();
try
{
tfcode=Integer.parseInt(request.getParameter("fcode"));
tfname=request.getParameter("fname");
tfdoi=dat;
tfsrc=request.getParameter("fsrc");
tfdest=request.getParameter("fdest");
tfat=request.getParameter("fat");
tfdt=request.getParameter("fdt");
tfjnos=Integer.parseInt(request.getParameter("fjnos"));
tfynos=Integer.parseInt(request.getParameter("fynos"));
tfjfare=Integer.parseInt(request.getParameter("fjfare"));
tfyfare=Integer.parseInt(request.getParameter("fyfare"));

System.out.println("&&&&&&&&&&&************^^^^^^^^^^^^^^^^"+tfname+tfsrc+tfdest+tfat+tfdt);
if(tfname!="" && tfsrc!="" && tfdest!="" && tfat!="" && tfdt!="" )
{
try
{
stmt1.executeUpdate("insert into flights values("+tfcode+",'"+tfname+"','"+tfsrc+"','"+tfdest+"','"+tfat+ "','"+tfdt+"',"+tfjnos+","+tfynos+","+tfjfare+","+tfyfare+",'"+tfdoi+"')"  );
out.println("<b><font color=black size=4>New Flight Registered.");

con.close();
}
catch(Exception e1)
{
out.println("Error :Validation Failed! Unable To Register. All Fields are Mandatory" );
}
}
else
out.println("Error :Validation Failed! Unable To Register." );
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


