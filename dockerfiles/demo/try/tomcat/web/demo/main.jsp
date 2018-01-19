<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/base.css"></link>
<style type="text/css">

#center{
overflow:auto;
padding-left: 2%;
}
.center_div{
    border: 1px outset #ccc;
    height: 95px;
    margin: 3px;
    width: 180px;
/*     box-shadow: 10px 10px 5px #888888; */
}
#center .center_div{
float: left;
background-color: #306289;
}
#center .center_div ul li{
text-align: center;
color:#DDF1FA;
}
#center_left{
width: 80%;
/* border: 1px dashed red;  */
float: left;
}
#center_right{
float: left;
/* border: 1px dashed #000; */
color:#000;
font-weight:bold;
width: 18%;
}
#center_right_tool{
font-weight:bold;
font-size: 16px;
}
#center_left_tool{
/* border-bottom: 1px dashed #000; */
color:#DDF1FA;
font-weight:bold;
height: 50px;
}
#center_left_tool ul li{
float: left;
width: 25%;
position: relative;
top: 10px;
}
#center_left_tool ul li input
,#center_left_tool ul li select{
width: 40%;
}
#center_left_btn{
padding-left: 2.5%;
}
#center_right_tool{
height: 50px;
text-align: left;
position: relative;
top: 10px;
}
#center_right_li ul li{
line-height: 25px;
text-align: left;
}
#center_right_label{
padding: 5px;
position: relative;
top: 5px;
}
#center_right_label p{
line-height: 30px;
}
.line{
/* border-bottom: 1px dashed #ccc; */
margin-bottom: 3px;
margin-top: 10px;
font-size: 16px;
}
#left_menu{
/* background-color: #53BCDC; */
background-image:url("images/right_menu.png");
color:#000;
height: 180px;
width:140px;
position: absolute;
border-bottom: 1px dashed #ccc;
border-radus:2px;
}

#left_menu ul li{
font-weight: bold;
line-height: 30px;
text-align: center;
cursor: pointer;
width: 100%;
}


</style>
</head>
<body>
<div id="main">
	<!-- top -->
	<jsp:include page="top.jsp"></jsp:include>
	<!-- main-->
	<div id="center">
			<div id="center_left">
				<div id="center_left_tool">
					<ul>
						<li>
							显示所有类型：<select></select>
						</li>
						<li>
							显示所有状态：<select></select>
						</li>
						<li>
							显示所有区域：<select></select>
						</li>
						<li>
							查询房名：<input type="text">
						</li>
					</ul>
				</div>
				<div id="center_left_btn">
					<div class="center_div">
						<ul>
						<li><h3>VIP1大房</h3></li>
						<li>开台：22:00</li>
						<li>用时：1:30</li>
						<li>
						<span>换台</span>&nbsp;&nbsp;
						<span>商品</span>&nbsp;&nbsp;
						<span>波钟</span>
						</li>
						</ul>
					</div>
				</div>
			</div>
			<div id="center_right">
				<div id="center_right_tool">
					当前所有房间|房间状态
				</div>
				<p class="line">当前房间状态</p>
				<div id="center_right_li">
					<ul>
						<li>房间名称：VIP1大房</li>
						<li>房间类型：VIP1</li>
						<li>房间区域：天字一号</li>
						<li>最低消费：￥200</li>
						<li>房间状态：已开</li>
						<li>宾客人数：5</li>
						<li>值班人员：1</li>
						<li>进店时间：20：00</li>
						<li>在店时长：60分钟</li>
						<li>备注说明：预定</li>
					</ul>					
				</div>
				<p class="line">所有房间总状态</p>
				<div id="center_right_label">
					<p>
					<label>当前可供：20</label>
					<label>当前占用：1</label>
					</p>
					<p>
					<label>当前预定：5</label>
					<label>当前停用：0</label>
					</p>
				</div>
			</div>
	</div>
	
	<!--  foot-->
<!-- 	<div id="foot">foot</div> -->
	
	<div style="display: none;" id="left_menu">
		<ul>
			<li>
			
				<img alt="" src="images/icons/clock_play.png">
				开台计时
				
			</li>
		</ul>
		<ul>
			
			<li>
			
			<img alt="" src="images/icons/clock_stop.png">
			收台关灯
		
			</li>
		</ul>
		<ul>
			
			<li>
				<img alt="" src="images/icons/calculator.png">
			计算收费
			</li>
		</ul>
		<ul>
			<li><img alt="开台计时" src="images/icons/calculator_edit.png">计算波钟</li>
		</ul>
		<ul>
			<li><img alt="开台计时" src="images/icons/arrow_switch.png">转台操作</li>
		</ul>
		<ul>
			<li><img alt="开台计时" src="images/icons/status_away.png">消费状态</li>
		</ul>
	</div>
</div>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
var h=window.screen.height;
//var w=window.screen.width;
//var fh=$("#foot").height();
var fh=0;
var th=$("#top").height();
var countH=(h-fh-th)-110;
$("#center").height(countH);
$("#center_right").height(countH-10);
$("#center_left").height(countH-10);


data();
function data(){
	var html=$("#center_left_btn").find(".center_div").eq(0).prop('outerHTML');
	for (var i = 1; i <20; i++) {
		html=html.replace("VIP"+i,"VIP"+(i+1));
		$("#center_left_btn").append(html);
	}
}
//禁用右键
$(document).bind("contextmenu",function(e){   
    return false;   
});
$('.center_div').mousedown(function(e){
	 var e = e || window.event
	 var obj=$(this);
	var x=e.screenX;
	var y=e.screenY;
	var top=parseFloat(y)-obj.height();
    if(3 == e.which){
    	$("#left_menu").css({"left":(x-10),"top":(top-10)});
         $("#left_menu").slideDown(500);
    }else if(1 == e.which){
     //        alert('这 是左键单击事件');
     }
    return false;
  });
   $("#left_menu").mouseover(function(){
	$("#left_menu").show();
});
$("#left_menu").mouseout(function(){
	$("#left_menu").hide();
});
</script>
</body>
</html>