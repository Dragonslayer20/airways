<%!
String vs, pid;
%>

<%
vs=request.getParameter("r1");
pid=request.getParameter("spt");

session.setAttribute("spid",pid);
if(vs.equals("1"))
response.sendRedirect("apilot.jsp");
else
response.sendRedirect("rpilot.jsp");
%>