<!DOCTYPE html>
<html lang="eric">
	<head>
		<meta charset="utf-8" />
		<title></title>
		<!--Install the bootstrap environment-->
		<!-- Bootstrap core CSS file -->
		<link href="/css/bootstrap.min.css" rel="stylesheet">
		<!--font-awesome core my CSS file-->
		<link href="/css/font-awesome.min.css" rel="stylesheet">
		<!-- Introduced before bootstrap.min.js -->
		<script src="/js/jquery-2.1.4.min.js"></script>
		<!-- Bootstrap core JavaScript file -->
		<script src="/js/bootstrap.min.js"></script>
		<!--jquery.validate-->
		<script type="text/javascript" src="/js/jquery.validate.min.js" ></script>
		<#--<script type="text/javascript" src="/js/message.js" ></script>-->
		<style type="text/css">
			body{background: url("/back_img/4.jpg") repeat;background-size: cover;font-size: 16px;}
			.form{background: rgba(255,255,255,0.2);width:400px;margin:100px auto;position: absolute;margin-left: 30%;margin-top: 10%;}
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
			<form class="form-horizontal col-sm-offset-3 col-md-offset-3" id="login_form" action="/user/login_verify" method="post">
				<h3 class="form-title">Log in to your account</h3>
				<div class="col-sm-9 col-md-9">
					<div class="form-group">
						<i class="fa fa-user fa-lg"></i>
						<input class="form-control required" type="text" placeholder="Username" name="username" autofocus="autofocus" maxlength="20"/>
					</div>
					<div class="form-group">
							<i class="fa fa-lock fa-lg"></i>
							<input class="form-control required" type="password" placeholder="Password" name="password" maxlength="8"/>
					</div>
					<div class="form-group">
						<label class="checkbox">
							<input type="checkbox" name="remember" value="1"/> remember me
						</label>
						<hr />
						<a href="javascript:;" id="register_btn" class="">register account</a>
					</div>
					<div class="form-group">
						<input type="submit" class="btn btn-success pull-right" value="Log in"/>
					</div>
				</div>
			</form>
		</div>

		<div class="form row">
			<form class="form-horizontal col-sm-offset-3 col-md-offset-3" id="register_form" action="/user/register" method="post">
				<h3 class="form-title">Register your account</h3>
				<div class="col-sm-9 col-md-9">
					<div class="form-group">
						<i class="fa fa-user fa-lg"></i>
						<input class="form-control required" type="text" placeholder="username" name="username" autofocus="autofocus"/>
					</div>
					<div class="form-group">
							<i class="fa fa-lock fa-lg"></i>
							<input class="form-control required" type="password" placeholder="password" id="register_password" name="password"/>
					</div>
					<div class="form-group">
							<i class="fa fa-check fa-lg"></i>
							<input class="form-control required" type="password" placeholder="Enter the password again" name="rpassword"/>
					</div>
					<div class="form-group">
							<i class="fa fa-phone fa-lg"></i>
							<input class="form-control required" type="text" placeholder="mobile phone number" name="phoneNum"/>
					</div>
					<div class="form-group radio-inline">
						<label class="radio radio-inline">
						<input class="form-control" type="radio"  value="male" name="sex"/>male
						</label>
						<label class="radio radio-inline">
						<input class="form-control" type="radio"  value="female" name="sex"/>female
						</label>
					</div>
					<div class="form-group form-inline col-md-14" style="margin-top: 20px;">
						<select class="form-control col-sm-1" name="province" id="province">
							<option>-Province-</option>
							<#list provinces as province>
								<option value="${province}">${province}</option>
							</#list>
						</select>
						<select class="form-control col-sm-1" name="city" id="city">
							<option>-city-</option>
						</select>
						<select class="form-control col-sm-1" name="area" id="area">
							<option>-Area-</option>
						</select>
					</div>

					<div class="form-group">
						<i class="fa fa-address-book fa-lg"></i>
						<input class="form-control" type="text" placeholder="address" name="address"/>
					</div>

					<div class="form-group">
						<input type="submit" class="btn btn-success pull-right" value="register"/>
						<button class="btn btn-info pull-left" id="back_btn">return</button>
					</div>
				</div>
			</form>
		</div>
		</div>

	</body>
	<script type="text/javascript" >
		$().ready(function() {
			<#if Session["insert_result"]? exists>
			alert("${Session.insert_result}");
			</#if>
			$("#register_btn").click(function() {
				$("#register_form").css("display", "block");
				$("#login_form").css("display", "none");
			});
			$("#back_btn").click(function() {
				$("#register_form").css("display", "none");
				$("#login_form").css("display", "block");
				return false;
			});
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
				})
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
			$("#register_form").validate({
				rules: {
					username: "required",
					password: {
						required: true,
						minlength: 5
					},
					rpassword: {
						equalTo: "#register_password"
					},
					email: {
						required: true,
						email: true
					}
				},
				messages: {
					username: "Please type in your name",
					password: {
						required: "Please enter the password",
						minlength: jQuery.format("Password cannot be less than {0} characters")
					},
					rpassword: {
						equalTo: "The two passwords are different"
					},
					email: {
						required: "please input your email",
						email: "Please enter a valid email address"
					}
				}
			});
		});



	</script>
</html>
