package com.eagle.util;

import java.sql.*;

public class DBUtil {

    /*public static void main(String[] args) {
        System.out.println("DBUtil.getConn():"+DBUtil.getConn());
    }*/

    public static Connection getConn(){
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbs","root","123456");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public static Statement createStmt(Connection connection){
        Statement stmt = null;
        try {
            stmt = connection.createStatement();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return stmt;
    }

    public static PreparedStatement createPptmt(Connection connection,String sql){
        PreparedStatement ppstmt = null;
        try {
            ppstmt = connection.prepareStatement(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ppstmt;
    }

    public static ResultSet execQuery(Statement statement, String sql){
        ResultSet resultSet = null;
        try {
            resultSet = statement.executeQuery(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultSet;
    }

    public static void close(Connection connection){
        try {
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void close(Statement statement){
        try {
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void close(ResultSet resultSet){
        try {
            resultSet.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
