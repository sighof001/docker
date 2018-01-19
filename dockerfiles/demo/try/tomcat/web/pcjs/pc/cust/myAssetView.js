$(function(){

	//充值
	$(".recharge_btn").on("click",function(){
		var $this = $(this);
		AuthStatus.isAuth(function(flag){
			if(flag){
				location.href = $this.attr('href');
			}
		});
		
		return false;
		
	});
	
	
	//可用余额
	$("#myRunningAccount").on("click",function(){
		location.href = cxt + "/myView/pcMyAssetView.do?menuId=myRunningAccountList";
	});
	
	
	//提现申请
	$(".cash_btn").on("click",function(){
		AuthStatus.isAuth(function(flag){
			if(flag){
				linkUrl('withdrawEdit');
			}
		});
	});
	
	
	
	
});