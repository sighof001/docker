/**
 * title string 对话框标题
 * msg string 消息内容
 * callback function 返回函数。
 **/
var tryModel = {
		model:function (msg,btnArr){
		    var  title = '对话框';
		    var dialogHTML = '<div id="ycf-alert" class="modal">';
		    dialogHTML += '<div class=" modal-sm" style="margin: 180px auto;">';
		    dialogHTML += '<div class="loginmodal modal-content">';
		    dialogHTML += '<div class="modal-header">';
		    dialogHTML += '<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>';
		    dialogHTML += '<h5 class="modal-title"><i class="fa fa-exclamation-circle"></i> '+title+'</h5>';
		    dialogHTML += '</div>';
		    dialogHTML += '<div class="modal-body small"><p>'+msg+'</p></div>';
		    dialogHTML += '<div class="modal-footer" >';
		    dialogHTML += '</div>';
		    dialogHTML += '</div>';
		    dialogHTML += '</div>';
		    dialogHTML += '</div>';
		    
		    $('#ycf-alert').remove();
	        $('body').append(dialogHTML);
		        
		    if(btnArr){
		    	$('#ycf-alert').find('.modal-footer').empty();
		    	for(var i in btnArr){
		    		var btn = btnArr[i];
		    		var $btn = $('<button type="button" class="btn btn-primary ' + btn.className + '" data-dismiss="modal">' + btn.text + '</button>');
		    		$btn.click(btn.click);
		    		$('#ycf-alert').find('.modal-footer').append($btn) ;
		    	}
		    }
		    //确定
		    $("button.confirm").on("click",function(){
		    	//$('#ycf-alert').remove();
		        if (typeof callback == 'function') {
		            callback();
		        }
		        
		        $("#ycf-alert").modal('hide');
		        return false;
		    });
		    //取消
		    $("button.cancel").on("click",function(){
		    	
		    	$("#ycf-alert").modal('hide');
		    	return false;
		    });
		    $("#ycf-alert").modal('show');
		    
		    $('#ycf-alert button.confirm').focus();
		    
		    
		},

	   alert:function (msg,success){
			btnArr = [{text:'确定',className:'ok confirm',click:success}];
			this.model(msg,btnArr)
	   },

		confirm:function (msg,ok,cancel){
			btnArr = [
		          {text:'确定',className:'ok confirm',click:ok},
		          {text:'取消',className:'ok cancel',click:cancel}
			];
			this.model(msg,btnArr);
		},
		
		hide:function(){
			$("#ycf-alert").modal('hide');
		}

};