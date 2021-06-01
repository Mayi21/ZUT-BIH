<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script src="/static/static/jquery/jquery.min.js"></script>
<body>
<h1>Resource</h1>
<div id="files-panel" class="card">

    <div class="card-header">
        <strong>心电图浏览</strong>
        <span class="dir-breadcrumbs"><span class="dir-breadcrumb-self">&lt;base&gt;</span></span>
    </div>


    <table class="files-panel">
    <tr>
        <th>名称</th>
        <th>下载</th>
    </tr>
    </thead>
        <tbody>
        <c:forEach items="${list}" var="item" varStatus="vs">
            <tr>
                <td><a href="/normal_ecg?name=${item.getName()}&type=type${item.typename}&id=${item.id}">${item.getName()}</a></td>
                <td><a href="/down?type=type${item.typename}&id=${item.id}">下载</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
