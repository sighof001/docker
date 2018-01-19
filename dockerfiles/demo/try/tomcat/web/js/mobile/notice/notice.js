$(function(){
	$(".btnwordwhite").on("tap",function(){
		location.href = cxt+"/myView/myViewMain.do";
		return false;
	});
	
	tabNavOn();
});


/**切换按钮*/
function tabNavOn(){
	if(messageType == 2){//个人消息
		$(".ui-block-a").addClass("tabNavOn");
	}else{
		$(".ui-block-b").addClass("tabNavOn");
	}
}