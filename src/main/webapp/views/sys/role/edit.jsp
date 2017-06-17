<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
var isValid = false;

$(function() {

});

function modify(cid) {
	
      	$('#roleAddForm').form('submit',{
           url : '${path}/pages/role/edit',
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
        <form id="roleAddForm" method="post">
    		<input name="id" type="hidden" value="${role.id}"/>
            <table class="grid">
                <tr>
                    <td>角色名称</td>
                	<td>
                		<input id="roleName" name="name" type="text" placeholder="请输入角色名称" class="easyui-validatebox span2" data-options="required:false" maxlength="32" value="${role.name}"/>
					</td>
                </tr>
                <tr>
                    <td>角色描述</td>
                	<td>
                		<input id="roleDesc" name="desc" type="text" placeholder="请输入角色描述" class="easyui-validatebox span2" data-options="required:false" maxlength="32" value="${role.desc}"/>
					</td>
                </tr>
                <tr>
                    <td>所属系统</td>
                	<td>
                		<select id="roleSystemId" name="systemId" disabled="disabled" class="easyui-combobox" data-options="width:120,height:26,editable:false,panelHeight:'140px'">
		              		<option value="">-请选择-</option>
			                <c:forEach items="${systemList}" var="system">
								<option value="${system.id}"<c:if test="${role.systemId == system.id}">selected="selected"</c:if>>${system.name}</option>
							</c:forEach>
						 </select>
					</td>
                </tr>
                <tr>
                    <td>角色状态</td>
                	<td>
                		<select id="roleStatus" name="status" class="easyui-combobox" data-options="width:120,height:26,editable:false,panelHeight:'140px'">
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