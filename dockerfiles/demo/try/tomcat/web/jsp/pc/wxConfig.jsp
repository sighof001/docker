<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" />
<title>JSSDk配置</title>
<script type="text/javascript" src="https://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/pcjs/jquery.min.js"></script>
<script type="text/javascript">
    function jssdk() {
    	alert(location.href.split('#')[0]);
        $.ajax({
            url : "https://app.jindatry.com/index/getWxConfigSyn.do",
            type : 'post',
            dataType : 'json',
            contentType : "application/x-www-form-urlencoded; charset=utf-8",
            data : {
                'url' : location.href.split('#')[0]
            },
            success : function(data) {
            	console.log("appId:"+data.data['appId']);
            	console.log("timestamp:"+data.data['timestamp']);
            	console.log("nonceStr:"+data.data['nonceStr']);
            	console.log("signature:"+data.data['signature']);
            	console.log("jsapi_ticket:"+data.data['jsapi_ticket'])
                wx.config({
                    debug : true,
                    appId : data.data['appId'],
                    timestamp : data.data['timestamp'],
                    nonceStr : data.data['nonceStr'],
                    signature : data.data['signature'],
                    jsApiList : [ 'checkJsApi','chooseImage', 'uploadImage', 'downloadImage' ]
                });
            }
        });
    }
 
    function isWeiXin5() {
        var ua = window.navigator.userAgent.toLowerCase();
        var reg = /MicroMessenger\/[5-9]/i;
        return reg.test(ua);
    }
 
    window.onload = function() {
        //     if (isWeiXin5() == false) {
        //           alert("您的微信版本低于5.0，无法使用微信支付功能，请先升级！");
        //         }
        jssdk();
    };
    
  //拍照或从手机相册中选图接口  
    function wxuploadImage(callback) { 
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
    }  
  
  
    function wxChooseImage() {  
          
    	wxuploadImage(function(mediaId,localId){
    		$(".myimg").attr("src", localId); 
    	});
    }  
    
    
</script>
</head>
<body>
<h1>
<input type="button" onclick="wxChooseImage();" value="选择图片"/>
</h1>

<div>
<img alt="这是一张图片" src="" class="myimg"/>

</div>


</body>
</html>