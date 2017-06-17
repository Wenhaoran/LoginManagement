<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="cn.digitalpublishing.service.html.index.WebIndexHtml" %>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">

</script>
<div title="首页">
<div style="margin:10px;"></div>
    <div id="panalIndex" class="easyui-layout"  style="width:98%;height:90%;margin:0 auto;">
       <!-- <div id="p" class="easyui-panel" title="Basic Panel" style="width:300px;height:200px;" data-options="iconCls:'icon-save',closable:false,collapsible:true,minimizable:false,maximizable:true">   
			<iframe src="http://192.168.0.109:8080/webgate/pages/account/form/index" style="border:0;width:100%;height:100%;">
			</iframe>
		</div>
		<div id="p" class="easyui-panel" title="Basic Panel" style="width:750px;height:400px;"  data-options="iconCls:'icon-save',closable:true,collapsible:true,minimizable:true,maximizable:true">
			<iframe src="account/form/index" style="border:0;width:100%;height:100%;">
			</iframe>
		</div> -->
		<%
		HttpServletRequest reque = request;
		%>
		<%=	new WebIndexHtml().getIndexHtml(reque)%>
    </div>
</div>

