<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>
        PhysioNet
    </title>


    <link rel="stylesheet" type="text/css" href="/static/static/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/static/static/font-awesome/css/all.css">
    <link rel="stylesheet" type="text/css" href="/static/static/custom/css/physionet.css">


    <link rel="stylesheet" type="text/css" href="/static/static/custom/css/home.css">
    <link rel="alternate" type="application/rss+xml" title="PhysioNet News" href="/feed.xml">


    <script src="/static/static/jquery/jquery.min.js"></script>
    <script src="/static/static/popper/popper.min.js"></script>
    <script async="" src="/static/static/analytics/js/googletagmanager.js"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());

        gtag('config', 'UA-87592301-7');
    </script>
    <script src="https://cdn.bootcss.com/echarts/3.7.1/echarts.js"></script>

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
                <a id="nav_index" class="nav-link" href="/views/search.jsp">
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
    </div>
</nav>

<div class="main-header">
    <div class="center">
        <h1>中原心电数据库</h1>
        <p>心电数据研究资源</p>
        <br>
        <div class="navbar-search">
            <form class="form-inline" action="/content/">
                <input name="topic" class="search-input" type="text" placeholder="搜索">
                <span class="input-group-btn">
		      <button id="search-button" type="submit" class="btn-search my-2 my-sm-0" title="Search"><span class="fa fa-search"><span class="visually-hidden">Search</span></span></button>
		    </span>
            </form>
        </div>
    <%--        <div>--%>
<%--            <a href="/data/">数据</a>--%>
<%--            <a href="/about/software/">在线视图工具</a>--%>
<%--        </div>--%>
    </div>
</div>
<%--<div id="totalFlowRate" style="height:500px;"></div>--%>
<%--<script type="text/javascript">--%>
<%--    var totalFlowRate = echarts.init(document.getElementById('totalFlowRate'));--%>
<%--    var xAxisData = [];--%>
<%--    var yAxisData = [];--%>
<%--    for (var i = 30; i > 0; i--) {--%>
<%--        xAxisData.push(null);--%>
<%--    }--%>
<%--    for (i = 1; i < 31; i++) {--%>
<%--        yAxisData.push(null);--%>
<%--    }--%>
<%--    var totalFlowRateOption = {--%>
<%--        animation: false,--%>
<%--        //尺寸--%>
<%--        grid: {--%>
<%--            left: 1000/*"50px"*/,--%>
<%--            right: 20/*"15px"*/--%>
<%--        },--%>
<%--        xAxis: {--%>
<%--            show:false,--%>
<%--            boundaryGap: false,--%>
<%--            data: xAxisData--%>
<%--        },--%>
<%--        yAxis: {--%>
<%--            show:false,--%>
<%--            boundaryGap: false--%>
<%--        },--%>
<%--        series: {--%>
<%--            symbol: "none",/*去掉小圆点*/--%>
<%--            type: 'line',--%>
<%--            data: yAxisData/*,             smooth:true//显示为平滑的曲线*/--%>
<%--        }--%>
<%--    };--%>

<%--    totalFlowRate.setOption(totalFlowRateOption);--%>

<%--    setInterval(function () {--%>
<%--        for (var i=0;i<3;i++){--%>
<%--            if(yAxisData.length>30) {--%>
<%--                yAxisData.shift();--%>
<%--            }--%>
<%--            yAxisData.push(Math.round(Math.random() * 50));--%>
<%--        }--%>
<%--        for (i=0;i<6;i++){--%>
<%--            if(yAxisData.length>50) {--%>
<%--                yAxisData.shift();--%>
<%--            }--%>
<%--            yAxisData.push(20);--%>
<%--        }--%>
<%--        totalFlowRate.setOption(totalFlowRateOption);--%>
<%--    }, 170);--%>
<%--</script>--%>
</body>
</html>