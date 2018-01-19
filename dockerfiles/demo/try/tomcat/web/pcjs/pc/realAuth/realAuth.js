$(document).ready(function() {
	$('input[name=realName]').change(function() {
		checkRealName();
	});
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
					$("#idCardText").text(data.message);
					$('.telvalid').prop("disabled",true);
					return false;
				}else{
					$('.telvalid').prop("disabled",false);
					return true;
				}
			}
		});
	});
	// 初始化Web Uploader
	var uploader = WebUploader.create({
	    // 选完文件后，是否自动上传。
	    auto: true,
	    // swf文件路径
	    swf: cxt + '/pcjs/Uploader.swf',
	    // 文件接收服务端。
	    server: cxt+ "/myView/idCardImageUpload.do",
	    pick:".ID_wrap",
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
	$('.ID_wrap').on('click',function(){
	    $index = $(this).index('.ID_wrap');//获取索引
	    if($index == 0){
    		uploader.option('fileVal', "image1");
		}else{
			uploader.option('fileVal', "image2");
		}
	    uploader.reset();
	});
	
	uploader.on('beforeFileQueued', function(file) {
		var extVal = "gif,jpg,jpeg,bmp,png";
		if(file.ext && extVal.indexOf(file.ext) == -1){
			tryModel.alert("格式不正确");
		}
	});
	
	uploader.on('uploadSuccess', function(file,resp) {
		console.info(resp);
		if(resp.success){
			uploader.makeThumb(file,function(error, src) {
				if($index == 0){
					$("#div1").html("");
					$("#div1").append("<img id='img_image1' style='width: 220px; height: 150px;' src='"+src+"' />");
				}else{
					$("#div2").html("");
					$("#div2").append("<img id='img_image2' style='width: 220px; height: 150px;' src='"+src+"' />");
				}
		    });
		}else{
			tryModel.alert(resp.message);
		}
	});
	
	//实名认证提交
	$("#submit").on("click",function(){
		if(checkRealName()&&checkIdCard()&&checkImage1()&&checkImage2()){
			var formData = $("#form").serializeArray();
			$.ajax({
				type:'post',
				url:cxt + '/myView/submitAuth.do',
				dataType:'json',
				data:formData,
				success:function(data){
					if(data.success){
						//触发点击实名认证
					    $(".p_realname").trigger("click");
					}else{
						tryModel.alert(data.message);
					}
				},
				error:function(result){
					tryModel.alert("服务器异常");
				}
			});
		}
	});
});
//检验姓名是否为空
function checkRealName(){
	var realName = $("#realName").val();
	if(!realName){
		$("#realNameText").text("姓名不能为空!");
		return false;
	}
	$("#realNameText").text("");
	return true;
}
//检验身份证是否为空
function checkIdCard(){
	var aCity={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外"} 
	var idCard = $("#idCard").val();
	var iSum = 0;
	var info = "";
	if(!idCard){
		$("#idCardText").text("身份证不能为空!");
		return false;
	}
	if (!/^\d{17}(\d|x)$/i.test(idCard)) {
		$("#idCardText").text("你输入的身份证长度或格式错误");
		return false;
	}
	idCard = idCard.replace(/x$/i, "a");
	if (aCity[parseInt(idCard.substr(0, 2))] == null) {
		$("#idCardText").text("你的身份证地区非法");
		return false;
	}
	sBirthday = idCard.substr(6, 4) + "-" + Number(idCard.substr(10, 2)) + "-"
			+ Number(idCard.substr(12, 2));
	var d = new Date(sBirthday.replace(/-/g, "/"));
	if (sBirthday != (d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d
			.getDate())) {
		$("#idCardText").text("身份证上的出生日期非法");
		return false;
	}
	$("#idCardText").text("");
	return true;
}
//校验身份证正面照片
function checkImage1() {
	//var image1 = $("#image1").val();
	var image1 = $("#img_image1").attr("src");
	if (image1 == "") {
		$("#image1Text").text("身份证资料不能为空!");
		return false;
	}
	$("#image1Text").text("");
	return true;
}
// 校验身份证反面照片
function checkImage2() {
	//var image2 = $("#image2").val();
	var image2 = $("#img_image2").attr("src");
	if (image2 == "") {
		$("#image2Text").text("身份证资料不能为空!");
		return false;
	}
	$("#image2Text").text("");
	return true;
}



