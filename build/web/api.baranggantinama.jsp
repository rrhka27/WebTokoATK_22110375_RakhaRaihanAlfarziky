<%@page import="tokoatk.Barang"%>
<%
    String id = request.getParameter("id");
    String namabaru = request.getParameter("namabaru");
    String hargabaruStr = request.getParameter("hargabaru");

    Barang barang = new Barang();
    if (barang.baca(id)) {
        barang.nama = namabaru;

        if (hargabaruStr != null && !hargabaruStr.isEmpty()) {
            try {
                barang.harga = Integer.parseInt(hargabaruStr);
            } catch (NumberFormatException e) {
                out.print("fail: harga tidak valid");
                return;
            }
        }

        if (barang.update()) {
            out.print("ok");
        } else {
            out.print("fail");
        }
    } else {
        out.print("fail: barang tidak ditemukan");
    }
%>
