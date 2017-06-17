<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
var isValid = false;

$(function() {

});

function modify(cid) {
	
      	$('#componentAddForm').form('submit',{
           url : '${path}/pages/component/edit',
           onSubmit : function() {
               progressLoad();
               isValid = $(this).form('validate');
               if (!isValid) {
                   progressClose();
               }
               return isValid;
           },
           success : function(result) {
               progressClose();
               result = $.parseJSON(result);
               if (result.success) {
               	$("#"+cid).dialog("close");
   				$("#"+cid).dialog("destroy");
               } else {
               	easyui_error(result.msg);
               }
           }
       });
}
</script>
<div class="easyui-layout" data-options="fit:true,border:false" >
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;" >
        <form id="componentAddForm" method="post">
    		<input name="id" type="hidden" value="${component.id}"/>
            <table class="grid">
                <tr>
                    <td>组件编码</td>
                	<td>
                		<input id="componentCode" name="code" type="text" placeholder="请输入组件编码" class="easyui-validatebox span2" data-options="required:false" maxlength="32" value="${component.code}"/>
					</td>
                </tr>
                <tr>
                    <td>组件名称</td>
                	<td>
                		<input id="componentName" name="name" type="text" placeholder="请输入组件名称" class="easyui-validatebox span2" data-options="required:false" maxlength="32" value="${component.name}"/>
					</td>
                </tr>
                <tr>
                    <td>组件地址</td>
                	<td>
                		<input id="componentAddress" name="address" type="text" placeholder="请输入组件地址" class="easyui-validatebox span2" data-options="required:false" maxlength="32" value="${component.address}"/>
					</td>
                </tr>
                <tr>
                    <td>组件端口</td>
                	<td>
                		<input id="componentPort" name="port" type="text" placeholder="请输入组件端口" class="easyui-validatebox span2" data-options="required:false" maxlength="32" value="${component.port}"/>
					</td>
                </tr>
                <tr>
                    <td>所属系统</td>
                	<td>
                		<select id="componentSystemId" name="systemId" disabled="disabled" class="easyui-combobox" data-options="width:120,height:26,editable:false,panelHeight:'140px'">
		              		<option value="">-请选择-</option>
			                <c:forEach items="${systemList}" var="system">
								<option value="${system.id}" <c:if test="${component.systemId == system.id}">selected="selected"</c:if>>${system.name}</option> 
							</c:forEach>
						 </select>
					</td>
                </tr>
                <tr>
                    <td>组件状态</td>
                	<td>
                		<select id="componentStatus" name="status" class="easyui-combobox" data-options="width:120,height:26,editable:false,panelHeight:'140px'">
		              		<option value="">-请选择-</option>
			                <option value="1">在用</option>
			                <option value="2">停用</option>
						 </select>
					</td>
                </tr>
            </table>
        </form>
    </div>
</div>