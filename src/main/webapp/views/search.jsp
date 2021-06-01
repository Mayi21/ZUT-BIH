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
        PhysioNet Index
    </title>


    <link rel="stylesheet" type="text/css" href="/static/static/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/static/static/font-awesome/css/all.css">
    <link rel="stylesheet" type="text/css" href="/static/static/custom/css/physionet.css">


    <link rel="stylesheet" type="text/css" href="/static/static/search/css/content-index.css">
    <link rel="stylesheet" type="text/css" href="/static/static/custom/css/form-control-input.css">
    <link rel="stylesheet" type="text/css" href="/static/static/custom/css/pagination.css">


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
    <div class="main">
        <div class="main-side">
            <form method="GET" action="" class="">
                <div class="card">
                    <h2 class="card-header">搜索</h2>
                    <div class="card-body no-pd search-card">
                        <input type="hidden" name="csrfmiddlewaretoken" value="buFd8laZtbV9g3Exl1Mk3n45unycehmjIBRGpUkUnppHiqKepCaBazvMlXmdSnYE">

                        <div class="form-group row">
                            <label class="col-md-2" for="id_topic" title="">
                            </label>
                            <div class="col-md-10">
                                <input type="text" name="topic" value="" maxlength="50" id="id_topic">
                            </div>
                        </div>
                        <div class="search-options">
                            <div class="sort">
                                <label>类型</label>
                                <input type="hidden" name="csrfmiddlewaretoken" value="buFd8laZtbV9g3Exl1Mk3n45unycehmjIBRGpUkUnppHiqKepCaBazvMlXmdSnYE">

                                <div class="form-group row">
                                    <label class="col-md-2" for="id_orderby" title="">
                                    </label>
                                    <div class="col-md-10">
                                        <select id="id_orderby">
                                            <option>----选择大类----</option>
                                            <option>正常心电图</option>
                                            <option>基本节律分析</option>
                                            <option>节律变动分析</option>
                                            <option>期外收缩分析</option>
                                            <option>有心房纤颤、心房扑动</option>
                                            <option>有起搏器</option>
                                            <option>完整疾病库</option>
                                        </select>
                                        <select class="city">
                                            <option>----选择小类----</option>
                                        </select>
                                        <select class="city">
                                            <option>正常心电图</option>
                                            <option>正常范围心电图</option>
                                            <option>大致正常心电图</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr>
                        <button class="btn btn-primary btn-rsp" type="submit">开始</button>
                    </div>
                </div>
            </form>
        </div>
        <div class="main-content">

            文件
        </div>
        <div class="main-right">
            简介
        </div>
<%--        <h1>数据库资源</h1>--%>
<%--        <br>--%>
<%--        <div class="project">--%>
<%--            <p>--%>
<%--                &lt;%&ndash;                <span class="badge badge-dark"><i class="fa fa-database"></i> Database</span>&ndash;%&gt;--%>
<%--                <span class="badge badge-success"><i class="fas fa-lock-open"></i>公开数据</span>--%>
<%--            </p>--%>
<%--            <h2><a href="#">数据库题目</a></h2>--%>

<%--            <div style="margin-bottom: 1rem;">--%>
<%--                <p>数据库简介</p>--%>
<%--            </div>--%>
<%--            <p class="text-muted">--%>

<%--                <a href="/content/?topic=hypertension"><span class="badge badge-pn">相似数据库</span></a>--%>

<%--                &lt;%&ndash;                <a href="/content/?topic=blood+pressure"><span class="badge badge-pn">blood pressure</span></a>&ndash;%&gt;--%>

<%--                &lt;%&ndash;                <a href="/content/?topic=cardiovascular"><span class="badge badge-pn">cardiovascular</span></a>&ndash;%&gt;--%>

<%--            </p>--%>
<%--            <p class="pub-details">附带信息</p>--%>

<%--            &lt;%&ndash;            <a href="/lightwave/?db=bpssrat/1.0.0"><i class="fas fa-chart-line"></i> Visualize waveforms</a>&ndash;%&gt;--%>
<%--            <a href="#">在线显示测试连接</a>--%>
<%--            <hr>--%>
<%--        </div>--%>
    </div>
</main>

<!-- This footer template is from the bootstrap 'blog' example -->

<link rel="stylesheet" type="text/css" href="/static/custom/css/footer.css">

<script src="/static/static/bootstrap/js/bootstrap.min.js"></script>
<script src="/static/static/bootstrap/js/ie10-viewport-bug-workaround.js"></script>


<script>
    $("#resource-check").change(function() {
        $(document).click(function(e){
            if ($('.resource').is(e.target) || $('.resource').has(e.target).length > 0) return;
            $('#resource-check').prop("checked", false);
            $(document).off('click');
        })
    });

    $(".nselected").html($('.resource .row input:checked').length + ' selected');
    $(".resource .row input").click(function(){
        $('.nselected').html($('.resource .row input:checked').length + ' selected')
    });

    $('#selectall').click(function(){ $('#type-check').find('input').prop('checked', true); return false; });
</script>

<script type="text/javascript">
    $(document).ready(function(){
        $("#id_orderby").change(function(){
            $("#id_orderby option").each(function(i,o){
                if($(this).attr("selected"))
                {
                    $(".city").hide();
                    $(".city").eq(i).show();
                }
            });
        });
        $("#id_orderby  ").change();
    });
</script>



</body></html>
