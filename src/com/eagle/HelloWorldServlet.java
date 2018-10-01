package com.eagle;

import java.io.IOException;

public class HelloWorldServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        response.getWriter().write("<a href='https://www.zhihu.com'>goto</a>");
        System.out.println("doGet:" + request.getRequestURI());

    }
}
