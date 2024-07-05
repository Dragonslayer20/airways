<%@   page import="java.sql.*;"%>

<%!
String rupwd;
int ruid;
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
}
catch(Exception e)
{
out.println("Error : " + e.getMessage());
}
%>

<%

try
{
ruid=Integer.parseInt(request.getParameter("uid"));
rupwd=request.getParameter("upwd");
if(ruid==1000 && rupwd.equals("admin"))
{
response.sendRedirect("options.htm");
String yy;
yy=""+ruid;
session.setAttribute("lvid",yy);

}
else
{
if (ruid>1000)
{
	System.out.println("*********************came here");
rs=stmt.executeQuery("select * from pilots where lid="+ruid+ " and lpwd='"+rupwd+"'");
System.out.println("*********************came here"+rs);
if (rs.next())
{
String yy;
yy=""+ruid;
session.setAttribute("lvid",yy);
response.sendRedirect("poptions.htm");
con.close();
}
else
out.println("Intruder! login Denied");
}
else
out.println("Intruder! login Denied");
out.println("<br><a href=left.htm>Back</a>");
}
}
catch(Exception e1)
{
out.println("Error : Invalid Login Data / Connection Unavailable!"  );
out.println("<br><a href=left.htm>Back</a>");
}
%>
