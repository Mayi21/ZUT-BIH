<%--
  Created by IntelliJ IDEA.
  User: HomieJ
  Date: 2021/4/19
  Time: 20:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>


    <link rel="stylesheet" type="text/css" href="/static/static/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/static/static/font-awesome/css/all.css">
    <link rel="stylesheet" type="text/css" href="/static/static/custom/css/physionet.css">


    <link rel="stylesheet" type="text/css" href="/static/static/custom/css/login-register.css">


    <script type="text/javascript" async="" src="/static/static/analytics/js/analytics.js"></script>
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
<body class="flexbody">

<nav class="navbar navbar-expand-md navbar-dark bg-dark" id="mainNav">
    <label for="navicon" class="navbar-icon">?</label>
    <input type="checkbox" id="navicon" class="navbar-check">

    <a id="nav_home" class="navbar-brand" href="/">
        中原心电数据库
    </a>

    <div class="collapse navbar-collapse" id="navbarCollapse">

        <ul class="navbar-nav mr-auto">

            <li class="nav-item">
                <a id="nav_index" class="nav-link" href="/content/">
                    发现
                </a>
            </li>

            <li class="nav-item">
                <a id="nav_publish" class="nav-link" href="/about/publish/">
                    分享
                </a>
            </li>

            <li class="nav-item">
                <a id="nav_about" class="nav-link" href="/about/">
                    关于
                </a>
            </li>

            <li class="nav-item">
                <a id="nav_news" class="nav-link" href="/news/">
                    最新
                </a>
            </li>
        </ul>
        <ul class="navbar-nav ml-auto">


            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="nav_account_dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">

                    账户
                </a>
                <div class="dropdown-menu" aria-labelledby="nav_account_dropdown">
                    <a id="nav_login" class="dropdown-item" href="/login/">
                        登录
                    </a>
                    <a id="nav_register" class="dropdown-item" href="/register/">
                        注册
                    </a>

                </div>
            </li>
        </ul>
        <%--        <ul class="navbar-nav ml-auto">--%>

        <%--            <li class="nav-item">--%>
        <%--                <a id="nav_projects" class="nav-link" href="/projects/">--%>
        <%--                    Projects--%>
        <%--                </a>--%>
        <%--            </li>--%>


        <%--            <li class="nav-item dropdown">--%>
        <%--                <a class="nav-link dropdown-toggle" href="#" id="nav_account_dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">--%>


        <%--                    <i class="fa fa-user"></i> homie--%>

        <%--                </a>--%>
        <%--                <div class="dropdown-menu" aria-labelledby="nav_account_dropdown">--%>
        <%--                    <a class="dropdown-item" href="/settings/">--%>
        <%--                        Settings--%>
        <%--                    </a>--%>

        <%--                    <a id="nav_logout" class="dropdown-item" href="/logout/">--%>
        <%--                        Logout--%>
        <%--                    </a>--%>
        <%--                </div>--%>
        <%--            </li>--%>
        <%--        </ul>--%>

    </div>

    <div class="navbar-search">
        <form class="form-inline" action="/content/">
            <input name="topic" class="search-input" type="text" placeholder="搜索">
            <span class="input-group-btn">
		      <button id="search-button" type="submit" class="btn-search my-2 my-sm-0" title="Search"><span class="fa fa-search"><span class="visually-hidden">Search</span></span></button>
		    </span>
        </form>
    </div>
</nav>


<main>
    <div class="container">
        <form action="/login/" method="post" class="form-signin">
            <h2 class="form-signin-heading">账户登录</h2>
            <input type="hidden" name="csrfmiddlewaretoken" value="xEmq9czdJslDWnCxqCUTxWcrqmGtbdH54LyTqLJ8DGPbYKIeudiaE8D8hWuuPjjq">
            <input type="text" name="username" autofocus="" class="form-control" placeholder="账号" maxlength="254" required="" id="id_username">
            <br>
            <input type="password" name="password" class="form-control" placeholder="密码" required="" id="id_password">

            <input type="hidden" name="next" value="">
            <div class="checkbox">
                <label><input type="checkbox" name="remember" id="id_remember"> 记住账户</label><a href="/reset-password/" style="float:right">忘记密码</a>
            </div>
            <button id="login" class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
        </form>
        <div class="form-signin">
            <p>没有帐户? <a id="register" href="/register/">注册</a></p>
        </div>
    </div>
</main>

<!-- This footer template is from the bootstrap 'blog' example -->

<link rel="stylesheet" type="text/css" href="/static/custom/css/footer.css">




<script src="/static/static/bootstrap/js/bootstrap.min.js"></script>
<script src="/static/static/bootstrap/js/ie10-viewport-bug-workaround.js"></script>






</body>
</html>
