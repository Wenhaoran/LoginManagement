<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>

<body>	
	<script type="text/javascript">
    $(function() {
    	var systemId = '${systemId}';
    	organizationTreeRole = $('#organizationTreeRole').tree({
            url : '${path }/pages/resource/tree',
            queryParams: {
            	systemId: systemId
        	},
        	method : "post",
        	checkbox : true,
            parentField : 'parentResourceId',
            textField : 'name',
            lines : true,
            onClick : function(node) {
//                 dataGrid.datagrid('load', {
//                    organizationId: node.id
//                });
            }
        });
    });
    
    function addDetail(cid){
    	var nodes = $('#organizationTreeRole').tree('getChecked');
    	
    	if(nodes.length == 0){
    		easyui_alert('请至少选择一条记录！');
    		return false;
    	}
    	var ids = [];
    	$.each(nodes, function(index, item){    
    		ids.push(item.id); 
    	});
    	$('#idsGive').val(ids);
    	$('#purchInvoiceAddForm').form('submit',{
            url : '${path}/pages/resource/addRRRS',
            onSubmit : function() {
                
            	return true;
            },
            success : function(result) {
                progressClose();
                result = $.parseJSON(result);
                if (result.success) {
                	detailDataGrid.datagrid('reload');
                	organizationTree.tree('reload');
                	$("#"+cid).dialog("close");
    				$("#"+cid).dialog("destroy");
                } else {
                	easyui_error(result.msg);
                }
            }
        });
    }
    
</script>
    <div id="orderLay" class="easyui-layout" data-options="fit:true,border:true,title:'资源列表'">
        <div data-options="region:'center',fit:true,border:true" style="height:95%;">
        	<form id="purchInvoiceAddForm" method="post">
	        	<input type="hidden" id="roleId" name="roleId" value="${role.id}" />
	        	<input type="hidden" id="idsGive" name="ids" value=""/>
	        </form>
            <ul id="organizationTreeRole"  style="width:160px;margin: 10px 10px 10px 10px"></ul>
        </div>
    </div>
    <div id="addPurchOrderListToolbar" style="display: none;">
    </div>
</body>
