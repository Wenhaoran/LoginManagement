<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
var isValid;
function modify(cid)  {
	var status = $("#systemStatus option:selected") .val();
	if(status != 1 && status != ''){
		$.messager.confirm('询问', '当前系统可能关联其他 角色、资源、组件 等信息，停用后会导致被关联的信息均被停用，是否继续？', function(b) {
	        if (b) {
	        	$('#systemEditForm').form('submit',{
	                url : '${path}/pages/system/edit',
	                
	                onSubmit : function() {
	                	progressLoad();
	                	isValid = $(this).form('validate');
	                    if (!isValid) {
	                        progressClose();
	                    }
	                	var status = $("#systemStatus option:selected") .val();
	                	if(status != 1){
	                		
	                	}
	                	return isValid;
//	                	 $("#systemId_query").find("option[value='"+sysId+"']").attr("selected",true);
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
	    });
	}
}
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
        <form id="systemEditForm" method="post">
    		<input name="id" type="hidden" value="${system.id}"/>
            <table class="grid">
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