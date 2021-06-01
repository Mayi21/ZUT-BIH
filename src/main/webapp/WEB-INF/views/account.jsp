<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: HomieJ
  Date: 2021/5/9
  Time: 16:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Project Home</title>


    <link rel="stylesheet" type="text/css" href="/static/static/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/static/static/font-awesome/css/all.css">
    <link rel="stylesheet" type="text/css" href="/static/static/custom/css/physionet.css">


    <link rel="stylesheet" type="text/css" href="/static/static/project/css/project-home.css">

    <script src="/static/static/jquery/3.4.0/jquery.min.js"></script>
    <script src="/static/static/jquery/3.4.0/jquery.cookie.min.js"></script>
    <script src="/static/static/popper/popper.min.js"></script>
    <script async="" src="/static/static/analytics/js/googletagmanager.js"></script>
    <script src="/static/static/dist/dispicker.js" charset="UTF-8"></script>

    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());

        gtag('config', 'UA-87592301-7');
    </script>
    <script>
        $(function(){
            $('#target').distpicker();

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
                    var data = JSON.stringify(data);
                    if (data!=null){
                        $("#count").text(data.slice(1,data.length-1));
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
<main >
    <div class="container">
        <div class="row row-offcanvas row-offcanvas-right"  >
            <div class="col-6 col-md-3 sidebar-offcanvas sett-side2" id="sidebar" >
                <div class="list-group" style="background: #FFFFFF">
                    <h2 class="list-group-item list-group-item-action">设置</h2>
                    <a href="#" id="password"  class="list-group-item list-group-item-action">修改密码</a>
                    <a href="#" id="username" class="list-group-item list-group-item-action active">编辑个人中心</a>
                </div>
            </div><!--/span-->

            <div class="col-10 col-md-9 sett-side" id="mainshow" style="background: #FFFFFF">
                <div class="alert alert-success2 alert-dismissible" id="updatesucceess">
                    <h2 class="alert-success">${warn}</h2>
                </div>
                <form action="/settings/username" method="post" class="form-signin no-pd">
                    <h1 class="form-signin-heading">个人资料</h1>
                    <hr>
                    <div class="form-group row">
                        <label class="col-md-2"  title="Required. 4 to 50 characters. Letters, digits and - only. Must start with a letter.">用户名
                        </label>
                        <div class="col-md-10">
                            ${user.username}
<%--                            <input type="text" name="username" value="${user.username}" class="form-control" validators="[<class 'user.validators.UsernameValidator'>]" maxlength="50" required="" id="id_username">--%>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-md-2"  title="">性别</label>
                        <div class="col-md-10">
                            ${user.sex}
<%--                            <input type="radio" name="gender" value="男" <c:if test="${user.sex=='男'}">checked="checked" </c:if> >男--%>
<%--                            <input type="radio" name="gender" value="女" style="margin-left: 30px;" <c:if test="${user.sex=='女'}">checked="checked" </c:if>> 女--%>
<%--                            <input type="radio" name="gender" value="" style="margin-left: 30px;" <c:if test="${user.sex==null}">checked="checked" </c:if>> 保密--%>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-md-2"  title="<ul><li>Your password is too weak.</li></ul>" >城市</label>
                        <div class="col-md-10">
                            ${user.city}
<%--                            <div id="target">--%>
<%--                                <select name="province" data-province="${province0}"></select>--%>
<%--                                <select name="city" data-city="${province1}"></select>--%>
<%--                                <select name="county"  data-district="${province2}"></select>--%>
<%--                            </div>--%>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-md-2"  title="<ul><li>Your password is too weak.</li></ul>" >出生日期</label>
                        <div class="col-md-10">
<%--                            <input type="date" name="birthday" value="${user.birthday}">--%>
                            ${user.birthday}
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-md-2"  title="<ul><li>Your password is too weak.</li></ul>" >简介</label>
                        <div class="col-md-10">
                            <textarea class="form-control" name="introduction" id="introduction" placeholder="在这里输入你的个人简介"></textarea>
                        </div>
                    </div>
                    <br>
                </form>
            </div><!--/span-->
        </div><!--/row-->
    </div><!--/.container-->
</main>
<script type="text/javascript">
    $(document).ready(function () {
        $("#username").click(function () {
        htmlobj2 = $.ajax({
            url: "/toUserName",
            dataType: 'json',
            data: {settingflag: "false"},
            async: false
        });
        $("#mainshow").html(htmlobj2.responseText);
        });
    });
</script>
<script>
    $(document).ready(function () {
        $(document).ready(function () {
            $("#introduction").val("${user.introduction}")
        })
    });
</script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#password").click(function () {
            htmlobj2 = $.ajax({
                url: "/settings/to_password",
                dataType: 'json',
                data: {settingflag: "false"},
                async: false
            });
            $("#mainshow").html(htmlobj2.responseText);
        });
    });
</script>
<script type="text/javascript">
    $(document).ready(function () {
        var settings = ${setting};
         if (settings=="http://127.0.0.1:8083/settings/password#"){
             htmlobj2 = $.ajax({
                 url: "/settings/to_password",
                 dataType: 'json',
                 data: {settingflag: "true"},
                 async: false
             });
             $("#mainshow").html(htmlobj2.responseText);
         }
    });
</script>
<script type="text/javascript">
    $(function(){
        $('#pass').keyup(function () {
            var strongRegex = new RegExp("^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g");
            var mediumRegex = new RegExp("^(?=.{7,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g");
            var enoughRegex = new RegExp("(?=.{6,}).*", "g");

            if (false == enoughRegex.test($(this).val())) {
                $('#level').removeClass('pw-weak');
                $('#level').removeClass('pw-medium');
                $('#level').removeClass('pw-strong');
                $('#level').addClass(' pw-defule');
                //密码小于六位的时候，密码强度图片都为灰色
            }
            else if (strongRegex.test($(this).val())) {
                $('#level').removeClass('pw-weak');
                $('#level').removeClass('pw-medium');
                $('#level').removeClass('pw-strong');
                $('#level').addClass(' pw-strong');
                //密码为八位及以上并且字母数字特殊字符三项都包括,强度最强
            }
            else if (mediumRegex.test($(this).val())) {
                $('#level').removeClass('pw-weak');
                $('#level').removeClass('pw-medium');
                $('#level').removeClass('pw-strong');
                $('#level').addClass(' pw-medium');
                //密码为七位及以上并且字母、数字、特殊字符三项中有两项，强度是中等
            }
            else {
                $('#level').removeClass('pw-weak');
                $('#level').removeClass('pw-medium');
                $('#level').removeClass('pw-strong');
                $('#level').addClass('pw-weak');
                //如果密码为6为及以下，就算字母、数字、特殊字符三项都包括，强度也是弱的
            }
            return true;
        });
    })
</script>

</body>
</html>
