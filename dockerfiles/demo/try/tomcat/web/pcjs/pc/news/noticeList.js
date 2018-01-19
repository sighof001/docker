$(document).ready(function(e) {
	var id = $(".focus").prop("id");
	$("input[name=assortId]").val(id);
	showPcPage();

});

/*
$(document).ready(function(e) {
	//locationIndex(tabView.newsTabView);//导航栏定位
	var ids=$("#test li").attr("id");
	//data1(ids);
	//var id = $('#test li').attr("id");
	getId(ids,page,limit);
});

function getFocus(obj){
	var id = obj.id;
	getId(id,page,limit);
}

function getId(id,page,limit) {
	var assortId = id;
	$.ajax({
		type:'post',
		url: cxt + '/news/pcNewsList.do',
		data:{"page":page,"limit":limit,"key":assortId},
		dataType:'json',
		success:function(data){
			$("#ul_art").html('');
			if(data.success){
				if(data.articleList!=""){
				$("#test li>a").removeClass("focus");
				
				for(var i=0;i<data.articleList.length;i++){
					var str = "<li><a href='"+cxt +'/index/news/'+data.articleList[i].id+'.do'+"'>"+
					"<div class='news_listtitle clearfix'><span class='pull-left'>"+data.articleList[i].title+"</span><em class='pull-right'>"+data.articleList[i].createDate+"</em></div></a></li>"
					$("#ul_art").append(str);
					
					$("#"+data.articleList[i].assortId).addClass("focus");
				}
				$("#firstTitle").text(data.articleList[0].assortId);
				data1(assortId,page,limit);
				}
			}else{
				alert("请联系管理员");
			}
		},
	});
}

function data1(id,page,limit){
	$.ajax({
		type:'post',
		url: cxt+'/news/queryTryArticleListPage.do',
		data:{"page":page,"limit":limit,"key":id},
		dataType:'json',
		success:function(data){
			//alert(data.rowNum);
			var totalPage = data.totalPage;
			var currentPage = data.rowNum/data.pageSize + 1;
			var firstPage = 1;
			var lastPage = totalPage;
			var prePage = currentPage==1?1:currentPage-1;
			var nextPage = currentPage==totalPage?totalPage:currentPage+1;
			$(".pagination").html('');
			var sb = "";
			for(var i = 1;i<=totalPage;i++){
				if(i==1){
					sb =sb+ "<li onclick='getId("+'"'+id+'"'+","+firstPage+","+limit+");'><a>&laquo;</a></li><li onclick='getId("+'"'+id+'"'+","+prePage+","+limit+");'><a>&#139;</a></li>";
				}
				sb =sb+"<li onclick='getId("+'"'+id+'"'+","+i+","+limit+");' ";
				if(i == currentPage){
					sb=sb+" class='active' ";
				}
				sb= sb +" ><a >"+i+" </a></li>";
				if(i==totalPage){
					sb = sb+"<li onclick='getId("+'"'+id+'"'+","+nextPage+","+limit+");'><a >&#155;</a></li> <li onclick='getId("+'"'+id+'"'+","+lastPage+","+limit+");'><a>&raquo;</a></li>";
				}
			}
			$(".pagination").append(sb);
			var a = $(".pagination .active a").html();
		
		},
	});
}*/