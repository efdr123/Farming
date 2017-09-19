$(document).ready(function(){
	deleteOne();
});
    
function deleteOne(){
    $("button[name='deleteBtn']").click(function(){
    	var vId = $(this).val();
    	deleteFunction(vId);
    });
}

function deleteFunction(vId){
   	$.ajax({
   		url:"../admin/memberDelete_Member.action",
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