$(function(){

	
	var pageNumber = 1;
	//分页
	var container =  $('.data-container').dropload({
		scrollArea:window,
		domDown : {
            domClass   : 'dropload-down',
            domRefresh : '<div class="dropload-refresh">↑上拉加载更多</div>',
            domLoad    : '<div class="dropload-load"><span class="loading"></span>加载中...</div>',
            domNoData  : '<div class="dropload-noData">暂无更多返息明细</div>'
        },
		loadDownFn:function(me){
			loadPage(pageNumber++,me);
			}
	});
	
});


//分页请求数据
function loadPage(pageNumber,me){
	var formArray = $(".queryForm").serializeArray();  
	$.ajax({
        type: 'GET',
        url: cxt + '/oldEntrust/oldReturnDetailsPage.do?pageNumber=' + pageNumber,
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