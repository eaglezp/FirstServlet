<%@ page import="java.sql.Connection" %>
<%@ page import="com.eagle.util.DBUtil" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Statement" %><%--
  Created by IntelliJ IDEA.
  User: Peng
  Date: 2018/10/2
  Time: 21:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int pid = Integer.parseInt(request.getParameter("pid"));
    int rootId = Integer.parseInt(request.getParameter("rootId"));

    //request.setCharacterEncoding("utf-8");

    String title = new String(request.getParameter("title").getBytes("ISO8859-1"),"UTF-8");
    System.out.println("title:"+title);
    String cont = new String(request.getParameter("cont").getBytes("ISO8859-1"), "UTF-8");
    System.out.println("cont:"+cont);
    Connection connection = DBUtil.getConn();
    String sql = "insert into article values(null,?,?,?,?,now(),?)";
    Statement statement = DBUtil.createStmt(connection);
    PreparedStatement ppstmt = DBUtil.createPptmt(connection,sql);
    ppstmt.setInt(1, pid);
    ppstmt.setInt(2, rootId);
    ppstmt.setString(3, title);
    ppstmt.setString(4,cont);
    ppstmt.setInt(5,0);

    connection.setAutoCommit(false);
    statement.executeUpdate("update article set isleaf = 0 where id="+rootId);
    ppstmt.executeUpdate();
    connection.commit();
    connection.setAutoCommit(true);

    DBUtil.close(ppstmt);
    DBUtil.close(connection);
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <p>恭喜你回复完成！</p>
</body>
</html>
