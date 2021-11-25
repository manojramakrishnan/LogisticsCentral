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
					<h1><a href="/user/mainpage">SpeedPass</a></h1>
				</div>	
				</div>

				<!-- 右侧导航栏-->
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				  <ul class="nav navbar-nav">
					<li class="active"><a href="/user/mainpage">Home Page</a></li>
					<li><a href="about.html">About Us</a></li>
					<#--<li><a href="gallery.html">公司故事</a></li>-->
					<li class="dropdown">
						<#if Session["user"]?exists> <a class="dropdown-toggle" data-toggle="dropdown">${Session.user.username}</a><#else><a href="#" class="dropdown-toggle" data-toggle="dropdown">log in register<b class="caret"></b></a></#if>
					  <ul class="dropdown-menu">
						  <#if Session["user"]?exists>
						  <li><a href="/user/log_out"><i class="fa fa-gear fa-fw"></i>注销</a></li>
						  <#else>
						  <li><a href="/user/to_login"><span class="glyphicon glyphicon-user"></span>User Login</a></li>
						<li><a href="/manager/to_login"><span class="glyphicon glyphicon-star">Manager Login</a></li>
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
			<div id="w3layouts-title">Welcome to the homepage</div>
		</div>
	</div>	
	<!-- //banner-slider -->
	<!-- main-content -->
	<div class="agileits-main-content">

	<!-- Function menu -->
	<div class="agileinfo-wwd">
		<h3>main menu</h3>
		<div class="container">
			<div class="col-md-6 agileits-bottom-left text-center">
			<ul id="sti-menu" class="sti-menu">
				<li data-hovercolor="#fff">
					<a href="/user/to_order_query">
						<h4 data-type="mText" class="sti-item">Checking order</h4>
						<p data-type="sText" class="sti-item">Use order number to query</p>
						<i class="glyphicon glyphicon-lamp" aria-hidden="true"></i>
					</a>
				</li>
				<li data-hovercolor="#fff">
					<a href="/user/to_user_order_management">
						<h4 data-type="mText" class="sti-item">Order Management</h4>
						<p data-type="sText" class="sti-item">Order management function</p>
						<i class="glyphicon glyphicon-saved" aria-hidden="true"></i>
					</a>
				</li>
				<li data-hovercolor="#fff">
					<a href="/order/to_generate">
						<h4 data-type="mText" class="sti-item">I want to send</h4>
						<p data-type="sText" class="sti-item"></p>
						<i class="glyphicon glyphicon-home" aria-hidden="true"></i>
					</a>
				</li>
				<li data-hovercolor="#fff">
					<a href="#">
						<h4 data-type="mText" class="sti-item">notify</h4>
						<p data-type="sText" class="sti-item">update information</p>
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
								<h4>about us</h4>
								<p>learn more about speedpass</p>
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
						<h3>welcome to choose speed</h3>
						<span></span>
						<h4>Is a transportation company founded in the United States, currently wholly-owned by Deutsche Post Group, is currently one of the largest transportation companies in the world
</h4>
						<p>In 1969, DHL opened their first express shipping route from San Francisco to Honolulu. The company's name "DHL" was composed of the initials of the three founders (Dalsey, Hillblom and Lynn). In the third year of DHL’s establishment, Hong Kong entrepreneur Chung Puyang met Adrian Dalsey, one of the founders, due to his work relationship, and joined the ranks of the founding of DHL. In 1972, DHL established DHL International (Hong Kong) in Hong Kong under the name of DHL. Responsible for international express delivery services outside of the United States, expanding DHL's routes to Hong Kong, Japan, the Philippines, Australia and Singapore. Under DHL's commitment to establishing a new network concept that provides global door-to-door transportation services, DHL expanded their routes to South America, the Middle East and Africa in the mid to late 1970s.</p>
						<p>On October 26, 2018, SF Express entered into a strategic cooperation with Deutsche Post DHL Group (DP DHL) through SF Hong Kong, and SF Express Hong Kong acquired Deutsche Post DHL for 700 million euros/5.5 billion yuan/6.2 billion Hong Kong dollars in cash. DHL Hong Kong and DHL Beijing under the group (DP DHL), namely the supply chain business of DHL in Mainland China, Hong Kong and Macau</p>
						<a href="about.html" class="hvr-bounce-to-bottom">learn more</a>
					</div>
					<div class="col-md-6 w3l-welcome_pic">
						<h2>Taboo search method is an extension of local domain search, a global step-by-step optimization method, and a simulation of the process of human intelligence</h2>
						<img src="/images/al.jpg" class="img-responsive" alt=""/>
						<h3>Logistics route optimization algorithm</h3>
						<p>There are many methods for the optimization of logistics distribution, which can be divided into two categories: precise algorithms and heuristic algorithms. Accurate algorithm refers to the algorithm that can find its optimal solution, mainly including: cutting plane method, branch and bound method, dynamic programming method, etc. Since the amount of calculation of an accurate algorithm generally increases exponentially with the increase of the problem scale, its application range is very limited in practice. For this reason, the experts mainly used their energy to construct high-quality heuristic algorithms.</p>
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
					<p class="footer-class">Copyright &copy; 2017.The copyright belongs to Sutong@公司.</p>
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