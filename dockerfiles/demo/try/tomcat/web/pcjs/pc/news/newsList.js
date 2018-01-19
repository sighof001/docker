
$(document).ready(function(e) {
	locationIndex(tabView.newsTabView);//导航栏定位
	firstTime();
	/**全部类型**/
	$('li a').on("click",function(){
		$("#table").attr("url",$(this).attr("url"));
		var id=$(this).prop("id");
		$("input[name=assortId]").val(id);
		$('li a').removeClass('focus');
		$(this).addClass("focus");
		showPcPage();
		title();
	});
	
});
//第一次进页面
function firstTime(){
	var id=$(".focus").prop("id");
	$("input[name=assortId]").val(id);
	showPcPage();
	title();
}
//拿到分类标题
function title(){
	 var title=$('.focus').text();
	 $("#firstTitle").text(title);
}

