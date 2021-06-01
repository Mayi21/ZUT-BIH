<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: HomieJ
  Date: 2021/5/24
  Time: 9:32
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

<%--    <script src="/static/static/jquery/3.4.0/jquery.min.js"></script>--%>
<%--    <script src="/static/static/jquery/3.4.0/jquery.cookie.min.js"></script>--%>
    <script src="/static/static/laydate/laydate.js"></script>
    <script src="/static/static/popper/popper.min.js"></script>
    <script async="" src="/static/static/analytics/js/googletagmanager.js"></script>
    <script src="/static/static/dist/dispicker.js" charset="UTF-8"></script>
    <script src="/static/static/laydate/theme/default/laydate.css"></script>
    <script language="javascript" type="text/javascript" src="/static/static/date/WdatePicker.js"></script>

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
    <link rel="shortcut icon" type="image/png" href="/static/favicon.ico">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<div class="alert alert-success2 alert-dismissible" id="updatesucceess">
    <h2 class="alert-success">${usernameWarn}</h2>
</div>
<form action="/settings/username" method="post" class="form-signin no-pd">
    <h1 class="form-signin-heading">编辑个人中心</h1>
    <hr>
    <div class="form-group row">
        <label class="col-md-2" for="id_username" title="Required. 4 to 50 characters. Letters, digits and - only. Must start with a letter.">用户名
        </label>
        <div class="col-md-10">
            <input type="text" name="username" value="${user.username}" class="form-control" validators="[<class 'user.validators.UsernameValidator'>]" maxlength="50" required="" id="id_username">
        </div>
    </div>
    <div class="form-group row">
        <label class="col-md-2"  title="">性别</label>
        <div class="col-md-10">
            <input type="radio" name="gender" value="男" <c:if test="${user.sex=='男'}">checked="checked" </c:if> >男
            <input type="radio" name="gender" value="女" style="margin-left: 30px;" <c:if test="${user.sex=='女'}">checked="checked" </c:if>> 女
            <input type="radio" name="gender" value="保密" style="margin-left: 30px;" <c:if test="${user.sex=='保密'}">checked="checked" </c:if>> 保密
        </div>
    </div>

    <div class="form-group row">
        <label class="col-md-2"  title="<ul><li>Your password is too weak.</li></ul>" >城市</label>
        <div class="col-md-10">
            <div id="target">
                <select name="province" data-province="${province0}"></select>
                <select name="city" data-city="${province1}"></select>
                <select name="county"  data-district="${province2}"></select>
            </div>
        </div>
    </div>
    <div class="form-group row">
        <label class="col-md-2"  title="<ul><li>Your password is too weak.</li></ul>" >出生日期</label>
        <div class="col-md-10">
            <input type="date" name="birthday" value="${user.birthday}">
        </div>
    </div>
    <div class="form-group row">
        <label class="col-md-2"  title="<ul><li>Your password is too weak.</li></ul>" >简介</label>
        <div class="col-md-10">
            <textarea class="form-control" name="introduction" id="introduction" placeholder="在这里输入你的个人简介"></textarea>

        </div>
    </div>
    <br>
    <button class="btn btn-primary btn-custom btn-rsp" type="submit" id="update">修改</button>
</form>
<script>
        $(document).ready(function () {
            $("#introduction").val("${user.introduction}")
        })
</script>
</body>
</html>
