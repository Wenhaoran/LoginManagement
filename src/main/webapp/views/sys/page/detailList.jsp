<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html>
<script type="text/javascript">
	var oldIndex;
    var detailDataGrid;
    $(function() {
    	var resourceId = '${resource.id}';
    	var systemId = '${systemId}';
        detailDataGrid = $('#detailDataGrid').datagrid({
            url : '${path}/pages/page/dataGridByResourceId?resourceId='+resourceId,
            striped : true,
            rownumbers : true,
            pagination : true,
            singleSelect : false,
            idField : 'id',
            sortName : 'a.inserttime',
            sortOrder : 'desc',
            fit : true,
            fitColumns : true,
            fix : false,
            autoRowHeight : false,
            pageSize : 20,
            pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
            columns: [[
            { 
           	   field : 'ck', checkbox : true
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
                width : '10%',
                title : '页面编号',
                field : 'code',
                sortable : false,
                align : 'center',
                hidden : false
            } , 
			{
                width : '10%',
                title : '页面名称',
                field : 'name',
                sortable : false,
                align : 'center',
                hidden : false,
            } , 
            {
                width : '10%',
                title : '页面路径',
                field : 'path',
                sortable : false,
                align : 'center',
                hidden : false,
            } , 
            {
                width : '10%',
                title : '所属资源',
                field : 'resourceName',
                sortable : false,
                align : 'center',
                hidden : false,
            } , 
            {
                field : 'action',
                title : '操作',
                width : 200,
                align : 'center',
                formatter : function(value, row, index) {
                    var str = '';
						str += $.formatString('<a href="javascript:void(0)" class="account-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'icon-edit\'" onclick="editFun(\'{0}\');" >编辑</a>', row.id);
					return str;
                }
            } 
			]],
			onDblClickRow:function(index, rowData){
				if(oldIndex != null && oldIndex != undefined){
					$('#detailDataGrid').datagrid('endEdit', oldIndex);
				}
				oldIndex = index;
				$('#detailDataGrid').datagrid('beginEdit', index);
			},
			onClickRow:function(rowIndex, rowData){
				$('#detailDataGrid').datagrid('endEdit', oldIndex);
			},
            onLoadSuccess:function(data){
            	$('.account-easyui-linkbutton-edit').linkbutton({text:'编辑',plain:true,iconCls:'icon-edit'});
                $('.accountRoleRS-easyui-linkbutton-edit').linkbutton({text:'批量删除',plain:true,iconCls:'icon-del'});
            },
            toolbar : '#detailToolbar'
        });
    });
    
    function editFun(id) {
        var url="${path}/pages/page/editPage?pageId=" + id;
		openEditDialog(url, 500, 700, detailDataGrid, function(cid) {
			modify(cid);
		}).dialog('open').dialog('setTitle', '修改');
    }

    function addRRRSFun() {
    	var resourceId = '${resource.id}';
    	var url="${path}/pages/page/addPage?resourceId="+resourceId;//?invoiceId="+'${purchInvoice.id}'+"&billType=1
    	
        openEditDialog(url, 500, 900, detailDataGrid, function(cid) {
			addDetail(cid);
		}).dialog('open').dialog('setTitle', '添加资源关联');
    }
    
    function detailDeleteFun() {
    	var checkedItems = detailDataGrid.datagrid('getChecked');
    	if(checkedItems.length == 0){
    		easyui_alert('请至少选择一条记录！');
    		return false;
    	}
    	var ids = '';
    	$.each(checkedItems, function(index, item){    
    		ids+=item.id+',';    		
    	});
    	$('#idsDetail').val(ids);
        progressLoad();
        $.post('${path}/pages/page/deletePage', {
            ids : ids,
            resourceId :'${resource.id}'
        }, function(result) {
        	progressClose();
            if (result.success) {
            	easyui_alert(result.msg);
            	for(var i = checkedItems.length; i > 0; i--){
            		var index = detailDataGrid.datagrid('getRowIndex', checkedItems[i-1]);
            		detailDataGrid.datagrid('deleteRow', index);
            	}
                detailDataGrid.datagrid('reload');
            }else{
            	easyui_alert(result.msg);
            }
            progressClose();
        }, 'JSON');
    }

    function changeRealPrice() {
    }
    
    function detailSearchFun() {
        detailDataGrid.datagrid('load', $.serializeObject($('#detailSearchForm')));
    }
    
    function detailCleanFun() {
        $('#detailSearchForm input').val('');
        
        $('#detailSearchForm select').combobox({
        	onLoadSuccess: function (row, data) {
        		$(this).combobox('setValue', '');
        	}
        });
        detailDataGrid.datagrid('load', {});
    }
</script>
</head>
<body>	
    <div class="easyui-layout" data-options="fit:true,border:true,title:'资源配置页面列表'">
			<div data-options="region:'north',fit:false,border:false,title:'查询条件',hideCollapsedContent:false" style="height:70px;overflow: hidden;padding:1px;background-color: #fff">
	    		<form id="detailSearchForm">
	    			<input id='resourceId' name="resourceId" value='${resource.id}' type="hidden" />
	    			<input type="hidden" id="idsDetail" name="ids" value="" />
	    			<div class="search_condition">
	    				<p>
							<b>当前资源：</b>
	                		<b style="color: red;">${resource.name}</b>
						</p>
    					<p>
							<b>页面编号</b>
	                		<input id="page_query" name="code" type="text" placeholder="请输入角色名称" class="easyui-validatebox span2" maxlength="32" value=""/>
						</p>
						<p>
							<b>页面名称</b>
	                		<input id="page_query" name="name" type="text" placeholder="请输入角色名称" class="easyui-validatebox span2" maxlength="32" value=""/>
						</p>
						<p class="btnSear">
		                    <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onclick="detailSearchFun();">查询</a>
		                    <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',plain:true" onclick="detailCleanFun();">清空</a>
		                </p>
					</div>
	    		</form>
    		</div>
        <div data-options="region:'center',border:false">
        	<form id="detailListForm" method="post">
        	</form>
            <table id="detailDataGrid" data-options="fit:true,border:false"></table>
        </div>
    </div>
    <div id="detailToolbar" style="display: none;">
        	<a onclick="addRRRSFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'">新建页面</a>
            <a onclick="detailDeleteFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-line'">删除</a>
            <a onclick="changeRealPrice();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-filter'">刷新</a>
    </div>
