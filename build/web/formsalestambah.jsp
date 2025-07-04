<%@page import="tokoatk.Sales"%>
<%
    String id = request.getParameter("id");
    Sales sales = new Sales();
    String username = (String) session.getAttribute("fullname");

    if (username == null || username.isEmpty()) {
        response.sendRedirect("login.jsp"); 
        return;
    }

    if(request.getParameter("id") == null) {
        sales.tambah(username); 
    } else {
        sales.baca(request.getParameter("id"));
    }
    
    request.setAttribute("sales", sales);
    
    RequestDispatcher dispatcher = request.getRequestDispatcher("formsalestambah.view.jsp");
    dispatcher.forward(request, response);
%>