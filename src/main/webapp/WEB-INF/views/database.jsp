<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<%--    <link rel="stylesheet" type="text/css" href="/static/static/custom/css/about.css">--%>

<%--    <script src="https://cdn.staticfile.org/jquery/3.4.0/jquery.min.js"></script>--%>
    <script src="/static/static/jquery/3.4.0/jquery.cookie.min.js"></script>
    <script type="text/javascript" async="" src="/static/static/analytics/js/analytics.js"></script>
    <script src="/static/static/jquery/jquery2.min.js"></script>
    <script src="/static/static/popper/popper.min.js"></script>
    <script async="" src="/static/static/analytics/js/googletagmanager.js"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());
        gtag('config', 'UA-87592301-7');
    </script>
    <script>
        $(document).ready(function () {
            $("#nav_logout").click(function () {
                $.cookie('_COOKIE_NAME',null);
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
        <div class="row">
            <div class="main-side" style="background: rgba(0,0,0,0.03); border: 1px silver solid;">
                <div class="card">
                    <h2 class="card-header">数据库</h2>
                    <div class="card-body" style="padding: 1.25rem">
                        <!-- Databases -->
                        <ul style="list-style: none">
                            <li><a href="#overview">概述</a></li>
                            <li><a href="#normal_ecg">正常心电图</a></li>
                            <li><a href="#basic_rhythm_analysis">基本节律分析</a></li>
                            <li><a href="#credentialed">节律变动分析</a></li>
                            <li><a href="#credentialed2">期外收缩分析</a></li>
                            <li><a href="#credentialed3">有心房纤颤、心房扑动</a></li>
                            <li><a href="#credentialed4">有起搏器</a></li>
                            <li><a href="#credentialed5">其他疾病库</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="main-content2" style="width: 75%">
                <div style="max-width: 75%"><section id="overview">
                    <h2>概述</h2>
                    <p> 此页面按左侧分类显示所有数据库的列表。如若搜索内容，请访问搜索页面。输入搜索词，然后选择结果的排序方式。</p>
                    <br>
                    <p> 每一个分类数据库都遵从以下规则</p>
                    <ul>
                        <li>公开访问:所有用户都可以访问，限制较小,获取少量数据。</li>
                        <li>登录访问:获取大量数据</li>
                    </ul>
                </section>

                    <br>
                    <hr>
                    <h2 id="normal_ecg">正常心电图</h2>
                    <ul>
                        <c:forEach items="${lista}" var="item" varStatus="vs">
                        <li><a href="/normal_ecg?name=${item.getName()}&type=type${item.typename}&id=${item.id}">${item.name}</a>:${item.datadesloc}-----<a href="/down?type=type${item.typename}&id=${item.id}">下载</a></li>
                        </c:forEach>
                    </ul>
                    <h2 id="basic_rhythm_analysis">基本节律分析</h2>
                    <ul>
                        <c:forEach items="${listb}" var="item" varStatus="vs">
                            <li><a href="/normal_ecg?name=${item.getName()}&type=type${item.typename}&id=${item.id}">${item.name}</a>:${item.datadesloc}-----<a href="/down?type=type${item.typename}&id=${item.id}">下载</a></li>
                        </c:forEach>
                    </ul>
                    <h2 id="credentialed">节律变动分析</h2>
                    <ul>
                        <c:forEach items="${listc}" var="item" varStatus="vs">
                            <li><a href="/normal_ecg?name=${item.getName()}&type=type${item.typename}&id=${item.id}">${item.name}</a>:${item.datadesloc}-----<a href="/down?type=type${item.typename}&id=${item.id}">下载</a></li>
                        </c:forEach>
                    </ul>
                    <h2 id="credentialed2">期外收缩分析</h2>
                    <ul>
                        <c:forEach items="${listd}" var="item" varStatus="vs">
                            <li><a href="/normal_ecg?name=${item.getName()}&type=type${item.typename}&id=${item.id}">${item.name}</a>:${item.datadesloc}-----<a href="/down?type=type${item.typename}&id=${item.id}">下载</a></li>
                        </c:forEach>
                    </ul>
                    <h2 id="credentialed3">有心房纤颤、心房扑动</h2>
                    <ul>
                        <c:forEach items="${liste}" var="item" varStatus="vs">
                            <li><a href="/normal_ecg?name=${item.getName()}&type=type${item.typename}&id=${item.id}">${item.name}</a>:${item.datadesloc}-----<a href="/down?type=type${item.typename}&id=${item.id}">下载</a></li>
                        </c:forEach>
                    </ul>
                    <h2 id="credentialed4">有起搏器</h2>
                    <ul>
                        <c:forEach items="${listf}" var="item" varStatus="vs">
                            <li><a href="/normal_ecg?name=${item.getName()}&type=type${item.typename}&id=${item.id}">${item.name}</a>:${item.datadesloc}-----<a href="/down?type=type${item.typename}&id=${item.id}">下载</a></li>
                        </c:forEach>
                    </ul>
                    <h2 id="credentialed5">其他疾病库</h2>
                    <ul>
                        <c:forEach items="${listg}" var="item" varStatus="vs">
                            <li><a href="/normal_ecg?name=${item.getName()}&type=type${item.typename}&id=${item.id}">${item.name}</a>:${item.datadesloc}-----<a href="/down?type=type${item.typename}&id=${item.id}">下载</a></li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
    </div>

</main>


<script src="/static/static/bootstrap/js/bootstrap.min.js"></script>
<script src="/static/static/bootstrap/js/ie10-viewport-bug-workaround.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $("#nav_logout").click(function () {
            $.cookie('_COOKIE_NAME',null);
        });
    });
</script>




</body>
</html>