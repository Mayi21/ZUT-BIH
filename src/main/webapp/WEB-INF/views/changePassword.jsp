<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: HomieJ
  Date: 2021/5/31
  Time: 18:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>
        中原心电数据库
    </title>


    <link rel="stylesheet" type="text/css" href="/static/static/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/static/static/font-awesome/css/all.css">
    <link rel="stylesheet" type="text/css" href="/static/static/custom/css/physionet.css">

    <link rel="stylesheet" type="text/css" href="/static/static/custom/css/login-register.css">
    <link rel="stylesheet" type="text/css" href="/static/static/custom/css/home.css">
    <link rel="alternate" type="application/rss+xml" title="PhysioNet News" href="/feed.xml">
    <link rel="stylesheet" type="text/css" href="/static/static/custom/css/form-control-input.css">
    <script src="/static/static/jquery/3.4.0/jquery.min.js"></script>
    <script src="/static/static/jquery/3.4.0/jquery.cookie.min.js"></script>
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
                    检索
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
                        设置
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
                    <a class="dropdown-item" href="/login">
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
<main>
    <div class="container">
        <form method="post" class="form-signin" action="/updatePassword">
            <h2 class="form-signin-heading">重置密码</h2>

            <div class="form-group">
                <label for="id_email" title="">邮箱
                </label> <input type="email" name="email" maxlength="254" required="" id="id_email">
            </div>
            <div class="form-group">
                <label for="id_email" title="">验证码
                </label>
                <input  name="code" class="form-control" maxlength="255" required="" id="code" placeholder="请输入验证码"><button id="send_phone" >获取验证码</button></input>

            </div>
            <div class="form-group">
                <label for="id_email" title="">密码
                </label> <input type="password" name="password" maxlength="254" required="" id="psw">
            </div>
            <div class="alert alert-danger" id="error" <c:if test="${error==''}">style="display: none" </c:if>>
                <strong>${error}</strong>
            </div>
            <button class="btn btn-lg btn-primary btn-block" type="submit" style="width: 100px;">重置</button>
        </form>

        <div class="alert alert-warning alert-dismissible fade show" role="alert" >
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true"></span>
            </button>
            <p>如果你没有收到验证码,请检查垃圾文件.如果没有说明该账户没有注册过,请 <a id="register" href="/register">注册一个</a>.</p>

        </div>

    </div>

</main>
<script type="text/javascript">
    $(document).ready(function () {
        $("#send_phone").click(function () {
            htmlobj = $.ajax({
                url: "/mail",
                data: {code: $("input[name=email]").val()},
                dataType: 'json',
                async: false
            });
        });
    });
</script>
<script>
    $(document).ready(function(){
        $.ajax({
            type: "Post",
            url: "/keepLogin",
            contentType: "application/json; charset=utf-8",
            dataType: "text",
            success: function(data) {
                var datas = JSON.stringify(data).slice(1,data.length-1);
                if (datas.length!=0){
                    $("#count").text(data);
                    document.getElementById("haslogin").style.display="";//隐藏
                    document.getElementById("nologin").style.display="none";//显示
                }else {
                    document.getElementById("haslogin").style.display="none";//隐藏
                    document.getElementById("nologin").style.display="";//显示
                }

            },
            error: function(data) {
            }
        });
        return false;
    });
</script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#nav_logout").click(function () {
            $.cookie('_COOKIE_NAME',null);
        });
    });
</script>
</body>
</html>
