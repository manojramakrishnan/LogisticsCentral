<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />

    <!--MAP API ADD-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
    <!--MAP API ADD-->


    <#--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
    <title>User order management system</title>
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
            <a class="navbar-brand" href="/user/mainpage">Speed pass</a>
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
                    <li><a href="/user/log_out"><i class="fa fa-sign-out fa-fw"></i>quit</a>
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
                    <a href=# id="nav1" class="active-menu"><i class="fa fa-dashboard"></i> Historical orders</a>
                </li>
                <li class="nav1">
                    <a href=# id="nav1" ><i class="fa fa-tablet"></i>Receiving (in transit)</a>
                </li>
                <li class="nav1">
                    <a href=# id="nav1" ><i class="fa fa-bar-chart-o"></i>Send order</a>
                </li>
                <li class="nav2">
                    <a href=# id="nav2" ><i class="fa fa-map-marker"></i>Real-time logistics display</a>
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
                       Welcome to the order management interface <small>Convenient order management page</small>
                    </h1>
                </div>
            </div>
            <!-- /. ROW  -->

            <div class="row" >
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default order_table"  id="finished_order_table" >
                        <div class="panel-heading">
                            Historical orders
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                    <tr>
                                        <th>Order No.</th>
                                         <th>Order name</th>
                                         <th>Delivery area</th>
                                         <th>Order status</th>
                                         <th>Time information</th>
                                         <th>Delivery information</th>                                    
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
                                            <td class="center">${fo.initial_time+" go through"+fo.live_time}</td>
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
                            Order in progress
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                    <tr>
                                        <th>Order No.</th>
                                         <th>Order name</th>
                                         <th>Shipment place</th>
                                         <th>Order status</th>
                                         <th>Time information</th>
                                         <th>Delivery information</th>
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
                                            <td>${io.initial_time+" go through"+io.live_time}</td>
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
                           Send order
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                    <tr>
                                        <th>Order No.</th>
                                         <th>Order name</th>
                                         <th>Destination</th>
                                         <th>Order status</th>
                                         <th>Time information</th>
                                         <th>Delivery information</th>
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
                                            <td>${so.initial_time+" go through"+so.live_time}</td>
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
            <h2>Logistics location query</h2>
            <div class="input-group">
                <input type="text" class="form-control" id="order_text" placeholder="Please enter your order number" />
                    <span class="input-group-btn">
                    <button class="btn btn-lg btn-success" id="query_btn" type="button">Inquire</button>
                    </span>
            </div>



            <div class="input-group">
                <span class="input-group-addon">Delivery place</span>
                <input type="text" id="start_place" class="form-control" readonly="readonly" placeholder="Please enter the order number first"/>
            </div>
            <div class="input-group">
                <span class="input-group-addon">destination</span>
                <input type="text" id="end_place" class="form-control" readonly="readonly" placeholder="Please enter the order number first"/>
            </div>
            <div class="input-group">
                <span class="input-group-addon">Logistics status</span>
                <input type="text" class="form-control" readonly="readonly" id="trans_infor"/>
            </div>
        </div>
    </div>

        <!-- /. ROW  page-inner-->


    </div>
    <!-- /. ROW  -->
</div >
<footer class="center-block"><p>Copyright &copy; 2016.Company name All rights reserved.<a target="_blank" href="http://guantaow.taobao.com/">Speed co., ltd.</a></p></footer>

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
        $("#container").hide();// Waiting to learn#container
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
                       policy: 0, // Planning strategy
                         size: 1, // model size
                         width: 2.5, // width
                         height: 2, // height
                         load: 1, // load
                         weight: 12, // self weight
                         axlesNum: 2, // number of axles
                         province:'Beijing', // province of vehicle license plate
                    })

                     path = [
                        {keyword:order.sender_area,city:order.sender_city},//starting point
                        // {keyword:'Beijing West Railway Station',city:'010'},//way
                        {keyword:order.receiver_area,city:order.receiver_city}//end
                    ];
                    //Latitude and longitude version
                    // var path = [];
                    // path.push({lnglat:[116.303843, 39.983412]});//starting point
                    // path.push({lnglat:[116.321354, 39.896436]});//way
                    // path.push({lnglat:[116.407012, 39.992093]});//end

                    truckDriving.search(path, function(status, result) {
                        // resultThat is the corresponding truck navigation information, please refer to the relevant data structure documents https://lbs.amap.com/api/javascript-api/reference/route-search#m_DrivingResult
                        if (status === 'complete') {
                            log.success('Draw the truck route completed');

                            if (result.routes && result.routes.length) {
                                drawRoute(result.routes[0]);
                            }
                        } else {
                            log.error('Failed to obtain truck planning data：' + result);
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

                        // Adjust the field of view to achieve the best display area
                        map.setFitView([ startMarker, endMarker, routeLine ]);
                    }

                    // Parse the DrivingRoute object and construct it into the format required by the path parameter of AMap.Polyline
                    // DrivingResultObject structure reference document https://lbs.amap.com/api/javascript-api/reference/route-search#m_DriveRoute
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
    //     policy: 0, // Planning strategy
     // size: 1, // model size
     // width: 2.5, // width
     // height: 2, // height
     // load: 1, // load
     // weight: 12, // self weight
     // axlesNum: 2, // number of axles
     // province:'京', // province of vehicle license plate
    // })
    //
    // var path = [
    //     {keyword:'Fudan University', city:'Shanghai'},//Starting point
     // // {keyword:'Beijing West Railway Station',city:'010'},//way
     // {keyword:'Peking University',city:'Beijing'}//End
    // ];
    // //Latitude and longitude version
    // // var path = [];
    // // path.push({lnglat:[116.303843, 39.983412]});//starting point
    // // path.push({lnglat:[116.321354, 39.896436]});//way
    // // path.push({lnglat:[116.407012, 39.992093]});//end
    //
    // truckDriving.search(path, function(status, result) {
    //     // Result is the corresponding truck navigation information, please refer to related data structure documents https://lbs.amap.com/api/javascript-api/reference/route-search#m_DrivingResult
    //     if (status === 'complete') {
    //         log.success('Draw the truck route completed');
    //
    //         if (result.routes && result.routes.length) {
    //             drawRoute(result.routes[0]);
    //         }
    //     } else {
    //         log.error('Failed to obtain truck planning data：' + result);
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
    //     // Adjust the field of view to achieve the best display area
    //     map.setFitView([ startMarker, endMarker, routeLine ]);
    // }
    //
    // // Parse the DrivingRoute object and construct it into the format required by the path parameter of AMap.Polyline
    // // DrivingResultObject structure reference document https://lbs.amap.com/api/javascript-api/reference/route-search#m_DriveRoute
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