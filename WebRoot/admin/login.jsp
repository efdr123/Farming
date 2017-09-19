<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><s:text name="login_title" /></title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/datepicker3.css" rel="stylesheet">
<link href="css/styles.css" rel="stylesheet">
<style>
	html,body {
		overflow-x: hidden;
	}
</style>

<!--[if lt IE 9]>
<script src="js/html5shiv.js"></script>
<script src="js/respond.min.js"></script>
<![endif]-->

</head>

<body>
	
	<div class="row">
		<div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4">
			<div class="login-panel panel panel-default">
				<div class="panel-heading"><s:text name="login_head" /></div>
				<div class="panel-body">
					<form role="form" action="../admin/login.action" method="post">
						<fieldset>
							<div class="form-group">
								<input class="form-control" placeholder="<s:text name="login_username" />" name="admin.username" type="text" autofocus="">
							</div>
							<div class="form-group">
								<input id="password" class="form-control" placeholder="<s:text name="login_password" />" name="admin.password" type="password" value="">
							</div>
                            <div class="popover right" style="color:#ff4444;top:31%;left:60%;font-size: 12px;">
                                <div class="arrow" style="left: -10px;"></div>
                                <div class="popover-content"></div>
                            </div>
							<div class="form-group" style="margin-bottom: 0;float: right">
								<!--<a href="index.html" class="btn btn-primary" style="text-align: right;">登录</a>-->
								<a href="forget.jsp" class="small"><s:text name="login_a_forget" /></a><span style="color: #30a5ff;font-weight: bolder;">&nbsp;|</span>
								<input type="button" class="btn btn-primary" value="<s:text name="login_btn_submit" />">
							</div>
						</fieldset>
					</form>
				</div>
			</div>
		</div><!-- /.col-->
	</div><!-- /.row -->	

	<div class="row">
		<div class="col-xs-12 text-center">
			<span class="small"><s:text name="login_newMember1" /></span><a href="#" style="font-size: 16px;"><s:text name="login_newMember2" /></a><span class="small"><s:text name="login_newMember3" /></span>
		</div>
	</div>
	
		

	<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/chart.min.js"></script>
	<script src="js/easypiechart.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script>
		!function ($) {
			$(document).on("click","ul.nav li.parent > a > span.icon", function(){		  
				$(this).find('em:first').toggleClass("glyphicon-minus");	  
			}); 
			$(".sidebar span.icon").find('em:first').addClass("glyphicon-plus");
		}(window.jQuery);

		$(window).on('resize', function () {
		  if ($(window).width() > 768) $('#sidebar-collapse').collapse('show');
		});
		$(window).on('resize', function () {
		  if ($(window).width() <= 767) $('#sidebar-collapse').collapse('hide');
		});
		$(document).ready(function () {
			$('input[type="button"]').click(function () {
				var uname = $('input[type="text"]').val();
				var pwd = $('#password').val();
				if(uname.length==0||pwd.length==0){
                    $(".popover-content").html('<span class="glyphicon glyphicon-exclamation-sign"></span> <s:text name="login_blank" />');
                    $(".popover").fadeIn(200);
                } else {
					$.ajax({
						url:"../admin/login_Login.action",
						type:"POST",
						data:{'admin.username':uname,'admin.password':pwd},
						dataType:"json",
						success: function (jsonString) {
							var obj = $.parseJSON(jsonString);
							var result = obj.loginJSON;
							if(result=="success")
								window.location.href='../admin/index.jsp';
							else{
						        $(".popover-content").html('<span class="glyphicon glyphicon-exclamation-sign"></span> <s:text name="login_failed" />');
						        $(".popover").fadeIn(200);
							}
						},
						error:function () {
							//alert("网络不是太好，等会儿再来试试？");
					        $(".popover-content").html('<span class="glyphicon glyphicon-exclamation-sign"></span> <s:text name="login_failed" />');
					        $(".popover").fadeIn(200);
						}
					});
				}
			});
		});
		$(document).keyup(function(event){
			if(event.keyCode == 13){
			  $('input[type="button"]').trigger("click");
			}
		});
        $(".popover").click(function () {
            $(this).fadeOut(200);
        });
	</script>	
</body>

</html>

