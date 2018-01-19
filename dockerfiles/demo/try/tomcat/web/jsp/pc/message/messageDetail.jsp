<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    <!------个人中心右侧start-------->
    <div class="col-sm-9 personal_right ">
     
      <div class="p_rightBottom p_r_con bgwhite"> 
        <!-------内容start----->
        <div class="title_wrap clearfix">
          <div class="title pull-left">消息中心</div>
           <a class="pull-right" onclick="linkUrl('messagelist','messageType=${trySysMessage.messageType}')">返回消息列表</a>
         </div>
        
      
          <div class=" news_wrap">
			<div class="news_con_head ">
				<h4>${trySysMessage.title }</h4>
				<div>
					<span>${trySysMessage.publishTime }</span>
				</div>
			</div>
			<div class="news_con">
				<p>${trySysMessage.content }</p>
			</div>
		</div> 
          
          
       
      
        <!-------内容end------> 
        
      </div>
    </div>
    <!-------个人中心右侧end------> 