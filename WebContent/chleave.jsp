u<%!
String ch;
%>

<%
ch=request.getParameter("r1");
if(ch.equals("1"))
{
String ldata;
ldata=request.getParameter("spt");
session.setAttribute("lv",ldata);

 response.sendRedirect("appleave.jsp");

}
else
{
String ldata;
ldata=request.getParameter("spt");
session.setAttribute("lv",ldata);
 response.sendRedirect("uleave.jsp");
}

%>