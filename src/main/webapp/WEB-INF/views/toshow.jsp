<%--
  Created by IntelliJ IDEA.
  User: HomieJ
  Date: 2021/5/16
  Time: 11:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>

    <script type="text/javascript">
    onload = function() {
        setInterval(go, 100);
    };
    function go() {
            location.href = 'http://127.0.0.1:8000/research';
    }
</script>
<body>
</body>
</html>
