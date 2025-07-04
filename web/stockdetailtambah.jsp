<%@page import="tokoatk.Stock"%>
<%
    String stockId = request.getParameter("stockId").toString();
    String barangId = request.getParameter("barangId").toString();
    String qtyStr = request.getParameter("qty");
    String hargaStr = request.getParameter("harga");

    if (qtyStr == null || qtyStr.isEmpty() || hargaStr == null || hargaStr.isEmpty()) {
        out.println("Input tidak lengkap. Silakan isi Qty dan Harga dengan benar.");
        return;
    }

    Integer qty = Integer.parseInt(qtyStr);
    Integer harga = Integer.parseInt(hargaStr);

    Stock stock = new Stock();
    stock.baca(stockId);
    stock.addDetail(barangId, qty, harga);
    response.sendRedirect("formstocktambah.jsp?id="+stockId);

%>