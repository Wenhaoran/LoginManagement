<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
var isValid = false;

$(function() {
	var status = '${account.status}';
	var type = '${account.type}';
	var level = '${account.level}';
 
});

function modify(cid) {
	
	
	var status = $("#accountLevel option:selected") .val();
	if(status == 1 ){
		$.messager.confirm('询问', '超级账户创建后不能被删除，是否确定创建？', function(b) {
	        if (b) {
	        	$('#accountAddForm').form('submit',{
	                url : '${path}/pages/account/edit',
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
	    });
	}else if(status == 2){
		$('#accountAddForm').form('submit',{
            url : '${path}/pages/account/edit',
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
	
}
</script>
<div class="easyui-layout" data-options="fit:true,border:false" >
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;" >
        <form id="accountAddForm" method="post">
    		<input name="id" type="hidden" value="${account.id}"/>
            <table class="grid">
                <tr>
                    <td>账户名称</td>
                	<td>
                		<input id="accountName" name="name" type="text" placeholder="请输入账户名称" class="easyui-validatebox span2" data-options="required:false" maxlength="32"  value="${account.name}"/>
					</td>
                </tr>
                <tr>
                    <td>账户状态</td>
                	<td>
                		<select id="accountStatus" name="status" class="easyui-combobox" data-options="width:120,height:26,editable:false,panelHeight:'140px'">
                			<option value="">-请选择-</option>
			                <option value="1">在用</option>
			                <option value="2">停用</option>
						 </select>
					</td>
                </tr>
                <tr>
                    <td>账户类型</td>
                	<td>
                		<select id="accountType" name="type" class="easyui-combobox" data-options="width:120,height:26,editable:false,panelHeight:'140px'">
		              		<option value="">-请选择-</option>
			                <option value="1">本地账户</option>
			                <option value="2">sina账户</option>
						 </select>
					</td>
                </tr>
                <tr>
                    <td>账户等级</td>
                	<td>
                		<select id="accountLevel" name="level" class="easyui-combobox" data-options="width:120,height:26,editable:false,panelHeight:'140px'">
		              		<option value="">-请选择-</option>
			                <option value="1">超级用户</option>
			                <option value="2">普通用户</option>
						 </select>
					</td>
                </tr>
            </table>
        </form>
    </div>
</div>