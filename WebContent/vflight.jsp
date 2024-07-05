<%!
String vs, pid;
%>

<%
vs=request.getParameter("r1");
pid=request.getParameter("spt");

session.setAttribute("fid",pid);
System.out.println(vs+"^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
if(vs.equals("1"))
response.sendRedirect("aflight.jsp");
else
response.sendRedirect("rflight.jsp");
%>