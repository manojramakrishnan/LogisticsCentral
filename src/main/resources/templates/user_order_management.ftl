<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />

    <!--MAP API ADD-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
    <!--MAP API ADD-->


    <#--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
    <title>用户订单管理系统</title>
    <!-- Bootstrap Styles-->
    <link href="/assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FontAwesome Styles-->
    <link href="/assets/css/font-awesome.css" rel="stylesheet" />
    <!-- Morris Chart Styles-->

    <!-- Custom Styles-->
    <link href="/assets/css/custom-styles.css" rel="stylesheet" />
    <!-- Google Fonts-->
    <link href='/#css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <!-- TABLE STYLES-->
    <link href="/assets/js/dataTables/dataTables.bootstrap.css" rel="stylesheet" />
    <!--map api add-->
    <link rel="stylesheet" href="https://a.amap.com/jsapi_demos/static/demo-center/css/demo-center.css" />
    <script src="https://webapi.amap.com/maps?v=1.4.14&key=4285d59da09ed5178e984a4655aed807&plugin=AMap.TruckDriving"></script>
    <script src="https://a.amap.com/jsapi_demos/static/demo-center/js/demoutils.js"></script>
    <style>
        #container {
            width: 600px;
            height: 500px;
            float: left;
        }
        #query_area{
            margin-left: 20px;
            height: 500px;
            border: 1px solid #23527c;
            border-radius: 3px 3px 3px 3px;
            background-color: #1b6d85;
        }
        #query_area .input-group{
            margin-top: 20px;

        }
        h2{
            margin-left: 15%;
            color: white;
            margin-bottom: 30px;
        }
        #query_btn{
            border-radius: 0px 0px 0px 0px;

        }
        </style>
    <!--map api add-->

</head>
<body>
<div id="wrapper">
    <nav class="navbar navbar-default top-navbar" role="navigation">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/user/mainpage">速通</a>
        </div>

        <ul class="nav navbar-top-links navbar-right">
            <!-- /.dropdown -->
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                    <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="#"><i class="fa fa-user fa-fw"></i><#if Session["user"]?exists>${Session.user.username}</#if></a>
                    </li>
                    <li class="divider"></li>
                    <li><a href="/user/log_out"><i class="fa fa-sign-out fa-fw"></i>退出</a>
                    </li>
                </ul>
                <!-- /.dropdown-user -->
            </li>
            <!-- /.dropdown -->
        </ul>
    </nav>
    <!--/. NAV TOP  -->
    <nav class="navbar-default navbar-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="main-menu">

                <li class="nav1">
                    <a href=# id="nav1" class="active-menu"><i class="fa fa-dashboard"></i> 历史订单</a>
                </li>
                <li class="nav1">
                    <a href=# id="nav1" ><i class="fa fa-tablet"></i>收件(运送中)</a>
                </li>
                <li class="nav1">
                    <a href=# id="nav1" ><i class="fa fa-bar-chart-o"></i>寄出订单</a>
                </li>
                <li class="nav2">
                    <a href=# id="nav2" ><i class="fa fa-map-marker"></i>实时物流显示</a>
                </li>


            </ul>

        </div>

    </nav>
    <!-- /. NAV SIDE  -->
    <div id="page-wrapper">
        <div id="page-inner" >
            <div class="row">
                <div class="col-md-12">
                    <h1 class="page-header">
                        欢迎来到订单管理界面 <small>方便的订单管理页面</small>
                    </h1>
                </div>
            </div>
            <!-- /. ROW  -->

            <div class="row" >
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default order_table"  id="finished_order_table" >
                        <div class="panel-heading">
                            历史订单
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                    <tr>
                                        <th>订单No.</th>
                                        <th>订单名称</th>
                                        <th>配送区间</th>
                                        <th>订单状态</th>
                                        <th>时间信息</th>
                                        <th>配送信息</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <#if finished_orders?exists>
                                    <#list finished_orders as fo>
                                    <#--class="odd gradeX"-->

                                        <tr >
                                            <td>${fo.order_id?c}</td>
                                            <td>${fo.order_name}</td>
                                            <td>${fo.sender_province+fo.sender_city}<span class="fa fa-arrow-right"></span>${fo.receiver_province+fo.receiver_city}</td>
                                            <td class="center">${fo.status}</td>
                                            <td class="center">${fo.initial_time+" 经过"+fo.live_time}</td>
                                            <td class="center">${fo.trans_info}</td>
                                        </tr>
                                    </#list>
                                    </#if>
                                    </tbody>
                                </table>
                            </div>

                        </div>
                    </div>
                    <!--End Advanced Tables -->
                    <!--  finished_order_table -->
                    <div class="panel panel-default order_table" id="ing_order_table" style="display: none;">
                        <div class="panel-heading">
                            进行中订单
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                    <tr>
                                        <th>订单No.</th>
                                        <th>订单名称</th>
                                        <th>发货地</th>
                                        <th>订单状态</th>
                                        <th>时间信息</th>
                                        <th>配送信息</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <#if ing_orders?exists>
                                    <#list  ing_orders as io>
                                    <#--class="odd gradeX"-->
                                        <tr >
                                            <td>${io.order_id?c}</td>
                                            <td>${io.order_name}</td>
                                            <td>${io.sender_province+io.sender_city}</td>
                                            <td>${io.status}</td>
                                            <td>${io.initial_time+" 经过"+io.live_time}</td>
                                            <td>${io.trans_info}</td>
                                        </tr>
                                    </#list>
                                    </#if>

                                    </tbody>
                                </table>
                            </div>

                        </div>
                    </div>
                    <!--End finished_order_table -->
                    <!--SENDING ORDER-->
                    <div class="panel panel-default order_table" id="sending_order_table" style="display: none;">
                        <div class="panel-heading">
                           寄出订单
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                    <tr>
                                        <th>订单No.</th>
                                        <th>订单名称</th>
                                        <th>目的地</th>
                                        <th>订单状态</th>
                                        <th>时间信息</th>
                                        <th>配送信息</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <#if sending_orders?exists>
                                    <#list  sending_orders as so>
                                    <#--class="odd gradeX"-->
                                        <tr >
                                            <td>${so.order_id?c}</td>
                                            <td>${so.order_name}</td>
                                            <td>${so.receiver_province+so.receiver_city}</td>
                                            <td>${so.status}</td>
                                            <td>${so.initial_time+" 经过"+so.live_time}</td>
                                            <td>${so.trans_info}</td>
                                        </tr>
                                    </#list>
                                    </#if>

                                    </tbody>
                                </table>
                            </div>

                        </div>
                    </div>
                    <!--SENDING ORDER-->


                </div>
            </div>



        </div>

    <div class="col-md-12">

            <div id="container" ></div>
        <div id="query_area" class="col-md-4">
            <h2>物流位置查询</h2>
            <div class="input-group">
                <input type="text" class="form-control" id="order_text" placeholder="请输入您的订单号" />
                    <span class="input-group-btn">
                    <button class="btn btn-lg btn-success" id="query_btn" type="button">查询</button>
                    </span>
            </div>



            <div class="input-group">
                <span class="input-group-addon">发货地</span>
                <input type="text" id="start_place" class="form-control" readonly="readonly" placeholder="请先行输入订单号"/>
            </div>
            <div class="input-group">
                <span class="input-group-addon">目的地</span>
                <input type="text" id="end_place" class="form-control" readonly="readonly" placeholder="请先行输入订单号"/>
            </div>
            <div class="input-group">
                <span class="input-group-addon">物流状况</span>
                <input type="text" class="form-control" readonly="readonly" id="trans_infor"/>
            </div>
        </div>
    </div>

        <!-- /. ROW  page-inner-->


    </div>
    <!-- /. ROW  -->
</div >
<footer class="center-block"><p>Copyright &copy; 2016.Company name All rights reserved.<a target="_blank" href="http://guantaow.taobao.com/">速通公司</a></p></footer>

<!-- /. PAGE INNER  -->
<!--</div>-->
<!-- /. PAGE WRAPPER  -->
<!-- /. WRAPPER  -->
<!-- JS Scripts-->
<!-- jQuery Js -->
<script src="/js/jquery-2.1.4.min.js"></script>
<!-- Bootstrap Js -->
<script src="/assets/js/bootstrap.min.js"></script>
<!-- Metis Menu Js -->
<script src="/assets/js/jquery.metisMenu.js"></script>
<!-- DATA TABLE SCRIPTS -->
<script src="/assets/js/dataTables/jquery.dataTables.js"></script>
<script src="/assets/js/dataTables/dataTables.bootstrap.js"></script>
<script>
    $(document).ready(function () {
        $('#dataTables-example').dataTable();
        $("#container").hide();// 等待学改成#container
        $(".nav1").click(function () {
            $("#container").hide();
            $("#page-inner").show();
            $(".nav1 a").removeClass("active-menu");
            $(".nav2 a").removeClass("active-menu");
            $(this).children("a").addClass("active-menu");
            var index=$(this).index();
             // alert("index:"+index);
            $(".order_table").css("display","none");
            $(".order_table").eq(index).css("display","block");
        });
        $(".nav2").click(function () {
            $(".nav1 a").removeClass("active-menu");
            $(".nav2 a").addClass("active-menu");
            $("#page-inner").hide();
             $("#container").show();
        });
        var map = new AMap.Map("container", {
            center: [116.397559, 39.89621],
            zoom: 14
        });
        var truckDriving;
        var path;
        var startMarker;
        var endMarker;
        var routeLine;

        $("#query_btn").click(function () {
            var order_id=$("#order_text").val();
            $.ajax({
                type:"post",
                url:"/user/order_query",
                data:"order_id="+order_id,
                dataType:"json",
                success: function (order) {
                    // map.clearMap();
                    // map = new AMap.Map("container", {
                    //     center: [116.397559, 39.89621],
                    //     zoom: 14
                    // });
                    $("#start_place").val(order.sender_province+order.sender_city+order.sender_area);
                    $("#end_place").val(order.receiver_province+order.receiver_city+order.receiver_area);
                    $("#trans_infor").val(order.trans_info);
                    if(truckDriving){
                        // truckDriving.clear();
                        map.remove(truckDriving);
                    }
                    if(routeLine){
                        map.remove(startMarker);
                        map.remove(endMarker);
                        map.remove(routeLine);
                    }


                     truckDriving = new AMap.TruckDriving({
                        policy: 0, // 规划策略
                        size: 1, // 车型大小
                        width: 2.5, // 宽度
                        height: 2, // 高度
                        load: 1, // 载重
                        weight: 12, // 自重
                        axlesNum: 2, // 轴数
                        province: '京', // 车辆牌照省份
                    })

                     path = [
                        {keyword:order.sender_area,city:order.sender_city},//起点
                        // {keyword:'北京西站',city:'010'},//途径
                        {keyword:order.receiver_area,city:order.receiver_city}//终点
                    ];
                    //经纬度版本
                    // var path = [];
                    // path.push({lnglat:[116.303843, 39.983412]});//起点
                    // path.push({lnglat:[116.321354, 39.896436]});//途径
                    // path.push({lnglat:[116.407012, 39.992093]});//终点

                    truckDriving.search(path, function(status, result) {
                        // result即是对应的货车导航信息，相关数据结构文档请参考 https://lbs.amap.com/api/javascript-api/reference/route-search#m_DrivingResult
                        if (status === 'complete') {
                            log.success('绘制货车路线完成');

                            if (result.routes && result.routes.length) {
                                drawRoute(result.routes[0]);
                            }
                        } else {
                            log.error('获取货车规划数据失败：' + result);
                        }
                    })

                    function drawRoute (route) {
                        var path = parseRouteToPath(route);

                         startMarker = new AMap.Marker({
                            position: path[0],
                            icon: 'https://webapi.amap.com/theme/v1.3/markers/n/start.png',
                            map: map
                        })

                         endMarker = new AMap.Marker({
                            position: path[path.length - 1],
                            icon: 'https://webapi.amap.com/theme/v1.3/markers/n/end.png',
                            map: map
                        })

                         routeLine = new AMap.Polyline({
                            path: path,
                            isOutline: true,
                            outlineColor: '#ffeeee',
                            borderWeight: 2,
                            strokeWeight: 5,
                            strokeColor: '#0091ff',
                            lineJoin: 'round'
                        })

                        routeLine.setMap(map);

                        // 调整视野达到最佳显示区域
                        map.setFitView([ startMarker, endMarker, routeLine ]);
                    }

                    // 解析DrivingRoute对象，构造成AMap.Polyline的path参数需要的格式
                    // DrivingResult对象结构参考文档 https://lbs.amap.com/api/javascript-api/reference/route-search#m_DriveRoute
                    function parseRouteToPath(route) {
                        var path = [];

                        for (var i = 0, l = route.steps.length; i < l; i++) {
                            var step = route.steps[i];

                            for (var j = 0, n = step.path.length; j < n; j++) {
                                path.push(step.path[j]);
                            }
                        }

                        return path;
                    }
                }
            })
        });
    });
</script>
<!-- Custom Js -->
<#--<script src="/assets/js/custom-scripts.js"></script>-->

<!--map api-->
<script type="text/javascript">

    //
    // var truckDriving = new AMap.TruckDriving({
    //     policy: 0, // 规划策略
    //     size: 1, // 车型大小
    //     width: 2.5, // 宽度
    //     height: 2, // 高度
    //     load: 1, // 载重
    //     weight: 12, // 自重
    //     axlesNum: 2, // 轴数
    //     province: '京', // 车辆牌照省份
    // })
    //
    // var path = [
    //     {keyword:'复旦大学',city:'上海'},//起点
    //     // {keyword:'北京西站',city:'010'},//途径
    //     {keyword:'北京大学',city:'北京'}//终点
    // ];
    // //经纬度版本
    // // var path = [];
    // // path.push({lnglat:[116.303843, 39.983412]});//起点
    // // path.push({lnglat:[116.321354, 39.896436]});//途径
    // // path.push({lnglat:[116.407012, 39.992093]});//终点
    //
    // truckDriving.search(path, function(status, result) {
    //     // result即是对应的货车导航信息，相关数据结构文档请参考 https://lbs.amap.com/api/javascript-api/reference/route-search#m_DrivingResult
    //     if (status === 'complete') {
    //         log.success('绘制货车路线完成');
    //
    //         if (result.routes && result.routes.length) {
    //             drawRoute(result.routes[0]);
    //         }
    //     } else {
    //         log.error('获取货车规划数据失败：' + result);
    //     }
    // })
    //
    // function drawRoute (route) {
    //     var path = parseRouteToPath(route);
    //
    //     var startMarker = new AMap.Marker({
    //         position: path[0],
    //         icon: 'https://webapi.amap.com/theme/v1.3/markers/n/start.png',
    //         map: map
    //     })
    //
    //     var endMarker = new AMap.Marker({
    //         position: path[path.length - 1],
    //         icon: 'https://webapi.amap.com/theme/v1.3/markers/n/end.png',
    //         map: map
    //     })
    //
    //     var routeLine = new AMap.Polyline({
    //         path: path,
    //         isOutline: true,
    //         outlineColor: '#ffeeee',
    //         borderWeight: 2,
    //         strokeWeight: 5,
    //         strokeColor: '#0091ff',
    //         lineJoin: 'round'
    //     })
    //
    //     routeLine.setMap(map);
    //
    //     // 调整视野达到最佳显示区域
    //     map.setFitView([ startMarker, endMarker, routeLine ]);
    // }
    //
    // // 解析DrivingRoute对象，构造成AMap.Polyline的path参数需要的格式
    // // DrivingResult对象结构参考文档 https://lbs.amap.com/api/javascript-api/reference/route-search#m_DriveRoute
    // function parseRouteToPath(route) {
    //     var path = [];
    //
    //     for (var i = 0, l = route.steps.length; i < l; i++) {
    //         var step = route.steps[i];
    //
    //         for (var j = 0, n = step.path.length; j < n; j++) {
    //             path.push(step.path[j]);
    //         }
    //     }
    //
    //     return path;
    // }
</script>
<!--map api-->



</body>
</html>
