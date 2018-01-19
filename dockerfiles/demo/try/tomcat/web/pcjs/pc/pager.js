
/**
 * 分页查询
 * @param pageNumber
 */
function showPcPage(pageNumber){	
	var limit = $("#pageSize").val();
	
	if(!pageNumber || !limit){
		pageNumber = 1;
		limit = 5;
	}
	
	var formData = $(".queryForm").serializeArray();
	formData.push({"name":"pageNumber","value":pageNumber});
	formData.push({"name":"limit","value":limit});
	
	
	var url = cxt + $("#table").attr("url");
	$.ajax({
	    type: 'POST',
	    url: url,
	    dataType: 'html',
	    data:formData,
	    success: function(data){
			var $data = $(data);
			if($data.size() > 0){
				$('#table,#showPage').html("");
				$('#table').append($data.find("#table").html());
				$('#showPage').append($data.find("#showPage").html());
			}
	    }
	});
	
}