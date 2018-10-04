<%@page pageEncoding="utf-8" %>
<%
    request.setCharacterEncoding("utf-8");
    String action = request.getParameter("action");
    if(action != null && !action.equals("")){
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if(username == null || !username.trim().equals("admin")){

        } else if (password == null || !password.trim().equals("123456")){

        } else {
            session.setAttribute("adminLogined", "true");
            response.sendRedirect("article_flat.jsp");
        }
    }
%>
<!DOCTYPE HTML>
<html>
<head>
    <title>管理员登陆</title>
</head>
<body>
    <form action="login.jsp" method="post">
        <input type="hidden" name="action" value="login"/>
        用户名:<input type="text" name="username"/><br>
        密码:<input type="password" name="password"/><br>
        <input type="submit" value="提交"/>
    </form>
</body>
</html>