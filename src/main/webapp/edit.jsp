<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
 <script type="text/javascript" src="${staticPath }/static/jquery.form.js" charset="utf-8"></script>
<script type="text/javascript">
var postDatas={};
var isValid;
function modify(cid)  {
	var datas = $('#itemsTable').datagrid('getRows');
	if(datas.length==0){
		easyui_error("请至少添加一条明细！");
		return;
	}
	
	$("#ptGodownEntryEditForm").ajaxSubmit({
		beforeSubmit :function(){
			progressLoad();
            isValid = $('#ptGodownEntryEditForm').form('validate');
            if (!isValid) {
                progressClose();
            }
            if(isValid){acceptChanges
            	$('#itemsTable').datagrid('acceptChanges');
            	for (var index = 0; index < datas.length; index++) {
            		postDatas["itemsList[" + index + "].count"] = datas[index].count;
            		postDatas["itemsList[" + index + "].unitPrice"] = datas[index].unitPrice;
            		postDatas["itemsList[" + index + "].ptMaterialId"] = datas[index].materialId;
            	}
            }
            return isValid;
		},
		success : function(result) {
			progressClose();
            result = $.parseJSON(result);
            if (result.success) {
            	$("#"+cid).dialog("close");
				$("#"+cid).dialog("destroy");
				easyui_alert("修改材料入库单成功！");
            } else {
            	easyui_error(result.msg);
            }
		},
		url : '${path}/ptGodownEntry/edit',
		type : "post",
		clearForm : false,
		data : postDatas
});
}

function searchMaterialFun(){
	$("#materialTable").datagrid('load', $.serializeObject($('#searchMaterialForm')));
}

function cleanMaterialFun(){
	$('#searchMaterialForm input').val('');
    $('#searchMaterialForm select').combobox({
    	onLoadSuccess: function (row, data) {
    		$(this).combobox('setValue', '');
    	}
    });
    $("#materialTable").datagrid('load', {});
}

function addItemsFun(index){
	var selectData=$('#materialTable').datagrid('getData').rows[index];
	var dataGridRows=$('#itemsTable').datagrid('getData').rows;
	for (var int = 0; int < dataGridRows.length; int++) {
		if(dataGridRows[int].materialId==selectData.id){
			easyui_error("您已添加过此材料！");
			return;
		}
	}
	selectData.materialId=selectData.id;
	$('#itemsTable').datagrid("appendRow",selectData);
	//每次新增一条  直接开启此行的编辑模式
	var maxIndex=$('#itemsTable').datagrid('getData').rows.length-1;
	$('#itemsTable').datagrid('selectRow', maxIndex).datagrid('beginEdit', maxIndex);
	$('#itemsTable').datagrid('unselectAll');
}

function removeItemslFun(){
	var delCheckedRows=$('#itemsTable').datagrid('getChecked');
	if(delCheckedRows.length==0){
		easyui_error("请至少选择一条明细！");
		return;
	}
	for (var int = delCheckedRows.length-1; int>=0; int--) {
		index=$('#itemsTable').datagrid('getRowIndex',delCheckedRows[int].id);
		$('#itemsTable').datagrid('deleteRow',index);
	}
}


$(function() {
	initCorpAutocompelete('${path}','crmId','printCorp',170,29,$("#crmIdHide").val(),'');
    ////////初始化材料一些基础信息，形成自动补全
	$.ajax({
		"dataType" : "json",
		"type" : "POST",
		"url" : '${path}/ptMaterial/getMaterialDicDatas',
		"cache" : false,
		"success" : function(response) {
			initAutoCompleteByLocal('spec',response.materialSpecList,'code','name',140,29);
			initAutoCompleteByLocal('brand',response.materialBrandList,'code','name',140,29);
			initAutoCompleteByLocal('types',response.materialTypeList,'code','name',140,29);
		},
		"error" : function(response) {
			alert("error");
		}
	});
	
	
	$('#materialTable').datagrid({  
		idField: 'id',
	    textField: 'name',
        rownumbers : true,
        pagination : true,
        singleSelect:true,
        sortName : 'id',
        pageSize : 10,
        pageList : [ 10, 20, 30, 40, 50],
	    url:'${path}/ptMaterial/dataGrid?status=1',
	    columns:[[
			    {field:'id',hidden:true},
			    {field:'code',title:'编号',width:'17%'},
			    {field:'name',title:'名称',width:'17%'},
			    {field:'specification',title:'规格',width:'9%'},
			    {field:'type',title:'类型',width:'8%'},
			    {field:'unit',title:'单位',width:'5%'},
			    {field:'gramWeight',title:'克重',width:'5%'},
			    {field:'brand',title:'品牌',width:'9%'},
			    {field:'action',title:'操作',width:'5%',
			    	formatter:function(value,row,index){
			    		return $.formatString('<a href="javascript:void(0)" style="margin-left:-8px" class="easyui-material-linkbutton" data-options="plain:true,iconCls:\'icon-dc-add\'" onclick="addItemsFun(\'{0}\');" ></a>', index);
			    	}	
			    }
	    ]],
	    onLoadSuccess:function(data){
            $('.easyui-material-linkbutton').linkbutton({text:'',plain:true,iconCls:'icon-dc-add'});
        },
        toolbar : '#materialToolbar'
	});
	
	
	$('#itemsTable').datagrid({  
		url:'${path}/ptGodownEntryItem/dataGridNoPage', 
		queryParams:{"ptId": $("#id").val()} ,
        singleSelect : false,
        idField : 'id',
        selectOnCheck:false,//点击行的时候不选中复选框
        autoRowHeight : false,
		columns: [[
		            { 
		           	   field : 'ck', checkbox : true
		           	},
		           	{field:'id',title:'ID',hidden:true},
					{field:'materialId',title:'ID',hidden:true},
					{field:'code',title:'编号',width:'15%'},
					{field:'name',title:'名称',width:'15%'},
				    {field:'specification',title:'规格',width:'8%'},
					{field:'type',title:'类型',width:'8%'},
					{field:'unit',title:'单位',width:'4%'},
					{field:'gramWeight',title:'克重',width:'4%'},
					{field:'brand',title:'品牌',width:'7%'},
					{field:'count',title:'入库数量',width:'7%',editor:{type:'numberbox',options:{required:true}}},
					{field:'unitPrice',title:'入库单价',width:'8%',editor:{type:'numberbox',options:{required:true}}}
				]],
				 onLoadSuccess:function(data){
					   var rows=$(this).datagrid('getRows');
					   for (var int = 0; int < rows.length; int++) {
							$(this).datagrid('beginEdit', int);
						}

			     }
	});
	

	
});
</script>
<div class="easyui-layout" data-options="fit:true,border:false" >
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;" >
        <form id="ptGodownEntryEditForm" method="post" style="margin-bottom:5px">
    		<input id="id" name="id" type="hidden" value="${ptGodownEntry.id}"/>
    		<input id="crmIdHide" type="hidden" value="${ptGodownEntry.crmCorptypeRsIn}"/>
            <table class="grid">
            	 <tr>
                    <td align="center">单号</td>
                	<td>
                		<input id="code" name="code"  value="${ ptGodownEntry.code}" class="easyui-textbox" data-options="required:true,width:170" />
					</td>
                    <td align="center">入库区</td>
                	<td>
                		<input id="crmId" name=crmCorptypeRsIn data-options="required:true"/>
					</td>
                    <td align="center">时间</td>
                	<td>
                		<input id="createOn"  name="createOn" class="easyui-datetimebox"  value="${ptGodownEntry.createOn}"  data-options="editable:false,required:true,width:170"/>
					</td>
                    <td align="center">类型</td>
                	<td>
                    	<select id="type" name="type" class="easyui-combobox" data-options="width:170,height:29,editable:false,panelHeight:'auto',required:true">
                    			<c:forEach items="${materialInOrderTypeList}" var="dic">
	                    			<option value="${dic.code}" value="${dic.code}" <c:if test="${dic.code == ptGodownEntry.type}">selected="selected"</c:if> >${dic.name}</option>
	                    		</c:forEach>
                    	</select>
					</td>
                </tr>
                <tr>
                    <td align="center">备注</td>
                	<td colspan="7">
                    	<textarea id="remark" name="remark" rows="4" cols="30" maxlength="128" class="easyui-textbox" style="resize: none;width: 900px;height: 50px" data-options="required:false,multiline:true">${ptGodownEntry.remark}</textarea>
					</td>
                </tr>
            </table>
        </form>
        <div style="width:100%;margin-top:-10px">
        	<div style="float: left;width:48%;height:570px;">
        		<div id="materialDiv" class="easyui-panel" title="选择材料列表" style="padding:5px;" data-options="iconCls:'icon-dc-material',fit:true">   
			      <table id="materialTable"></table>
				</div> 
        	</div>
	        <div style="float: right;width:52%;height:570px;">
        		<div id="itemsDiv" class="easyui-panel" title="材料入库明细" style="padding:5px;" data-options="iconCls:'icon-dc-list',fit:true">
        			<div style="margin-top:15px">
    					<a href="javascript:void(0);"  style="margin-top:-18px;margin-bottom:2px" class="easyui-linkbutton" iconCls="icon-dc-del" plain="true" onclick="removeItemslFun();">删除</a>
    				</div>   
			       <table id="itemsTable" style="height:490px"></table>
				</div> 
        	</div>
        </div>
        <div id="materialToolbar" style="display: none;margin-bottom:-7px"">
        		<form id="searchMaterialForm">
    			<div class="search_condition">
    				<table>
    					<tr>
    						<td><b>编号</b><input id="code" name="code"  class="easyui-textbox"/></td>
    						<td><b>名称</b><input id="name" name="name" class="easyui-textbox" /></td>
    						<td><b>克重</b><input id="gramWeight" name="gramWeight" class="easyui-textbox" /></td>
    						<td><b>规格</b><input id="spec" name="specification" /></td>
    						
    					</tr>
    					<tr>
    						<td><b>类型</b><input id="types" name="type" /></td>
    						<td><b>品牌</b><input id="brand" name="brand"  /></td>
    						<td colspan="2">
    							<div style="margin-top:15px">
    								<a href="javascript:void(0);"  style="margin-bottom:10px" class="easyui-linkbutton" iconCls="icon-dc-search" plain="true" onclick="searchMaterialFun();">查询</a>
    								<a href="javascript:void(0);" style="margin-bottom:10px" class="easyui-linkbutton" iconCls="icon-dc-reset" plain="true" onclick="cleanMaterialFun();">清空</a>
    							</div>
    						</td>
    					</tr>
    				</table>
    			</div>
    		</form>
        </div>
    </div>
</div>