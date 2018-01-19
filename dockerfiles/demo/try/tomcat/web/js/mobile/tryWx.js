$(function(){
	if(tryWx.isWeiXin5()){
		tryWx.initJsSdk();//初始化微信config
	}
});

/**
 * 结合微信JS-SDK封装( 前提引入微信JS文件)
 * * callback function 返回函数。
 */
var tryWx = {
		initJsSdk:function(){
			$.ajax({
	            url : cxt + "/index/getWxConfigSyn.do",
	            type : 'post',
	            dataType : 'json',
	            contentType : "application/x-www-form-urlencoded; charset=utf-8",
	            data : {
	                'url' : location.href.split('#')[0]
	            },
	            success : function(data) {
	                wx.config({
	                    debug : false,
	                    appId : data.data['appId'],
	                    timestamp : data.data['timestamp'],
	                    nonceStr : data.data['nonceStr'],
	                    signature : data.data['signature'],
	                    jsApiList : [ 'checkJsApi','chooseImage', 'uploadImage', 'downloadImage' ]
	                });
	            }
	        });
		},
		 //拍照或从手机相册中选图接口  
		wxuploadImage:function(callback) {
	        wx.chooseImage({  
	            count: 1,  
	            needResult: 1,  
	            sizeType: ['original', 'compressed'], // 可以指定是原图还是压缩图，默认二者都有  
	            sourceType: ['album', 'camera'], // 可以指定来源是相册还是相机，默认二者都有  
	            success: function (data) {  
	                var  localId = data.localIds[0].toString(); // 返回选定照片的本地ID列表，localId可以作为img标签的src属性显示图片
	                //上传图片接口  
	                wx.uploadImage({  
	                    localId: localId, // 需要上传的图片的本地ID，由chooseImage接口获得  
	                    isShowProgressTips: 1, // 默认为1，显示进度提示  
	                    success: function (res) {  
	                        var  mediaId = res.serverId; // 返回图片的服务器端ID 
	                        if(callback){
	                        	callback(mediaId,localId);
	                        }
	                    },  
	                    fail: function (error) {
	                        alert(Json.stringify(error));  
	                    }  
	                });
	            },  
	            fail: function (res) {  
	                alterShowMessage("操作提示", JSON.stringify(res), "1", "确定", "", "", "");  
	            }  

	        });  
	    },
	    //微信版本低于5.0 为flase
	    isWeiXin5:function(){
	        var ua = window.navigator.userAgent.toLowerCase();
	        var reg = /MicroMessenger\/[5-9]/i;
	        return reg.test(ua);
	    }
		
		
};