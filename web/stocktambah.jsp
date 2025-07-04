<%@page import="tokoatk.Stock"%>
<%
    String stockId  = request.getParameter("stockId");
    String barangId = request.getParameter("barangId");
    Integer qty     = Integer.parseInt(request.getParameter("qty"));
    Integer harga   = Integer.parseInt(request.getParameter("harga"));

    Stock stock = new Stock();
    stock.baca(stockId);
    stock.addDetail(barangId, qty, harga);

    response.sendRedirect("formstocktambah.jsp?id=" + stockId);
%>
