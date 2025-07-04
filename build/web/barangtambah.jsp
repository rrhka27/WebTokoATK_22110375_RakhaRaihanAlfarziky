<%@page import="tokoatk.Barang"%>
<%
    String id = request.getParameter("id").toString();
    String nama = request.getParameter("nama").toString();
    String jenis = request.getParameter("jenis").toString();
    Integer harga = Integer.parseInt(request.getParameter("harga"));
    
    Barang barang = new Barang();
    barang.id = id;
    barang.nama = nama;
    barang.jenis = jenis;
    barang.harga = harga;
    barang.tambah();
    
    response.sendRedirect("baranglist.jsp");
%>