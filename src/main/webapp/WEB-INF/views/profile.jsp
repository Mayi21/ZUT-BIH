<%--
  Created by IntelliJ IDEA.
  User: HomieJ
  Date: 2021/5/13
  Time: 11:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>
        Profile
    </title>


    <link rel="stylesheet" type="text/css" href="/static/static/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/static/static/font-awesome/css/all.css">
    <link rel="stylesheet" type="text/css" href="/static/static/custom/css/physionet.css">


    <link rel="stylesheet" type="text/css" href="/static/static/custom/css/login-register.css">


    <script src="/static/static/jquery/jquery.min.js"></script>
    <script src="/static/static/popper/popper.min.js"></script>
    <script async="" src="/static/static/analytics/js/googletagmanager.js"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());

        gtag('config', 'UA-87592301-7');
    </script>

    <link rel="shortcut icon" type="image/png" href="/static/favicon.ico">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<nav class="navbar navbar-expand-md navbar-dark bg-dark" id="mainNav">
    <label for="navicon" class="navbar-icon">?</label>
    <input type="checkbox" id="navicon" class="navbar-check">
    <a id="nav_home" class="navbar-brand" href="/">中原心电数据库</a>
    <div class="collapse navbar-collapse" id="navbarCollapse">

        <ul class="navbar-nav mr-auto">

            <li class="nav-item">
                <a id="nav_index" class="nav-link" href="/search_page">
                    发现
                </a>
            </li>

            <li class="nav-item">
                <a id="nav_publish" class="nav-link" href="/toShare">
                    分享
                </a>
            </li>

            <li class="nav-item">
                <a id="nav_about" class="nav-link" href="/toAbout">
                    关于
                </a>
            </li>

        </ul>
        <ul class="navbar-nav ml-auto"  id="haslogin">

            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="nav_account_dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fa fa-user" id="count"></i>
                </a>
                <div class="dropdown-menu" aria-labelledby="nav_account_dropdown">
                    <a class="dropdown-item" href="/toAccount">
                        项目
                    </a>

                    <a id="nav_logout" class="dropdown-item" href="/">
                        退出
                    </a>

                </div>
            </li>
        </ul>
        <ul class="navbar-nav ml-auto"  id="nologin">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="nav_account_dropdown2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fa fa-user"></i>账户
                </a>
                <div class="dropdown-menu" aria-labelledby="nav_account_dropdown">
                    <a class="dropdown-item" href="/toLogin">
                        登录
                    </a>

                    <a id="nav_login" class="dropdown-item" href="/register">
                        注册
                    </a>

                </div>
            </li>
        </ul>
    </div>
    <div class="navbar-search">
        <form class="form-inline" action="/search_page">
            <input name="topic" class="search-input" type="text" placeholder="搜索">
            <span class="input-group-btn">
		      <button id="search-button" type="submit" class="btn-search my-2 my-sm-0" title="Search"><span class="fa fa-search"><span class="visually-hidden">Search</span></span></button>
		    </span>
        </form>
    </div>
</nav>
</body>
</html>