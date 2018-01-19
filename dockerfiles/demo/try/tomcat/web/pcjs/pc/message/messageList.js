$(function(){
	
	//标记为
	$(".mark_read").on("click",function(){
		var length = $("input[name='sqCheckbox']:checked").length;
		var messageType = $("#messageType").val();
		if(length == 0){
			tryModel.alert("请勾选需要标记的选项!");
			return;
		}
		var ids = new Array(); 
		$("input[name='sqCheckbox']:checked").each(function(i){
			var id = $(this).val();
			if(id != 'id' && id != undefined && id != ""){
				ids.push(id);
			}
			
		});
		$.post(cxt + '/notice/pcSetReadStatus.do',{ids:ids.join(",")},function(data){
			if(data.success){
				tryModel.alert("标记成功!",function(){
					linkUrl("messagelist","messageType="+messageType);
				});
			}else{
				tryModel.alert(data.message);
			}
		},"json");
		
	});
	
	
	$('div.table_top a').on("click",function(){
		$("#table").attr("url",$(this).attr("url"));
		$('div.table_top a').removeClass('active');
		$(this).addClass("active");
		showPcPage();
	});
	
	
	
});


//复选框选择
function check(){
	var checkall = $("#check-all")[0];
	var checkbox$ = $('input[type="checkbox"]');
	for (var i in checkbox$) {
		checkbox$[i].checked = checkall.checked;
	}
}


