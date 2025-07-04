<%@page import="java.util.ArrayList"%>
<%@page import="tokoatk.Stock"%>
<%
    ArrayList<Stock> list = Stock.getList();
    
    request.setAttribute("list", list);
    
    RequestDispatcher dispatcher = request.getRequestDispatcher("stocklist.view.jsp");
    dispatcher.forward(request, response);
%>