$(function(){
	$('a.pay').click(function(){
		$.yb.pc.load();
		location.href = $(this).attr('href');
		return false;
	});
});