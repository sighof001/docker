$(function(){

	
	var pageNumber = 1;
	//分页
	var container =  $('.data-container').dropload({
		scrollArea:window,
		domDown : {
            domClass   : 'dropload-down',
            domRefresh : '<div class="dropload-refresh">↑上拉加载更多</div>',
            domLoad    : '<div class="dropload-load"><span class="loading"></span>加载中...</div>',
            domNoData  : '<div class="dropload-noData">暂无返息明细</div>'
        },
		loadDownFn:function(me){
			loadPage(pageNumber++,function(data){
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
			});
		}
	});
	
});


//分页请求数据
function loadPage(pageNumber,callback){
	var formArray = $(".queryForm").serializeArray();  
	$.ajax({
        type: 'GET',
        url: cxt + '/webEntrust/returnDetailsPage.do?pageNumber=' + pageNumber,
        dataType: 'html',
        data:formArray,
        success: function(data){
        	if(callback){
        		callback(data);
        	}else{
        		var $data = $(data);
        		if($data.size() > 0){
        			$('.lists').append(data);
        		}
        	}
        	
        }
    });
}