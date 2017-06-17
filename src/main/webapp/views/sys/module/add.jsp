<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
var isValid = false;

function add(cid) {
	$('#moduleAddForm').form('submit',{
        url : '${path}/pages/module/add',
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
        <form id="moduleAddForm" method="post">
    		<input id="id" name="id" type="hidden"/>
            <table class="grid">
                <tr>
                    <td>模块名称</td>
                	<td>
                		<input id="moduleName" name="name" type="text" placeholder="请输入模块名称" class="easyui-validatebox span2" data-options="required:true" maxlength="32" value=""/>
					</td>
                </tr>
                <tr>
                    <td>模块链接</td>
                	<td>
                		<input id="moduleLink" name="link" type="text" placeholder="请输入模块链接" class="easyui-validatebox span2" data-options="required:true" maxlength="200" value=""/>
					</td>
                </tr>
                <tr>
                    <td>模块宽度</td>
                	<td>
                		<input id="moduleWidth" name="width" type="text" placeholder="请输入模块宽度" class="easyui-validatebox span2" data-options="required:true" maxlength="32" value=""/>
					</td>
                </tr>
                <tr>
                    <td>模块高度</td>
                	<td>
                		<input id="moduleHeight" name="height" type="text" placeholder="请输入模块高度" class="easyui-validatebox span2" data-options="required:true" maxlength="32" value=""/>
					</td>
                </tr>
                <tr>
                    <td>是否必须</td>
                	<td>
                		<select id="moduleMust" name="must" class="easyui-combobox" data-options="width:120,height:26,editable:false,panelHeight:'140px'">
		              		<option value="">-请选择-</option>
			                <option value="1">是</option>
			                <option value="2">否</option>
						 </select>
					</td>
                </tr>
            </table>
        </form>
    </div>
</div>