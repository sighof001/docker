$(function(){
	//设置底部配置
	settingBottom(".buttons-d");
	
	$('.recharge,.withdraw').click(function(){
		var $this = $(this);
		TryAuthStatus.isAuth(function(flag){
			if(flag){
				location.href = $this.attr('href');
			}
		});
		
		return false;
	});
	
});