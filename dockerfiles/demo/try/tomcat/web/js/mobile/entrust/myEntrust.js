$(function(){
	
	var time = $("#time").val();
	
	if(time == "all"){
		$("#all").css("color","#ff6d22");
	}else if(time == "-30"){
		$("#oneMonth").css("color","#ff6d22");
	}else if(time == "-90"){
		$("#threeMonth").css("color","#ff6d22");
	}
	
	var pageNumber = 1;
	//分页
	$('.data-container').dropload({
		scrollArea:window,
		domDown : {
            domClass   : 'dropload-down',
            domRefresh : '<div class="dropload-refresh">↑上拉加载更多</div>',
            domLoad    : '<div class="dropload-load"><span class="loading"></span>加载中...</div>',
            domNoData  : '<div class="dropload-noData">暂无数据</div>'
        },
		loadDownFn:function(me){
			loadPage(pageNumber++,me);
		}
	});
	/*$(".btnwordwhite").on("tap",function(){
		location.href = cxt+"/myView/myViewMain.do";
		return false;
	});*/
	
});

//分页请求数据
function loadPage(pageNumber,me){
	var time = $("#time").val();
	$.ajax({
        type: 'GET',
        url: cxt + '/webEntrust/queryEntrustPage/'+time+'.do?pageNumber=' + pageNumber,
        dataType: 'html',
        success: function(data){
    		var $data = $(data);
    		if($data.size() > 0){
    			$('.lists').append(data);
    		}else{
                // 锁定
                me.lock();
                // 无数据
                me.noData();
    		}
			me.resetload();
        },
        error: function(xhr, type){
            // 即使加载出错，也得重置
            me.resetload();
        }
    });
}


//根据类型跳转
function turnPage(obj){
	location.href = cxt + "/webEntrust/myEntrust/"+obj+".do"
	
}