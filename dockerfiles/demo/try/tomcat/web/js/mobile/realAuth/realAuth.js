$(function() {
	$('input[name=idCard]').change(function() {
		checkIdCard();
		var idCard = $("#idCard").val();
		$.ajax({
			type:'post',
			url:cxt + '/bank/checkIdCard.do',
			data:{'idCard':trim(idCard)},
			dataType:'json',
			success:function(data){
				if(!data.success){
					$("#desc").show();
					$("#desc label").text(data.message);
					return false;
				}else{
					return true;
				}
			}
		});
	});
	// 初始化Web Uploader
	/*var uploader = WebUploader.create({
	    // 选完文件后，是否自动上传。
	    auto: true,
	    // swf文件路径
	    swf: cxt + '/pcjs/Uploader.swf',
	    // 文件接收服务端。
	    server: cxt+ "/myView/idCardImageUpload.do",
	    pick:".uploadImage",
	    // 只允许选择图片文件。
	    accept: {
	        title: 'Images',
	        extensions: 'gif,jpg,jpeg,bmp,png',
	        mimeTypes: 'image/gif,image/jpg,image/jpeg,image/bmp,image/png'
	    },
	    fileVal: "image1",
	    duplicate: true,
	    compress:{
	    	width: 425,
	 	    height: 638,
	        // 图片质量，只有type为`image/jpeg`的时候才有效。
	        quality: 90,
	        // 此属性可能会影响图片自动纠正功能
	        noCompressIfLarger: true,
	        // 单位字节，如果图片大小小于此值，不会采用压缩。
	        compressSize: 0
	    }
	});
	var $index = 0;
	$('.uploadImage').on('click',function(){
	    $index = $(this).index();//获取索引
	    if($index == 0){
    		uploader.option('fileVal', "image1");
		}else{
			uploader.option('fileVal', "image2");
		}
	    uploader.reset();
	});
	uploader.on('uploadSuccess', function(file,resp) {
		if(resp.success){
			uploader.makeThumb(file,function(error, src) {
				if($index == 0){
					$("#desc").hide();
					$("#desc label").text("");
					$("#pic1").removeClass("icon-papers");
					$("#span1").empty();
					$("#img_image1").attr("src","showImages.do?name=image1&"+ new Date().toTimeString());
				}else{
					$("#desc").hide();
					$("#desc label").text("");
					$("#pic2").removeClass("icon-papers1");
					$("#span2").empty();
					$("#img_image2").attr("src","showImages.do?name=image2&"+ new Date().toTimeString());
				}
		    });
		}else{
			$("#desc").show();
			$("#desc label").text(resp.message);
		}
	});*/
	
	if(tryWx.isWeiXin5()){
		//身份证正面图片上传(微信浏览器)
  	 // $("#image1").attr('type','text');
	  $("#pic1").on("click",function(){
	    		  tryWx.wxuploadImage(function(mediaId,localId){
	    			 $.post(cxt + '/personal/uploadWxImage.do',{mediaId:mediaId,property:"image1"},function(data){
	    					if(data.success){
	    						$("#desc").hide();
								$("#desc label").text("");
								$("#pic1").removeClass();
								$("#pic1").addClass("a-inputfile1");
								$("#span1").empty();
								$("#img_image1").attr("src",localId);
								$("#img_image1").attr("position", "relative");
								$("#img_image1").attr("width", "210");
								$("#img_image1").attr("height", "150");
	    					}
	    				},"json");
	    			 
	    		  });
	      });
	    //身份证反面图片上传(微信浏览器)
	  	 // $("#image2").attr('type','text');
		  $("#pic2").on("click",function(){
		    		  tryWx.wxuploadImage(function(mediaId,localId){
		    			 $.post(cxt + '/personal/uploadWxImage.do',{mediaId:mediaId,property:"image2"},function(data){
		    					if(data.success){
		    						$("#desc").hide();
									$("#desc label").text("");
									$("#pic2").removeClass();
									$("#pic2").addClass("a-inputfile1");
									$("#span2").empty();
									$("#img_image2").attr("src",localId);
									$("#img_image2").attr("width", "210");
									$("#img_image2").attr("height", "150");
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
		    server: cxt+ "/myView/idCardImageUpload.do",
		    pick:".uploadImage",
		    // 只允许选择图片文件。
		    accept: {
		        title: 'Images',
		        extensions: 'gif,jpg,jpeg,bmp,png',
		        mimeTypes: 'image/gif,image/jpg,image/jpeg,image/bmp,image/png'
		    },
		    fileVal: "image1",
		    duplicate: true,
		    compress:{
		    	width: 425,
		 	    height: 638,
		        // 图片质量，只有type为`image/jpeg`的时候才有效。
		        quality: 90,
		        // 此属性可能会影响图片自动纠正功能
		        noCompressIfLarger: true,
		        // 单位字节，如果图片大小小于此值，不会采用压缩。
		        compressSize: 0
		    }
		});
		var $index = 0;
		$('.uploadImage').on('click',function(){
		    $index = $(this).index();//获取索引
		    if($index == 0){
	    		uploader.option('fileVal', "image1");
			}else{
				uploader.option('fileVal', "image2");
			}
		    uploader.reset();
		});
		uploader.on('uploadSuccess', function(file,resp) {
			if(resp.success){
				uploader.makeThumb(file,function(error, src) {
					if($index == 0){
						$("#desc").hide();
						$("#desc label").text("");
						$("#pic1").removeClass("icon-papers");
						$("#span1").empty();
						$("#img_image1").attr("src","showImages.do?name=image1&"+ new Date().toTimeString());
					}else{
						$("#desc").hide();
						$("#desc label").text("");
						$("#pic2").removeClass("icon-papers1");
						$("#span2").empty();
						$("#img_image2").attr("src","showImages.do?name=image2&"+ new Date().toTimeString());
					}
			    });
			}else{
				$("#desc").show();
				$("#desc label").text(resp.message);
			}
		});
	}
	


	/*$('input[name=realName]').change(function() {
		checkRealName();
	});
	$('input[name=idCard]').change(function() {
		checkIdCard();
	});*/
	/*$('input[name=image1]').change(function() {
		checkImage1();
	});
	$('input[name=image2]').change(function() {
		checkImage2();
	});*/

	// 输入时,错误提示隐藏
	$("input").on('input', function(e) {
		// $.alert('服务器异常!');
		$("#desc").hide();
		$("#desc label").text("");
	});

	// 添加
	$("#add").on(
			"click",
			function() {
				var realName = $("#realName").val();
				if (!realName) {
					$("#desc").show();
					$("#desc label").text("姓名不能为空!");
					return;
				}
				if (checkRealName()&&checkIdCard() && checkImage1() != "" && checkImage2() != "" ) {
					var formData = $("#form").serializeArray();
					$.ajax({
						type : 'post',
						url : cxt + '/myView/submitAuth.do',
						data : formData,
						dataType : 'json',
						success : function(data) {
							if (data.success) {
								location.href = cxt
										+ "/myView/sumbitSuccess.do";
							} else {
								$("#desc").show();
								$("#desc label").text(data.message);
							}

						},
						error : function(result) {
							$("#desc").show();
							$("#desc label").text("服务器异常!");
						}
					});
				}
			});
});

// 去掉前后空格
function trim(str) {
	var strnew = str.replace(/^\s*|\s*$/g, "");
	return strnew;
}

// 校验姓名
function checkRealName() {
	var realName = $("#realName").val();
	if (!realName) {
		$("#desc").show();
		$("#desc label").text("姓名不能为空!");
		return false
	}
	if (realName.length>10) {
		$("#desc").show();
		$("#desc label").text("姓名长度不能超过10个字");
		return false
	}
	// 只能只中文
	var pattern = /[\u4e00-\u9fa5]/;
	if (!pattern.test(realName)) {
		$("#desc").show();
		$("#desc label").text("请输入正确的中文姓名!");
		return false;
	}
	return true;
}

// 校验身份证号码
function checkIdCard() {
	var aCity={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外"} 
	var idCard = $("#idCard").val();
	var iSum = 0;
	var info = "";
	if (!idCard) {
		$("#desc").show();
		$("#desc label").text("身份证号不能为空!");
		return false
	}
	if (!/^\d{17}(\d|x)$/i.test(idCard)) {
		$("#desc").show();
		$("#desc label").text("你输入的身份证长度或格式错误");
		return false;
	}
	idCard = idCard.replace(/x$/i, "a");
	if (aCity[parseInt(idCard.substr(0, 2))] == null) {
		$("#desc").show();
		$("#desc label").text("你的身份证地区非法");
		return false;
	}
	sBirthday = idCard.substr(6, 4) + "-" + Number(idCard.substr(10, 2)) + "-"
			+ Number(idCard.substr(12, 2));
	var d = new Date(sBirthday.replace(/-/g, "/"));
	if (sBirthday != (d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d
			.getDate())) {
		$("#desc").show();
		$("#desc label").text("身份证上的出生日期非法");
		return false;
	}
	return true;

	/*
	 * var idCard = $("#idCard").val(); var pattern
	 * =/^[1-9]{1}[0-9]{14}$|^[1-9]{1}[0-9]{16}([0-9]|[xX])$/; if(!idCard){
	 * $("#desc").show(); $("#desc label").text("身份证不能为空!"); return false; }
	 * if(!pattern.test(idCard)){ $("#desc").show(); $("#desc
	 * label").text("请输入正确的身份证号!"); return false; } return true;
	 */
}
// 校验身份证正面照片
function checkImage1() {
	var image1 = $("#img_image1").attr("src");
	// var image1 = $("#image1").attr("value");
	// var image1=document.getElementById("#image1").value();
	// console.log(image1);
	if (image1 == "") {
		$("#desc").show();
		$("#desc label").text("身份证正面不能为空!");
		return false;
	}
}
// 校验身份证反面照片
function checkImage2() {
	var image2 = $("#img_image2").attr("src");
	// var image2 = $("#image2").attr("value");
	// var image2=document.getElementById("#image2").value();
	//console.log(image2);
	if (image2 == "") {
		$("#desc").show();
		$("#desc label").text("身份证反面不能为空!");
		return false;
	}
}
