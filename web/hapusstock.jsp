<%@page import="tokoatk.Stock"%>
<%@page import="tokoatk.StockDetail"%>
<%
    Stock stock = new Stock();
    stock.id = request.getParameter("id");
    stock.hapus();
    response.sendRedirect("stocklist.jsp");
%>
