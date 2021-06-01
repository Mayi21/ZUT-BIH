<%--
  Created by IntelliJ IDEA.
  User: HomieJ
  Date: 2021/5/14
  Time: 14:43
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


    <link rel="stylesheet" type="text/css" href="/static/static/custom/css/home.css">
    <link rel="alternate" type="application/rss+xml" title="PhysioNet News" href="/feed.xml">

    <script src="https://cdn.staticfile.org/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
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
    <div class="main">
        <div class="row">
            <div class="main-side">
                <div class="card">
                    <h2 class="card-header">关于网站</h2>
                    <div class="card-body">
                        <ul style="list-style: none">
                            <li><a href="#resource">中原心电数据库:网站简介</a></li>
                            <li><a href="#resource2">资源引用</a></li>
                            <li><a href="#resource3">网站背景</a></li>
                            <li><a href="#resource4">关于心电图诊断</a></li>
                            <li><a href="#resource5">关于中国心电图数据库</a></li>

                        </ul>
                    </div>
                </div>
            </div>
            <div class="main-content">
                <div>
                    <section id="resource">
                        <h1>中原心电数据库:网站简介</h1>
                        <div class="indented-box">
                            <p>郑州大学互联网医疗协同创新中心一直在做通过心电图进行智能诊断的研究。去年以来，我校与郑州大学合作开发该系统中心电图专家标注的工具和管理系统。目前已经在试用中。该标注系统输出结果是经标注过的心电数据库。为了更有效地利用这个数据库，为进行心电研究或者人工智能研究者服务，我们考虑建设功能更强大的中原心电数据库，并配套一个供有关研究人员访问的、利用的心电数据库应用网站。该网站可以供普通访问者不经注册进行简单浏览，为一般注册用户提供免费的有限的资源访问，。同时，网站还提供一套支持用户利用网站数据进行软件开发的开发工具包，工具支持用户编程对数据进行访问、分析等。</p>
                        </div>
                    </section>
                    <br>
                    <section id="resource2">
                        <h1>资源引用</h1>
                        <div class="indented-box">
                            <p>如果您在出版物中使用中原心电数据库系统提供的数据或软件，请在引用时注明作者。您可以在项目页面上找到作者的姓名，在许多情况下，还可以找到他们介绍数据或软件的出版物。如果您不确定如何引用一个特定的项目，请询问我们！。还请包括中原心电数据库网站系统的标准引文：</p>
                        </div>
                    </section>
                    <br>
                    <section id="resource3">
                        <h1>网站背景</h1>
                        <div class="indented-box">
                            <p>心电数据库是研究心脏病、心电图诊断方法和诊断标准的重要工具，是心电分析自动化的基础。由于数据库中所包含的数据一般都是花费一定的人力物力来采集，因此心电数据库是一种宝贵的资源。心电数据库的开发实际上是一种循证医学研究模式。心电数据库中存储的数据包括心电波形数据、测量参数、心电分类、患者信息等。所选心电数据一般由临床资料或权威专家进行验证。根据不同的应用方向，每个数据库的数据选择标准也不同。
                                在这个竞争激增的社会中,人们关于身体健康越来越重视,心电图就是一个对身体健康素质的重大的检查手段,但是对于看心电图仅仅只是医生的技能,对于这个科技迅速发展的时代,人工智能渐渐在人们的生活中显现出来,但对于开发人员来说,如果需要对数据模型进行训练则需要的大量的数据,数据来源则是一个重要的内容。心电数据库可以为研究人员提供重要的数据来源。</p>
                        </div>
                    </section>
                    <br>
                    <section id="resource4">
                        <h1>关于心电图诊断</h1>
                        <div class="indented-box">
                            <p>心电图主要是通过心电图机来记录心脏生理心电活动的临床检查方式，在病房最常见的就是单导联监护心电图，在门诊上最常做的就是12通道心电图。它的检查方式有很多种，比如负荷心电图，包括运动负荷心电图和药物负荷心电图；还有动态心电图，有24小时的，48小时的，还有72小时的。另外，还有食管内心电图、心腔内心电图检查等等。诊断依据，主要就是通过心电图采集过程中生成的14个数据。这14个数据主要的记录就是心电图的波形运行的时间、电压振幅大小以及运行的方向等等。诊断的疾病最确切的那就是心律失常，还可以对许多疾病提供诊断线索，比如小儿的心肌炎型、先天性心脏病，青少年时期的这种植物神经功能紊乱引起的功能生理性的改变。还有甲亢引起的甲亢性心脏病，比如房颤等。心肌缺血、缺氧，引起的各种冠心病、急性心梗，持续的慢性的心脏心肌缺血等等。高血压引起的高血压心脏病等可以提供一定的线索；肾脏疾病方面的离子改变，比如高血钾、低血钾的心电图上都有一定体现。肺心病，比如慢性气管炎后期引起的心脏病，都可以提供一定的线索。尤其需要注意就是在岁数增长的过程中，随着逐渐变老，传导束也是逐渐的老化，出现心律失常的几率就增多了。比如最常见的是心律失常，室性期前收缩，也就是室性早搏。另外还有房颤，我们必须关注房颤。房颤在75岁的时候达到高峰，房颤后果是比较可怕的，比如能够形成血栓。如果栓在脑子就形成脑血栓；如果栓的心脏就形成了心脏卒中。另外还有先天性的疾病，比如BRUGARDA征或者先天性右心室肌发育不全。</p>
                        </div>
                    </section>
                    <br>
                    <section id="resource5">
                        <h1>关于中国心电图数据库</h1>
                        <div class="indented-box">
                            <p>心脏病一直是威胁人类生命安全的主要疾病，其发病率和死亡率一直处于较高水平。目前，世界各国都采用采集心电图的方法来研究和预防心脏病。心电图是监测人类心脏活动和诊断心血管疾病的主要工具。它在心脏病的检测中起着非常重要的作用。对于心脏病患者，医生首选心电图检查方法，因为心电图记录了心脏的电生理活动信息，能反映心脏的工作状态和状态，为心脏病的诊断提供了主要依据，具有无损检测的特点。
                                山东医科大学开发了sdmu心律失常心电图数据库，从1500例患者中筛选出150例双通道心律失常心电图记录。中国科学院和北京协和医学院在大规模人群调查的基础上联合建立了心电图数据库，共有2万多个样本。数据库主要存储10秒12导联心电图，包含人员信息、健康状况、测量数据和诊断结果。该数据库为我国心电图学研究提供了丰富的资源，对我国正常人心电图特征的研究具有重要意义。 心电数据库的主要用途有：
                                <br>(1)在从事心电学习时，有必要对大量的心电信号进行分析和研究，为心电教学提供基础资料。ECG数据库可以提供这样的学习资源。。
                                <br>(2)通过对正常人和各种疾病的心电图进行比较，可以发现正常心电图参数范围。这些参数有助于心电图的诊断。在分析心电图时，可以根据这些参数判断心电图是否正常。
                                <br>(3)通过对部分心血管疾病心电图表现的分析，探讨心电图诊断标准，总结出部分心血管疾病的心电图特征。根据这些特点，可以建立一些心血管疾病的心电图诊断标准
                                <br>(4)作为心电图自动分析仪或软件的性能评价标准。心电分析的自动化是心电分析领域的发展趋势。心电信号的检测与分析技术多种多样，如人工神经网络、小波变换等。在这种情况下，如何检测和评价自动心电分析仪或软件就成为了一个关键问题。目前市场上普遍采用国际权威的心电图数据库作为评价标准。开发的心电自动分析设备和软件必须通过权威心电数据库的验证才能被识别。
                                在构建心电数据库时，需要根据数据库的具体应用方向选择不同的数据源，存储不同类型的心电数据，并确定数据库的存储级别。根据数据存储的大小，选择不同的数据库开发工具。例如，如果数据库只需要存储少量的心电数据，可以使用access数据库。
                                对于临床医学研究中使用的ECG数据库，如研究和探讨一些ECG参数（如心室率、PR间期、QR间期等）的应用价值，或建立一些心脏病（如心动过速、心肌梗死、心室肥大等）的ECG诊断标准，预激综合征等，它应该包括一定数量的特定疾病的心电图样本，每一个心电图都应该包括明确的临床诊断证据和测量参数。另外，心电图条件复杂，包括多种疾病同时出现，如窦性心动过速、左室高压伴房性早搏、陈旧性前臂心肌梗死伴T波改变、下臂及前臂心肌梗死伴完全性右束支传导阻滞等，这种数据库能够客观地反映某一疾病或不同疾病的心电图特征，研究者可以利用这种数据库来研究心电图所提供的信息与某一疾病之间的关系。</p>
                        </div>
                    </section>
                    <br>
                </div>
            </div>
        </div>
    </div>
</main>
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
<script src="/static/static/bootstrap/js/bootstrap.min.js"></script>
<script src="/static/static/bootstrap/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
