/**
 * 加载提交时等待方法
 */
function submitWaiting(){
	art.dialog.through({
		id: 'broadcastLoading',
		title: false,
	    content: '<img src="' + cxt + '/image/loading.gif" />',
	    lock: true
	});
}
/**
 * 两个日期相差几天 date2 - date1
 * 以天为单位,参数格式yyyy-MM-dd
 */
function getDateDiff(date1,date2){
	var d1 = stringToDate(date1);
	var d2 = stringToDate(date2);
	var miliseconds = d2.getTime() - d1.getTime();
	
	var dateDiff = miliseconds / (1000 * 60 * 60 * 24);
	
	return dateDiff;
}

/**字符串转化为date对象
 * 格式yyyy-MM-dd
 * 或 yyyy-MM-dd HH:mm:ss
 * */
function stringToDate(str){
	var arr = str.split(' ');
	var dateArr = arr[0].split('-');	
	var timeArr;
	if(arr[1]){
		timeArr = arr[1].split(':');
	}else{
		timeArr = [0,0,0];
	}
	
	var date = new Date();
	date.setFullYear(parseInt(dateArr[0],10), parseInt(dateArr[1],10) - 1, parseInt(dateArr[2],10));
	date.setHours(parseInt(timeArr[0],10), parseInt(timeArr[1],10), parseInt(timeArr[2],10), 0);
	
	return date;
}

/**
 * 返回当前时间,格式：yyyy-MM-dd
 * 
 * dif:如果无该参数为当天，如果有为当前日期加上该天数
 * 如，dif为1，为下一天，dif为-1为前一天
 * 
 * */
function getYyyy_MM_dd(dif){
	var now = new Date();
	if(dif){
		now.setDate(now.getDate() + dif);
	}
	var month = now.getMonth() + 1;
	var date = now.getDate();
	var monthStr = month < 10 ? '0' + month : month;
	var dateStr = date < 10 ? '0' + date : date;
	return now.getFullYear() + '-' + monthStr + '-' + dateStr;
}

function showFieldError(ele,message){
	ele.closest('div').removeClass('has-success').addClass('has-error');
	if(message){
		$("#"+ele.attr("data-describedby")).html(message);
	}
	ele.focus();
}

function hideFieldError(ele){
	ele.closest('div').removeClass('has-error').addClass('has-success');
	$("#"+ele.attr("data-describedby")).html("");
}

function initGroup(){	
	$('.group-title').click(function(){
		$(this).parent('.group-box').toggleClass('box-hide');
	});
}

/**
 * 联动select
 * 1,下级select需要有pId属性，值为上级select的id
 * 2,url接收parentId参数
 * @param el 当前获取数据的select
 * @param dataUrl 获取数据的url
 * @param callback 回调函数
 */
function getLinkedSelect(el,dataUrl,callback){
	if(!el || el.size() == 0){
		return;
	}
	var param = {};
	var parentId = el.attr('pId'); 
	if(parentId && parentId != ''){
		param.parentId = $('#' + parentId).val();
	}
	$.post(dataUrl,param,function(data){
		if(!data){
			return;
		}
		el.empty();
		for(var i in data){
			var o = data[i];
			el.append($('<option value="' + o.id + '">' + o.typeName + '</option>'));
		}
		
		if(callback){
			callback();
		}
	},"json");
}

var fmpUtils = {
	//保存状态
	saveStatus:{
		//暂存
		isTemp:function(status,saveStatus){
			if(this.isSubmited(status, saveStatus)){
				return false;
			}
			
			if(saveStatus == const_save_status_temp){
				return true;
			}
			
			return false;
		},
		//保存
		isSaved:function(status,saveStatus){
			if(this.isSubmited(status, saveStatus)){
				return false;
			}
			
			if(saveStatus == const_save_status_saved){
				return true;
			}
			
			return false;
		},
		//提交
		isSubmited:function(status,saveStatus){
			if(status == const_hs_status_shtg || status == const_hs_status_in_sh){
				return true;
			}
			
			return false;
		}
	}
};
/*
 * 判断字符是否为Null或空
 */
function isNullOrEmpty(value){
	if(value!=null&&value!="") return true;
	else return false;
}

/**
 * 给编辑页面填充实体数据
 * @param data 实体数据
 */
function fillEdit(data){
	for(var i in data){
		var input = $('input[name="' + i + '"]');
		if(input.size() > 0){
			input.val(data[i]);
			continue;
		}
		
		var select = $('select[name="' + i + '"]');
		if(select.size() > 0){
			var os = select.find('option');
			if(os.size() > 0){
				for (var j = 0; j < os.size(); j++) {
					var option = os.eq(j);
					if(option.attr('value') == data[i]){
						option.prop("selected",true);
						break;
					}
				}
			}
			continue;
		}
		
		
	}
	
	return false;
}

/**  
 * 将数值四舍五入(保留2位小数)后格式化成金额形式  
 *  
 * @param num 数值(Number或者String)  
 * @return 金额格式的字符串,如'1,234,567.45'  
 * @type String  
 */    
function formatCurrency(num) {    
    num = num.toString().replace(/\$|\,/g,'');    
    if(isNaN(num))    
    num = "0";    
    sign = (num == (num = Math.abs(num)));    
    num = Math.floor(num*100+0.50000000001);    
    cents = num%100;    
    num = Math.floor(num/100).toString();    
    if(cents<10)    
    cents = "0" + cents;    
    for (var i = 0; i < Math.floor((num.length-(1+i))/3); i++)    
    num = num.substring(0,num.length-(4*i+3))+','+    
    num.substring(num.length-(4*i+3));    
    return (((sign)?'':'-') + num + '.' + cents);    
} 

function autoAddZero(num,count){
	var zero='1';
	if(isNaN(count)){
		return false;
	}
	if(!isNullOrEmpty(count)){
		zero='100';
	}else{
		for(var i=0;i<count;i++){
			zero +='0';
		}
	}
	if(isNaN(num)){
		return false;
	}
	var f=parseFloat(num);
	if(isNaN(f)){
		return false;
	}
	var f=Math.round(num*zero)/zero;
	var s=f.toString();
	var rs=s.indexOf('.');
	if(rs<0){
		rs=s.length;
		s+='.';
	}
	while(s.length<=rs+count){
		s+='0';
	}
	return s;
}

/**
 * 常量 数值长度；
 */
function getValueSize(){
	return 20;
}