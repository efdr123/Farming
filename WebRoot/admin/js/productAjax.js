$(document).ready(function(){
	deleteOne();
	deleteMore();
});
    
function deleteOne(){
    $("button[name='deleteBtn']").click(function(){
    	var vId = $(this).val();
    	deleteFunction(vId);
    });
}

function deleteFunction(vId){
   	$.ajax({
   		url:"../admin/productDelete_Product.action",
   		type:"POST",
   		data:{'id':vId},
   		success: function (data) {
   			getList();
        },
        error:function () {
            alert("网络不是太好，等会儿再来试试？");
        }
   	});
}

function deleteMore(){
	$("button[name='deleteMoreBtn']").click(function(){
		$("#proTable tbody").find($(":checked")).each(function(){
			var vId = $(this).val();
			deleteFunction(vId);
		});
	});
}