<!DOCTYPE html>
<html lang="eric">
	<head>
		<meta charset="utf-8" />
		<title>Manager login interface</title>
		<!--Install the bootstrap environment with the cdn of Baidu's static resource library-->
		<!-- Bootstrap Core CSS file -->
		<link href="/css/bootstrap.min.css" rel="stylesheet">
		<!--font-awesome Core my css file-->
		<link href="/css/font-awesome.min.css" rel="stylesheet">
		<!-- In bootstrap.min.js Introduced before -->
		<script src="/js/jquery-2.1.4.min.js"></script>
		<!-- Bootstrap core JavaScript file -->
		<script src="/js/bootstrap.min.js"></script>
		<!--jquery.validate-->
		<script type="text/javascript" src="/js/jquery.validate.min.js" ></script>
		<#--<script type="text/javascript" src="/js/message.js" ></script>-->
		<style type="text/css">
			body{background: url("/back_img/5.jpg") repeat;background-size: cover;font-size: 16px;}
			.form{background: rgba(255,255,255,0.5);width:400px;margin:100px auto;position: absolute;margin-left: 30%;margin-top: 10%;}
			#login_form{display: block;}
			#register_form{display: none;}
			.fa{display: inline-block;top: 27px;left: 6px;position: relative;color: #ccc;}
			input[type="text"],input[type="password"]{padding-left:26px;}
			.checkbox{padding-left:21px;}
			select{
				width: 50px;
			}
		</style>
	</head>
	<body>

	<div class="container">
		<div class="form row">
			<form class="form-horizontal col-sm-offset-3 col-md-offset-3" id="login_form" action="/manager/login_verify" method="post">
				<h3 class="form-title" style="color: white;">Log in to your account</h3>
				<div class="col-sm-9 col-md-9">
					<div class="form-group">
						<i class="fa fa-user fa-lg"></i>
						<input class="form-control required" type="text" placeholder="username" name="username" autofocus="autofocus" maxlength="20"/>
					</div>
					<div class="form-group">
							<i class="fa fa-lock fa-lg"></i>
							<input class="form-control required" type="password" placeholder="password" name="password" maxlength="20"/>
					</div>
					<div class="form-group radio-inline">
						<label class="radio radio-inline">
							<input type="radio" name="identity" value="1"/> <p style="color: white">manager</p>
						</label>
						<label class="radio radio-inline">
							<input type="radio" name="identity" value="2"/> <p style="color: white">Delivery staff</p>
						</label>
					</div>
					<div class="form-group">
						<input type="submit" class="btn btn-success pull-right" value="Log in"/>
					</div>
				</div>
			</form>
		</div>
		</div>
	<script type="text/javascript">
		$().ready(function() {


			$("#login_form").validate({
				rules: {
					username: "required",
					password: {
						required: true,
						minlength: 1
					},
				},
				messages: {
					username: "Please type in your name",
					password: {
						required: "Please enter the password",
						minlength: jQuery.format("Password cannot be less than {0} characters")
					},
				}
			});

		});

	</script>
	</body>
</html>
