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
	<link href="css/bootstrap-table.css" rel="stylesheet">
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
        <li><a href="../admin/index.jsp"><span class="glyphicon glyphicon-dashboard"></span> 首页</a></li>
        <li class="active"><a href="../admin/product.jsp"><span class="glyphicon glyphicon-briefcase"></span> 商品管理</a></li>
        <li><a href="../admin/member.jsp"><span class="glyphicon glyphicon-briefcase"></span> 员工管理</a></li>
        <li><a href="../admin/comment.jsp"><span class="glyphicon glyphicon-briefcase"></span> 评论管理</a></li>
        <li role="presentation" class="divider"></li>
        <li><a href="../index.html"><span class="glyphicon glyphicon-user"></span> 前台首页</a></li>
    </ul>
</div><!--/.sidebar-->

<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">

    <div class="row">
        <ol class="breadcrumb">
            <li><a href="index.jsp"><span class="glyphicon glyphicon-home"></span></a></li>
            <li class="active">商品管理</li>
        </ol>
    </div><!--/.row-->

    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">商品管理</h1>
        </div>
    </div><!--/.row-->
    
    	<div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
					<div class="row">
						<div class="col-xs-6">商品列表</div>
						<div class="col-xs-6 text-right">
							<button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#insertProductModal"
            									data-title="新增商品" data-name="" data-img="" data-descri="" 
            									data-price="" data-stock="" data-id="-1">
								<span class="glyphicon glyphicon-plus-sign"></span>新增商品
							</button>
						</div>
					</div>
				</div>
                <div class="panel-body">
               	<button name="deleteMoreBtn" type="button" class="btn btn-danger" style="position:absolute;margin-top:10px;">批量删除</button>
               	<table class="" id="proTable" data-toggle="table" data-show-toggle="true" data-show-columns="true" data-search="true" data-select-item-name="toolbar1" data-pagination="true" data-sort-name="name" data-sort-order="desc">
                       <thead>
                       <tr>
                           <th class="bs-checkbox">
                           	<input name="btSelectAll" type="checkbox">
                           </th>
                           <th>ID</th>
                           <th>商品名</th>
                           <th>图片</th>
                           <th>商品描述</th>
                           <th>价格</th>
                           <th>库存</th>
                           <th>操作</th>
                       </tr>
                       </thead>
                       <tbody>
                       </tbody>
                   </table>
                </div>
            </div>
        </div>
    </div><!--/.row-->	
    
	<div class="modal fade" id="insertProductModal" tabindex="-1" role="dialog"
         aria-labelledby="insertProductModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="insertProductModalLabel"></h4>
                </div>
                <div class="modal-body">
                    <form id="saveOrUpdateFrom" class="form-horizontal" action="../admin/productSOU_Product.action" method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <label for="productName" class="col-sm-3 control-label">商品名：</label>
                            <div class="col-sm-8">
                                <input name="product.id" type="hidden" class="form-control" value="">
                                <input name="product.name" type="text" class="form-control" id="productName">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="productImg" class="col-sm-3 control-label">图片：</label>
                            <div class="col-sm-8">
                                <input name="file" type="file" class="form-control" id="productImg">
                                <input name="product.img" type="hidden" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="productDescri" class="col-sm-3 control-label">商品描述：</label>
                            <div class="col-sm-8">
                            	<textarea name="product.descri" class="form-control" id="productDescri" style="resize: none;" rows="3"></textarea>
<!--                                 <input name="product.descri" type="text" class="form-control" id="productdescri"> -->
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="productPrice" class="col-sm-3 control-label">价格：</label>
                            <div class="col-sm-8">
                                <input name="product.price" type="text" class="form-control" id="productPrice">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="productStock" class="col-sm-3 control-label">库存：</label>
                            <div class="col-sm-8">
                                <input name="product.stock" type="text" class="form-control" id="productStock">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="modalSubmit">确认</button>
                </div>
            </div>
        </div>
    </div>
    
    <div class="modal fade" id="checkImgModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <img src="" width="568px">
                </div>
            </div>
        </div>
    </div>

</div>    <!--/.main-->

	<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/chart.min.js"></script>
	<script src="js/chart-data.js"></script>
	<script src="js/easypiechart.js"></script>
	<script src="js/easypiechart-data.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script src="js/bootstrap-table.js"></script>
	
<div id="jsBox"></div>
<script>
    $('#calendar').datepicker({});

    !function ($) {
        $(document).on("click", "ul.nav li.parent > a > span.icon", function () {
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
    
    $('#insertProductModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget); // Button that triggered the modal
        var id = button.data('id');
        var title = button.data('title'); // Extract info from data-* attributes
        var name = button.data('name');
        var img = button.data('img');
        var descri = button.data('descri');
        var price = button.data('price');
        var stock = button.data('stock');
        // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
        // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
        var modal = $(this);
        modal.find('.modal-title').text(title);
        modal.find('.modal-body input[type="hidden"]').val(id);
        modal.find('.modal-body #productName').val(name);
        modal.find('.modal-body input[name="product.img"]').val(img);
        modal.find('.modal-body #productDescri').val(descri);
        modal.find('.modal-body #productPrice').val(price);
        modal.find('.modal-body #productStock').val(stock);
    });
    
    $('#checkImgModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget); // Button that triggered the modal
        var img = "../upload/"+button.data('img');
        // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
        // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
        var modal = $(this);
        modal.find('.modal-body img').attr('src',img);
    });
    
    $('#modalSubmit').click(function () {
        $('#insertProductModal #saveOrUpdateFrom').submit();
    });
    function getList(){
	    $.ajax({
	        url:"../admin/getList_Product.action",
	        type:"POST",
	        async:false,
	        dataType:"json",
	        success: function (data) {
	            $("#proTable tbody").empty();
	            var s = '';
	            $.each(data,function(key, value){
	            	var imgvar = value.img;
	            	if(imgvar==undefined)
	            		imgvar="";
	                s+='<tr><td class="bs-checkbox"><input data-index="0" name="toolbar1" type="checkbox" value="'+value.id+'"></td><td>'+value.id+'</td><td>'+value.name+'</td>' +
	                        '<td><button type="button" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#checkImgModal" data-img="'+imgvar+'">查看图片</button></td>' + 
	                        '<td>'+value.descri+'</td>' +
	                        '<td>'+value.price+'</td><td>'+value.stock+'</td>' +
	                        '<td> <button name="deleteBtn" type="button" value="'+value.id+'" class="btn btn-danger btn-xs"> ' +
	                        '<span class="glyphicon glyphicon-remove-circle"></span> 删除 </button>' +
	                        ' <button type="button" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#insertProductModal" ' +
	                        'data-title="修改商品" data-name="'+value.name+'" data-img="'+imgvar+'"' +
	                        ' data-descri="'+value.descri+'"data-price="'+value.price+'" data-stock="'+value.stock+'" ' +
	                        'data-id="'+value.id+'"> <span class="glyphicon glyphicon-wrench"></span> 修改 </button> </td>' +
	                        '</tr>';
	            });
	            $("#proTable tbody").append(s);
	            $("#jsBox").empty();
	            $("#jsBox").append('<script src="js/productAjax.js"></'+'script>');
	            //bindEvents();
	            //$('#protable tbody').append(s);
	        },
	        error:function () {
	            window.location.href='../admin/login.jsp';
	        }
	    });
    }
    
   	getList();
   	
    
</script>


</body>

</html>