<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
var isValid = false;

function modify(cid) {
	$('#pageAddForm').form('submit',{
        url : '${path}/pages/page/edit',
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
        <form id="pageAddForm" method="post">
    		<input id="pageId" name="id" type="hidden" value="${page.id}"/>
    		<input id="resourceId" name="resourceId" type="hidden" value="${page.resourceId}"/>
            <table class="grid">
                <tr>
                    <td>页面编码</td>
                	<td>
                		<input id="pageCode" name="code" type="text" placeholder="请输入页面编码" class="easyui-validatebox span2" data-options="required:true" maxlength="32" value="${page.code}"/>
					</td>
                </tr>
                <tr>
                    <td>页面名称</td>
                	<td>
                		<input id="pageName" name="name" type="text" placeholder="请输入页面名称" class="easyui-validatebox span2" data-options="required:true" maxlength="32" value="${page.name}"/>
					</td>
                </tr>
                <tr>
                    <td>页面路径</td>
                	<td>
                		<input id="pagePath" name="path" type="text" placeholder="请输入页面路径" class="easyui-validatebox span2" data-options="required:true" maxlength="32" value="${page.path}"/>
					</td>
                </tr>
                <tr>
                    <td>特殊标识</td>
                	<td>
                		<input id="pageSpecial" name="special" type="text" placeholder="请输入特殊标识" class="easyui-validatebox span2" data-options="required:false" maxlength="32" value="${page.special}"/>
					</td>
                </tr>
            </table>
        </form>
    </div>
</div>