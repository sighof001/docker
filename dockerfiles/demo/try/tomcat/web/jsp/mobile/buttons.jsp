<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
  <div data-role="footer" class="footer" data-position="fixed" style="position: fixed !important;">
    <div class="ui-grid-c footer-nav">
    <a class="ui-block-a buttons-a" href="<%=request.getContextPath() %>/index/indexList.do" rel="external"><span class="icon icon-home"></span><span>首页</span></a>
    <a class="ui-block-b buttons-b" href="<%=request.getContextPath() %>/tool/toolMain.do" rel="external"><span class="icon icon-tool"></span><span>工具</span></a>
    <a class="ui-block-c buttons-c" href="<%=request.getContextPath() %>/help/contact.do" rel="external"><span class="icon icon-book"></span><span>联系</span></a>
    <a class="ui-block-d buttons-d" href="<%=request.getContextPath() %>/myView/myViewMain.do" rel="external"><span class="icon icon-user"></span><span>我的</span></a>
    </div>
  </div>