<%@page import="tokoatk.Stock"%>
<%
    String id = request.getParameter("id");
    Stock stock = new Stock();
    String username = (String) session.getAttribute("fullname");

    if (username == null || username.isEmpty()) {
        response.sendRedirect("login.jsp"); 
        return;
    }
    
    if(request.getParameter("id") == null) {
        stock.tambah(username); 
    } else {
        stock.baca(request.getParameter("id"));
    }

    request.setAttribute("stock", stock);
    RequestDispatcher dispatcher = request.getRequestDispatcher("formstocktambah.view.jsp");
    dispatcher.forward(request, response);
%>
