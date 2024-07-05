l<%!
String ch;
%>

<%
ch=request.getParameter("r1");
if(ch.equals("1"))
 response.sendRedirect("lms.jsp");
else
out.println("Sorry! You cannot proceed to apply for leave. <a href='terms.htm'>Click Here</a> View Terms again");

%>