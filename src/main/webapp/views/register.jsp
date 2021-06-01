<%--
  Created by IntelliJ IDEA.
  User: HomieJ
  Date: 2021/4/19
  Time: 21:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>
        Register
    </title>


    <link rel="stylesheet" type="text/css" href="/static/static/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/static/static/font-awesome/css/all.css">
    <link rel="stylesheet" type="text/css" href="/static/static/custom/css/physionet.css">


    <link rel="stylesheet" type="text/css" href="/static/static/custom/css/login-register.css">


    <script type="text/javascript" async="" src="/static/static/analytics/js/analytics.js"></script>
    <script src="/static/static/jquery/jquery.min.js"></script>
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
    <label for="navicon" class="navbar-icon">☰</label>
    <input type="checkbox" id="navicon" class="navbar-check">

    <a id="nav_home" class="navbar-brand" href="/">
        PhysioNet
    </a>

    <div class="collapse navbar-collapse" id="navbarCollapse">

        <ul class="navbar-nav mr-auto">

            <li class="nav-item">
                <a id="nav_index" class="nav-link" href="/content/">
                    Find
                </a>
            </li>

            <li class="nav-item">
                <a id="nav_publish" class="nav-link" href="/about/publish/">
                    Share
                </a>
            </li>

            <li class="nav-item">
                <a id="nav_about" class="nav-link" href="/about/">
                    About
                </a>
            </li>

            <li class="nav-item">
                <a id="nav_news" class="nav-link" href="/news/">
                    News
                </a>
            </li>
        </ul>

        <ul class="navbar-nav ml-auto">


            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="nav_account_dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">

                    Account
                </a>
                <div class="dropdown-menu" aria-labelledby="nav_account_dropdown">
                    <a id="nav_login" class="dropdown-item" href="/login/">
                        Login
                    </a>
                    <a id="nav_register" class="dropdown-item" href="/register/">
                        Register
                    </a>

                </div>
            </li>
        </ul>

    </div>

    <div class="navbar-search">
        <form class="form-inline" action="/content/">
            <input name="topic" class="search-input" type="text" placeholder="Search">
            <span class="input-group-btn">
		      <button id="search-button" type="submit" class="btn-search my-2 my-sm-0" title="Search PhysioNet"><span class="fa fa-search"><span class="visually-hidden">Search PhysioNet</span></span></button>
		    </span>
        </form>
    </div>
</nav>


<main>
    <div class="container">
        <form action="/register/" method="post" class="form-signin">
            <h2 class="form-signin-heading">Create Account</h2>
            <input type="hidden" name="csrfmiddlewaretoken" value="EVyxduYE5snbRcEyT1zcXaarX2CXssQgb2K0u38zZGRJTzKfXCXt4mB8OCqY6ysB">

            <div class="form-group">
                <label for="id_email" title="">Email
                </label> <input type="email" name="email" class="form-control" maxlength="255" required="" id="id_email">

            </div>

            <div class="form-group">
                <label for="id_username" title="Required. 4 to 50 characters. Letters, digits and - only. Must start with a letter.">Username
                </label> <input type="text" name="username" class="form-control" maxlength="50" required="" id="id_username">

            </div>

            <div class="form-group">
                <label for="id_first_names" title="">First Names
                </label> <input type="text" name="first_names" class="form-control" maxlength="100" required="" id="id_first_names">

            </div>

            <div class="form-group">
                <label for="id_last_name" title="">Last Name
                </label> <input type="text" name="last_name" class="form-control" maxlength="50" required="" id="id_last_name">

            </div>




            <button class="btn btn-lg btn-primary btn-block" type="submit">Register</button>
        </form>
        <div class="form-signin">
            <p>Already have an account? <a href="/login/">Log In</a></p>
        </div>
    </div>
</main>

<!-- This footer template is from the bootstrap 'blog' example -->

<link rel="stylesheet" type="text/css" href="/static/custom/css/footer.css">

<footer class="blog-footer">
    <div class="container">
        <div class="row row-centered">
            <div class="col-xs-10 center col-centered">
                <p>PhysioNet is a repository of freely-available medical research data, managed by the <a href="http://lcp.mit.edu/" target="_blank">MIT Laboratory for Computational Physiology</a>.</p>
                <p>Supported by the <a href="https://www.nibib.nih.gov/" target="_blank">National Institute of Biomedical Imaging and Bioengineering (NIBIB)</a> under NIH grant number R01EB030362.</p>
                <p>For more accessibility options, see <a href="https://accessibility.mit.edu">MIT's accessibility page</a>.</p>
                <p><a href="#">Back to top</a></p>
            </div>
        </div>
    </div>
</footer>



<script src="/static/static/bootstrap/js/bootstrap.min.js"></script>
<script src="/static/static/bootstrap/js/ie10-viewport-bug-workaround.js"></script>






</body>
</html>
