<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<%@ include file="/commons/basejs.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${staticPath}/static/style/css/search.css"/>

<meta http-equiv="X-UA-Compatible" content="edge" />
<title>功能信息管理</title>
<script type="text/javascript">
    var dataGrid;
    $(function() {
        dataGrid = $('#dataGrid').datagrid({
            url : '${path}/pages/function/dataGrid',
            striped : true,
            rownumbers : true,
            pagination : true,
            singleSelect : true,
            idField : 'id',
            sortName : 'accountName',//id
            sortOrder : 'desc',
            fit : true,
            fitColumns : true,
            fix : false,
            autoRowHeight : false,
            pageSize : 20,
            pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
            columns: [[
           /*  {
           	   field : 'ck', checkbox : false
           	}, */
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
                sortable : true,
                align : 'center',
                hidden : false,
            } , 
			{
                width : '10%',
                title : '功能路径',
                field : 'path',
                sortable : true,
                align : 'center',
                hidden : false,
            } , 
            {
                width : '10%',
                title : '所属页面',
                field : 'pageName',
                sortable : true,
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
					return str;
                }
            } 
			]],
            onLoadSuccess:function(data){
            	
            },
            toolbar : '#toolbar'
        });
    });

    function addFun() {
    	var url="${path}/texpjourPurchInvoiceDet/addPage";
        openEditDialog(url, 500, 700, dataGrid, function(cid) {
			add(cid);
		}).dialog('open').dialog('setTitle', '新增');
    }

    function editFun(id) {
        if (id == undefined) {
            var rows = dataGrid.datagrid('getSelections');
            id = rows[0].id;
        } else {
            dataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        }                
        var url="${path}/texpjourPurchInvoiceDet/editPage?id=" + id;
		openEditDialog(url, 500, 700, dataGrid, function(cid) {
			modify(cid);
		}).dialog('open').dialog('setTitle', '修改');
    }

    function deleteFun(id) {
        if (id == undefined) {//点击右键菜单才会触发这个
            var rows = dataGrid.datagrid('getSelections');
            id = rows[0].id;
        } else {//点击操作里面的删除图标会触发这个
            dataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        }
        $.messager.confirm('询问', '您是否要删除当前进货发票明细？', function(b) {
            if (b) {
                progressLoad();
                $.post('${path}/texpjourPurchInvoiceDet/delete', {
                    id : id
                }, function(result) {
                    if (result.success) {
                    	easyui_alert(result.msg);
                        dataGrid.datagrid('reload');
                    }else{
                    	easyui_alert(result.msg);
                    }
                    progressClose();
                }, 'JSON');
            }
        });
    }

    function viewFun(id) {
        if (id == undefined) {
            var rows = dataGrid.datagrid('getSelections');
            id = rows[0].id;
        } else {
            dataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        }
        var url="${path}/texpjourPurchInvoiceDet/viewPage?id=" + id;
		openViewDialog(url, 500, 700, dataGrid).dialog('open').dialog('setTitle', '查看');
    }
    
    function filterFun(){
    	//调用时，beanName需要传递各个模块的实体bean名称即可
    	var url = '${path}/common/showColumnManager?beanName=TExpjourPurchInvoiceDet';
    	//成功后回调链接
    	var success_backurl = '${path}/texpjourPurchInvoiceDet/manager';
    	selectShowCls(url,success_backurl);
    }
    
    function exportFun(){
    	var checkedItems = dataGrid.datagrid('getChecked');
    	var ids = [];
    	$.each(checkedItems, function(index, item){    
    		ids.push(item.id);    		
    	});
    	dataGrid.datagrid('clearChecked');
    	var url = '${path}/common/exportColumnManager?beanName=TExpjourPurchInvoiceDet&ids='+ids;
    	exportXls(url);
    }
    
    function searchFun() {
        dataGrid.datagrid('load', $.serializeObject($('#searchForm')));
    }
    
    function cleanFun() {
        $('#searchForm input').val('');
        $('#searchForm select').combobox({
        	onLoadSuccess: function (row, data) {
        		$(this).combobox('setValue', '');
        	}
        });
        dataGrid.datagrid('load', {});
    }
</script>
</head>
<body>	
   <div class="easyui-layout" data-options="fit:true,border:true">
     <div data-options="region:'north',border:false,title:'查询条件'" style="height:70px; overflow: hidden;background-color: #fff">
	    		<form id="searchForm">
	    			<div class="search_condition">
    					<p>
							<b>功能编码：</b>
	                		<input id="code_query" name="code" type="text" placeholder="请输入功能编码" class="easyui-validatebox span2" maxlength="32" value=""/>
						</p>
    					<p>
							<b>功能名称：</b>
	                		<input id="name_query" name="name" type="text" placeholder="请输入功能名称" class="easyui-validatebox span2" maxlength="32" value=""/>
						</p>
						<p>
							<b>所属页面：</b>
	                		<select id="pageId_query" name="pageId" class="easyui-combobox" data-options="width:120,height:26,editable:false,panelHeight:'140px'">
			              		<option value="">-请选择-</option>
				                <option value="1">页面1</option>
				                <option value="2">页面2</option>
							 </select>
						</p>
	    				<p class="btnSear">
			                    <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onclick="searchFun();">查询</a>
			                    <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',plain:true" onclick="cleanFun();">清空</a>
		                </p>  
	    			</div>
	    		</form>
    		</div>
        <div data-options="region:'center',border:false">
            <table id="dataGrid" data-options="fit:true,border:false"></table>
        </div>
    </div>
</body>
</html>