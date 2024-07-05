<%!
String vs, pid;
%>

<%
vs=request.getParameter("r1");
pid=request.getParameter("spt");

session.setAttribute("lvid",pid);
if(vs.equals("1"))
response.sendRedirect("appleave.jsp");
else
if(vs.equals("2"))
response.sendRedirect("desleave.html");
else
response.sendRedirect("undleave.html");
%>