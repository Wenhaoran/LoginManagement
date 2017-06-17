<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
var isValid = false;

function add(cid) {
    $('#systemAddForm').form('submit',{
        url : '${path}/pages/system/add',
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
        <form id="systemAddForm" method="post">
    		<input id="id" name="id" type="hidden"/>
            <table class="grid">
                <tr>
                    <td>系统编号</td>
                	<td>
                		<input id="systemCode" name="code" type="text" placeholder="请输入系统编号" class="easyui-validatebox span2" data-options="required:false" maxlength="32" value=""/>
					</td>
                </tr>
                <tr>
                    <td>系统名称</td>
                	<td>
                		<input id="systemName" name="name" type="text" placeholder="请输入系统名称" class="easyui-validatebox span2" data-options="required:false" maxlength="32" value=""/>
					</td>
                </tr>
                <tr>
                    <td>系统状态</td>
                	<td>
                		<select id="systemStatus" name="status" class="easyui-combobox" data-options="width:120,height:26,editable:false,panelHeight:'140px'">
		              		<option value="">-请选择-</option>
			                <option value="3">废用</option>
			                <option value="2">停用</option>
			                <option value="1">在用</option>
						 </select>
					</td>
                </tr>
            </table>
        </form>
    </div>
</div>