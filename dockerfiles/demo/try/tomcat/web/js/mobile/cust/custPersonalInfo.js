$(function(){
	//
	 $("#scroller").mobiscroll().date();  
     // $("#scroll2").mobiscroll().image_text();  
        
      var currYear = (new Date()).getFullYear();    

      //初始化日期控件  
      var opt = {  
          preset: 'date', //日期，可选：date\datetime\time\tree_list\image_text\select  
          theme: 'android-ics light', //皮肤样式，可选：default\android\android-ics light\android-ics\ios\jqm\sense-ui\wp light\wp  
          display: 'bottom', //显示方式 ，可选：modal\inline\bubble\top\bottom  
          mode: 'scroller', //日期选择模式，可选：scroller\clickpick\mixed  
          lang:'zh',  
          dateFormat: 'yyyy-mm-dd', // 日期格式  
          setText: '确定', //确认按钮名称  
          cancelText: '取消',//取消按钮名籍我  
          dateOrder: 'yyyymmdd', //面板中日期排列格式  
          dayText: '日', monthText: '月', yearText: '年', //面板中年月日文字  
          showNow: false,    
          nowText: "今",    
          startYear:currYear-100, //开始年份    
          endYear:currYear, //结束年份    
          maxDate: new Date(),
          //endYear:2099 //结束年份 
          onSelect: function (valueText, inst) {  
              $(this).find(".inputtxt1").html(valueText);  
              $.post("submitBirthday.do", {birthday: valueText}, function (result) { 
                  if (result == 'ok') { 
                      $(this).find(".inputtxt1").html(valueText); 
                  } 
                  else { 
                      //error('网络繁忙，请您稍后再试'); 
                  } 
              });
          }  
      };  
        
      $("#scroller").mobiscroll(opt);  
     /* var uploader = WebUploader.create({
  	    // 选完文件后，是否自动上传。
  	    auto: true,
  	    // swf文件路径
  	    swf: cxt + '/pcjs/Uploader.swf',
  	    // 文件接收服务端。
  	    server: cxt+ "/personal/headerImageUpload.do",
  	    pick:".headImageUpload",
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
  	uploader.on('uploadSuccess', function(file, resp) {
  		if(resp.success){
  			uploader.makeThumb(file,function(error, src) {
  	  			if($("#headPic")){
  	  				$("#headPic").attr('src', src );
  	  				console.log("文件"+file);
  	  				console.log("路径"+src);
  	  			}else if($("#defaultPic")){
  	  				$("#defaultPic").attr('src', src );
  	  			}
  	  	    });
  		}else{
  			$("#desc").show();
			$("#desc label").text(resp.message);
  		}
     });*/
  	//点击file事件先判断
     if(tryWx.isWeiXin5()){
    	//图片上传(微信浏览器)
    	 //$(".headImageUpload").attr('type','text');
	      $(".headImageUpload").on("click",function(){
    		  tryWx.wxuploadImage(function(mediaId,localId){
    			 $.post(cxt + '/personal/uploadWxImage.do',{mediaId:mediaId,property:"headerImage"},function(data){
    					if(data.success){
    						$("#headPic").attr("src",localId);  
    		        		$("#defaultPic").attr("src",localId);
    					}
    				},"json");
    			 
    		  });
	      });
      }else{
    	  var uploader = WebUploader.create({
    	  	    // 选完文件后，是否自动上传。
    	  	    auto: true,
    	  	    // swf文件路径
    	  	    swf: cxt + '/pcjs/Uploader.swf',
    	  	    // 文件接收服务端。
    	  	    server: cxt+ "/personal/headerImageUpload.do",
    	  	    pick:".headImageUpload",
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
    	  	uploader.on('uploadSuccess', function(file, resp) {
    	  		if(resp.success){
    	  			uploader.makeThumb(file,function(error, src) {
    	  	  			if($("#headPic")){
    	  	  				$("#headPic").attr('src', src );
    	  	  				console.log("文件"+file);
    	  	  				console.log("路径"+src);
    	  	  			}else if($("#defaultPic")){
    	  	  				$("#defaultPic").attr('src', src );
    	  	  			}
    	  	  	    });
    	  		}else{
    	  			$("#desc").show();
    				$("#desc label").text(resp.message);
    	  		}
    	     });
    	  
      }

  //点击file事件先判断
   /* if(tryWx.isWeiXin5()){
  	//图片上传(微信浏览器)
    	debugger;
  	 $("input[name=file]").attr('type','text');
	      $("input[name=file]").on("click",function(){
  		  tryWx.wxuploadImage(function(mediaId,localId){
  			 $.post(cxt + '/personal/uploadWxImage.do',{mediaId:mediaId,property:"headerImage"},function(data){
  					if(data.success){
  						$("#headPic").attr("src",localId);  
  		        		$("#defaultPic").attr("src",localId);
  					}
  				},"json");
  			 
  		  });
	      });
    }else{
  	  
  	  
  	  
  	  	//图片上传(其他浏览器)
  		// input框改变的时候将图片发送给后台  
  		$("input[name=file]").change(function() {
  		    var formData = new FormData($("#form")[0]);
  		    $.ajax({  
  		        url : "headerImageUpload.do",
  		        type : "POST", 
  		        dataType:'json',
  		        data : formData,  
  		        async : false,  
  		        cache : false,  
  		        contentType : false,  
  		        processData : false,  
  		        success : function(data) {  
  		        	if(!data.success){
  		        		$("#desc").show();
  						$("#desc label").text(data.message);
  		        	}else{
  		        		$("#desc").hide();
  		        		$("#desc label").text("");
  		        		$("#headPic").attr("src","showImages.do?name=headerImage&"+new Date().toTimeString());  
  		        		$("#defaultPic").attr("src","showImages.do?name=headerImage&"+new Date().toTimeString());  
  		        	}
  		        },  
  		        error : function(returndata) {  
  		        	$("#desc").show();
  					$("#desc label").text("服务器异常");
  		        }  
  		    });  
  		}); 
  	  
    }*/

	
	
	
	$(".clickFile").on("click",function(){
		$("#headerImage").click();
	});
	
	
	//输入时,错误提示隐藏
	$("input").on('input',function(e){  
		//$.alert('服务器异常!');
		$("#desc").hide();
		$("#desc label").text("");
	}); 
});


/*function success(path){
    $("#headPic").attr("src",path);  
	$("#defaultPic").attr("src",path);
}*/



