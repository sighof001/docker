$(function(){
	//设置底部配置
	settingBottom(".buttons-a");
	//配置首页轮播图点击事件，有时候需要用到
	$(".swiper-slide").click(function(){
		_index = $(this).index();
		if(_index == 1){
			//第1张图点击
		}else if(_index == 2){
			//第2张图点击
		}else if(_index == 3){
			//第3张图点击
		}
	});
});