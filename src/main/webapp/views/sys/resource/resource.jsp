<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/commons/basejs.jsp" %>
<meta http-equiv="X-UA-Compatible" content="edge" />
<title>资源信息管理</title>
    <script type="text/javascript">
    var dataGrid;
    var organizationTree;
    
    $(function() {
    	var sysId = '${form.obj.system.id}';
    	var sysName = '${form.obj.system.name}';
		$("#systemId").val(sysId);
		
   	   	$('#systemId_query').combobox({
   	    	onSelect: function(record){
   	    		$("#systemId").val(record.value);
	   	    	searchResourceTreeBySystemId(record.value);
	   	     	searchResourceBySystemId(record.value);
   	    	}
   	    });
   	   	
   	 	$('#systemId_query').combobox('setValue',sysId);
   	   
    });
    
    function searchResourceTreeBySystemId(systemId){
    	organizationTree = $('#organizationTree').tree({
            url : '${path }/pages/resource/tree',
            queryParams: {
            	systemId: systemId
        	},
        	method : "post",
            parentField : 'parentResourceId',
            textField : 'name',
            lines : true,
            onClick : function(node) {
//                 dataGrid.datagrid('load', {
//                    organizationId: node.id
//                });
            }
        });
    }
    
    function searchResourceBySystemId(systemId){
    	
    	treeGrid = $('#treeGrid').treegrid({
            url : '${path }/pages/resource/findResourceBySystemId?systemId='+systemId,
            idField : 'id',
            rownumbers : true,
            treeField : 'name',
            parentField : 'parentResourceId',
            fit : true,
            autoRowHeight :false,
            fitColumns : false,            
            border : false,
            frozenColumns : [ [ {title : '编号',field : 'code',width : 80} ] ],
            columns : [ [ 
                {field : 'name',title : '资源名称',width : '13%'}, 
                {field : 'link',title : '资源路径',width : '20%'}, 
                {field : 'type',title : '资源类型',width : '7%', 
              	  formatter : function(value, row, index) {
             			switch (value) {
				             case 1:
				                 return '菜单';
				             case 2:
				                 return '接口';
				        }
      		  	  }
                }, 
                {field : 'parentResourceId',title : '上级资源ID',width : '10%',hidden : true}, 
                {field : 'status',title : '状态',width : '4%',
			          formatter : function(value, row, index) {
			              switch (value) {
			              case 1:
			                  return '在用';
			              case 2:
			                  return '停用';
			              }
			          }
  			  },
  			  {field : 'systemName',title : '所属系统',width : '20%'},
  			  {field : 'componentName',title : '所属组件',width : '10%'},
  			  {field : 'action',title : '操作',width : '25%',
		          formatter : function(value, row, index) {
		              var str = '';
		                      str += $.formatString('<a href="javascript:void(0)" class="resource-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'icon-edit\'" onclick="editFun(\'{0}\');" >编辑</a>', row.id);
		                      str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
		                      str += $.formatString('<a href="javascript:void(0)" class="resource-easyui-linkbutton-del" data-options="plain:true,iconCls:\'icon-del\'" onclick="deleteFun(\'{0}\');" >删除</a>', row.id);
		                      str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
		                      str += $.formatString('<a href="javascript:void(0)" class="resource-easyui-linkbutton-view" data-options="plain:true,iconCls:\'icon-list\'" onclick="detailListView(\'{0}\');" >角色授权</a>', row.id);
		                      str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
		                      str += $.formatString('<a href="javascript:void(0)" class="resource-easyui-linkbutton-page" data-options="plain:true,iconCls:\'icon-list\'" onclick="page(\'{0}\');" >页面管理</a>', row.id);
		              return str;
		          }
  			  } ] ],
            onLoadSuccess:function(data){
            	$('#treeGrid').treegrid('collapseAll');
                $('.resource-easyui-linkbutton-edit').linkbutton({text:'编辑',plain:true,iconCls:'icon-edit'});
                $('.resource-easyui-linkbutton-del').linkbutton({text:'删除',plain:true,iconCls:'icon-del'});
                $('.resource-easyui-linkbutton-view').linkbutton({text:'角色授权',plain:true,iconCls:'icon-list'});
                $('.resource-easyui-linkbutton-page').linkbutton({text:'页面管理',plain:true,iconCls:'icon-list'});
                
            },
            toolbar : '#toolbar'
        });
    }

	function editFun(id) {
    	if (id != undefined) {
            treeGrid.treegrid('select', id);
        }
        var node = treeGrid.treegrid('getSelected');
        var url='${path }/pages/resource/editPage?resourceId=' + node.id;
        openEditTreeDialog(url, 450, 500, treeGrid, function(cid) {
			modify(cid);
		}).dialog('open').dialog('setTitle', '修改');
    }

    function deleteFun(id) {
        if (id != undefined) {
            treeGrid.treegrid('select', id);
        }
        var node = treeGrid.treegrid('getSelected');
        if (node) {
            progressLoad();
            $.post('${pageContext.request.contextPath}/pages/resource/deleteResource', {
            	id : node.id
            }, function(result) {
                if (result.success) {
                	treeGrid.treegrid('reload');
                	organizationTree.tree('reload');
                }
                easyui_alert(result.msg);
                progressClose();
            }, 'JSON');
        }
    }

    function addFun() {
    	var sysId = $("#systemId").val();
    	var url="${path}/pages/resource/addPage?systemId="+sysId;
    	openEditTreeDialog(url, 450, 500, treeGrid, function(cid) {
			add(cid);
		}).dialog('open').dialog('setTitle', '新增');
    }
    
    function searchFun() {
        dataGrid.datagrid('load', $.serializeObject($('#searchForm')));
    }
    
    function cleanFun() {
        $('#searchForm input').val('');
        dataGrid.datagrid('load', {});
    }
    
    function detailListView(id) {
    	$('#ListLay').layout('remove','south');
    	$('#ListLay').layout('add',{    
    	    region: 'south',    
    	    width: '100%',
    	    height:'60%',
    	    href:'${path}/pages/role/roleListManagerByResourceId?resourceId='+id,
    	    title: '当前关联角色信息',    
    	    split: true
    	}); 
    }    
    
    function page(id) {
    	$('#ListLay').layout('remove','south');
    	$('#ListLay').layout('add',{    
    	    region: 'south',    
    	    width: '100%',
    	    height:'60%',
    	    href:'${path}/pages/page/pageListManagerByResourceId?resourceId='+id,
    	    title: '当前关联页面信息',    
    	    split: true
    	}); 
    }    
    
    </script>
</head>
<body>	
    <div id="ListLay" class="easyui-layout" data-options="fit:true,border:true,title:'岗位列表'" >
    	<!-- 中部区域重新布局 -->
        <div data-options="region:'center',border:false"  >
             <div class="easyui-layout" data-options="fit:true,border:true,title:'岗位列表'" >
             	
               	<div data-options="region:'center',border:false"  style="overflow: hidden;">
		            <table id="treeGrid"></table>
		        </div>
             </div>
            
        </div>
        <div data-options="region:'west',border:true,split:false,title:'组织机构'"  style="width:240px;overflow: true; ">
        	<p>
	    		<b>选择系统：</b>
	    		<input id="systemId" name="systemId" type="hidden" />
	    		<select id="systemId_query" class="easyui-combobox" data-options="width:120,height:26,editable:false,panelHeight:'140px'">
	    			<c:forEach items="${systemList}" var="system">
						<option value="${system.id}">${system.name}</option>
					</c:forEach>
				 </select>
  			</p>
		    <ul id="organizationTree"  style="width:160px;margin: 10px 10px 10px 10px"></ul>
    </div>
    </div>
    <div id="toolbar" style="display: none;">
		<a onclick="addFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'">添加</a>
    </div>
</body>
</html>