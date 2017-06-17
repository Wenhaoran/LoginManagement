<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${staticPath}/static/style/css/search.css"/>
<%@ include file="/commons/basejs.jsp" %>
<meta http-equiv="X-UA-Compatible" content="edge" />
<title>进货发票明细管理</title>
<script type="text/javascript">
    var dataGrid;
    $(function() {
        dataGrid = $('#dataGrid').datagrid({
            url : '${path}/texpjourPurchInvoiceDet/dataGrid',
            striped : true,
            rownumbers : true,
            pagination : true,
            singleSelect : true,
            idField : 'id',
            sortName : 'id',
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
                title : '发票主键',
                field : 'invoiceId',
                sortable : true,
                align : 'center',
                hidden : false
            } , 
			{
                width : '10%',
                title : '单据标识',
                field : 'billId',
                sortable : true,
                align : 'center',
                hidden : false
            } , 
			{
                width : '10%',
                title : '单据号',
                field : 'billNo',
                sortable : true,
                align : 'center',
                hidden : false
            } , 
			{
                width : '10%',
                title : '单据类型',
                field : 'billType',
                sortable : true,
                align : 'center',
                hidden : false
            } , 
			{
                width : '10%',
                title : '供应商账户ID',
                field : 'suppAcctId',
                sortable : true,
                align : 'center',
                hidden : false
            } , 
			{
                width : '10%',
                title : '进货码洋',
                field : 'purchCodePrice',
                sortable : true,
                align : 'center',
                hidden : false
            } , 
			{
                width : '10%',
                title : '进货实洋',
                field : 'purchRealPrice',
                sortable : true,
                align : 'center',
                hidden : false
            } , 
			{
                width : '10%',
                title : '折扣金额',
                field : 'discountAmount',
                sortable : true,
                align : 'center',
                hidden : false
            } , 
			{
                width : '10%',
                title : '种数',
                field : 'kindNum',
                sortable : true,
                align : 'center',
                hidden : false
            } , 
			{
                width : '10%',
                title : '册数',
                field : 'copiesNum',
                sortable : true,
                align : 'center',
                hidden : false
            } , 
			{
                width : '10%',
                title : '备注',
                field : 'remark',
                sortable : true,
                align : 'center',
                hidden : true
            } , 
			{
                width : '10%',
                title : '创建时间',
                field : 'createOn',
                sortable : true,
                align : 'center',
                hidden : true
            } , 
			{
                width : '10%',
                title : '创建人',
                field : 'createBy',
                sortable : true,
                align : 'center',
                hidden : true
            } , 
			{
                width : '10%',
                title : '创建人名称',
                field : 'createbyName',
                sortable : true,
                align : 'center',
                hidden : true
            } , 
            {
                field : 'action',
                title : '操作',
                width : 200,
                align : 'center',
                formatter : function(value, row, index) {
                    var str = '';
                    <shiro:hasPermission name="/texpjourPurchInvoiceDet/edit">
						str += $.formatString('<a href="javascript:void(0)" class="texpjourPurchInvoiceDet-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'icon-edit\'" onclick="editFun(\'{0}\');" >编辑</a>', row.id);
					</shiro:hasPermission>
                    <shiro:hasPermission name="/texpjourPurchInvoiceDet/delete">
						str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
						str += $.formatString('<a href="javascript:void(0)" class="texpjourPurchInvoiceDet-easyui-linkbutton-del" data-options="plain:true,iconCls:\'icon-del\'" onclick="deleteFun(\'{0}\');" >删除</a>', row.id);
					</shiro:hasPermission>
					<shiro:hasPermission name="/texpjourPurchInvoiceDet/view">
						str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
						str += $.formatString('<a href="javascript:void(0)" class="texpjourPurchInvoiceDet-easyui-linkbutton-view" data-options="plain:true,iconCls:\'icon-view\'" onclick="viewFun(\'{0}\');" >查看</a>', row.id);
					</shiro:hasPermission>
					return str;
                }
            } 
			]],
            onLoadSuccess:function(data){
                $('.texpjourPurchInvoiceDet-easyui-linkbutton-edit').linkbutton({text:'编辑',plain:true,iconCls:'icon-edit'});
                $('.texpjourPurchInvoiceDet-easyui-linkbutton-del').linkbutton({text:'删除',plain:true,iconCls:'icon-del'});
                $('.texpjourPurchInvoiceDet-easyui-linkbutton-view').linkbutton({text:'查看',plain:true,iconCls:'icon-view'});
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
    <div class="easyui-layout" data-options="fit:true,border:true,title:'进货发票明细列表'">
			<div data-options="region:'north',fit:false,border:false,title:'查询条件',hideCollapsedContent:false" style="height:120px;overflow: hidden;padding:3px;background-color: #fff">
	    		<form id="searchForm">
	    			<div class="search_condition">
    					<p>
							<b>单据号</b>
	                		<input id="billNo_query" name="billNo" type="text" placeholder="请输入单据号" class="easyui-validatebox span2" maxlength="32" value=""/>
						</p>
    					<p>
							<b>单据类型</b>
	                		<input id="billType_query" name="billType" type="text" placeholder="请输入单据类型" class="easyui-validatebox span2" maxlength="2" value=""/>
						</p>
    					<p>
							<b>供应商账户ID</b>
	                		<input id="suppAcctId_query" name="suppAcctId" type="text" placeholder="请输入供应商账户ID" class="easyui-validatebox span2" maxlength="32" value=""/>
						</p>
	    			</div>
	    		</form>
    		</div>
        <div data-options="region:'center',border:false">
            <table id="dataGrid" data-options="fit:true,border:false"></table>
        </div>
    </div>
    <div id="toolbar" style="display: none;">
        <shiro:hasPermission name="/texpjourPurchInvoiceDet/add">
            <a onclick="addFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'">添加</a>
        </shiro:hasPermission>
    	<shiro:hasPermission name="/texpjourPurchInvoiceDet/filter">
            <a onclick="filterFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-filter'">选择显示列</a>
        </shiro:hasPermission>
        <shiro:hasPermission name="/texpjourPurchInvoiceDet/export">
            <a onclick="exportFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-export'">导出</a>
        </shiro:hasPermission>
    </div>
</body>
</html>