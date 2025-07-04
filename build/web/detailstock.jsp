<%@page import="tokoatk.Stock"%>
<%@page import="java.util.ArrayList"%>
<%
    String id = request.getParameter("id");

    Stock stock = new Stock();
    stock.baca(id);

    request.setAttribute("stock", stock);
    request.setAttribute("details", stock.getDetail());

    RequestDispatcher dispatcher = request.getRequestDispatcher("detailstock.view.jsp");
    dispatcher.forward(request, response);
%>
