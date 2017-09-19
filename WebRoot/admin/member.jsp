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
        <li><a href="../admin/product.jsp"><span class="glyphicon glyphicon-briefcase"></span> 商品管理</a></li>
        <li class="active"><a href="../admin/member.jsp"><span class="glyphicon glyphicon-briefcase"></span> 员工管理</a></li>
        <li><a href="../admin/comment.jsp"><span class="glyphicon glyphicon-briefcase"></span> 评论管理</a></li>
        <li role="presentation" class="divider"></li>
        <li><a href="../index.html"><span class="glyphicon glyphicon-user"></span> 前台首页</a></li>
    </ul>
</div><!--/.sidebar-->

<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">

    <div class="row">
        <ol class="breadcrumb">
            <li><a href="index.jsp"><span class="glyphicon glyphicon-home"></span></a></li>
            <li class="active">员工管理</li>
        </ol>
    </div><!--/.row-->

    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">员工管理</h1>
        </div>
    </div><!--/.row-->
    
    	<div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
					<div class="row">
						<div class="col-xs-6">员工列表</div>
						<div class="col-xs-6 text-right">
							<s:if test="#session.auth==1">
								<button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#insertMemberModal"
	            									data-title="新增员工" data-id="-1" data-idCard="" data-name="" data-selfi="" data-descri="">
									<span class="glyphicon glyphicon-plus-sign"></span>新增员工
								</button>
							</s:if>
							<s:if test="#session.auth!=1">
								<button class="btn btn-primary btn-sm" disabled><span class="glyphicon glyphicon-plus-sign"></span>新增员工</button>
							</s:if>
						</div>
					</div>
				</div>
                <div class="panel-body">
               	<table class="" id="proTable" data-toggle="table" data-show-toggle="true" data-show-columns="true" data-search="true" data-select-item-name="toolbar1" data-pagination="true" data-sort-name="name" data-sort-order="desc">
                       <thead>
                       <tr>
                           <th>ID</th>
                           <th>员工卡号</th>
                           <th>员工姓名</th>
                           <th>照片</th>
                           <th>个人简介</th>
							<s:if test="#session.auth==1">
								<th>操作</th>
							</s:if>
                       </tr>
                       </thead>
                       <tbody>
                       </tbody>
                   </table>
                </div>
            </div>
        </div>
    </div><!--/.row-->	
    
	<div class="modal fade" id="insertMemberModal" tabindex="-1" role="dialog"
         aria-labelledby="insertMemberModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="insertMemberModalLabel"></h4>
                </div>
                <div class="modal-body">
                    <form id="saveOrUpdateFrom" class="form-horizontal" action="../admin/memberSOU_Member.action" method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <div class="col-sm-8">
                                <input name="member.idCard" type="hidden" class="form-control" id="idCard">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label">姓名：</label>
                            <div class="col-sm-8">
                                <input name="member.id" type="hidden" class="form-control" value="">
                                <input name="member.name" type="text" class="form-control" id="name">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="selfi" class="col-sm-3 control-label">照片：</label>
                            <div class="col-sm-8">
                                <input name="member.selfi" type="hidden" class="form-control" value="">
                                <input name="file" type="file" class="form-control" id="selfi">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="descri" class="col-sm-3 control-label">个人简介：</label>
                            <div class="col-sm-8">
                            	<textarea name="member.descri" class="form-control" id="descri" style="resize: none;" rows="3"></textarea>
<!--                                 <input name="member.descri" type="text" class="form-control" id="memberdescri"> -->
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
    
    <div class="modal fade bs-example-modal-sm" id="checkImgModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <img src="" width="100%">
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
    
    $('#insertMemberModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget); // Button that triggered the modal
        var title = button.data('title');
        var id = button.data('id');
        var idCard = button.data('card');
        var name = button.data('name');
        var img = button.data('selfi');
        var descri = button.data('descri');
        // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
        // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
        var modal = $(this);
        modal.find('.modal-title').text(title);
        modal.find('#idCard').val(idCard);
        modal.find('.modal-body input[name="member.id"]').val(id);
        modal.find('.modal-body input[name="member.selfi"]').val(img);
        modal.find('.modal-body #name').val(name);
        modal.find('.modal-body #descri').val(descri);
    });
    
    $('#checkImgModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget); // Button that triggered the modal
        var img = "../upload/"+button.data('selfi');
        // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
        // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
        var modal = $(this);
        modal.find('.modal-body img').attr('src',img);
    });
    
    $('#modalSubmit').click(function () {
        $('#insertMemberModal #saveOrUpdateFrom').submit();
    });
    
    function getList(){
	    $.ajax({
	        url:"../admin/getList_Member.action",
	        type:"POST",
	        async:false,
	        dataType:"json",
	        success: function (data) {
	            $("#proTable tbody").empty();
	            var s = '';
	            $.each(data,function(key, value){
	            	var imgvar = value.selfi;
	            	if(imgvar==undefined)
	            		imgvar="";
	            		if(value.id==1){
			                s+='<tr><td>'+value.id+'</td><td>'+value.idCard+'</td><td>'+value.name+'</td>' +
			                        '<td><button type="button" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#checkImgModal" data-selfi="'+imgvar+'">查看图片</button></td>' + 
			                        '<td>'+value.descri+'</td>' +
			                        '<s:if test="#session.auth==1">' +
			                        '<td> <button name="deleteBtn" disabled type="button" value="'+value.id+'" class="btn btn-danger btn-xs"> ' +
			                        '<span class="glyphicon glyphicon-remove-circle"></span> 删除 </button>&nbsp;'+
			                        '<button class="btn btn-primary btn-xs" data-toggle="modal" data-target="#insertMemberModal"'+
	            					'data-title="修改员工" data-id="'+value.id+'" data-card="'+value.idCard+'" data-name="'+value.name+'" data-selfi="'+value.selfi+'" data-descri="'+value.descri+'">'+
									'<span class="glyphicon glyphicon-wrench"></span> 修改员工'+
									'</button>'+
			                        '</td>' +
			                        '</s:if>'+
			                        '</tr>';
	            		}else{
			                s+='<tr><td>'+value.id+'</td><td>'+value.idCard+'</td><td>'+value.name+'</td>' +
			                        '<td><button type="button" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#checkImgModal" data-selfi="'+imgvar+'">查看图片</button></td>' + 
			                        '<td>'+value.descri+'</td>' +
			                        '<s:if test="#session.auth==1">' +
			                        '<td> <button name="deleteBtn" type="button" value="'+value.id+'" class="btn btn-danger btn-xs"> ' +
			                        '<span class="glyphicon glyphicon-remove-circle"></span> 删除 </button>&nbsp;'+
			                        '<button class="btn btn-primary btn-xs" data-toggle="modal" data-target="#insertMemberModal"'+
	            					'data-title="修改员工" data-id="'+value.id+'" data-card="'+value.idCard+'" data-name="'+value.name+'" data-selfi="'+value.selfi+'" data-descri="'+value.descri+'">'+
									'<span class="glyphicon glyphicon-wrench"></span> 修改员工'+
									'</button>'+
			                        '</td>' +
			                        '</s:if>'+
			                        '</tr>';
	            		}
	            });
	            $("#proTable tbody").append(s);
	            $("#jsBox").empty();
	            $("#jsBox").append('<script src="js/memberAjax.js"></'+'script>');
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