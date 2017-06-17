<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
var isValid = false;

function add(cid) {
    $('#componentAddForm').form('submit',{
        url : '${path}/pages/component/add',
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
    		<input id="id" name="id" type="hidden"/>
            <table class="grid">
                <tr>
                    <td>组件编码</td>
                	<td>
                		<input id="componentCode" name="code" type="text" placeholder="请输入组件编码" class="easyui-validatebox span2" data-options="required:true" maxlength="32" value=""/>
					</td>
                </tr>
                <tr>
                    <td>组件名称</td>
                	<td>
                		<input id="componentName" name="name" type="text" placeholder="请输入组件名称" class="easyui-validatebox span2" data-options="required:true" maxlength="32" value=""/>
					</td>
                </tr>
                <tr>
                    <td>组件地址</td>
                	<td>
                		<input id="componentAddress" name="address" type="text" placeholder="请输入组件地址" class="easyui-validatebox span2" data-options="required:true" maxlength="32" value=""/>
					</td>
                </tr>
                <tr>
                    <td>组件端口</td>
                	<td>
                		<input id="componentPort" name="port" type="text" placeholder="请输入组件端口" class="easyui-validatebox span2" data-options="required:true" maxlength="32" value=""/>
					</td>
                </tr>
                <tr>
                    <td>组件状态</td>
                	<td>
                		<select id="componentStatus" name="status" validType="comboxRequired['-请选择-']" class="easyui-combobox" data-options="width:120,height:26,editable:false,panelHeight:'140px'">
		              		<option value="">-请选择-</option>
			                <option value="1">在用</option>
			                <option value="2">停用</option>
						 </select>
					</td>
                </tr>
                <tr>
                    <td>所属系统</td>
                	<td>
                		<select id="componentSystemId" name="systemId" validType="comboxRequired['-请选择-']" class="easyui-combobox" data-options="width:120,height:26,editable:false,panelHeight:'140px'">
		              		<option value="">-请选择-</option>
			                <c:forEach items="${systemList}" var="system">
								<option value="${system.id}">${system.name}</option>
							</c:forEach>
						 </select>
					</td>
                </tr>
            </table>
        </form>
    </div>
</div>