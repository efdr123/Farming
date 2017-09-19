<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Farming后台管理系统</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/datepicker3.css" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet">

    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->

</head>

<body>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#sidebar-collapse">
                <span class="sr-only">切换导航</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#"><span>Farming</span>Admin</a>
            <ul class="user-menu">
                <li class="dropdown pull-right">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span
                            class="glyphicon glyphicon-user"></span> 管理员 <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#"><span class="glyphicon glyphicon-user"></span> 个人信息</a></li>
                        <li><a href="#"><span class="glyphicon glyphicon-cog"></span> 设置</a></li>
                        <li><a href="logout_Login"><span class="glyphicon glyphicon-log-out"></span> 注销</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div><!-- /.container-fluid -->
</nav>

<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
    <form role="search">
        <div class="form-group">
            <input type="text" class="form-control" placeholder="搜索">
        </div>
    </form>
    <ul class="nav menu">
        <li class="active"><a href="../admin/index.jsp"><span class="glyphicon glyphicon-dashboard"></span> 首页</a></li>
        <li><a href="../admin/product.jsp"><span class="glyphicon glyphicon-briefcase"></span> 商品管理</a></li>
        <li><a href="../admin/member.jsp"><span class="glyphicon glyphicon-briefcase"></span> 员工管理</a></li>
        <li><a href="../admin/comment.jsp"><span class="glyphicon glyphicon-briefcase"></span> 评论管理</a></li>
        <li role="presentation" class="divider"></li>
        <li><a href="../index.html"><span class="glyphicon glyphicon-user"></span> 前台首页</a></li>
    </ul>
</div><!--/.sidebar-->

<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
    <div class="row">
        <ol class="breadcrumb">
            <li><a href=""><span class="glyphicon glyphicon-home"></span></a></li>
            <li class="active">首页</li>
        </ol>
    </div><!--/.row-->

    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">首页</h1>
        </div>
    </div><!--/.row-->

    <div class="row">
        <div class="col-xs-12 col-md-6 col-lg-3">
            <div class="panel panel-blue panel-widget ">
                <div class="row no-padding">
                    <div class="col-sm-3 col-lg-5 widget-left">
                        <em class="glyphicon glyphicon-shopping-cart glyphicon-l"></em>
                    </div>
                    <div class="col-sm-9 col-lg-7 widget-right">
                        <div class="large">120</div>
                        <div class="text-muted">新订单</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xs-12 col-md-6 col-lg-3">
            <div class="panel panel-orange panel-widget">
                <div class="row no-padding">
                    <div class="col-sm-3 col-lg-5 widget-left">
                        <em class="glyphicon glyphicon-comment glyphicon-l"></em>
                    </div>
                    <div class="col-sm-9 col-lg-7 widget-right">
                        <div class="large">52</div>
                        <div class="text-muted">用户来信</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xs-12 col-md-6 col-lg-3">
            <div class="panel panel-teal panel-widget">
                <div class="row no-padding">
                    <div class="col-sm-3 col-lg-5 widget-left">
                        <em class="glyphicon glyphicon-user glyphicon-l"></em>
                    </div>
                    <div class="col-sm-9 col-lg-7 widget-right">
                        <div class="large">24</div>
                        <div class="text-muted">新用户</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xs-12 col-md-6 col-lg-3">
            <div class="panel panel-red panel-widget">
                <div class="row no-padding">
                    <div class="col-sm-3 col-lg-5 widget-left">
                        <em class="glyphicon glyphicon-stats glyphicon-l"></em>
                    </div>
                    <div class="col-sm-9 col-lg-7 widget-right">
                        <div class="large">25.2k</div>
                        <div class="text-muted">游客</div>
                    </div>
                </div>
            </div>
        </div>
    </div><!--/.row-->


    <div class="row">
        <div class="col-md-12">

            <div class="panel panel-default chat">
                <div class="panel-heading" id="accordion"><span class="glyphicon glyphicon-comment"></span> 留言</div>
                <div class="panel-body">
                    <ul>
                        <li class="left clearfix">
								<span class="chat-img pull-left">
									<img src="http://placehold.it/80/30a5ff/fff" alt="User Avatar" class="img-circle"/>
								</span>
                            <div class="chat-body clearfix">
                                <div class="header">
                                    <strong class="primary-font">无名氏</strong>
                                    <small class="text-muted">32分钟之前</small>
                                </div>
                                <p>
                                    留言测试留言测试留言测试留言测试留言测试留言测试留言测试留言测试留言测试留言测试留言测试留言测试留言测试留言测试留言测试留言测试留言测试
                                    留言测试留言测试留言测试留言测试留言测试留言测试留言测试留言测试留言测试留言测试留言测试留言测试留言测试留言测试
                                    留言测试留言测试留言测试留言测试留言测试留言测试留言测试留言测试留言测试留言测试留言测试留言测试留言测试
                                </p>
                            </div>
                        </li>
                        <li class="right clearfix">
								<span class="chat-img pull-right">
									<img src="http://placehold.it/80/dde0e6/5f6468" alt="User Avatar"
                                         class="img-circle"/>
								</span>
                            <div class="chat-body clearfix">
                                <div class="header">
                                    <strong class="pull-left primary-font">吴名</strong>
                                    <small class="text-muted">6分钟之前</small>
                                </div>
                                <p>
                                    留言测试留言测试留言测试留言测试留言测试留言测试留言测试留言测试留言测试留言测试留言测试留言测试
                                    留言测试留言测试留言测试留言测试留言测试留言测试留言测试留言测试留言测试留言测试留言测试
                                    留言测试留言测试留言测试留言测试留言测试留言测试
                                </p>
                            </div>
                        </li>
                        <li class="left clearfix">
								<span class="chat-img pull-left">
									<img src="http://placehold.it/80/30a5ff/fff" alt="User Avatar" class="img-circle"/>
								</span>
                            <div class="chat-body clearfix">
                                <div class="header">
                                    <strong class="primary-font">John Doe</strong>
                                    <small class="text-muted">32 mins ago</small>
                                </div>
                                <p>
                                    留言测试留言测试留言测试留言测试留言测试留言测试留言测试留言测试留言测试留言测试
                                    留言测试留言测试留言测试留言测试留言测试留言测试留言测试留言测试留言测试
                                    留言测试留言测试留言测试留言测试留言测试留言测试留言测试留言测试留言测试留言测试
                                    留言测试
                                </p>
                            </div>
                        </li>
                    </ul>
                </div>

                <div class="panel-footer">
                    <div class="input-group">
                        <input id="btn-input" type="text" class="form-control input-md"
                               placeholder="在这里输入你想说的话……"/>
                        <span class="input-group-btn">
								<button class="btn btn-success btn-md" id="btn-chat">发送</button>
							</span>
                    </div>
                </div>
            </div>

        </div><!--/.col-->
    </div><!--/.row-->
</div>    <!--/.main-->

<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/chart.min.js"></script>
<script src="js/easypiechart.js"></script>
<script src="js/bootstrap-datepicker.js"></script>
<script>
    $('#calendar').datepicker({});

    !function ($) {
        $(document).on("click", "ul.nav li.parent > a > span.icon", function () {
            $(this).find('em:first').toggleClass("glyphicon-minus");
        });
        $(".sidebar span.icon").find('em:first').addClass("glyphicon-plus");
    }(window.jQuery);

    $(window).on('resize', function () {
        if ($(window).width() > 768) $('#sidebar-collapse').collapse('show')
    })
    $(window).on('resize', function () {
        if ($(window).width() <= 767) $('#sidebar-collapse').collapse('hide')
    })
    
    function getList() {
			$.ajax({
				url : "../admin/getList_Comment.action",
				type : "POST",
				async : false,
				dataType : "json",
				success : function(data) {
				},
				error : function() {
					window.location.href='../admin/login.jsp';
				}
			});
		}

		getList();
</script>
</body>

</html>
