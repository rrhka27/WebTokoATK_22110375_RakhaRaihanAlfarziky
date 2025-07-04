<%@page import="tokoatk.Barang"%>
<%
    Barang b = new Barang();
    b.id = request.getParameter("id");
    b.hapus();
    response.sendRedirect("baranglist.jsp");
%>
