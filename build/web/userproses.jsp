<%@page import="tokoatk.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String action = request.getParameter("action");

    try {
        User user = new User();

        if ("update".equals(action)) {
            String username = request.getParameter("username");
            String fullname = request.getParameter("fullname");
            String password = request.getParameter("password");

            if (!user.baca(username)) {
                out.println("User tidak ditemukan.");
                return;
            }

            user.fullname = fullname;
            user.update();

            if (password != null && !password.isEmpty()) {
                user.updatePassword(password);
            }

            response.sendRedirect("userlist.jsp");

        } else if ("delete".equals(action)) {
            String username = request.getParameter("username");

            if (!user.baca(username)) {
                out.println("User tidak ditemukan.");
                return;
            }

            user.hapus();
            response.sendRedirect("userlist.jsp");

        } else if ("add".equals(action)) {
            // Tambah user bisa ditambahkan di sini jika perlu
        }

    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>