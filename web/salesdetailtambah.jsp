<%@page import="tokoatk.Sales"%>
<%
    String salesId = request.getParameter("salesId").toString();
    String barangId = request.getParameter("barangId").toString();
    String qtyStr = request.getParameter("qty");
    String hargaStr = request.getParameter("harga");

    if (qtyStr == null || qtyStr.isEmpty() || hargaStr == null || hargaStr.isEmpty()) {
        out.println("Input tidak lengkap. Silakan isi Qty dan Harga dengan benar.");
        return;
    }

    Integer qty = Integer.parseInt(qtyStr);
    Integer harga = Integer.parseInt(hargaStr);

    Sales sales = new Sales();
    sales.baca(salesId);
    sales.addDetail(barangId, qty, harga);
    response.sendRedirect("formsalestambah.jsp?id="+salesId);

%>