<%!
String vs, pid;
%>

<%
vs=request.getParameter("r1");
pid=request.getParameter("spt");

session.setAttribute("rid",pid);
if(vs.equals("1"))
response.sendRedirect("asector.jsp");
else
response.sendRedirect("rsector.jsp");
%>