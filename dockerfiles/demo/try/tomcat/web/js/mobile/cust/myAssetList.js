$(function(){
	var type = $("#type").val();
	
	if(type == "all"){
		$("#all").css("color","#ff6d22");
	}else if(type == "2"){
		$("#no").css("color","#ff6d22");
	}else if(type == "3"){
		$("#yes").css("color","#ff6d22");
	}
	
	var pageNumber = 1;
	
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
	
	$('.btnwordwhite').on("tap",function(){
		location.href = cxt + '/myView/myViewMain.do';
		return false;
	});
});

function loadPage(pageNumber,me){
	var formArray = $(".queryForm").serializeArray();  
	var type = $("#type").val();
	$.ajax({
        type: 'GET',
        url: cxt + '/order/myAssetPage/'+type+'.do?pageNumber=' + pageNumber,
        dataType: 'html',
        data:formArray,
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
//根据时间跳转
function turnPage(obj){
	location.href = cxt + "/order/myAssetList/"+obj+".do"
}