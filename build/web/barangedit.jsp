<%@page import="tokoatk.Barang"%>
<%
    Barang b = new Barang();
    b.id = request.getParameter("id");
    b.nama = request.getParameter("nama");
    b.jenis = request.getParameter("jenis");
    b.harga = Integer.parseInt(request.getParameter("harga"));
    b.update();
    response.sendRedirect("baranglist.jsp");
%>
