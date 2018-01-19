(function($){
	$.yb = {};
	$.yb.pc = {};
	$.yb.mobile = {};
	$.yb.pc.layer = {};
	
	$.ajaxSetup({
	  contentType: "application/x-www-form-urlencoded; charset=utf-8"
	});
	/**
	 * 倒计时,元素开是倒计时,倒计时期间为disabled
	 * text：倒计时的时候显示的文字
	 * second:计时多少秒
	 */ 
	$.fn.countDown = function(second,text){
		var oldHtml = $(this).html();
		if(!text){
			text = oldHtml;
		}
		var $this = $(this);
		$this.prop("disabled",true);
		var timer = setInterval(function(){
			$this.html(text + "(" + --second + ")")
			if(second <= 0){
				clearInterval(timer);
				$this.html(oldHtml);
				$this.prop("disabled",false);
			}
		}, 1000);
	}
	
	$.yb.calEarnings = function(amount,rate,term){
		return (amount * rate / appConstants.const_interest_year_day * term).toFixed(2);
	}
	
	var Browser = function(){
		this.userAgent = navigator.userAgent.toLowerCase();
		this.isIpad = this.userAgent.indexOf('ipad') > -1;		
	    this.isIphone = this.userAgent.indexOf('iphone') > -1;
	    this.isMidp = this.userAgent.indexOf('midp') > -1;
	    this.isUc7 = this.userAgent.indexOf('rv:1.2.3.4') > -1;
	    this.isUc = this.userAgent.indexOf('ucweb') > -1;
	    this.isAndroid = this.userAgent.indexOf('android') > -1;
	    this.isCE = this.userAgent.indexOf('windows ce') > -1;
	    this.isWM = this.userAgent.indexOf('windows mobile') > -1;	    
	    this.isWx = this.userAgent.indexOf('micromessenger') > -1; 
	    this.isPc = !(this.isIphone || this.isIpad || this.isAndroid);
	   
	};
	
	$.yb.browser = new Browser();
	
	if(layer && layer.config){
		layer.config({
			  skin: 'demo-class',
//			  skin: 'layui-layer-molv',
//			  skin: 'layui-layer-lan',
			  
			  
			  shade: [0.8,'#393D49']
			});
	}
	
	/**need layer.js*/
	$.yb.pc.alert = function(message,ok){
		layer.alert(message,function(index){
			if(ok){
				ok();
			}
			layer.close(index);
		});
	};
	
	$.yb.pc.confirm = function(message,ok,cancel){
		layer.confirm(message,function(index){
			if(ok){
				ok();
			}
			layer.close(index);
		},function(index){
			if(cancel){
				cancel();
			}
			layer.close(index);
		});
	};
	
	$.yb.pc.layer.close = function(){
		layer.closeAll();
	};
	
})(jQuery);