<!DOCTYPE html>
<html lang="eric">
<head>
    <title>订单创建</title>
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
    <link href="http://fonts.googleapis.com/css?family=Dosis:200,300,400,500,600,700,800&subset=latin-ext" rel="stylesheet">
    <link href="http://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    <!--//fonts-->
    <style>
        body{background: url("/back_img/generate.jpg") repeat;background-size: cover;}
        #form_look{
            background: rgba(255,255,255,0.2);width:400px;
            margin:100px auto;position: absolute;margin-left: 24%;margin-top: 10%;
            border:1px solid gray;
            border-radius: 3px 3px 3px 3px;
            width: 350px;
            height: 320px;
            padding-left: 20px;
        }
        #form_submit{
            padding-left: 20px;
            border: 1px solid gray;
            border-radius: 3px 3px 3px 3px;
            background: rgba(255,255,255,0.2);width:400px;margin:100px auto;position: absolute;margin-left: 55%;margin-top: 10%;

        }
        #form_look .form-group{
            margin-top: 30px;
        }
        #form_submit .form-group{
            margin-top: 5px;
        }
        #order_type{
            width: 70px;
            margin-left: 12px;
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
    <form class="form-horizontal col-sm-offset-3 col-md-offset-3" id="form_look" >
        <h3 class="form-title">您的信息</h3>
        <div class="col-sm-9 col-md-9">
            <div class="form-group input-group">
                <span class="input-group-addon">寄件人姓名</span>
                <input class="form-control required" type="text" readonly="readonly" value="${Session.user.username}" autofocus="autofocus"/>
            </div>
            <div class="form-group input-group">
                <span class="input-group-addon">地域信息</span>
                <input class="form-control required" type="text" readonly="readonly" value="${Session.user.province+Session.user.city+Session.user.area}" />
            </div>
            <div class="form-group input-group">
                <span class="input-group-addon">地址</span>
                <input class="form-control required" type="text" readonly="readonly" value="${Session.user.address}" name="user_address"/>
            </div>
        </div>
    </form>
    <form class="form-horizontal col-sm-offset-3 col-md-offset-3" id="form_submit" action="/order/generate" method="post">
        <h3 class="form-title">收件人信息</h3>
        <div class="col-sm-9 col-md-9">
            <div class="form-group input-group">
                <span class="input-group-addon">收件人编号</span>
                <input class="form-control" type="text"   name="receiver_id" />
            </div>
            <div class="form-group input-group">
                <span class="input-group-addon">收件人姓名</span>
                <input class="form-control" type="text"   name="receiver_name" />
            </div>
            <div class="form-group input-group">
                <span class="input-group-addon">收件人电话</span>
                <input class="form-control" type="text"  name="receiver_phone" />
            </div>
            <div class="form-group input-group form-inline col-md-14">
                <span class="input-group-addon">收件人省市区</span>
                <select class="form-control col-sm-1" name="receiver_province" id="province">
                    <option>--请选择--</option>
                    <#list provinces as province>
                    <option value="${province}">${province}</option>
                </#list>
                </select>
                <select class="form-control col-sm-1" name="receiver_city" id="city">
                    <option>--请选择--</option>
                </select>
                <select class="form-control col-sm-1" name="receiver_area" id="area">
                    <option>--请选择--</option>
                </select>
            </div>
            <div class="form-group input-group">
                <span class="input-group-addon ">收件人地址</span>
                <input class="form-control" type="text"  name="receiver_address" />
            </div>
            <div class="form-group input-group">
                <span class="input-group-addon">物品名称</span>
                <input class="form-control" type="text"  name="order_name" />
            </div>
            <div class="form-group input-group">
                <#--<div class="col-md-12">-->
                <span class="input-group-addon">商品类型</span>
                    <select class="form-group col-md-4" id="order_type" name="order_type">
                        <option value="文件">文件</option>
                        <option value="包裹">包裹</option>
                        <option value="物品">物品</option>
                        <option value="易碎品">易碎品</option>
                    </select>
                <#--<input class="form-control" type="radio" value="文件" name="order_type"/>文件-->
                <#--<input class="form-control" type="radio" value="包裹" name="order_type"/>包裹-->
                <#--<input class="form-control" type="radio" value="物品" name="order_type"/>物品-->
                <#--<input class="form-control" type="radio" value="易碎品" name="order_type"/>易碎品-->
                <#--</div>-->
            </div>
                <br/>
            <div class="form-group pull-right" style="margin-top: 30px;">
                <input type="submit" class="btn btn-success pull-right" value="创建"/>
            </div>
        </div>
    </form>
</div>
</body>


<!--script-->
<script type="text/javascript" src="/js/jquery-2.1.4.min.js"></script><!-- Required-js -->
<script src="/js/bootstrap.min.js"></script><!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<!-- main slider-banner -->
<script type="text/javascript" src="/js/jquery.mkinfinite.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        $("#province").change(function () {
            $("#city").find("option").remove();
            $("#area").find("option").remove();
            var province=$(this).val();
            $.ajax({
                type:"post",
                url:"/user/show_cities",
                data:"province="+province,
                dataType:"json",
                success: function (data) {
                    // alert(data);
                    // var cities=JSON.parse(data);
                    if(data!=null){
                        $.each(data,function (i,n) {
                            $("#city").append("<option value="+n+">"+n+"</option>");
                        })

                    }
                }
            });
        });
        $("#city").change(function () {
            $("#area").find("option").remove();
            var city=$(this).val();
            $.ajax({
                type:"post",
                url:"/user/show_areas",
                data:"city="+city,
                dataType:"json",
                success: function (data) {
                    if(data!=null){
                        $.each(data,function (i,n) {
                            $("#area").append("<option value="+n+">"+n+"</option>");
                        })

                    }
                }
            })
        });

        $('.w3layouts-slider').mkinfinite({
            maxZoom:       1.4,
            animationTime: 4000,
            imagesRatio:   (960 / 720),
            isFixedBG:     true,
            zoomIn:        true,
            imagesList:    new Array(
                '/images/al.jpg',
                '/images/22.jpg',
                '/images/car.jpg',
                '/images/44.jpg',
                '/images/55.jpg'
            )
        });
    });
</script>
<!-- //main slider-banner -->
<!-- what we do hover effect -->
<script type="text/javascript" src="/js/jquery.iconmenu.js"></script>
<script type="text/javascript">
    $(function() {
        $('#sti-menu').iconmenu();
    });
</script>
<!-- //what we do hover effect -->
<!-- here stars scrolling icon -->
<script type="text/javascript">
    $(document).ready(function() {
        <#if Request["insert_result"]?exists>
        alert("${Request.insert_result}");

        </#if>
        /*
            var defaults = {
            containerID: 'toTop', // fading element id
            containerHoverID: 'toTopHover', // fading element hover id
            scrollSpeed: 1200,
            easingType: 'linear'
            };
        */

        $().UItoTop({ easingType: 'easeOutQuart' });

    });
</script>
<!-- start-smoth-scrolling -->
<script type="text/javascript" src="/js/move-top.js"></script>
<script type="text/javascript" src="/js/easing.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function($) {
        $(".scroll").click(function(event){
            event.preventDefault();
            $('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
        });
    });
</script>
</html>