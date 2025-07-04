<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Hapus session
    session.setAttribute("fullname", null);
    session.invalidate();

    // Redirect ke halaman login
    response.sendRedirect("login.jsp"); // Ganti dengan halaman login Anda
%>