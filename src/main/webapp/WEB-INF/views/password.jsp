<%--
  Created by IntelliJ IDEA.
  User: HomieJ
  Date: 2021/5/24
  Time: 13:28
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
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());

        gtag('config', 'UA-87592301-7');
    </script>
    <link rel="shortcut icon" type="image/png" href="/static/favicon.ico">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        .pwd{width:40px;height:20px;line-height:5px;padding-top:2px;}
        .pwd_f{color:#BBBBBB;}
        .pwd_c{background-color:#F3F3F3;border-top:1px solid #D0D0D0;border-bottom:1px solid #D0D0D0;border-left:1px solid #D0D0D0;}
        .pwd_Weak_c{background-color:#FF4545;border-top:1px solid #BB2B2B;border-bottom:1px solid #BB2B2B;border-left:1px solid #BB2B2B;}
        .pwd_Medium_c{background-color:#FFD35E;border-top:1px solid #E9AE10;border-bottom:1px solid #E9AE10;border-left:1px solid #E9AE10;}
        .pwd_Strong_c{background-color:#3ABB1C;border-top:1px solid #267A12;border-bottom:1px solid #267A12;border-left:1px solid #267A12;}
        .pwd_c_r{border-right:1px solid #D0D0D0;}
        .pwd_Weak_c_r{border-right:1px solid #BB2B2B;}
        .pwd_Medium_c_r{border-right:1px solid #E9AE10;}
        .pwd_Strong_c_r{border-right:1px solid #267A12;}
    </style>
</head>
<body>
<div class="alert alert-success2 alert-dismissible" id="updatesucceess">
    <h2 class="alert-success">${passwordWarn}</h2>
</div>
<form action="/settings/password" method="post" class="form-signin">
    <h1 class="form-signin-heading">修改密码</h1>
    <hr>
    <div class="form-group row">
        <label class="col-md-2" for="id_old_password" title="">旧密码
        </label>
        <div class="col-md-10">
            <input type="password" name="old_password" autofocus="" required="" id="id_old_password" placeholder="请输入旧密码" class="form-control">
        </div>
    </div>

    <div class="form-group row">
        <label class="col-md-2" for="" title="<ul><li>Your password is too weak.</li></ul>">新密码
        </label>
        <div class="col-md-10">
<%--            <input class="password" name="new_password1" id="new_password1" />--%>
            <input name="password" type="PassWord" onKeyUp="CheckIntensity(this.value)" style="float: left" placeholder="请输入新密码" id="pwd" class="form-control">
            <table  style="margin: 0 ;height: 5px;border-collapse: collapse">
                <tr align="center" style="height: 10px" >
                    <td id="pwd_Weak" class="pwd pwd_c">&nbsp;</td>
                    <td id="pwd_Medium" class="pwd pwd_c pwd_f" style="text-align: center ;padding: 0.7em 0.5em"></td>
                    <td id="pwd_Strong" class="pwd pwd_c pwd_c_r">&nbsp;</td>
                </tr>
            </table>

        </div>
    </div>
    <div class="form-group row">
        <label class="col-md-2" for="apw" title="">确认新密码
        </label>
        <div class="col-md-10">
            <input type="password" name="new_password2" required="" id="apw" placeholder="请再次输入密码" aria-invalid="pwd1" class="form-control"><span id="tishi"></span>
        </div>
    </div>
    <br>
    <button class="btn btn-primary btn-rsp" type="submit" onkeyup="validate()">修改密码</button>
</form>
<hr>
<p>如果你忘记你的密码点击 <a href="/changePassword">这里</a> 通过邮箱修改你的密码.

</p>
</body>
<script>
    function CheckIntensity(pwd){
        var Mcolor,Wcolor,Scolor,Color_Html;
        var m=0;
        var Modes=0;
        for(i=0; i<pwd.length; i++){
            var charType=0;
            var t=pwd.charCodeAt(i);
            if(t>=48 && t <=57){charType=1;}
            else if(t>=65 && t <=90){charType=2;}
            else if(t>=97 && t <=122){charType=4;}
            else{charType=4;}
            Modes |= charType;
        }
        for(i=0;i<4;i++){
            if(Modes & 1){m++;}
            Modes>>>=1;
        }
        if(pwd.length<=4){m=1;}
        if(pwd.length<=0){m=0;}
        switch(m){
            case 1 :
                Wcolor="pwd pwd_Weak_c";
                Mcolor="pwd pwd_c";
                Scolor="pwd pwd_c pwd_c_r";
                Color_Html="弱";
                break;
            case 2 :
                Wcolor="pwd pwd_Medium_c";
                Mcolor="pwd pwd_Medium_c";
                Scolor="pwd pwd_c pwd_c_r";
                Color_Html="中";
                break;
            case 3 :
                Wcolor="pwd pwd_Strong_c";
                Mcolor="pwd pwd_Strong_c";
                Scolor="pwd pwd_Strong_c pwd_Strong_c_r";
                Color_Html="强";
                break;
            default :
                Wcolor="pwd pwd_c";
                Mcolor="pwd pwd_c pwd_f";
                Scolor="pwd pwd_c pwd_c_r";
                Color_Html="无";
                break;
        }
        document.getElementById('pwd_Weak').className=Wcolor;
        document.getElementById('pwd_Medium').className=Mcolor;
        document.getElementById('pwd_Strong').className=Scolor;
        document.getElementById('pwd_Medium').innerHTML=Color_Html;
    }
</script>
</html>
