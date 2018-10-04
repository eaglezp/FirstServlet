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
    ppstmt.setInt(5,1);

    connection.setAutoCommit(false);
    statement.executeUpdate("update article set isleaf = 0 where id="+pid);
    ppstmt.executeUpdate();
    connection.commit();
    connection.setAutoCommit(true);

    DBUtil.close(ppstmt);
    DBUtil.close(connection);
    //response.sendRedirect("article.jsp");
%>
<html>
<head>
    <title>Title</title>
    <script>

        function delayURL(url) {
            var time = document.getElementById("time").innerHTML;
            if (time > 0) {
                time--;
                document.getElementById("time").innerHTML = time;
            } else {
                window.top.location.href = url;
            }
            setTimeout("delayURL('"+url+"')",1000);
        }
    </script>
</head>
<body>
    恭喜你回复完成！页面将在<span id="time">3</span>秒后跳转，如果不跳转请点击链接
    <%--<a href="article.jsp">主题列表</a>--%>
    <!--平板展示-->
    <a href="article_flat.jsp">主题列表</a>

    <script>
        /*delayURL("article.jsp");*/
        <!--平板展示-->
        delayURL("article_detail.jsp?id=<%=pid%>&rootId=<%=rootId%>&title=<%=title%>");
    </script>
</body>
</html>
