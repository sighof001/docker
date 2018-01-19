<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<div class="container-fluid footer">
  <div class="container">
    <div class="row">
      <div class="col-sm-2 twocode"></div>
      <div class="col-sm-2 wxgzhcode"></div>
      <div class="col-sm-4">
        <div class="row">
          <div class="col-sm-6">
            <h4>关于金达</h4>
            <ul>
              <li><a href="<%=request.getContextPath()%>/index/news/${articleAboutCompany.id}.do">公司简介</a></li>
              <li><a href="<%=request.getContextPath()%>/news/pcCompanyDynamics.do">公司动态</a></li>
              <li><a href="<%=request.getContextPath()%>/news/pcCompanyCulture.do">企业文化</a></li>
            </ul>
          </div>
         <!--  <div class="col-sm-4">
            <h4>保障方式</h4>
            <ul>
              <li><a href="###">保险公司合作</a></li>
              <li><a href="###">法律法规</a></li>
              <li><a href="###">资质认证</a></li>
            </ul>
          </div> -->
          <div class="col-sm-6">
            <h4>帮助中心</h4>
            <ul>
             <%--  <li><a href="<%=request.getContextPath()%>/webEntrust/pcProductsListView.do">理财指引</a></li> --%>
              <li><a href="<%=request.getContextPath()%>/news/pcNewsList.do">财富学堂</a></li>
              <li><a href="<%=request.getContextPath()%>/help/pcContact.do">联系我们</a></li>
            </ul>
          </div>
        </div>
      </div>
      <div class="col-sm-4 service">
        <ul style="text-align:left">
          <!-- <li >客服热线</li> -->
          <h4>客服热线</h4>
          <li>
            <h2>${fax }</h2>
          </li>
          <li>服务时间：工作日9:00-18:00</li>
        </ul>
      </div>
    </div>
  </div>
</div>
<div class="container-fluid footerbottom">
  <p>地址：${address }</p>
  <p>版权所有 © 2015-2016 ${comanyName } All rights reserved 粤ICP备I4072333号-1</p>
</div>