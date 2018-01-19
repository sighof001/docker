$(function(){
	$('.links').click(function(){
		var url = cxt + $(this).attr("url");
		 $.ajax({
	        type: 'POST',
	        url: url,
	        dataType: 'html',
	        success: function(data){
	        	var $data = $(data);
	    		$('.content').html("");
	    		if($data.size() > 0){
	    			$('.content').append(data);
	    		}
	        }
	    }); 
	});
});