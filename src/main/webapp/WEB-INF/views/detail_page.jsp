<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: HomieJ
  Date: 2021/4/23
  Time: 16:31
  To change this template use File | Settings | File Templates.
--%>
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
    <link rel="stylesheet" type="text/css" href="/static/static/custom/css/about.css">

    <script src="/static/static/jquery/3.4.0/jquery.cookie.min.js"></script>
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
<body class="flexbody"><div id="MathJax_Message" style="display: none;"></div>

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
    <div class="container">
        <p>
            <span class="badge badge-dark"><i class="fa fa-database"></i> 数据库</span>
            <span class="badge badge-success"><i class="fas fa-lock-open"></i> 公开访问</span>
        </p>
        <h1 class="form-signin-heading">${data.get(0).getName()}</h1>
        <p>
            <strong>
                <a class="author">${data.get(0).getAuthor()}</a> <i class="fas fa-info-circle" data-toggle="popover" data-original-title="<strong>作者信息</strong>" data-placement="bottom" data-content="<b>关系</b><p>中原心电数据库</p>" data-html="true" style="cursor: pointer;"></i>
                &nbsp
<%--                <a class="author">Roger Mark</a> <i class="fas fa-info-circle" data-toggle="popover" data-original-title="<strong>Author Info</strong>" data-placement="bottom" data-content="<b>Affiliations</b><p>MIT Laboratory for Computational Physiology, Cambridge, USA</p><p><b>PhysioNet Profile</b><br><a href=/users/rgmark target=_blank>rgmark</a></p>" data-html="true" style="cursor: pointer;"></i>--%>


            </strong>
        </p>

        <p>发布日期：2021年2月10日 版本：1.0.0</p>


        <hr>

        <!-- Latest news and announcements -->


        <div class="row">
            <!-- Main column -->
            <div class="col-md-8">

                <div class="alert alert-secondary">



                    <strong>使用此资源时，请附上出处链接及本声明。</strong>

                    <p><a href="${data.get(0).getLink()}">如需了解更多关于该分类心电图详细借鉴和知识,点击查阅相关文档。</a></p>



                    <p>
                        <strong>请使用以下标准引文</strong>
                        <a href="#citationModalPlatform" data-toggle="modal">(更多选择)</a>
                        <br><span>${data.get(0).getCite() }</span>
                    </p>

                    <div class="modal fade" id="citationModalPlatform">
                        <div class="modal-dialog citation" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">引用</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">×</span>
                                    </button>
                                </div>
                                <div class="modal-body">

                                    <table><tbody>

                                    <tr>
                                        <th>${data.get(0).getCite1name()} </th>
                                        <td>${data.get(0).getCite1()}</td>
                                    </tr>

                                    <tr>
                                        <th>${data.get(0).getCite2name()}</th>
                                        <td>${data.get(0).getCite2()}</td>
                                    </tr>

<%--                                    <tr>--%>
<%--                                        <th>Chicago</th>--%>
<%--                                        <td>Goldberger, A., L. Amaral, L. Glass, J. Hausdorff, P. C. Ivanov, R. Mark, J. E. Mietus, G. B. Moody, C. K. Peng, and H. E. Stanley. "PhysioBank, PhysioToolkit, and PhysioNet: Components of a new research resource for complex physiologic signals. Circulation [Online]. 101 (23), pp. e215–e220." (2000).</td>--%>
<%--                                    </tr>--%>

<%--                                    <tr>--%>
<%--                                        <th>Harvard</th>--%>
<%--                                        <td>Goldberger, A., Amaral, L., Glass, L., Hausdorff, J., Ivanov, P.C., Mark, R., Mietus, J.E., Moody, G.B., Peng, C.K. and Stanley, H.E., 2000. PhysioBank, PhysioToolkit, and PhysioNet: Components of a new research resource for complex physiologic signals. Circulation [Online]. 101 (23), pp. e215–e220.</td>--%>
<%--                                    </tr>--%>

<%--                                    <tr>--%>
<%--                                        <th>Vancouver</th>--%>
<%--                                        <td>Goldberger A, Amaral L, Glass L, Hausdorff J, Ivanov PC, Mark R, Mietus JE, Moody GB, Peng CK, Stanley HE. PhysioBank, PhysioToolkit, and PhysioNet: Components of a new research resource for complex physiologic signals. Circulation [Online]. 101 (23), pp. e215–e220.</td>--%>
<%--                                    </tr>--%>

                                    </tbody></table>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>



                <h3>数据摘要</h3>

<%--                <p>The data consist of 70 records, divided into a <em>learning set</em> of 35 records (a01 through a20, b01 through b05, and c01 through c10), and a <em>test set</em> of 35 records (x01 through x35), all of which may be downloaded from this page. Recordings vary in length from slightly less than 7 hours to nearly 10 hours each. Each recording includes a continuous digitized ECG signal, a set of apnea annotations (derived by human experts on the basis of simultaneously recorded respiration and related signals), and a set of machine-generated QRS annotations (in which all beats regardless of type have been labeled normal). In addition, eight recordings (a01 through a04, b01, and c01 through c03) are accompanied by four additional signals (Resp C and Resp A, chest and abdominal respiratory effort signals obtained using inductance plethysmography; Resp N, oronasal airflow measured using nasal thermistors; and SpO2, oxygen saturation).</p>--%>
                <p>${data.get(0).getDataabstract()}</p>
<%--                <p>Several files are associated with each recording. The files with names of the form <em>rnn</em>.dat contain the digitized ECGs (16 bits per sample, least significant byte first in each pair, 100 samples per second, nominally 200 A/D units per millivolt). The .hea files are (text) header files that specify the names and formats of the associated signal files; these header files are needed by the software available from this site. The .apn files are (binary) annotation files, containing an annotation for each minute of each recording indicating the presence or absence of apnea at that time; these are available for the 35 learning set recordings only. The qrs files are machine-generated (binary) annotation files, made using <a href="/physiotools/wag/sqrs-1.htm">sqrs125</a>, and provided for the convenience of those who do not wish to use their own QRS detectors.</p><p>Please note that the .qrs files are unaudited and contain errors. You may wish to correct these errors. Otherwise, you may use these annotations in uncorrected form if you wish to investigate methods of apnea detection that are robust with respect to small numbers of QRS detection errors, or you may ignore these annotations entirely and work directly from the signal files. Further information about the annotation files, including interpretations of the annotation types (codes) and details of how the .qrs files were created, are available <a href="annotations.html">here</a>.</p>--%>

<%--                <p>In April 2013, Chiu-wen Wu reported that training set control records c05 and c06 come from the same original recording (c05 begins 80 seconds later than c06). The slightly different descriptions of these records in <a href="additional-information.txt">additional-information.txt</a> suggest that c06 may have been a corrected version of c05.</p>--%>

<%--                <p>The eight records that include respiration signals have several additional files each. The four respiration-related signals are combined in a file named <em>rnn</em>r.dat, which has its own header file (<em>rnn</em>r.hea), as well as a header file named <em>rnn</em>er.hea, which (when used with software such as <a href="/physiotools/wug/">WAVE</a> or <a href="/physiotools/old/dbag/wview-1.htm"> WVIEW</a>) allows you to examine the ECG and the respiration signals side-by-side.</p>--%>

<%--                <p>Finally, if you are running Linux and have installed WAVE, you may click on the .xws file associated with each record to view that record without downloading it first. WAVE and the related <a href="/physiotools/wfdb.html"> WFDB software package</a> may be downloaded from this site.</p>--%>

                <h3>贡献者</h3>

                <p>本页面数据由中原心电数据库系统提供</p>
                <hr>

            </div>
            <!-- /.main column -->

            <!-- Sidebar Column -->
            <div class="col-md-4">





                <div class="card my-4">
                    <h5 class="card-header">分享</h5>
                    <div class="card-body">
                        <a class="btn btn-sm share-email sharebtn" href="mailto:?subject=Apnea-ECG%20Database&amp;body=https://www.zut.org/content/apnea-ecg/1.0.0/" role="button" title="Share with email"><i class="far fa-envelope"></i></a>
                        <a class="btn btn-sm facebook sharebtn" href="http://www.facebook.com/sharer.php?u=https://www.zut.org/content/apnea-ecg/1.0.0/" role="button" title="Share on Facebook"><i class="fab fa-facebook"></i></a>
                        <a class="btn btn-sm linkedin sharebtn" href="https://www.linkedin.com/shareArticle?url=https://www.zut.org/content/apnea-ecg/1.0.0/" role="button" title="Share on LinkedIn"><i class="fab fa-linkedin"></i></a>
                        <a class="btn btn-sm reddit sharebtn" href="https://www.reddit.com/submit?url=https://www.zut.org/content/apnea-ecg/1.0.0/&amp;title=Apnea-ECG%20Database" role="button" title="Share on Reddit"><i class="fab fa-reddit"></i></a>
                        <a class="btn btn-sm twitter sharebtn" href="https://zut.com/intent/tweet?text=Apnea-ECG%20Database. https://www.physionet.org/content/apnea-ecg/1.0.0/" role="button" title="Share on Twitter"><i class="fab fa-twitter"></i></a>
                    </div>
                </div>

                <div class="card my-4">
                    <h5 class="card-header">访问</h5>
                    <div class="card-body">
                        <p>
                            <strong>访问策略</strong>
                            <br>
                            任何人都可以访问这些文件，只要它们符合指定许可证的条款。
                        </p>
                        <p>
                            <strong>使用指南:</strong>
                            <br>
                            <a href="/toAbout">心电数据库数据资源引用指南</a>
                        </p>
                    </div>
                </div>
                <div class="card my-4">
                    <h5 class="card-header">关键词</h5>
                    <div class="card-body">
                        <p><strong>Topics:</strong>
                            <br>

                            <a href="/search_page?topic=${data.get(0).getKeyword1()}"><span class="badge badge-pn">${data.get(0).getKeyword1()}</span></a>

                            <a href="/search_page?topic=${data.get(0).getKeyword2()}"><span class="badge badge-pn">${data.get(0).getKeyword2()}</span></a>
                        </p>



                    </div>
                </div>

                <div class="card my-4">
                    <h5 class="card-header">联系咨询</h5>
                    <div class="card-body">

                        <p>
                            中原心电数据库支持<br>
                            ECG.<br>
                            <a href="">12451163@163.com</a>
                        </p>

                    </div>
                </div>


            </div>
            <!-- /.sidebar -->
        </div>

        <h2 id="files">文件</h2>


        <p>总未压缩下载大小:${allzount}

        </p><h5>获取文件</h5>
        <ul>


            <li><a href="/down?type=type${data.get(0).getTypename()}&id=${data.get(0).getId()}">下载压缩包</a> ${allzount}</li>


            <li>想要获取更多数据请点击 <a href="/toLogin">登录</a>.并刷新页面
<%--            </li><li>Access the data using the Google Cloud command line tools (please refer to the <a href="https://cloud.google.com/storage/docs/gsutil_install">gsutil</a> documentation for guidance):  <pre class="shell-command">gsutil -m -u YOUR_PROJECT_ID cp -r gs://apnea-ecg-1.0.0.physionet.org DESTINATION</pre></li>--%>



<%--            <li>Download the files using your terminal: <pre class="shell-command">wget -r -N -c -np https://physionet.org/files/apnea-ecg/1.0.0/</pre></li>--%>
        </ul>

        <p></p>


        <p><a href="/toJson?type=type${data.get(0).getTypename()}&id=${data.get(0).getId()}"><i class="fas fa-chart-line"></i> 在线视图工具</a></p>

        <div id="files-panel" class="card">
            <div class="card-header">
                文件导航:
                <span class="dir-breadcrumbs"><span class="dir-breadcrumb-self"></span></span>
            </div>


            <table class="files-panel">
                <colgroup><col class="files-panel-name">
                    <col class="files-panel-size">
                    <col class="files-panel-date">
                </colgroup><thead>
            <tr>
                <th>名字</th>
                <th>大小</th>
                <th>日期</th>
            </tr>
            </thead>
                <tbody>
                <c:forEach items="${files}" var="item" varStatus="vs">
                    <tr>
                        <td><a href="#">${item.name}</a>
                        </td>
                        <td>${item.size}</td>
                        <td>2000-10-13</td>
                    </tr>
                </c:forEach>


                </tbody>
            </table>


            <script>
                // Navigate to another file directory and reload the file panel
                // subdir is the full subdirectory
                function navigateDir(subdir){
                    $.ajax({
                        type: "GET",
                        url: "/content/apnea-ecg/files-panel/1.0.0/",
                        data: {'subdir':subdir
                        },
                        success: function reloadSection(result){
                            $("#files-panel").html(result);
                        },
                    });
                    return false
                }
            </script>

        </div>


        <br>
    </div>

</main>

<script src="/static/static/bootstrap/js/bootstrap.min.js"></script>
<script src="/static/static/bootstrap/js/ie10-viewport-bug-workaround.js"></script>


<script src="/static/static/custom/js/enable-popover.js"></script>
<script>hljs.initHighlightingOnLoad();</script>
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
<script type="text/javascript">
    $(document).ready(function () {
        $("#nav_logout").click(function () {
            $.cookie('_COOKIE_NAME',null);
        });
    });
</script>
<!-- https://schema.org/ metadata for discovery -->
<script type="application/ld+json">
    {
        "@context": "https://schema.org/",
        "@type": "Dataset",
        "name": "Abdominal and Direct Fetal ECG Database",
        "description": "The research material included in the Abdominal and Direct Fetal Electrocardiogram Database contains multichannel fetal electrocardiogram (FECG) recordings obtained from 5 different women in labor, between 38 and 41 weeks of gestation. The recordings were acquired in the Department of Obstetrics at the Medical University of Silesia, by means of the KOMPOREL system for acquisition and analysis of fetal electrocardiogram (ITAM Institute, Zabrze, Poland). Each recording comprises four differential signals acquired from maternal abdomen and the reference direct fetal electrocardiogram registered from the fetal head.",
        "version": "1.0.0",
        "license": "https://opendatacommons.org/licenses/by/index.html",
        "datePublished" : "Aug. 9, 2012",
        "url": "https://physionet.org/content/adfecgdb/1.0.0/",

        "identifier": "https://doi.org/10.13026/C2RP4B",

        "creator": [

        ],
        "includedInDataCatalog":{
            "@type": "DataCatalog",
            "name": "physionet.org"
        },
        "distribution": [
            {
                "@type": "DataDownload",
                "contentUrl": "https://physionet.org/content/adfecgdb/1.0.0/#files"
            }
        ]
    }
</script>
</body>
</html>
