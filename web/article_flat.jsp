<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.eagle.util.DBUtil" %>
<%@ page import="java.util.List" %>
<%@ page import="com.eagle.entity.Article" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.SQLException" %>
<%@page pageEncoding="utf-8" %>

<%
    boolean logined = false;
    String admingLogined = (String) session.getAttribute("adminLogined");
    if(admingLogined != null && admingLogined.equals("true")){
        logined = true;
    }
%>

<%
    int pageNum = 1;
    final int PAGE_SIZE = 10;
    String startPageNum = request.getParameter("pageNum");
    if (startPageNum != null && !startPageNum.equals("")) {
        try {
            pageNum = Integer.parseInt(startPageNum);
        } catch (NumberFormatException e) {
            e.printStackTrace();
            pageNum = 1;
        }
    }
    if (pageNum <= 0) {
        pageNum = 1;
    }

    List<Article> articleList = new ArrayList<Article>();
    Connection connection = DBUtil.getConn();
    ResultSet totalResultSet = null;
    try {
        totalResultSet = DBUtil.createStmt(connection).executeQuery("select count(1) from article where pid=0");
    } catch (SQLException e) {
        e.printStackTrace();
    }
    totalResultSet.next();
    int totalCount = totalResultSet.getInt(1);

    int totalPages = (totalCount + PAGE_SIZE - 1) / PAGE_SIZE;

    pageNum = pageNum > totalPages ? totalPages : pageNum;
    int startPos = (pageNum - 1) * PAGE_SIZE;
    String sql = "select * from article where pid = 0 order by pdate desc limit " + startPos + ", " + PAGE_SIZE;
    ResultSet resultSet = DBUtil.execQuery(DBUtil.createStmt(connection), sql);
    System.out.println("sql:" + sql);
    while (resultSet.next()) {
        Article article = new Article();
        article.initFromRs(resultSet);
        articleList.add(article);
    }

    DBUtil.close(connection);
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
    <title>Java|Java世界_中文论坛|ChinaJavaWorld技术论坛 : Java语言*初级版</title>
    <meta http-equiv="content-type" content="text/html; charset=GBK">
    <link rel="stylesheet" type="text/css" href="images/style.css" title="Integrated Styles">
    <script language="JavaScript" type="text/javascript" src="images/global.js"></script>
    <link rel="alternate" type="application/rss+xml" title="RSS"
          href="http://bbs.chinajavaworld.com/rss/rssmessages.jspa?forumID=20">
    <script language="JavaScript" type="text/javascript" src="images/common.js"></script>
</head>
<body>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tbody>
    <tr>
        <td width="140"><a href="http://bbs.chinajavaworld.com/index.jspa"><img src="images/header-left.gif"
                                                                                alt="Java|Java世界_中文论坛|ChinaJavaWorld技术论坛"
                                                                                border="0"></a></td>
        <td><img src="images/header-stretch.gif" alt="" border="0" height="57" width="100%"></td>
        <td width="1%"><img src="images/header-right.gif" alt="" border="0"></td>
    </tr>
    </tbody>
</table>
<br>
<div id="jive-forumpage">
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tbody>
        <tr valign="top">
            <td width="98%"><p class="jive-breadcrumbs">论坛: Java语言*初级版
                (模仿)</p>
                <p class="jive-description"> 探讨Java语言基础知识,基本语法等 大家一起交流 共同提高！谢绝任何形式的广告 </p>
            </td>
        </tr>
        </tbody>
    </table>
    <div class="jive-buttons">
        <table summary="Buttons" border="0" cellpadding="0" cellspacing="0">
            <tbody>
            <tr>
                <td class="jive-icon"><a href="post.jsp"><img src="images/post-16x16.gif" alt="发表新主题" border="0"
                                                              height="16" width="16"></a></td>
                <td class="jive-icon-label"><a id="jive-post-thread" href="post.jsp">发表新主题</a> <a href=""></a></td>
            </tr>
            </tbody>
        </table>
    </div>
    <br>
    <table border="0" cellpadding="3" cellspacing="0" width="100%">
        <tbody>
        <tr valign="top">
            <td>
          <span class="nobreak">
              <span class="jive-paginator"> [
                  <a href="<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()%>/article_flat.jsp?pageNum=1">首页</a> |
                  <a href="<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()%>/article_flat.jsp?pageNum=<%=pageNum-1%>">上一页</a> |
                  <a href="<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()%>/article_flat.jsp?pageNum=<%=pageNum+1%>">下一页</a> |
                  <a href="<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()%>/article_flat.jsp?pageNum=<%=totalPages%>">尾页</a> ]
              </span>
          </span>
            </td>
        </tr>
        </tbody>
    </table>
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tbody>
        <tr valign="top">
            <td width="99%">
                <div class="jive-thread-list">
                    <div class="jive-table">
                        <table summary="List of threads" cellpadding="0" cellspacing="0" width="100%">
                            <thead>
                            <tr>
                                <th class="jive-first" colspan="3"> 主题</th>
                                <th class="jive-author">
                                    <nobr> 作者
                                        &nbsp;
                                    </nobr>
                                </th>
                                <th class="jive-view-count">
                                    <nobr> 浏览
                                        &nbsp;
                                    </nobr>
                                </th>
                                <th class="jive-msg-count" nowrap="nowrap"> 回复</th>
                                <th class="jive-last" nowrap="nowrap"> 最新帖子</th>
                            </tr>
                            </thead>
                            <tbody>

                            <%
                                int i = 0;
                                for (Iterator<Article> iterator = articleList.iterator(); ((Iterator) iterator).hasNext(); i++) {
                                    Article a = iterator.next();
                                    String lineclass = i % 2 == 0 ? "jive-even" : "jive-odd";
                            %>

                            <tr class="<%=lineclass%>">
                                <td class="jive-first" nowrap="nowrap" width="1%">
                                    <div class="jive-bullet"><img src="images/read-16x16.gif" alt="已读" border="0"
                                                                  height="16" width="16">
                                        <!-- div-->
                                    </div>
                                </td>
                                <td nowrap="nowrap" width="1%">

                                <%
                                    StringBuffer url = request.getRequestURL();
                                    String param = request.getQueryString();
                                    System.out.println("param:"+param);
                                    if(param != null && !param.equals("")){
                                        url = url.append("?").append(param);
                                    }
                                    System.out.println("param:"+param);
                                %>
                                <%
                                    if(logined){

                                            if(logined){
                                        %>
                                                <a href="article_delete.jsp?id=<%=a.getId()%>&isleaf=<%=a.isLeaf()%>&pid=<%=a.getPid()%>&from=<%=url%>">DEL</a>
                                        <%
                                            }
                                        %>
                                    <%
                                    }
                                    %>
                                </td>
                                <td class="jive-thread-name" width="95%"><a id="jive-thread-1"
                                                                            href="article_detail.jsp?id=<%=a.getId()%>&rootId=<%=a.getRootId()%>&title=<%=a.getTitle()%>"><%= a.getTitle()%>
                                </a></td>
                                <td class="jive-author" nowrap="nowrap" width="1%"><span class=""> <a
                                        href="http://bbs.chinajavaworld.com/profile.jspa?userID=226030">eagle</a> </span>
                                </td>
                                <td class="jive-view-count" width="1%"> 100000</td>
                                <td class="jive-msg-count" width="1%"> 500</td>
                                <td class="jive-last" nowrap="nowrap" width="1%">
                                    <div class="jive-last-post"><%= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(a.getPdate())%>
                                        <br>
                                        by: <a href="http://bbs.chinajavaworld.com/thread.jspa?messageID=780182#780182"
                                               title="jingjiangjun" style="">eagle &#187;</a></div>
                                </td>
                            </tr>
                            <%
                                }
                            %>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="jive-legend"></div>
            </td>
        </tr>
        </tbody>
    </table>
    <br>
    <br>
</div>
</body>
</html>