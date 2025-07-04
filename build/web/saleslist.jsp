<%@page import="java.util.ArrayList"%>
<%@page import="tokoatk.Sales"%>
<%
    ArrayList<Sales> list = Sales.getList();
    
    request.setAttribute("list", list);
    
    RequestDispatcher dispacher = request.getRequestDispatcher("saleslist.view.jsp");
    dispacher.forward(request, response);
%>