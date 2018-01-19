$(function(){
	
	$('div.table_top a').on("click",function(){
		$("#table").attr("url",$(this).attr("url"));
		$('div.table_top a').removeClass('active');
		$(this).addClass("active");
		showPcPage();
	});
	
	$('#querySubmit').on("click",function(){
		showPcPage();
	});
	
});

