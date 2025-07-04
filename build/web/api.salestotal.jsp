<%@page import="tokoatk.SalesDetail"%>
<%@page import="tokoatk.Sales"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="application/json" pageEncoding="UTF-8"%>

<%
   
    out.clear(); // Bersihkan buffer
    response.setContentType("application/json");
    response.setCharacterEncoding("UTF-8");

    String id = request.getParameter("id");
    Sales sales = new Sales();
    boolean found = sales.baca(id);

    int total = 0;
    if (found) {
        ArrayList<SalesDetail> list = sales.getDetail();
        for (SalesDetail item : list) {
            total += item.getQty() * item.getHarga();
        }
    }

    out.print("{\"total\":" + total + "}");

%>