<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.eagle.util.DBUtil" %>
<%@ page import="java.sql.Statement" %>
<%@page pageEncoding="utf-8" %>
<%!
    public void deleteArticle(Connection conn, int id, boolean isLeaf) {
        if(!isLeaf){
            Statement statement = DBUtil.createStmt(conn);
            ResultSet resultSet = null;
            try {
                resultSet = statement.executeQuery("select * from article where pid = " + id);
                while (resultSet.next()){
                    deleteArticle(conn,resultSet.getInt("id"),resultSet.getBoolean("isLeaf"));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                DBUtil.close(resultSet);
                DBUtil.close(statement);
            }
        }

        Statement dstatement = null;
        try {
            dstatement = DBUtil.createStmt(conn);
            dstatement.execute("delete from article where id ="+id);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(dstatement);
        }
    }
%>

<%
    String idstr = request.getParameter("id");
    boolean isleaf = Boolean.parseBoolean(request.getParameter("isleaf"));
    String pid = request.getParameter("pid");
    int id = 0;
    if(idstr != null && !idstr.equals("")){
        id = Integer.parseInt(idstr);
    }
    Connection connection = DBUtil.getConn();
    connection.setAutoCommit(false);
    deleteArticle(connection,id,isleaf);
    Statement statement = DBUtil.createStmt(connection);
    ResultSet resultSet = null;
    try {
        resultSet = statement.executeQuery("select count(1) from article where id="+pid);
        if(resultSet.next()){
            if(resultSet.getInt(1) == 0){
                statement.executeUpdate("update article set isleaf = 1 where id="+id);
            }
        }
        connection.commit();
        connection.setAutoCommit(true);
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        try {
            resultSet.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


%>
congratulations!