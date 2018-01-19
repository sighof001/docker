$(function(){
	var uploader = WebUploader.create({
	    // 选完文件后，是否自动上传。
	    auto: true,
	    // swf文件路径
	    swf: cxt + '/pcjs/Uploader.swf',
	    // 文件接收服务端。
	    server: cxt+ "/personal/headerImageUpload.do",
	    pick:"#pic1",
	    // 只允许选择图片文件。
	    accept: {
	        title: 'Images',
	        extensions: 'gif,jpg,jpeg,bmp,png',
	        mimeTypes: 'image/gif,image/jpg,image/jpeg,image/bmp,image/png'
	    },
	    fileVal: 'headerImage',
	    duplicate: true,
	    compress:{
	    	width: 425,
	 	    height: 638,
	        // 图片质量，只有type为`image/jpeg`的时候才有效。
	        quality: 70,
	        // 此属性可能会影响图片自动纠正功能
	        noCompressIfLarger: true,
	        // 单位字节，如果图片大小小于此值，不会采用压缩。
	        compressSize: 0
	    }
	});
	
	uploader.on('beforeFileQueued', function(file) {
		var extVal = "gif,jpg,jpeg,bmp,png";
		if(file.ext && extVal.indexOf(file.ext) == -1){
			tryModel.alert("格式不正确");
		}
	});
	
	uploader.on('uploadSuccess', function(file, resp) {
		if(resp.success){
			uploader.makeThumb(file,function(error, src) {
				$("#headImageText").text("");
				if($("#headPic")){
					$("#headPic").attr('src', src );
				}else if($("#defaultPic")){
					$("#defaultPic").attr('src', src );
				}
				if($(".personal_pic") && $(".personal_pic img")){
					$(".personal_pic img").attr('src', src );
				}
		    });
		}else{
			$("#headImageText").text(resp.message);
		}
    });
});

