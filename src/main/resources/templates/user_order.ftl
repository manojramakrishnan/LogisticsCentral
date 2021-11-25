<!DOCTYPE html>
<html lang="eric">
<head>
    <title>订单查询</title>
    <link href="/css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all" /><!-- fontawesome css -->
    <link href="/css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all" /><!-- Bootstrap stylesheet -->
    <link href="/css/style.css" rel="stylesheet" type="text/css" media="all" /><!-- stylesheet -->
    <!-- meta tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Interiors Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- //meta tags -->
    <!--fonts-->
    <link href="/assets/js/dataTables/dataTables.bootstrap.css" rel="stylesheet" />
    <link href="http://fonts.googleapis.com/css?family=Dosis:200,300,400,500,600,700,800&subset=latin-ext" rel="stylesheet">
    <link href="http://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    <!--//fonts-->
    <style>
        body{background: url("/back_img/query.jpg") repeat;background-size: cover;}
        #query_div{
            margin-top: 10%;
            margin-left: 35%;
        }
        .col-md-12{
            margin-top: 30px;
            margin-left: 20px;
            display: none;
        }
        </style>
</head>
<body>
<!-- header -->
<header>
    <div class="container">
        <!-- nav -->
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <div class="logo">
                        <h1><a href="/user/mainpage">速通</a></h1>
                    </div>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li><a href="/user/mainpage">主页</a></li>
                        <li><a href="about.html">关于我们</a></li>
                        <#--<li><a href="gallery.html">公司故事</a></li>-->
                        <li class="dropdown">
                            <#if Session["user"]?exists> <a>${Session.user.username}</a></#if>
                        <ul class="dropdown-menu">
                            <#if Session["user"]?exists>
                            <li><a href="/user/log_out"><span class="glyphicon glyphicon-star">注销</a></li>
                            </#if>
                        </ul>
                        </li>
                        <#--<li><a href="blog.html">Blog</a></li>-->
                        <#--<li><a href="contact.html">Contact</a></li>-->
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container-fluid -->
        </nav>
        <!-- //nav -->
    </div>
</header>
<!-- //header -->
<div class="container-fluid form-inline">

                <div class="col-md-5 input-group" id="query_div">
                <span class="input-group-addon">订单编号</span>
                <input class="form-control" type="text" placeholder="请输入您的订单编号"  id="order_id" name="order_id"/>
                 <span class="input-group-btn">
                     <button class="btn btn-info" type="button" id="query">查询</button>
                 </span>
                </div>
    <div class="col-md-12">
        <table class="table table-striped table-bordered table-hover" id="dataTables-example">
            <thead>
            <tr>
                <th>订单No.</th>
                <th>订单名称</th>
                <th>配送区间</th>
                <th>寄件人姓名</th>
                <th>寄件人手机号</th>
                <th>收件人姓名</th>
                <th>收件人手机号</th>
                <th>订单状态</th>
                <th>时间信息</th>
                <#--<th>配送信息</th>-->
            </tr>
            </thead>
            <tbody>
            <tr>

            </tr>
            </tbody>
        </table>
        <div class="col-lg-6 input-group center-block">
        <span id="trans_span" class="input-group-addon">运输信息:</span>
            <input class="form-control" readonly="readonly" type="text" id="transInfos" />
            <#--<input type="hidden" id="arrow" value="">-->
        </div>

    </div>

</div>
</body>


<!--script-->
<script type="text/javascript" src="/js/jquery-2.1.4.min.js"></script><!-- Required-js -->
<script src="/js/bootstrap.min.js"></script><!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<!-- main slider-banner -->
<script type="text/javascript" src="/js/jquery.mkinfinite.js"></script>
<script type="text/javascript">
</script>
<!-- //main slider-banner -->
<!-- what we do hover effect -->
<script type="text/javascript" src="/js/jquery.iconmenu.js"></script>
<script type="text/javascript">
    $(function() {
        $('#sti-menu').iconmenu();
        $("#query").click(function () {
            var order_id=$("#order_id").val();
            $(".col-md-12").css("display","none");
            $.ajax({
                type:"post",
                url:"/user/order_query",
                data:"order_id="+order_id,
                dataType:"json",
                success: function (order) {
                    $("#dataTables-example tbody tr td").remove();
                    $(".col-md-12").css("display","block");
                  $("#dataTables-example tbody tr").append(
                      "<td>"+order.order_id+"</td><td>"
                      +order.order_name+"</td><td>"+order.sender_province+order.sender_city+"<span class='glyphicon glyphicon-arrow-right'>"+order.receiver_province+order.receiver_city
                      +"</td><td>"+order.sender_name+"</td><td>"+order.sender_phone
                      +"</td><td>"+order.receiver_name+"</td><td>"+order.receiver_phone
                      +"</td><td>"+order.status+"</td><td>"+order.initial_time+" 时长："+order.live_time+"</td>");
                      <#--+-->
                      <#--<#list order.trans_info?split(",") as singleInfo>-->
                      <#--singleInfo+"<span class='glyphicon glyphicon-arrow-right'>"-->
                          <#--</#list>-->

                      <#--+"</td>");-->
                    var arr=new Array();
                    arr=order.trans_info.split("，");
                    // $("#trans_span").append(
                    //     " <input class='form-control' readonly='readonly' type='text' id='transInfos' value='"+"/>"
                    // )
                    //
                    var retrans="";
                    for(var i=0;i<arr.length;i++){
                        if(i==arr.length-1){
                            retrans=retrans+arr[i];
                            // $("#transInfos").val(retrans);
                            // $("#transInfos").html("<span class='glyphicon glyphicon-arrow-right' />");
                            //     retrans=$("#transInfos").val();
                        }else {
                            retrans = retrans + arr[i] + " -> ";
                            // retrans = retrans + arr[i] + "<span class='glyphicon glyphicon-arrow-right' />";
                        }
                    }
                    // retrans.replace(/[<>&"]/g,function(c){return {'<':'&lt;','>':'&gt;','&':'&amp;','"':'&quot;'}[c];});
                // <span class='glyphicon glyphicon-arrow-right' />

                    $("#transInfos").val(retrans);

                    // alert($("#arrow").text());
                    // var arr=order.trans_info.split(",");
                    // $.each(arr,function (index,i) {
                    //         $("#transInfos").val(i+"<span class='glyphicon glyphicon-arrow-right'>");


                    //
                    // })


                    <#--$("#transInfos").val(<#list order.trans_info?split(",") as singleInfo>-->
                        <#--<#if !singleInfo_has_next>-->
                        <#--singleInfo-->
                    <#--<#else>-->
                    <#--singleInfo+"<span class='glyphicon glyphicon-arrow-right'>"-->
                    <#--</#if>-->
                    <#--</#list>);-->
                }
            });


        });
    });
</script>
<!-- //what we do hover effect -->
<!-- here stars scrolling icon -->
<script type="text/javascript">
    $(document).ready(function() {



        $().UItoTop({ easingType: 'easeOutQuart' });

    });
</script>
<!-- start-smoth-scrolling -->
<script type="text/javascript" src="/js/move-top.js"></script>
<script type="text/javascript" src="/js/easing.js"></script>
<script type="text/javascript">

</script>
</html>