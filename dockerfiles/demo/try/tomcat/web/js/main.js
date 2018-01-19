$(function(){  
	fillUIContent();
});
 
var tab=function(tab_content,tab_item,tbaNavUl,tabNavOn){
	$(tab_content).find(tab_item).eq(0).show().siblings().hide();
	$(tbaNavUl).children("li").on("tap",function(){
    
		index=$(tbaNavUl).children("li").index(this);

		$(this).addClass(tabNavOn).siblings().removeClass(tabNavOn);

		$(tab_content).find(tab_item).eq(index).show().siblings().hide();

		});

	}; 
 function navChangeArea(message, height) {
     var liveDiv2 = $("#" + message).length ? $("#" + message) : $("." + message);
     if(/android/i.test(navigator.userAgent)){ 
        var scrollTop = document.documentElement.scrollTop || document.body.scrollTop;
        if (scrollTop < height) {
			liveDiv2.css("top",0);
            liveDiv2.css("position", "relative");
        } else { 
		    liveDiv2.css("top",height);
            liveDiv2.css("position", "fixed");
        }
     }
     if(/(iPhone|iPad|iPod|iOS)/i.test(navigator.userAgent)){
        liveDiv.addClass("sticky");
      }
     } 
	 
var fixtop=function(header,livediv){ 
	height=$(header).height();
    $(window).on("scroll", function() {
    navChangeArea(livediv, height);
     });
    $(window).on("touchmove", function() {
    navChangeArea(livediv, height);
    });
    }

/**
 * 页面中间的content区域的高度设置为100%
 * param always 无论什么时候都调整
 */
var fillUIContent = function(always){
	var screenheight = $.mobile.getScreenHeight();  
	var header = $(".ui-header").hasClass("ui-header-fixed") ? $(".ui-header").outerHeight()  - 1 : $(".ui-header").outerHeight();  
	var footer = $(".ui-footer").hasClass("ui-footer-fixed") ? $(".ui-footer").outerHeight() - 1 : $(".ui-footer").outerHeight();  
	/* content div has padding of 1em = 16px (32px top+bottom). This step 
	   can be skipped by subtracting 32px from content var directly. */  
	var bodyheight=document.body.clientHeight;
	if(always || bodyheight>=screenheight){
		var contentCurrent = $(".ui-content").outerHeight() - $(".ui-content").height();  
		var content = screenheight - header - footer - contentCurrent;  
		$(".ui-content").height(content); 
	}
}
	