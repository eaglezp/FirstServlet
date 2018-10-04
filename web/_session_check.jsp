<%@page pageEncoding="utf-8" %>
<%
    request.setCharacterEncoding("utf-8");
    boolean logined = false;
    String admingLogined = (String) session.getAttribute("adminLogined");
    if(admingLogined == null || admingLogined.equals("")){
        response.sendRedirect("login.jsp");
        return;
    }
%>