var t=3;//设定跳转的时间 
setInterval("refer()",1000); //启动1秒定时 
function refer(){ 
if(t==1){ 
location=cxt+"/login/loginView.do"; //#设定跳转的链接地址 
} 
document.getElementById('show').innerHTML="成功修改密码,请重新登录!"+t+"秒后进入登录页面..."; // 显示倒计时 
t--; 
} 