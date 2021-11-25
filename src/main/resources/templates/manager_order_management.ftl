<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>管理员管理界面</title>
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
            <a class="navbar-brand" href=#>速通</a>
        </div>

        <ul class="nav navbar-top-links navbar-right">
            <!-- /.dropdown -->
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                    <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="#"><i class="fa fa-user fa-fw"></i><#if Session["manager"]?exists>${Session.manager.manager_name}</#if></a>
                    </li>
                    <#--<li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>-->
                    <#--</li>-->
                    <li class="divider"></li>
                    <li><a href="/manager/log_out"><i class="fa fa-sign-out fa-fw"></i>退出</a>
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
                    <a href=# id="nav1" ><i class="fa fa-desktop"></i> 待审核订单</a>
                </li>
                <li class="nav1">
                    <a href=# id="nav1" ><i class="fa fa-tablet"></i> 进行中订单</a>
                </li>
                <li class="nav1">
                    <a href=# id="nav1" ><i class="fa fa-bar-chart-o"></i> 本月财务状况</a>
                </li>


                <#--<li>-->
                    <#--<a href=# id="nav1" ><i class="fa fa-sitemap"></i> Multi-Level Dropdown<span class="fa arrow"></span></a>-->
                    <#--<ul class="nav nav-second-level">-->
                        <#--<li>-->
                            <#--<a href="#">Second Level Link</a>-->
                        <#--</li>-->
                        <#--<li>-->
                            <#--<a href="#">Second Level Link</a>-->
                        <#--</li>-->
                        <#--<li>-->
                            <#--<a href="#">Second Level Link<span class="fa arrow"></span></a>-->
                            <#--<ul class="nav nav-third-level">-->
                                <#--<li>-->
                                    <#--<a href="#">Third Level Link</a>-->
                                <#--</li>-->
                                <#--<li>-->
                                    <#--<a href="#">Third Level Link</a>-->
                                <#--</li>-->
                                <#--<li>-->
                                    <#--<a href="#">Third Level Link</a>-->
                                <#--</li>-->

                            <#--</ul>-->

                        <#--</li>-->
                    <#--</ul>-->
                <#--</li>-->
                <#--<li>-->
                    <#--<a href=# id="nav1"><i class="fa fa-fw fa-file"></i> Empty Page</a>-->
                <#--</li>-->
            </ul>

        </div>

    </nav>
    <!-- /. NAV SIDE  -->
    <div id="page-wrapper" >
        <div id="page-inner">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="page-header">
                        管理员订单界面 <small>方便的订单管理页面</small>
                    </h1>
                </div>
            </div>
            <!-- /. ROW  -->

            <div class="row">
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
                                    <#if finished_orders?exists >
                                    <#list finished_orders as fo>
                                        <#--class="odd gradeX"-->
                                    <tr >
                                        <td>${fo.order_id?c}</td>
                                        <td>${fo.order_name}</td>
                                        <td>${fo.sender_province+fo.sender_city}<span class="fa fa-arrow-right"></span>${fo.receiver_province+fo.receiver_city}</td>
                                        <td>${fo.status}</td>
                                        <td>${fo.initial_time+" 经过"+fo.live_time}</td>
                                        <td>${fo.trans_info}</td>
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
                    <div class="panel panel-default order_table" id="unview_order_table" style="display: none;">
                        <div class="panel-heading">
                            待审核订单
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
                                        <th>选择配送员</th>
                                        <th>配送信息</th>
                                        <th>确认处理</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <#if unview_orders?exists >
                                    <#list unview_orders as uo>
                                    <#--class="odd gradeX"-->
                                        <form class="form-group" action="/manager/deliver_order" method="post">
                                            <tr >
                                                <td  style="table-layout:fixed;width: 80px;"><input type="text" style="width:100%" readonly="readonly" name="order_id" value="${uo.order_id?c}" /></td>
                                                <td>${uo.order_name}</td>
                                                <td>${uo.sender_province+uo.sender_city}<span class="fa fa-arrow-right"></span>${uo.receiver_province+uo.receiver_city}</td>
                                                <td style="table-layout:fixed;width: 100px;"><input type="text" style="width:100%" name="status" value="${uo.status}" /></td>
                                                <td>${uo.initial_time}</td>
                                                <td>
                                                    <div class="form-group form-inline">
                                                        <select class="col-md-6 deliver_province" name="deliver_province">
                                                            <option>-省份-</option>
                                                            <#list provinces as pr>
                                                                <option value="${pr}">${pr}</option>
                                                            </#list>
                                                        </select>
                                                        <select class="col-md-6 deliver" name="deliver" >
                                                            <option>-人员-</option>
                                                        </select>
                                                    </div>
                                                </td>
                                                <td><input type="text" name="trans_info" value="${uo.trans_info}" /></td>
                                                <td><input type="submit" class="btn btn-info" value="处理" /></td>
                                            </tr>
                                        </form>
                                    </#list>
                                    </#if>

                                    </tbody>
                                </table>
                            </div>

                        </div>
                    </div>
                    <!--End finished_order_table -->
                    <!--begin of checked_orders-->
                    <!--  finished_order_table -->
                    <div class="panel panel-default order_table" id="checked_order_table" style="display: none;">
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
                                        <th>配送区间</th>
                                        <th>订单状态</th>
                                        <th>时间信息</th>
                                        <th>配送信息</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <#if checked_orders?exists >
                                    <#list checked_orders as co>
                                    <#--class="odd gradeX"-->
                                            <tr >
                                                <td>${co.order_id?c}</td>
                                                <td>${co.order_name}</td>
                                                <td>${co.sender_province+co.sender_city}<span class="fa fa-arrow-right"></span>${co.receiver_province+co.receiver_city}</td>
                                                <td>${co.status}</td>
                                                <td>${co.initial_time+" 经过"+co.live_time}</td>
                                                <td>${co.trans_info}</td>
                                            </tr>
                                    </#list>
                                    </#if>
                                    </tbody>
                                </table>
                            </div>

                        </div>
                    </div>
                    <!--End checked_orders -->
                    <!-- start financial -->
                      <div class="panel panel-default order_table" id="financial_table" style="height:400px;display: none;">
                          <div class="input-group col-md-10" style="padding-top:15%;padding-left:30%;">
                              <span class="input-group-addon">本月工资</span>
                              <input type="text" id="end_place" class="form-control" readonly="readonly" value="${salary}" />
                          </div>
                      </div>

                    <!-- start financial -->

                </div>
            </div>


        </div>
        <!-- /. ROW  -->


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

        $(".nav1").click(function () {
            $(".nav1 a").removeClass("active-menu");
            $(this).children("a").addClass("active-menu");
            var index=$(this).index();
            // alert("index:"+index);
            $(".order_table").css("display","none");
            $(".order_table").eq(index).css("display","block");
        });

        //select province
        $(".deliver_province").change(function () {
            var province=$(this).val();
            var deliver=$(this).parent().children(".deliver");
            $.ajax({
                type:"post",
                url:"/manager/select_deliver",
                data:"province="+province,
                dataType:"json",
                success: function (delivers) {
                    // alert(data);
                // var delivers=JSON.parse(data);

                      // alert(deliver);
                     // alert($(this).next());
                // $(this).parent().find("select").eq(1).find("option").remove();
                //     $(this).parent().children(".deliver").empty();
                if(delivers!=null){
                    $.each(delivers,function (i,n) {
                        //ajax 域内this已经不再适用
                        deliver.append("<option value="+n.deliver_id+">"+n.deliver_name+","+n.deliver_id+"</option>");
                    })
                }
            }

        })
        });


    });
</script>
<!-- Custom Js -->
<#--<script src="/assets/js/custom-scripts.js"></script>-->


</body>
</html>
