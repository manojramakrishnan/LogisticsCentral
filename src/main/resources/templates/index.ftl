<!DOCTYPE html>
<html lang="eric">
<head>
<title>Home</title>
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
<!--font awesome 图标-->
<link href="http://fonts.googleapis.com/css?family=Dosis:200,300,400,500,600,700,800&subset=latin-ext" rel="stylesheet">
<link href="http://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
<!--//fonts-->
</head>
<body>
<!-- header -->
	<header>
		<div class="container">
			<!-- nav -->
			<nav class="navbar navbar-inverse">
			  <div class="container-fluid">
				<!--  -->
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

				<!-- 右侧导航栏-->
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				  <ul class="nav navbar-nav">
					<li class="active"><a href="/user/mainpage">主页</a></li>
					<li><a href="about.html">关于我们</a></li>
					<#--<li><a href="gallery.html">公司故事</a></li>-->
					<li class="dropdown">
						<#if Session["user"]?exists> <a class="dropdown-toggle" data-toggle="dropdown">${Session.user.username}</a><#else><a href="#" class="dropdown-toggle" data-toggle="dropdown">登录/注册<b class="caret"></b></a></#if>
					  <ul class="dropdown-menu">
						  <#if Session["user"]?exists>
						  <li><a href="/user/log_out"><i class="fa fa-gear fa-fw"></i>注销</a></li>
						  <#else>
						  <li><a href="/user/to_login"><span class="glyphicon glyphicon-user"></span>用户登录</a></li>
						<li><a href="/manager/to_login"><span class="glyphicon glyphicon-star">管理人员登录</a></li>
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
	<!-- banner-slider -->
	<div class="w3layouts-slider">
		<div class="content">
			<div id="w3layouts-title">欢迎来到主页！</div>
		</div>
	</div>	
	<!-- //banner-slider -->
	<!-- main-content -->
	<div class="agileits-main-content">

	<!-- 功能菜单 -->
	<div class="agileinfo-wwd">
		<h3>功能菜单</h3>
		<div class="container">
			<div class="col-md-6 agileits-bottom-left text-center">
			<ul id="sti-menu" class="sti-menu">
				<li data-hovercolor="#fff">
					<a href="/user/to_order_query">
						<h4 data-type="mText" class="sti-item">查询订单</h4>
						<p data-type="sText" class="sti-item">使用订单号进行查询</p>
						<i class="glyphicon glyphicon-lamp" aria-hidden="true"></i>
					</a>
				</li>
				<li data-hovercolor="#fff">
					<a href="/user/to_user_order_management">
						<h4 data-type="mText" class="sti-item">订单管理</h4>
						<p data-type="sText" class="sti-item">订单管理功能</p>
						<i class="glyphicon glyphicon-saved" aria-hidden="true"></i>
					</a>
				</li>
				<li data-hovercolor="#fff">
					<a href="/order/to_generate">
						<h4 data-type="mText" class="sti-item">我要寄件</h4>
						<p data-type="sText" class="sti-item"></p>
						<i class="glyphicon glyphicon-home" aria-hidden="true"></i>
					</a>
				</li>
				<li data-hovercolor="#fff">
					<a href="#">
						<h4 data-type="mText" class="sti-item">通知</h4>
						<p data-type="sText" class="sti-item">更新信息</p>
						<i class="glyphicon glyphicon-bullhorn" aria-hidden="true"></i>
					</a>
				</li>				
			</ul>

			<div class="clearfix"></div>
		</div>
			<div class="col-md-6 wthree-bottom-right  grid">
				<figure class="effect-moses">
							<img src="/images/car.jpg" alt="" />
							<figcaption>
								<h4>关于我们</h4>
								<p>了解更多关于速通</p>
							</figcaption>
				</figure>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<!-- //功能菜单-->
		<!-- 下部欢迎界面 -->
		<div class="w3layouts-welcome">
			<div class="container">
				<div class="w3ls-welcome_sec">
					<div class="col-md-6 w3l-welcome_info">
						<h3>欢迎选择速通</h3>
						<span></span>
						<h4>是一家创立于美国的运输公司，目前由德国邮政集团全资持有，是目前世界上最大的运输公司之一</h4>
						<p>1969年，DHL开设了他们的第一条从旧金山到檀香山的快递运输航线，公司的名称“DHL”由三位创始人姓氏的首字母组成（Dalsey, Hillblom and Lynn）。敦豪成立第3年，香港企业家锺普洋因工作关系结识了创办人之一的Adrian Dalsey，加入敦豪的创办行列，于1972年以敦豪名称在香港开设敦豪国际（香港），负责美国本土以外的国际快递业务，将敦豪的航线扩展到香港、日本、菲律宾、澳大利亚和新加坡。在敦豪致力建立起一个崭新的、提供全球门到门运输服务的网络构想下，在1970年代中后期敦豪将他们的航线扩展到南美洲、中东地区和非洲。</p>
						<p>2018年10月26日，顺丰速运透过顺丰香港与德国邮政敦豪集团(DP敦豪)达成战略合作，顺丰香港以7亿欧元/55亿元人民币/62亿港元现金收购德国邮政敦豪集团(DP敦豪)旗下的敦豪香港及敦豪北京，即敦豪中国内地、香港及澳门供应链业务</p>
						<a href="about.html" class="hvr-bounce-to-bottom">了解更多</a>
					</div>
					<div class="col-md-6 w3l-welcome_pic">
						<h2>禁忌搜寻法是对局部领域搜索的一种扩展，是一种全局逐步寻优法，是对人类智力过程的一种模拟</h2>
						<img src="/images/al.jpg" class="img-responsive" alt=""/>
						<h3>物流线路优化算法</h3>
						<p>关于物流配送优化问题的方法很多，可以分为精确算法和启发式算法两大类。精确算法是指可求出其最优解的算法，主要有: 割平面法、分支定界法、动态规划法等。由于精确算法的计算量一般会跟随问题规模的增大呈指数增长，在实际中其应用范围很有限。为此，专家们把精力主要用在了构造高质量的启发式算法上。</p>
						<p></p>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
		<!-- //下部欢迎界面 -->
	</div>
	<!-- //main-content -->	

	<!-- footer -->
	<footer>
	<div class="agileinfo-footer">

			<div class="agileits-footer-bottom">
				<div class="container center-block">
					<p class="footer-class">Copyright &copy; 2017.版权属于速通@公司.</p>
					<ul class="w3layouts-agileits-social">
						<li><a href="#"><i class="fa fa-facebook"></i></a></li>
						<li><a href="#"><i class="fa fa-twitter"></i></a></li>
						<li><a href="#"><i class="fa fa-rss"></i></a></li>
						<li><a href="#"><i class="fa fa-vk"></i></a></li>
					</ul>
			<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	</footer>
	<!-- //footer -->

	
	<script type="text/javascript" src="/js/jquery-2.1.4.min.js"></script><!-- Required-js -->
	<script src="/js/bootstrap.min.js"></script><!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<!-- main slider-banner -->
	<script type="text/javascript" src="/js/jquery.mkinfinite.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				<#if Request["insert_result"]?exists>
				alert("${Request.insert_result}");
				</#if>

				$('.w3layouts-slider').mkinfinite({
					maxZoom:       1.2,
					animationTime: 6000,
					imagesRatio:   (960 / 720),
					isFixedBG:     true,
					zoomIn:        true,
					imagesList:    new Array(
						'/images/main1.jpg',
						'/images/main2.jpg',
						'/images/main3.jpg'
						// '/images/44.jpg',
						// '/images/55.jpg'
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
			<!-- start-smoth-scrolling -->
	<!-- //here ends scrolling icon -->	
</body>
</html>