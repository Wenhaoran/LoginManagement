<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
var isValid = false;
function add(cid) {
    $('#texpjourPurchInvoiceDetAddForm').form('submit',{
        url : '${path}/texpjourPurchInvoiceDet/add',
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
        <form id="texpjourPurchInvoiceDetAddForm" method="post">
    		<input id="id" name="id" type="hidden"/>
            <table class="grid">
                <tr>
                    <td>发票主键</td>
                	<td>
                		<input id="invoiceId" name="invoiceId" type="text" placeholder="请输入发票主键" class="easyui-validatebox span2" data-options="required:false" maxlength="32" value=""/>
					</td>
                </tr>
                <tr>
                    <td>单据标识</td>
                	<td>
                		<input id="billId" name="billId" type="text" placeholder="请输入单据标识" class="easyui-validatebox span2" data-options="required:false" maxlength="32" value=""/>
					</td>
                </tr>
                <tr>
                    <td>单据号</td>
                	<td>
                		<input id="billNo" name="billNo" type="text" placeholder="请输入单据号" class="easyui-validatebox span2" data-options="required:false" maxlength="32" value=""/>
					</td>
                </tr>
                <tr>
                    <td>单据类型</td>
                	<td>
                		<input id="billType" name="billType" type="text" placeholder="请输入单据类型" class="easyui-validatebox span2" data-options="required:false" maxlength="2" value=""/>
					</td>
                </tr>
                <tr>
                    <td>供应商账户ID</td>
                	<td>
                		<input id="suppAcctId" name="suppAcctId" type="text" placeholder="请输入供应商账户ID" class="easyui-validatebox span2" data-options="required:false" maxlength="32" value=""/>
					</td>
                </tr>
                <tr>
                    <td>进货码洋</td>
                	<td>
                		<input id="purchCodePrice" name="purchCodePrice" type="text" placeholder="请输入进货码洋" class="easyui-validatebox span2" data-options="required:false" maxlength="32" value=""/>
					</td>
                </tr>
                <tr>
                    <td>进货实洋</td>
                	<td>
                		<input id="purchRealPrice" name="purchRealPrice" type="text" placeholder="请输入进货实洋" class="easyui-validatebox span2" data-options="required:false" maxlength="32" value=""/>
					</td>
                </tr>
                <tr>
                    <td>折扣金额</td>
                	<td>
                		<input id="discountAmount" name="discountAmount" type="text" placeholder="请输入折扣金额" class="easyui-validatebox span2" data-options="required:false" maxlength="32" value=""/>
					</td>
                </tr>
                <tr>
                    <td>种数</td>
                	<td>
                		<input id="kindNum" name="kindNum" type="text" placeholder="请输入种数" class="easyui-validatebox span2" data-options="required:false" maxlength="32" value=""/>
					</td>
                </tr>
                <tr>
                    <td>册数</td>
                	<td>
                		<input id="copiesNum" name="copiesNum" type="text" placeholder="请输入册数" class="easyui-validatebox span2" data-options="required:false" maxlength="32" value=""/>
					</td>
                </tr>
                <tr>
                    <td>备注</td>
                	<td>
                		<input id="remark" name="remark" type="text" placeholder="请输入备注" class="easyui-validatebox span2" data-options="required:false" maxlength="512" value=""/>
					</td>
                </tr>
                <tr>
                    <td>创建时间</td>
                	<td>
                		<input id="createOn" name="createOn" type="text" placeholder="请选择创建时间" class="easyui-validatebox span2" data-options="required:false" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly"/>
					</td>
                </tr>
                <tr>
                    <td>创建人</td>
                	<td>
                		<input id="createBy" name="createBy" type="text" placeholder="请输入创建人" class="easyui-validatebox span2" data-options="required:false" maxlength="32" value=""/>
					</td>
                </tr>
                <tr>
                    <td>创建人名称</td>
                	<td>
                		<input id="createbyName" name="createbyName" type="text" placeholder="请输入创建人名称" class="easyui-validatebox span2" data-options="required:false" maxlength="128" value=""/>
					</td>
                </tr>
            </table>
        </form>
    </div>
</div>