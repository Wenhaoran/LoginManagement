<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<%@ include file="/commons/basejs.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${staticPath}/static/style/css/search.css"/>
<meta http-equiv="X-UA-Compatible" content="edge" />
<title>系统信息管理</title>
<script type="text/javascript">
	var currency_Button_Mod = '';
	var dataGrid;
	var cacheRow;
    $(function() {
        dataGrid = $('#dataGrid').datagrid({
            url : '${path}/pages/system/dataGrid',
            striped : true,
            rownumbers : true,
            pagination : true,
            singleSelect : true,
            idField : 'id',
            sortName : 'inserttime',//id
            sortOrder : 'desc',
            fit : true,
            fitColumns : true,
            fix : false,
            autoRowHeight : false,
          	//onClickCell:function(){}
            onDblClickRow: function(index,field){
            	if(field.code != "webgate"){
            		$(this).datagrid('beginEdit', index);  
                    var ed = $(this).datagrid('getEditor', {index:index,field:field});  
                    
                    //$("a[data-row='edit_"+index+"']").attr("disabled",'disabled'); 
                    $("a[data-row='revoke_"+index+"']").removeAttr("hidden");
                    $("a[data-row='save_"+index+"']").removeAttr("hidden");
                    
                    $("a[data-row='save_"+index+"']").linkbutton({text:'保存',plain:true,iconCls:'icon-save'});
                    $("a[data-row='revoke_"+index+"']").linkbutton({text:'撤销更改',plain:true,iconCls:'icon-clear'});
                    
                    $("a[data-row='edit_"+index+"']").linkbutton({text:'更改数据',plain:true,iconCls:'icon-edit',disabled:true});
                    if(field.id==""){
                    	$("a[data-row='del_"+index+"']").linkbutton({text:'删除',plain:true,iconCls:'icon-remove',disabled:true});
                    }
                	//$("a[data-row='del_"+index+"']").linkbutton({text:'删除未保存记录',plain:true,iconCls:'icon-remove',disabled:true});
            	}
            },
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
                width : '20%',
                title : '系统编号',
                field : 'code',
                sortable : false,
                align : 'center',
                hidden : false,
                editor:{type:'textbox',options:{required:true}}
            } , 
			{
                width : '20%',
                title : '系统名称',
                field : 'name',
                sortable : false,
                align : 'center',
                hidden : false,
                editor:{type:'textbox',options:{required:true}}
            } , 
			{
                width : '20%',
                title : '系统状态',
                field : 'status',
                sortable : false,
                align : 'center',
                hidden : false,
         		editor:{  
                    type: 'combobox',  
                    options: { 
                       data: [{"value":"1","text":"在用"},{"value":"2","text":"停用"},{"value":"3","text":"废用"}],  
                       valueField: "value",  
                       textField: "text",  
                       editable: false,  
                       panelHeight:70,  
                       required: true  
                   }  
                },
                formatter : function(value, row, index) {
                	if(value==1||value==2||value==3){
                		switch (value) {
			             case 1:
			                 return '在用';
			             case 2:
			                 return '停用';
			             case 3:
			                 return '废用';
			        	}
                	}else{
                		return value;
                	}
         		}
            } , 
            {
                field : 'action',
                title : '操作',
                width : 200,
                align : 'center',
                formatter : function(value, row, index) {
                    var str = '';
                    	if(row.code !='webgate'){
                    		str += $.formatString('<a hidden href="javascript:void(0)" class="texpjourPurchInvoiceDet-easyui-linkbutton-edit" data-row="edit_{0}" data-options="plain:true,iconCls:\'icon-edit\'" >更改</a>', index );
						}
                    	str += $.formatString('<a hidden href="javascript:void(0)" class="texpjourPurchInvoiceDet-easyui-linkbutton-del" data-row="del_{0}" data-options="plain:true,iconCls:\'icon-edit\'" onclick="delRow(\'{1}\',\'{2}\');" >删除当前记录</a>', index , row.id, index);
                    	str += $.formatString('<a hidden href="javascript:void(0)" class="texpjourPurchInvoiceDet-easyui-linkbutton-save" data-row="save_{0}" data-options="plain:true,iconCls:\'icon-edit\'" onclick="saveRow(\'{1}\',\'{2}\');" >保存</a>', index, row.id, index);
                    	str += $.formatString('<a hidden href="javascript:void(0)" class="texpjourPurchInvoiceDet-easyui-linkbutton-revoke" data-row="revoke_{0}" data-options="plain:true,iconCls:\'icon-edit\'" onclick="revoke(\'{1}\',\'{2}\');" >撤销更改</a>', index, row.id, index);
					return str;
                }
            } 
			]],
            onLoadSuccess:function(data){
                $('.texpjourPurchInvoiceDet-easyui-linkbutton-edit').linkbutton({text:'双击行数据更改',plain:true,iconCls:'icon-edit'});
                for(var num = 0;num<data.rows.length;num++){
                	if(data.rows[num].id==""){
                		$("a[data-row='del_"+num+"']").linkbutton({text:'删除未保存记录',plain:true,iconCls:'icon-remove'});
                		//$("a[data-row='save_"+num+"']").linkbutton({text:'保存',plain:true,iconCls:'icon-save'});
                    }
                }
            },
            toolbar : '#toolbar'
        });
    });

    //新增页面
    function addFun() {
    	var url="${path}/pages/system/addPage";
        openEditDialog(url, 200, 300, dataGrid, function(cid) {
			add(cid);
		}).dialog('open').dialog('setTitle', '新增');
    }
    
	// 如果 操作编辑 则 撤销更改  or 如果 操作新增行，则 删除当前行 
	function delRow(id,rowIndex) {
		var rowsIndex = $('#dataGrid').datagrid('getEditingRowIndexs');
		
		$.messager.confirm('询问', '删除未保存记录，只会缓存 编辑完成 未保存的信息，是否继续？', function(b) {
	        if (b) {
	        	$('#dataGrid').datagrid('deleteRow', rowIndex);
	        	$('#dataGrid').datagrid('acceptChanges');
	       		var rows = $('#dataGrid').datagrid("getRows");
	        	var onEditRow = [];
	        	console.log(rowsIndex);
	        	debugger;
	        	for(var index =0; index<rowsIndex.length-1 ;index ++){
	        		onEditRow.push(rows[rowsIndex[index]]);
	        	}
	        	dataGrid.datagrid('reload', {});
	        	
	        	for(var rowSize =0; rowSize<onEditRow.length-1 ;rowSize ++){
	        		console.log(onEditRow[rowSize]);
	        		$('#dataGrid').datagrid('appendRow',onEditRow[rowSize]);
	        		var rowNumber = $('#dataGrid').datagrid('getData').rows.length-1;
		        	$('#dataGrid').datagrid('beginEdit', rowNumber);
	        	}
	        	return;
	        }
	    });
    }
    
    // 如果 操作编辑 则 撤销更改  or 如果 操作新增行，则 删除当前行 
    function revoke(id,rowIndex) {
    	
    	if(id==""){
    		$('#dataGrid').datagrid('cancelEdit', rowIndex);
        	$("a[data-row='edit_"+rowIndex+"']").linkbutton({text:'双击行数据更改',plain:true,iconCls:'icon-edit'});
        	$("a[data-row='del_"+rowIndex+"']").linkbutton({text:'删除未保存记录',plain:true,iconCls:'icon-remove'});
        	return;
    		/* var arrAll = $('#dataGrid').datagrid('getData');
        	for(var a = 0;a<arrAll.rows.length ;a++){
        		$('#dataGrid').datagrid('endEdit', a);
        	} */
    		$('#dataGrid').datagrid('deleteRow', rowIndex);
    		var rows = $('#dataGrid').datagrid("getRows");
    		$('#dataGrid').datagrid("loadData", rows);
    	}else{
    		$('#dataGrid').datagrid('cancelEdit', rowIndex);
        	$("a[data-row='edit_"+rowIndex+"']").linkbutton({text:'双击行数据更改',plain:true,iconCls:'icon-edit'});	
    	}
    }
    
    //保存当前行数据
    function saveRow(id,rowIndex){
    	//验证必填
    	var validate = $('#dataGrid').datagrid('validateRow', rowIndex);  
    	if(!validate){
    		easyui_error("请 填写所有必填数据 后进行保存操作");
    		return;
    	}
    	//获取更改之前的 系统 状态
    	var oArr=$('#dataGrid').datagrid('getData');
    	var oStatus=oArr.rows[rowIndex].status;
    	
    	//提交编辑当前行
    	$('#dataGrid').datagrid('endEdit', rowIndex);  
    	var arr=$('#dataGrid').datagrid('getData');
    	var id = arr.rows[rowIndex].id;
    	var code=arr.rows[rowIndex].code;
    	var name=arr.rows[rowIndex].name;
    	var status=arr.rows[rowIndex].status;
    	
 		var statusName = '';
		if(status==1){
			statusName ='在用';
		}else if(status == 2){
			statusName ='停用';
		}else if(status == 3){
			statusName ='废用';
		}
		$('#dataGrid').datagrid('updateRow',{
			index: rowIndex,
			row: {
				status: statusName
			}
		}); 
		//判断 系统状态是否更改。
    	if(oStatus==1&&status!=1){
    		$.messager.confirm('询问', '当前系统可能关联其他 角色、资源、组件 等信息，停用后会导致被关联的信息均被停用，是否继续？', function(b) {
    	        if (b) {
    	        	saveOne(id,code,name,status);
    	        }
    	    });
    	}else{
    		saveOne(id,code,name,status);
    	}
    	$("a[data-row='edit_"+rowIndex+"']").linkbutton({text:'双击行数据更改',plain:true,iconCls:'icon-edit'});
    }
    
    function editFun(id) {
        if (id == undefined) {
            var rows = dataGrid.datagrid('getSelections');
            id = rows[0].id;
        } else {
            dataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        }
        var url="${path}/pages/system/editPage?id=" + id;
		openEditDialog(url, 200, 300, dataGrid, function(cid) {
			modify(cid);
		}).dialog('open').dialog('setTitle', '更改系统状态');
    }

    function addRow(row){
    	if(row===undefined){
    		//当前 dataGrid 末尾 增加一行空数据，
        	$('#dataGrid').datagrid('appendRow',{
        		id:""
        	});
    	}else{
    		$('#dataGrid').datagrid('appendRow',row);
    	}
		//设置 新增行为 编辑状态。
    	var rowNumber = $('#dataGrid').datagrid('getData').rows.length-1;
    	$('#dataGrid').datagrid('beginEdit', rowNumber);
    	//显示按钮
    	$("a[data-row='revoke_"+rowNumber+"']").removeAttr("hidden");
        $("a[data-row='save_"+rowNumber+"']").removeAttr("hidden");
        $("a[data-row='save_"+rowNumber+"']").linkbutton({text:'保存',plain:true,iconCls:'icon-save'});
        $("a[data-row='revoke_"+rowNumber+"']").linkbutton({text:'撤销更改',plain:true,iconCls:'icon-clear'});
    }
    
    //保存全部的方法
    function saveAll(){
    	//循环获取当前表格所有数据
    	var arrAll = $('#dataGrid').datagrid('getData');
    	for(var a = 0;a<arrAll.rows.length ;a++){
    		//所有表格结束编辑
    		$('#dataGrid').datagrid('endEdit', a);
    		//所有表格验证必填
    		var validate = $('#dataGrid').datagrid('validateRow', a);  
        	if(!validate){
        		easyui_error("请 填写所有必填数据 后进行保存操作");
        		return;
        	}
    	}
    	//获取所有编辑过的数据
    	var arr=dataGrid.datagrid('getChanges');
    	//循环保存所有数据
    	for (var index = 0; index < arr.length; index++) {
    		var id = arr[index].id;
    		var code = arr[index].code;
    		var name = arr[index].name;
    		var status = arr[index].status;
    		saveOne(id,code,name,status);
    	}
    	//重新加载 dataGrid
    	dataGrid.datagrid('load', {});
    }
    
    //保存 一条记录
    function saveOne(id,code,name,status){
    	//id为空，是新增，否则是修改。
    	if(id==''){
			var url ='${path}/pages/system/add';
			var data = {'code':code,'name':name,'status':status};
		}else{
			var url ='${path}/pages/system/edit';
			var data = {'id':id,'code':code,'name':name,'status':status};
		}
    	if(code!=""&&name!=""&&status!=""&&code!=undefined&&name!=undefined&&status!=undefined){
    		$.ajax({ 
                url : url,            
                type: "POST",  
                async: false,  
                data: data,            
                dataType: "json",              
                cache: false,  
                success : function(result) {
                    if (result.success) {  
                    	console.log(result);
                    } else {
                    	easyui_error(result.msg);
                    }
                }
            });
    	}
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
							<b>系统编码：</b>
	                		<input id="code_query" name="code" type="text" placeholder="请输入系统编码" class="easyui-validatebox span2" maxlength="32" value=""/>
						</p>
    					<p>
							<b>系统名称：</b>
	                		<input id="name_query" name="name" type="text" placeholder="请输入系统名称" class="easyui-validatebox span2" maxlength="50" value=""/>
						</p>
						 <p>
				    		<b>系统状态：</b>
				    		<select id="status_query" name="status" class="easyui-combobox" data-options="width:120,height:26,editable:false,panelHeight:'140px'">
			              		<option value="">-请选择-</option>
				                <option value="3">废用</option>
				                <option value="2">停用</option>
				                <option value="1">在用</option>
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
    <div id="toolbar" style="display: none;">
    	<ingenta-tag:BtnTag limit="${form.limit}" code="test" iconStyle="icon-edit bigger-120" buttonStyle="btn btn-mini btn-warning" scopeName="functionMap" lang="lang" name="测试按钮" />
        <a onclick="addFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'">添加页面</a>
        <a onclick="addRow();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'">添加一行</a>
        <a onclick="saveAll();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-save'">保存全部</a>
    </div>
</body>
</html>