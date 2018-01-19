$(document).ready(function() {
	//通知公告横向滚动
	var num = $('.notice_active').find('li').length;
	if(num > 1){
	   var $this = $(".notice_active");
	   var scrollTimer;
	   $this.hover(function(){
	      clearInterval(scrollTimer);
	   },function(){
	      scrollTimer = setInterval(function(){
	    	  timer($this);
	      }, 7000);
	   }).trigger("mouseleave");
	}
	resizeWindow();
});
$(window).resize(function() {
	resizeWindow();
});
function resizeWindow(){
	setTimeout(function(){
		var w = $(".sy_notice_con").width();
		var h5_w = $(".sy_notice_con h5").width();
		var more_w = $(".sy_notice_con .more").width();
		var active_w = w - h5_w - more_w - 30;
		$(".notice_active").width(active_w);
	}, 500)
}

function timer(opj){
	var w = $(".notice_active_ch:first").width()+110;
	$(opj).find('ul').animate({
		marginLeft : "-"+w+"px"  
	},3000,function(){  
		$(this).css({marginLeft : "0px"}).find("li:first").appendTo(this);  
	}); 
}
function getId(e) {
	var assortId = e.id;
	$.ajax({
		type:'post',
		url: cxt + '/index/newsDetail.do',
		data:{"id":assortId},
		dataType:'json',
		beforeSend:function(){
			$("#ul_art").html('');
		},
		success:function(data){
			$("#ul_art").html('');
			if(data.success){
				//$("#ul_art").clear();
				for(var i=0;i<data.articleList.length;i++){
					var str = "<li><a href='"+cxt +'/index/news/'+data.articleList[i].id+'.do'+"'>"+data.articleList[i].title+"</a><span>"+data.articleList[i].createDate+"</span></li>";
					$("#ul_art").append(str);
				} 
			}else{
				tryModel.alert("请联系管理员");
			}
		},
	});
}