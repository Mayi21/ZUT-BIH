<%--
  Created by IntelliJ IDEA.
  User: HomieJ
  Date: 2021/4/19
  Time: 13:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>
        中原心电数据库
    </title>


    <link rel="stylesheet" type="text/css" href="/static/static/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/static/static/font-awesome/css/all.css">
    <link rel="stylesheet" type="text/css" href="/static/static/custom/css/physionet.css">


    <link rel="stylesheet" type="text/css" href="/static/static/search/css/content-index.css">
    <link rel="stylesheet" type="text/css" href="/static/static/custom/css/form-control-input.css">
    <link rel="stylesheet" type="text/css" href="/static/static/custom/css/pagination.css">
    <script src="/static/static/jquery/3.4.0/jquery.min.js"></script>
    <script src="/static/static/jquery/3.4.0/jquery.cookie.min.js"></script>

    <script type="text/javascript" async="" src="/static/static/analytics/js/analytics.js"></script>
<%--    <script src="/static/static/jquery/jquery2.min.js"></script>--%>
    <script src="/static/static/popper/popper.min.js"></script>
    <script async="" src="/static/static/analytics/js/googletagmanager.js"></script>
    <script>
        window.dataLayer = window.dataLayer || [];

        function gtag() {
            dataLayer.push(arguments);
        }

        gtag('js', new Date());

        gtag('config', 'UA-87592301-7');
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#id_orderby").change(function () {
                $("#id_orderby option").each(function (i, o) {
                    if ($(this).attr("selected")) {
                        $(".city").hide();
                        $(".city").eq(i).show();
                    }
                });
            });
            $("#id_orderby").change();
        });
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            var topic = '${topic}';
            if (topic.length!=0){
                    htmlobj = $.ajax({
                        url: "/search_ecg",
                        data: {id_topic: topic},
                        dataType: 'json',
                        async: false
                    });
                    $("#search_center").html(htmlobj.responseText);
            }
        });
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#search").click(function () {
                htmlobj = $.ajax({
                    url: "/search_ecg",
                    data: {id_topic: $("input[name=id_topic]").val()},
                    dataType: 'json',
                    async: false
                });
                $("#search_center").html(htmlobj.responseText);
                htmlobj2 = $.ajax({
                    url: "/main_right",
                    data: {search_center: $("div[id=search_center]").val()},
                    dataType: 'json',
                    async: false
                });
                $("#search_right").html(htmlobj2.responseText);
            });
        });
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#search").click(function () {
                htmlobj2 = $.ajax({
                    url: "/main_right",
                    data: {search_center: $("div[id=search_center]").val()},
                    dataType: 'json',
                    async: false
                });
                $("#search_right").html(htmlobj2.responseText);
            });
        });
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#sou_suo").click(function () {
                htmlobj = $.ajax({
                    url: "/retrieval",
                    data: {id_orderby: $("select[name=id_orderby]").val(), city1:$("select[name=city1]").val(), city2:$("select[name=city2]").val()
                        , city3:$("select[name=city3]").val(), city4:$("select[name=city4]").val(), city5:$("select[name=city5]").val(), city6:$("select[name=city6]").val(), city7:$("select[name=city7]").val()},
                    dataType: 'json',
                    async: false
                });
                $("#search_center").html(htmlobj.responseText);
            });
        });
    </script>
    <link rel="shortcut icon" type="image/png" href="/static/favicon.ico">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body class="flexbody">
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
    <div class="main">
        <div class="main-side">
            <form>
                <div class="card">
                    <h2 class="card-header">搜索</h2>
                    <div class="card-body no-pd search-card">
                        <input type="hidden" name="csrfmiddlewaretoken"
                               value="buFd8laZtbV9g3Exl1Mk3n45unycehmjIBRGpUkUnppHiqKepCaBazvMlXmdSnYE">

                        <div class="form-group row">
                            <label class="col-md-2" for="id_topic" title="">
                            </label>
                            <div class="col-md-10">
                                <input type="text" name="id_topic" maxlength="50" id="id_topic" placeholder=${topic}>
                                <br>
                                <button type="button" class="btn btn-primary btn-rsp" id="search">搜索</button>
                                <hr>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <div class="main-content" id="search_center">
            <section id="overview">
                <h2>概述</h2>
                <p>
                    此页面是用于用户进行心电数据的资源搜索,你可以通过该页面左侧的搜索栏输入资源关键字进行搜索。如果想要查看全部的心电数据库类型,请点击<a href="/data">所有心电数据库资源</a>进行访问。访问所有心电数据库资源可以进行资源使用(例如:下载数据,数据的示例的在线可视化展示)</p>
                <p>每个资源都可以使用以下使用策略之一：</p>
                <ul>
                    <li>通过关键字进行筛选</li>
                    <li>本页面提供一键打包下载(有权限限制)</li>
                    <li>如有一条的心电数据的需求请在可视化心电展示界面进行下载</li>
                </ul>
            </section>
            <section id="jurisdiction">
                <h2>权限限制</h2>
                <p>
                   该页面进行的数据资源访问是有限制的,如果您想访问更多的数据访问请<a href="/data">登录</a>进行访问。</p>
                <ul>
                <li>未登录用户下载限制</li>
                <li>登录用户可以使用本站大量心电数据资源</li>
                <li>具体请阅读<a href="">使用文档</a> </li>
            </ul>
            </section>
        </div>
        <div class="main-right" id="search_right">
        </div>
    </div>
</main>

<!-- This footer template is from the bootstrap 'blog' example -->

<link rel="stylesheet" type="text/css" href="/static/custom/css/footer.css">

<script src="/static/static/bootstrap/js/bootstrap.min.js"></script>
<script src="/static/static/bootstrap/js/ie10-viewport-bug-workaround.js"></script>


<script>
    $("#resource-check").change(function () {
        $(document).click(function (e) {
            if ($('.resource').is(e.target) || $('.resource').has(e.target).length > 0) return;
            $('#resource-check').prop("checked", false);
            $(document).off('click');
        })
    });

    $(".nselected").html($('.resource .row input:checked').length + ' selected');
    $(".resource .row input").click(function () {
        $('.nselected').html($('.resource .row input:checked').length + ' selected')
    });

    $('#selectall').click(function () {
        $('#type-check').find('input').prop('checked', true);
        return false;
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
