<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
var isValid = false;

$(function() {
	var systemId= '${systemId}';
    $('#parentResourceId').combotree({
        url : '${path }/pages/resource/tree?systemId='+systemId,
        parentField : 'parentResourceId',
        lines : true,
        panelHeight : '300'
    });
});

function modify(cid) {
	
	$('#resourceAddForm').form('submit',{
	    url : '${path}/pages/resource/edit',
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
        <form id="resourceAddForm" method="post">
    		<input name="id" type="hidden" value="${resource.id}"/>
            <table class="grid">
                <tr>
                    <td>资源编号</td>
                	<td>
                		<input id="resourceCode" name="code" type="text" placeholder="请输入资源编号" class="easyui-validatebox span2" data-options="required:false" maxlength="32" value="${resource.code}"/>
					</td>
                </tr>
                <tr>
                    <td>资源名称</td>
                	<td>
                		<input id="resourceCode" name="name" type="text" placeholder="请输入资源名称" class="easyui-validatebox span2" data-options="required:false" maxlength="32" value="${resource.name}"/>
					</td>
                </tr>
                <tr>
                    <td>资源链接</td>
                	<td>
                		<input id="resourceLink" name="link" type="text" placeholder="请输入资源链接" class="easyui-validatebox span2" data-options="required:false" maxlength="32" value="${resource.link}"/>
					</td>
                </tr>
                <tr>
                    <td>资源类型</td>
                	<td>
                		<select id="resourceType" name="type" class="easyui-combobox" data-options="width:120,height:26,editable:false,panelHeight:'140px'">
			                <option value="1">菜单</option>
			                <option value="2">接口</option>
						 </select>
					</td>
                </tr>
                <tr>
                    <td>资源状态</td>
                	<td>
                		<select id="resourceStatus" name="status" class="easyui-combobox" data-options="width:120,height:26,editable:false,panelHeight:'140px'">
			                <option value="1">在用</option>
			                <option value="2">停用</option>
						 </select>
					</td>
                </tr>
                <tr>
                    <td>所属组件</td> 
                	<td>
                		<select id="systemId_query" name="componentId" disabled="disabled" class="easyui-combobox" data-options="width:120,height:26,editable:false,panelHeight:'140px'">
			    			<option value="">-请选择-</option>
			    			<c:forEach items="${componentList}" var="component">
								<option value="${component.id}" <c:if test="${resource.componentId == component.id}">selected="selected"</c:if>>${component.name}</option>
							</c:forEach>
						 </select>
					</td>
                </tr>
                <tr>
                    <td>是否全路径</td>
                	<td>
                		<select id="resourceFull" name="full" class="easyui-combobox" data-options="width:120,height:26,editable:false,panelHeight:'140px'">
			                <option value="1">否</option>
			                <option value="2">是</option>
						 </select>
					</td>
                </tr>
                <tr>
                    <td>上级资源</td>
	                <td colspan="3"><select id="parentResourceId" name="parentResourceId" style="width: 200px; height: 29px;"></select>
	                <a class="easyui-linkbutton" href="javascript:void(0)" onclick="$('#pid').combotree('clear');" >清空</a></td>
                </tr>
            </table>
        </form>
    </div>
</div>