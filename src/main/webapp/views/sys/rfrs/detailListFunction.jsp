<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html>
<script type="text/javascript">
	var oldIndex;
    var detailDataGrid;
    $(function() {
    	var roleId = '${role.id}';
        detailDataGrid = $('#detailDataGrid').datagrid({
            url : '${path}/pages/function/dataGridByRoleId?roleId='+roleId,
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
                title : '功能编码',
                field : 'code',
                sortable : false,
                align : 'center',
                hidden : false
            } , 
			{
                width : '10%',
                title : '功能名称',
                field : 'name',
                sortable : false,
                align : 'center',
                hidden : false,
            } , 
            {
                width : '10%',
                title : '功能路径',
                field : 'path',
                sortable : false,
                align : 'center',
                hidden : false,
            } , 
            {
                width : '10%',
                title : '所属页面',
                field : 'pageName',
                sortable : false,
                align : 'center',
                hidden : false,
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
                $('.accountRoleRS-easyui-linkbutton-edit').linkbutton({text:'解除关联',plain:true,iconCls:'icon-del'});
            },
            toolbar : '#detailToolbar'
        });
    });

    function addRFRSFun() {
    	var roleId = '${role.id}';
    	var url="${path}/pages/function/roleGiveFunction?roleId="+roleId;
    	
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
        $.post('${path}/pages/function/deleteRFRS', {
            ids : ids,
            roleId :'${role.id}'
        }, function(result) {
        	progressClose();
            if (result.success) {
            	easyui_alert(result.msg);
            	for(var i = checkedItems.length; i > 0; i--){
            		var index = detailDataGrid.datagrid('getRowIndex', checkedItems[i-1]);
            		detailDataGrid.datagrid('deleteRow', index);
            	}
                detailDataGrid.datagrid('reload');
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
    <div class="easyui-layout" data-options="fit:true,border:true,title:'功能关联角色列表'">
			<div data-options="region:'north',fit:false,border:false,title:'查询条件',hideCollapsedContent:false" style="height:70px;overflow: hidden;padding:1px;background-color: #fff">
	    		<form id="detailSearchForm">
	    			<input id='roleId' name="roleId" value='${role.id}' type="hidden" />
	    			<input type="hidden" id="idsDetail" name="ids" value="" />
	    			<div class="search_condition">
	    				<p>
							<b>当前角色：</b>
	                		<b style="color: red;">${role.name}</b>
						</p>
    					<p>
							<b>功能名称</b>
	                		<input id="function_queryName" name="name" type="text" placeholder="请输入功能名称" class="easyui-validatebox span2" maxlength="32" value=""/>
						</p>
						<p>
							<b>功能编码</b>
	                		<input id="function_queryCode" name="code" type="text" placeholder="请输入功能编码" class="easyui-validatebox span2" maxlength="32" value=""/>
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
        	<a onclick="addRFRSFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'">关联功能</a>
            <a onclick="detailDeleteFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-line'">解除关联</a>
            <a onclick="changeRealPrice();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-filter'">刷新</a>
    </div>
