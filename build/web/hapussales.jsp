<%@page import="tokoatk.Sales"%>
<%@page import="tokoatk.SalesDetail"%>
<%
 
    Sales sales = new Sales();
    sales.id = request.getParameter("id");
    sales.hapus();
    response.sendRedirect("saleslist.jsp");

%>
