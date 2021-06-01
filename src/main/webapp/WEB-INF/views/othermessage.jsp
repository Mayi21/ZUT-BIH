<%--
  Created by IntelliJ IDEA.
  User: HomieJ
  Date: 2021/5/24
  Time: 20:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="alert alert-success2 alert-dismissible" id="updatesucceess">
    <h2 class="alert-success">${warn}</h2>
</div>
<form action="/settings/othermessage" method="post" class="form-signin">
    <h1 class="form-signin-heading">其他信息</h1>
    <hr>

    <div class="form-group row">
        <label class="col-md-2" for="id_old_password" title="">性别
        </label>
        <div class="col-md-10">
            <input type="password" name="old_password" autofocus="" required="" id="id_old_password">

        </div>
    </div>

    <div class="form-group row">
        <label class="col-md-2" for="id_new_password1" title="<ul><li>Your password is too weak.</li></ul>">城市
        </label>
        <div class="col-md-10">
            <input type="password" name="new_password1" required="" id="id_new_password1">

        </div>
    </div>

    <br>
    <button class="btn btn-primary btn-rsp" type="submit">修改</button>
</form>
</body>
</html>
