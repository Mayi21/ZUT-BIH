<%--
  Created by IntelliJ IDEA.
  User: HomieJ
  Date: 2021/5/13
  Time: 16:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>New Project</title>


    <link rel="stylesheet" type="text/css" href="/static/static/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/static/static/font-awesome/css/all.css">
    <link rel="stylesheet" type="text/css" href="/static/static/custom/css/physionet.css">


    <link rel="stylesheet" type="text/css" href="/static/static/custom/css/settings.css">

    <script src="/static/static/jquery/3.4.0/jquery.min.js"></script>
    <script src="/static/static/jquery/3.4.0/jquery.cookie.min.js"></script>
<%--    <script src="/static/static/jquery/jquery.min.js"></script>--%>
    <script src="/static/static/popper/popper.min.js"></script>
    <script async="" src="/static/static/analytics/js/googletagmanager.js"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());

        gtag('config', 'UA-87592301-7');
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
                    alert("error");
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
    <style>.cke{visibility:hidden;}</style><script type="text/javascript" src="https://www.physionet.org/static/ckeditor/ckeditor/config.js?t=J39A"></script><link rel="stylesheet" type="text/css" href="https://www.physionet.org/static/ckeditor/ckeditor/skins/moono-lisa/editor.css?t=J39A"><script type="text/javascript" src="https://www.physionet.org/static/ckeditor/ckeditor/lang/en.js?t=J39A"></script><script type="text/javascript" src="https://www.physionet.org/static/ckeditor/ckeditor/styles.js?t=J39A"></script><script type="text/javascript" src="https://www.physionet.org/static/ckeditor/ckeditor/plugins/codesnippet/plugin.js?t=J39A"></script><script type="text/javascript" src="https://www.physionet.org/static/ckeditor/ckeditor/plugins/pnmathml/plugin.js?t=J39A"></script><script type="text/javascript" src="https://www.physionet.org/static/ckeditor/ckeditor/plugins/autosave/plugin.js?t=J39A"></script><link rel="stylesheet" type="text/css" href="https://www.physionet.org/static/ckeditor/ckeditor/plugins/scayt/skins/moono-lisa/scayt.css?t=J39A"><link rel="stylesheet" type="text/css" href="https://www.physionet.org/static/ckeditor/ckeditor/plugins/scayt/dialogs/dialog.css?t=J39A"><link rel="stylesheet" type="text/css" href="https://www.physionet.org/static/ckeditor/ckeditor/plugins/tableselection/styles/tableselection.css"><link rel="stylesheet" type="text/css" href="https://www.physionet.org/static/ckeditor/ckeditor/plugins/wsc/skins/moono-lisa/wsc.css?t=J39A"><script type="text/javascript" src="https://www.physionet.org/static/ckeditor/ckeditor/plugins/codesnippet/lang/en.js?t=J39A"></script><script type="text/javascript" src="https://www.physionet.org/static/ckeditor/ckeditor/plugins/pnmathml/lang/en.js?t=J39A"></script><script type="text/javascript" src="https://www.physionet.org/static/ckeditor/ckeditor/plugins/autosave/lang/en.js?t=J39A"></script><link rel="stylesheet" type="text/css" href="https://www.physionet.org/static/ckeditor/ckeditor/plugins/copyformatting/styles/copyformatting.css"><link rel="stylesheet" type="text/css" href="https://www.physionet.org/static/ckeditor/ckeditor/plugins/autosave/css/autosave.min.css?t=J39A"><script type="text/javascript" src="https://www.physionet.org/static/ckeditor/ckeditor/plugins/codesnippet/lib/highlight/highlight.pack.js"></script><script type="text/javascript" src="https://www.physionet.org/static/ckeditor/ckeditor/plugins/autosave/js/extensions.min.js?t=J39A"></script></head>
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

<main>
    <div class="container">
        <form action="/projects/create/" method="post" class="no-pd">
            <h2 class="form-signin-heading">创建新项目</h2>
            <hr>
            <p>完成下面的选项以创建新项目。</p>
            <p>在创建项目之前，请阅读<a href="/toShare" target="_blank">作者指南</a></p>
            <hr>
            <script type="text/javascript" src="/static/ckeditor/ckeditor-init.js" data-ckeditor-basepath="/static/ckeditor/ckeditor/" id="ckeditor-init-script"></script>
            <script type="text/javascript" src="/static/ckeditor/ckeditor/ckeditor.js"></script>
            <input type="hidden" name="csrfmiddlewaretoken" value="3ubPeUneSP6hRatY6g0RIVOEipEnSVaxfEiuFheZYXWnsHnA6K7tW9hNcguq8qVA">
            <input type="hidden" name="csrfmiddlewaretoken" value="3ubPeUneSP6hRatY6g0RIVOEipEnSVaxfEiuFheZYXWnsHnA6K7tW9hNcguq8qVA">

            <div class="form-group row">
                <label class="col-md-2"  title="">资源类型
                </label>
                <div class="col-md-10">
                        <option value="0">心电数据库</option>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-md-2" for="id_title" title="">题目
                </label>
                <div class="col-md-10">
                    <input type="text" name="title" maxlength="200" required="" id="id_title">
                </div>
            </div>

            <div class="form-group row">
                <label class="col-md-2" for="id_abstract" title="">摘要
                </label>
                <div class="col-md-10">
                    <div class="django-ckeditor-widget" data-field-id="id_abstract" style="display: inline-block; width: 100%;">
                        <textarea rows="10" cols="100" id="id_abstract">
                            </textarea>
                    </div>

                </div>
            </div>



<%--            <script type="text/javascript" src="/static/ckeditor/ckeditor-init.js" data-ckeditor-basepath="/static/ckeditor/ckeditor/" id="ckeditor-init-script"></script>--%>
<%--            <script type="text/javascript" src="/static/ckeditor/ckeditor/ckeditor.js"></script>--%>

            <hr>
            <button id="create_project" class="btn btn-primary btn-rsp" type="submit">创建项目</button>
        </form>
    </div>
</main>
<script type="text/javascript">
    $(document).ready(function () {
        $("#create_project").click(function () {
            htmlobj = $.ajax({
                url: "/toJson",
                data: {type: $("a[name=toShow]").v},
                dataType: 'json',
                async: false
            });
        });
    });
</script>
</body>
</html>
