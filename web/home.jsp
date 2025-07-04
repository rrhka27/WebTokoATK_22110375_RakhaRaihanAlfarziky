<%
    Object fullnameObj = session.getAttribute("fullname");
    String fullname = (fullnameObj != null) ? fullnameObj.toString() : "Guest";

    request.setAttribute("fullname", fullname);
    RequestDispatcher dispacher = request.getRequestDispatcher("home.view.jsp");
    dispacher.forward(request, response);
%>