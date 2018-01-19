function showMore(){
	$('#app_detail').css({
		'height': 'auto',
		'max-height': '100%'
	});
	$('.showMore').hide();
	$('.hideMore').show();
	$('.bottom').removeClass('bottom_fix');
}
function hideMore(){
	$('#app_detail').css({
		'max-height': '100px'
	});
	$('.showMore').show();
	$('.hideMore').hide();
	set_bottom();
}
function browserShow(){
	$('.browser_warp').show();
}
function browserHide(){
	$('.browser_warp').hide();
}
$(window).load(function(){
	// 设置截图
	var screenshot = $('.screenshot .swiper-slide');
	if(screenshot.length < 4){
		$('.screenshot .swiper-wrapper').addClass('screenshot_center');
	}else{
		var mySwiper = new Swiper ('.swiper-container', {
		    autoHeight: true,
		    slidesPerView: 3,
		    spaceBetween : '1.5%',
		    // 如果需要滚动条
		    scrollbar: '.swiper-scrollbar',
		});
	}
	
	// 显示更多
	if($('#app_detail').height() >= 100){
		$('.more-link-box').show();
	}
	var window_h = $(window).outerHeight();
	$('body').height(window_h);
})