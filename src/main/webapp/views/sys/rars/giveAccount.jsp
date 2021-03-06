<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>

<body>	
	<script type="text/javascript">
    var accountListDataGrid;
    $(function() {
        accountListDataGrid = $('#accountListDataGrid').datagrid({
            url : '${path}/pages/account/dataGridByRoleId',
            /* queryParams: {
        	}, */
            striped : true,
            rownumbers : true,
            pagination : true,
            singleSelect : false,
            autoRowHeight:false,
            idField : 'id',
            sortName : 'inserttime',
            sortOrder : 'desc',
            fit : true,
            autoRowHeight: false,
            fitColumns:true,
            fix:false,
            pageSize : 20,
            pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
            columns: [[
            { 
           	   field:'ck',checkbox:true
           	},
           	{
                width : '10%',
                title : '主键',
                field : 'id',
                sortable : true,
                align : 'center',
            	hidden : true
            } , 
			{
                width : '15%',
                title : '账户名称',
                field : 'name',
                sortable : false,
                align : 'center',
                hidden : false
            } , 
			{
                width : '30%',
                title : '账户等级',
                field : 'level',
                sortable : false,
                align : 'center',
                hidden : false,
                formatter : function(value, row, index) {
         			switch (value) {
			             case 1:
			                 return '超级用户';
			             case 2:
			                 return '普通用户';
			        }
         		}
            }
			]],
            onLoadSuccess:function(data){
            },
            toolbar : '#addPurchOrderListToolbar'
        });
    });
    
    function addDetail(cid){
    	var checkedItems = accountListDataGrid.datagrid('getChecked');
    	if(checkedItems.length == 0){
    		easyui_alert('请至少选择一条记录！');
    		return false;
    	}
    	var ids = [];
    	$.each(checkedItems, function(index, item){    
    		ids.push(item.id); 
    	});
    	$('#purchInvoiceAddForm').form('submit',{
            url : '${path}/pages/account/addRARS',
            onSubmit : function() {
            	$('#idsGiveRole').val(ids);
            	return true;
            },
            success : function(result) {
                progressClose();
                result = $.parseJSON(result);
                if (result.success) {
                	dataGrid.datagrid('reload');
                	$("#"+cid).dialog("close");
    				$("#"+cid).dialog("destroy");
                } else {
                	easyui_error(result.msg);
                }
            }
        });
    }
    
    function accountListSearchFun() {
        accountListDataGrid.datagrid('load', $.serializeObject($('#accountListSearchForm')));
    }
    
    function accountListCleanFun() {
        $('#accountListSearchForm input').val('');
        accountListDataGrid.datagrid('load', $.serializeObject($('#accountListSearchForm')));
    }
    
</script>
    <div id="orderLay" class="easyui-layout" data-options="fit:true,border:true,title:'账户列表'">
           <div data-options="region:'north',border:false" style="width:100%;height: 50px; overflow: hidden;background-color: #fff">
	        <form id="purchInvoiceAddForm" method="post">
	        	<input type="hidden" id="roleId" name="roleId" value="${role.id}" />
	        	<input type="hidden" id="idsGiveRole" name="ids" />
	        </form>
	        
	        <form id="accountListSearchForm">
	            <table>
	                <tr>
	                    <th>账户名称:</th>
	                    <td>
	                    	<input id="accountList_name" name="name" placeholder="请输入账户名称"/>
	                    </td>
	                    <td width="300">
		                    <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onclick="accountListSearchFun();">查询</a>
		                    <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',plain:true" onclick="accountListCleanFun();">清空</a>
	                    </td>                   
	                </tr>
	            </table>
	        </form>
	    </div>
        <div data-options="region:'center',fit:true,border:true" style="height:95%;">
            <table id="accountListDataGrid" data-options="border:false"></table>
        </div>
    </div>
    <div id="addPurchOrderListToolbar" style="display: none;">
    </div>
</body>
