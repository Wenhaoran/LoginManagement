<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<%@ include file="/commons/basejs.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${staticPath}/static/style/css/search.css"/>

<meta http-equiv="X-UA-Compatible" content="edge" />
<title>账户信息管理</title>
<script type="text/javascript">
    var dataGrid;
    $(function() {
        dataGrid = $('#dataGrid').datagrid({
            url : '${path}/pages/module/dataGrid',
            striped : true,
            rownumbers : true,
            pagination : true,
            singleSelect : true,
            idField : 'id',
            sortName : 'a.moduleName',
            sortOrder : 'desc',
            fit : true,
            fitColumns : true,
            fix : false,
            autoRowHeight : false,
            onDblClickRow: function(index,field){
            	$(this).datagrid('beginEdit', index);  
                var ed = $(this).datagrid('getEditor', {index:index,field:field});  
                
                //$("a[data-row='edit_"+index+"']").attr("disabled",'disabled'); 
                $("a[data-row='revoke_"+index+"']").removeAttr("hidden");
                $("a[data-row='save_"+index+"']").removeAttr("hidden");
                $("a[data-row='save_"+index+"']").linkbutton({text:'保存',plain:true,iconCls:'icon-save'});
                $("a[data-row='revoke_"+index+"']").linkbutton({text:'撤销更改',plain:true,iconCls:'icon-undo'});
                
                $("a[data-row='edit_"+index+"']").linkbutton({text:'更改',plain:true,iconCls:'icon-edit',disabled:true});
                $("a[data-row='del_"+index+"']").linkbutton({text:'删除',plain:true,iconCls:'icon-remove',disabled:true});
                $("a[data-row='account_"+index+"']").linkbutton({text:'账户',plain:true,iconCls:'icon-list',disabled:true});
            },
            pageSize : 20,
            pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
            columns: [[
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
                title : '模块名称',
                field : 'name',
                sortable : false,
                align : 'center',
                editor:{type:'textbox',options:{required:true}},
                hidden : false
            } , 
            {
                width : '5%',
                title : '模块宽度',
                field : 'width',
                sortable : false,
                align : 'center',
                editor:{type:'numberbox',options:{required:true}},
                hidden : false
            } , 
            {
                width : '5%',
                title : '模块高度',
                field : 'height',
                sortable : false,
                align : 'center',
                editor:{type:'numberbox',options:{required:true}},
                hidden : false
            } ,
            {
                width : '35%',
                title : '模块链接',
                field : 'link',
                sortable : false,
                align : 'center',
                editor:{type:'textbox',options:{required:true}},
                hidden : false
            } ,
			{
                width : '10%',
                title : '是否必须',
                field : 'must',
                sortable : false,
                align : 'center',
                hidden : false,
                editor:{  
                    type: 'combobox',  
                    options: { 
                       data: [{"value":"1","text":"是"},{"value":"2","text":"否"}],  
                       valueField: "value",  
                       textField: "text",  
                       editable: false,  
                       panelHeight:70,  
                       required: true  
                   }  
                },
                formatter : function(value, row, index) {
                	if(value==1||value==2){
         				switch (value) {
			             case 1:
			                 return '是';
			             case 2:
			                 return '否';
			        	}
         			}else{
         				return value;
         			}
         		}
            },
            {
                field : 'action',
                title : '操作',
                width : 200,
                align : 'center',
                formatter : function(value, row, index) {
                    var str = '';
	                    str += $.formatString('<a hidden href="javascript:void(0)" class="texpjourPurchInvoiceDet-easyui-linkbutton-save" data-row="save_{0}" data-options="plain:true,iconCls:\'icon-edit\'" onclick="saveRow(\'{1}\',\'{2}\');" >保存</a>', index, row.id, index);
    	            	str += $.formatString('<a hidden href="javascript:void(0)" class="texpjourPurchInvoiceDet-easyui-linkbutton-revoke" data-row="revoke_{0}" data-options="plain:true,iconCls:\'icon-edit\'" onclick="revoke(\'{1}\',\'{2}\');" >撤销更改</a>', index, row.id, index);
						str += $.formatString('<a href="javascript:void(0)" data-row="edit_{0}" class="module-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'icon-edit\'" >编辑</a>',index);
//						str += $.formatString('<a href="javascript:void(0)" data-row="edit_{0}" class="module-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'icon-edit\'" onclick="editFun(\'{1}\',\'{2}\');" >编辑</a>',index, row.id,index);
						str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
						if(row.level != 1 ){
							str += $.formatString('<a href="javascript:void(0)" data-row="del_{0}" class="module-easyui-linkbutton-del" data-options="plain:true,iconCls:\'icon-del\'" onclick="deleteFun(\'{1}\',\'{2}\');" >删除</a>',index, row.id,index);
							str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
						}
						str += $.formatString('<a href="javascript:void(0)" data-row="account_{0}" class="module-easyui-linkbutton-view" data-options="plain:true,iconCls:\'icon-list\'" onclick="detailListView(\'{1}\');" >关联账户</a>',index, row.id);
					return str;
                }
            } 
			]],
            onLoadSuccess:function(data){
                $('.module-easyui-linkbutton-edit').linkbutton({text:'双击编辑',plain:true,iconCls:'icon-edit'});
                for(var num = 0;num<data.rows.length;num++){
                	if(data.rows[num].id!=""){
                		$("a[data-row='del_"+num+"']").linkbutton({text:'删除',plain:true,iconCls:'icon-del'});
                		$("a[data-row='account_"+num+"']").linkbutton({text:'关联账户',plain:true,iconCls:'icon-list'});
                    }else{
                    	$("a[data-row='del_"+num+"']").linkbutton({text:'删除未保存记录',plain:true,iconCls:'icon-remove'});
                    	$("a[data-row='account_"+num+"']").linkbutton({text:'关联账户',plain:true,iconCls:'icon-list',disabled:true});
                    }
                }
            },
            toolbar : '#toolbar'
        });
    });

    function addFun() {
    	var url="${path}/pages/module/addPage";
        openEditDialog(url, 350, 550, dataGrid, function(cid) {
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
        var url="${path}/pages/module/editPage?id=" + id;
		openEditDialog(url, 500, 700, dataGrid, function(cid) {
			modify(cid);
		}).dialog('open').dialog('setTitle', '修改');
    }

    function deleteFun(id,index) {
        if (id==""||id == undefined) {//点击右键菜单才会触发这个
        	$('#dataGrid').datagrid('deleteRow', index);
        	$('#dataGrid').datagrid('acceptChanges');
       		var rows = $('#dataGrid').datagrid("getRows");
       		$('#dataGrid').datagrid("loadData", rows);
        } else {
        	$.messager.confirm('询问', '您是否要删除当前 模块？', function(b) {
                if (b) {
                    progressLoad();
                    $.post('${path}/pages/module/delete', {
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
    }

    function detailListView(id) {

    	$('#ListLay').layout('remove','south');
    	$('#ListLay').layout('add',{    
    	    region: 'south',    
    	    width: '100%',
    	    height:'60%',
    	    href:'${path}/pages/account/accountListManagerByModuleId?moduleId='+id,
    	    title: '当前关联角色信息',    
    	    split: true
    	}); 
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
    
	// 如果 操作编辑 则 撤销更改  or 如果 操作新增行，则 删除当前行 
    function revoke(id,index) {
    	if(id==""){
    		$('#dataGrid').datagrid('cancelEdit', index);
        	$("a[data-row='edit_"+index+"']").linkbutton({text:'双击编辑',plain:true,iconCls:'icon-edit'});
        	$("a[data-row='del_"+index+"']").linkbutton({text:'删除未保存记录',plain:true,iconCls:'icon-remove'});
        	$("a[data-row='account_"+index+"']").linkbutton({text:'关联账户',plain:true,iconCls:'icon-list',disabled:true});
        	return;
    		$('#dataGrid').datagrid('deleteRow', index);
    		var rows = $('#dataGrid').datagrid("getRows");
    		$('#dataGrid').datagrid("loadData", rows);
    	}else{
    		$('#dataGrid').datagrid('cancelEdit', index);
    		$("a[data-row='edit_"+index+"']").linkbutton({text:'双击编辑',plain:true,iconCls:'icon-edit'});
        	$("a[data-row='del_"+index+"']").linkbutton({text:'删除',plain:true,iconCls:'icon-del'});
        	$("a[data-row='account_"+index+"']").linkbutton({text:'关联账户',plain:true,iconCls:'icon-list'});
    	}
    }
</script>
</head>
<body>	
   <div id="ListLay" class="easyui-layout" data-options="fit:true,border:true">
     <div data-options="region:'north',border:false,title:'查询条件'" style="height:70px; overflow: hidden;background-color: #fff">
	    		<form id="searchForm">
	    			<div class="search_condition">
    					<p>
							<b>模块名称：</b>
	                		<input id="name_query" name="name" type="text" placeholder="请输入模块名称" class="easyui-validatebox span2" maxlength="32" value=""/>
						</p>
						<p>
							<b>是否必须：</b>
	                		<select id="type_query" name="type" class="easyui-combobox" data-options="width:120,height:26,editable:false,panelHeight:'140px'">
			              		<option value="">-请选择-</option>
				                <option value="1">是</option>
				                <option value="2">否</option>
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
        <a onclick="addFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'">添加页面</a>
        <a onclick="addRow();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'">添加一行</a>
        <a onclick="saveAll();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-save'">保存全部</a>
    </div>
</body>
<script type="text/javascript">
	function addRow(row){
		if(row===undefined){
			//当前 dataGrid 末尾 增加一行空数据，
	    	$('#dataGrid').datagrid('appendRow',{id:""});
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
	    $("a[data-row='revoke_"+rowNumber+"']").linkbutton({text:'撤销更改',plain:true,iconCls:'icon-undo'});
	    $("a[data-row='edit_"+rowNumber+"']").linkbutton({text:'编辑',plain:true,iconCls:'icon-edit',disabled:true});
	    $("a[data-row='del_"+rowNumber+"']").linkbutton({text:'删除',plain:true,iconCls:'icon-del',disabled:true});
	    $("a[data-row='account_"+rowNumber+"']").linkbutton({text:'账户',plain:true,iconCls:'icon-list',disabled:true});
	}
	
	//保存当前行数据
	function saveRow(id,rowIndex){
		//验证必填
		var validate = $('#dataGrid').datagrid('validateRow', rowIndex);  
		if(!validate){
			easyui_error("请 填写所有必填数据 后进行保存操作");
			return;
		}
		//提交编辑当前行
		$('#dataGrid').datagrid('endEdit', rowIndex);  
		var arr=$('#dataGrid').datagrid('getData');
		
		var id = arr.rows[rowIndex].id;
		var name=arr.rows[rowIndex].name;
		var width=arr.rows[rowIndex].width;
		var height=arr.rows[rowIndex].height;
		var link=arr.rows[rowIndex].link;
		var must=arr.rows[rowIndex].must;
		
		saveOne(id,name,width,height,link,must);
		
		var mustName = '';
		if(must==1){
			mustName ='是';
		}else if(must == 2){
			mustName ='否';
		}
		$('#dataGrid').datagrid('updateRow',{
   			index: rowIndex,
   			row: {
   				must: mustName
   			}
   		});
			    		
		 $("a[data-row='edit_"+rowIndex+"']").linkbutton({text:'更改数据',plain:true,iconCls:'icon-edit'});
	     $("a[data-row='del_"+rowIndex+"']").linkbutton({text:'删除',plain:true,iconCls:'icon-del'});
	     $("a[data-row='account_"+rowIndex+"']").linkbutton({text:'账户',plain:true,iconCls:'icon-list',disabled:true});
	}
	
	//保存 一条记录
    function saveOne(id,name,width,height,link,must){
    	//id为空，是新增，否则是修改。
    	if(id==''){
			var url ='${path}/pages/module/add';
			var data = {'name':name,'width':width,'height':height,'link':link,'must':must};
		}else{
			var url ='${path}/pages/module/edit';
			var data = {'id':id,'name':name,'width':width,'height':height,'link':link,'must':must};
		}
    	if(name!=""&&width!=""&&height!=""&&link!="" &&must!="" &&
    		name!=undefined && width!=undefined && height!=undefined && link!=undefined && must!=undefined){
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
    		var name = arr[index].name;
    		var width = arr[index].width;
    		var height = arr[index].height;
    		var link = arr[index].link;
    		var must = arr[index].must;
    		
    		saveOne(id,name,width,height,link,must);
    	}
    	//重新加载 dataGrid
    	dataGrid.datagrid('load', {});
    }
</script>
</html>