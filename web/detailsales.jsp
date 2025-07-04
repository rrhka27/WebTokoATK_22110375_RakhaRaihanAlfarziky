<%@page import="tokoatk.Sales"%>
<%@page import="java.util.ArrayList"%>
<%
    String id = request.getParameter("id");

    Sales sales = new Sales();
    sales.baca(id);

    request.setAttribute("sales", sales);
    request.setAttribute("details", sales.getDetail());

    RequestDispatcher dispatcher = request.getRequestDispatcher("detailsales.view.jsp");
    dispatcher.forward(request, response);
%>
