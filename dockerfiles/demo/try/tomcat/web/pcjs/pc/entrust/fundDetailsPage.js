$(function(){
	
	/**全部类型**/
	$('.select-button a').on("click",function(){
		$("#table").attr("url",$(this).attr("url"));
		$('.select-button a').removeClass('active');
		$(this).addClass("active");
		showPcPage();
	});
	
	/***自定义日期查询***/
	$('#querySubmit').on("click",function(){
		var beginDate = $("#beginDate").val();
		var endDate = $("#endDate").val();
		/*if(!beginDate || !endDate){
			tryModel.alert("请输入完整日期~!");
			return;
		}*/
		//清空期限查询
		$("#time").val("");
		$(".search_wrap a").removeClass('active');
		$(".search_wrap a:first-child").addClass('active');
		
		$('.select-button a.active').click();
	});
	
	
	/***期限查询***/
	$('.times a').on("click",function(){
		$(".search_wrap a").removeClass('active');
		$(this).addClass('active');
		$("#time").val($(this).attr("time"));
		
		//清空自定义日期查询
		$("#beginDate,#endDate").val("");
		
		$('.select-button a.active').click();
	});
	
	
});

 