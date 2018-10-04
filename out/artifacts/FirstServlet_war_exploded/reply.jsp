<%--
  Created by IntelliJ IDEA.
  User: Peng
  Date: 2018/10/2
  Time: 20:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    int rootId = Integer.parseInt(request.getParameter("rootId"));
%>
<html>
<head>
    <title>Java|Java世界_中文论坛|ChinaJavaWorld技术论坛 : 初学java遇一难题！！望大家能帮忙一下 ...</title>
    <meta http-equiv="content-type" content="text/html; charset=GBK">
    <link rel="stylesheet" type="text/css" href="images/style.css" title="Integrated Styles">
    <script language="JavaScript" type="text/javascript" src="images/global.js"></script>
    <link rel="alternate" type="application/rss+xml" title="RSS" href="http://bbs.chinajavaworld.com/rss/rssmessages.jspa?threadID=744236">
</head>
<body>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tbody>
    <tr>
        <td width="140"><a href="http://bbs.chinajavaworld.com/index.jspa"><img src="images/header-left.gif" alt="Java|Java世界_中文论坛|ChinaJavaWorld技术论坛" border="0"></a></td>
        <td><img src="images/header-stretch.gif" alt="" border="0" height="57" width="100%"></td>
        <td width="1%"><img src="images/header-right.gif" alt="" border="0"></td>
    </tr>
    </tbody>
</table>
<br>
<div id="jive-flatpage">
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tbody>
        <tr valign="top">
            <td width="99%"><p class="jive-breadcrumbs"> <a href="<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()%>/article_flat.jsp">首页</a> &#187; <a href="http://bbs.chinajavaworld.com/forumindex.jspa?categoryID=1">ChinaJavaWorld技术论坛|Java世界_中文论坛</a> &#187; <a href="http://bbs.chinajavaworld.com/category.jspa?categoryID=2">Java 2 Platform, Standard Edition (J2SE)</a> &#187; <a href="http://bbs.chinajavaworld.com/forum.jspa?forumID=20&amp;start=0">Java语言*初级版</a> </p>
            <td width="1%"><div class="jive-accountbox"></div></td>
        </tr>
        </tbody>
    </table>
    <br>
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tbody>
        <tr valign="top">
            <td width="99%"><div id="jive-message-holder">
                <div class="jive-message-list">
                    <div class="jive-table">
                        <div class="jive-messagebox">
                            <form action="reply_deal.jsp" method="post">
                                <input type="hidden" name="pid" value="<%=id%>">
                                <input type="hidden" name="rootId" value="<%=rootId%>">
                                标题：<input type="text" name="title"/><br>
                                内容：<textarea rows="15" cols="80" name="cont"></textarea><br>
                                <input type="submit" value="提交">
                            </form>
                        </div>
                    </div>
                </div>
                <div class="jive-message-list-footer">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tbody>
                        <tr>
                            <td nowrap="nowrap" width="1%"></td>
                            <td align="center" width="98%"><table border="0" cellpadding="0" cellspacing="0">
                                <tbody>
                                <tr>
                                    <%--<td><a href="<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()%>/article.jsp"><img src="images/arrow-left-16x16.gif" alt="返回到主题列表" border="0" height="16" hspace="6" width="16"></a> </td>
                                    <td><a href="<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()%>/article.jsp">返回到主题列表</a> </td>--%>

                                    <!--平板展示-->
                                    <td><a href="<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()%>/article_falt.jsp"><img src="images/arrow-left-16x16.gif" alt="返回到主题列表" border="0" height="16" hspace="6" width="16"></a> </td>
                                    <td><a href="<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()%>/article_flat.jsp">返回到主题列表</a> </td>
                                </tr>
                                </tbody>
                            </table></td>
                            <td nowrap="nowrap" width="1%">&nbsp;</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div></td>
            <td width="1%"></td>
        </tr>
        </tbody>
    </table>
</div>
</body>
</html>