$(document).ready(function(){
	updateBtn();
});

function updateBtn(){
	$("#modalSubmit").click(function(){
		var id = $("#saveOrUpdateFrom input[type='hidden']").val();
		var name = $("#name").val();
		var content = $("#descri").val();
		$.ajax({
			url:"../admin/update_Comment",
			type:"POST",
			data:{'comment.id':id,'comment.name':name,'comment.content':content},
            async: false,
			dataType:"json",
			success: function () {
				getList();
			},
			error:function () {
				alert("网络不是太好，等会儿再来试试？");
			}
		});
	});
}
