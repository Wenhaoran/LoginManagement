<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
var isValid = false;

function add(cid) {
	$('#functionAddForm').form('submit',{
        url : '${path}/pages/function/add',
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
        <form id="functionAddForm" method="post">
    		<input id="id" name="id" type="hidden"/>
            <table class="grid">
                <tr>
                    <td>功能编码</td>
                	<td>
                		<input id="functionCode" name="code" type="text" placeholder="请输入功能编码" class="easyui-validatebox span2" data-options="required:true" maxlength="32" value=""/>
					</td>
                </tr>
                <tr>
                    <td>功能名称</td>
                	<td>
                		<input id="functionName" name="name" type="text" placeholder="请输入功能名称" class="easyui-validatebox span2" data-options="required:true" maxlength="32" value=""/>
					</td>
                </tr>
                <tr>
                    <td><font color='red'>*</font>所属页面</td>
                	<td>
                		<select id="functionPageId" name="pageId" class="easyui-combobox" validType="comboxRequired['-请选择-']" data-options="width:120,height:26,editable:false,panelHeight:'140px',required:true">
		              		<option value="">-请选择-</option>
			                <c:forEach items="${pageList}" var="page">
								<option value="${page.id}">${page.name}</option>
							</c:forEach>
						 </select>
					</td>
                </tr>
            </table>
        </form>
    </div>
</div>