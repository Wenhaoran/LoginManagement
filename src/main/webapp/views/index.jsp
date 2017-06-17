<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp"%>
<%@ include file="/commons/basejs.jsp"%>
<%@ page import="cn.digitalpublishing.service.html.menu.WebMenuList" %>
<%@ page import="cn.digitalpublishing.service.html.role.WebRoleList" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="${staticPath }/static/style/css/common.css" />
<script type="text/javascript" src="${staticPath }/static/index.js" charset="utf-8"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="0">
<title>webgate 登录系统</title>
<!-- **	
	*━━━━━━神兽出没━━━━━━
	* 　　     ┏┓　       ┏┓ 
	* 　　   ┏┛┻━━━━━┛┻┓ 
	* 　　   ┃　　　　    ┃ 
	* 　　   ┃　　 ━　     ┃ 
	* 　　   ┃　┳┛　┗┳  ┃ 
	* 　　   ┃　　　   　  ┃ 
	* 　　   ┃　　┻　      ┃ 
	* 　　   ┃　　　　　 ┃ 
	* 　　   ┗━┓　　　┏━┛ 
	* 　　　　┃　　　┃神兽保佑 
	* 　　　　┃　　　┃代码无BUG！ 
	* 　　　　┃　　　┗━━━┓ 
	* 　　　　┃　　　　　 ┣┓ 
	* 　　　　┃　　　　　┏┛ 
	* 　　　　┗┓┓┏━┳┓┏┛ 
	* 　　　　  ┃┫┫　┃┫┫ 
	* 　　　　  ┗┻┛　┗┻┛ 
	* ━━━━━━神兽出没━━━━━━
	* -->
<script type="text/javascript">
	$(function() {
		
		var ticket = '${sessionScope.ticket}';
		var roleId = '${form.roleId}';
		var sysId = '${form.sysId}';
		var accountId = '${form.accountId}';
		
		var changepwd = '${form.changepwd}';
		if(changepwd=='true'){
			editUserPwd();
		}
		
		//getMenuList 
		
		$("#tabs").tabs({
			border : false,
			fit : true,
			height : '20px',
			cache : false,
			onSelect : function(title, index) {
				if (index == 0) {
					var centerTabs = $('#tabs').tabs('getTab', 0);
					$('#tabs').tabs('update', {
						tab : centerTabs,
						options : {
							closable : false,
							//content : content,
							height : '20px'
						}
					});
				} else {
				}
			}
		});
		
		$('#changeRole').menubutton({   
		    iconCls: 'icon-edit',    
		    menu: '#tab_personmenu'   
		});
		
		$('#shortcutMenu').menubutton({    
		    iconCls: 'icon-edit',    
		    menu: '#tab_shortcutMenu'   
		});
		
	});
</script>
<script type="text/javascript">
	$(function() {
		var tabsId = 'tabs';//tabs页签Id 
		var tab_rightmenuId = 'tab_rightmenu';//tabs右键菜单Id   
		//绑定tabs的右键菜单  
		$("#" + tabsId).tabs({
			onContextMenu : function(e, title) {//这时去掉 tabsId所在的div的这个属性：class="easyui-tabs"，否则会加载2次
				e.preventDefault();
				if (title != "首页") {
					$('#' + tab_rightmenuId).menu('show', {
						left : e.pageX,
						top : e.pageY
					}).data("tabTitle", title);
				}
			}
		});
		//实例化menu的onClick事件  
		$("#" + tab_rightmenuId).menu({
			onClick : function(item) {
				CloseTab(tabsId, tab_rightmenuId, item.name);
			}
		});
		
		
	});
	/**  
	 * tab关闭事件  
	 * @param tabId  tab组件Id 
	 * @param tabMenuId tab组件右键菜单Id 
	 * @param type  
	 * tab组件右键菜单div中的name属性值 
	 */
	function CloseTab(tabId, tabMenuId, type) { //tab组件对象  
		var tabs = $('#' + tabId); //tab组件右键菜单对象 
		var tab_menu = $('#' + tabMenuId);
		//获取当前tab的标题 
		var curTabTitle = tab_menu.data('tabTitle');
		//关闭当前tab 
		if (type === 'tab_menu-tabclose') {
			//通过标题关闭tab 
			if (curTabTitle != "首页") {
				tabs.tabs("close", curTabTitle);
			} else {
				//tabs.tabs("close","首页");
			}
		}
		//关闭全部tab 
		else if (type === 'tab_menu-tabcloseall') {
			//获取所有关闭的tab对象 
			var closeTabsTitle = getAllTabObj(tabs);
			//循环删除要关闭的tab  
			$.each(closeTabsTitle, function() {
				var title = this;
				if (title != "首页") {
					tabs.tabs('close', title);
				}
			});
		}
		//关闭其他tab 
		else if (type === 'tab_menu-tabcloseother') { //获取所有关闭的tab对象 
			var closeTabsTitle = getAllTabObj(tabs); //循环删除要关闭的tab   
			$.each(closeTabsTitle, function() {
				var title = this;
				if (title != curTabTitle && title != "首页") {
					tabs.tabs('close', title);
				}
			});
		}
		//关闭当前左侧tab 
		else if (type === 'tab_menu-tabcloseleft') { //获取所有关闭的tab对象 
			var closeTabsTitle = getLeftToCurrTabObj(tabs, curTabTitle);
			//循环删除要关闭的tab   
			$.each(closeTabsTitle, function() {
				var title = this;
				if (title != "首页") {
					tabs.tabs('close', title);
				}
			});
		}
		//关闭当前右侧tab 
		else if (type === 'tab_menu-tabcloseright') { //获取所有关闭的tab对象 
			var closeTabsTitle = getRightToCurrTabObj(tabs, curTabTitle);
			//循环删除要关闭的tab   
			$.each(closeTabsTitle, function() {
				var title = this;
				if (title != "首页") {
					tabs.tabs('close', title);
				}
			});
		}
	}

	/**  获取所有关闭的tab对象  
	 @param 
	 tabs tab组件 
	 */
	function getAllTabObj(tabs) { //存放所有tab标题  
		var closeTabsTitle = []; //所有所有tab对象  
		var allTabs = tabs.tabs('tabs');
		$.each(allTabs, function() {
			var tab = this;
			var opt = tab.panel('options');
			//获取标题   
			var title = opt.title;
			//是否可关闭 ture:会显示一个关闭按钮，点击该按钮将关闭选项卡   
			var closable = opt.closable;
			if (closable) {
				closeTabsTitle.push(title);
			}
		});
		return closeTabsTitle;
	}

	/**  获取左侧第一个到当前的tab  @param tabs  
	 tab组件 
	 @param 
	 curTabTitle 到当前的tab 
	 */
	function getLeftToCurrTabObj(tabs, curTabTitle) {
		//存放所有tab标题  
		var closeTabsTitle = [];
		//所有所有tab对象  
		var allTabs = tabs.tabs('tabs');
		for (var i = 0; i < allTabs.length; i++) {
			var tab = allTabs[i];
			var opt = tab.panel('options');
			//获取标题   
			var title = opt.title;
			//是否可关闭 ture:会显示一个关闭按钮，点击该按钮将关闭选项卡   
			var closable = opt.closable;
			if (closable) {
				//alert('title' + title + '  curTabTitle:' + curTabTitle);    
				if (title == curTabTitle) {
					return closeTabsTitle;
				}
				closeTabsTitle.push(title);
			}
		}
		return closeTabsTitle;
	}

	/**  
	 * 获取当前到右侧最后一个的tab  
	 * @param tabs  
	 * tab组件 
	 * @param 
	 * curTabTitle 到当前的tab 
	 */
	function getRightToCurrTabObj(tabs, curTabTitle) {
		//存放所有tab标题  
		var closeTabsTitle = [];
		//所有所有tab对象  
		var allTabs = tabs.tabs('tabs');
		for (var i = (allTabs.length - 1); i >= 0; i--) {
			var tab = allTabs[i];
			var opt = tab.panel('options');
			//获取标题   
			var title = opt.title;
			//是否可关闭 ture:会显示一个关闭按钮，点击该按钮将关闭选项卡  
			var closable = opt.closable;
			if (closable) {
				//alert('title' + title + '  curTabTitle:' + curTabTitle);    
				if (title == curTabTitle) {
					return closeTabsTitle;
				}
				closeTabsTitle.push(title);
			}
		}
		return closeTabsTitle;
	}

	function logout() {
		$.messager.confirm('提示', '确定要退出?', function(r) {
			if (r) {
				progressLoad();
				$.post('${path }/pages/common/logout', function(result) {
					if (result.success) {
						progressClose();
						window.location.href = '${path}';
					}else{
						alert("系统错误");
					}
				}, 'json');
			}
		});
	}

	function editUserPwd() {
		var accountId = '${form.accountId}';
		parent.$.modalDialog({
			title : '修改密码',
			width : 300,
			height : 250,
			href : '${path }/pages/account/editPwdPage?accountId='+accountId,
			buttons : [ {
				text : '确定',
				handler : function() {
					var f = parent.$.modalDialog.handler
							.find('#editUserPwdForm');
					f.submit();
				}
			} ]
		});
	}
	
	function changeRole(item){
		if(item.id!==undefined){
			$.post('${path}/pages/frame/switchRole', {
	            roleId :item.id
	        }, function(result) {
	            if (result.isSuccess=="true") {
	            	window.location.href = basePath + '/pages/index';
	            }
	        }, 'JSON');			
		}
	}
	
	
	$(function() {
		$('.easyui-tree').tree({
			onSelect : function(node) {
				if (node.state == "closed")
					$(this).tree('expand', node.target);
				else
					$(this).tree('collapse', node.target);
			}
		});
	});
</script>
</head>
<body class="easyui-layout">
	<div id="loading" style="position: fixed; top: -50%; left: -50%; width: 200%; height: 200%; background: #fff; z-index: 100; overflow: hidden;">
		<img src="${staticPath }/static/style/images/ajax-loader.gif" style="position: absolute; top: 0; left: 0; right: 0; bottom: 0; margin: auto;" />
	</div>

	<div class="top" id="index_layout"
		data-options="region:'north',split:true">
		<div class="container">
			<div class="topInner">
				<a href="#" class="logo"><img src="${staticPath }/static/style/images/logo.png" alt=""></a>
				<a href="#" class="smallLogo">登录认证系统 </a> 
				

				<a href="javascript:void(0)" onclick="logout()" class="quit">|&nbsp;&nbsp;安全退出&nbsp;&nbsp;</a> 
				<a href="javascript:void(0)" onclick="editUserPwd()" class="quit">|&nbsp; 修改密码&nbsp;&nbsp;</a> 
				
				<a id="changeRole" href="javascript:void(0)" class="quit">&nbsp; 欢迎，${form.username}&nbsp;&nbsp;</a>
				
				<a id="shortcutMenu" href="javascript:void(0)" class="quit">快捷菜单&nbsp;&nbsp;</a>
				
			</div>
		</div>
	</div>
	<div data-options="region:'west',title:'导航菜单',split:true"
		style="width: 12%;">
		<ul class="easyui-tree" id="dtree">
		<%
		HttpServletRequest reque = request;
		%>
		<%=	new WebMenuList().getMenuList(reque)%>
			<!-- <li><span>系统管理</span><ul><li><span>系统信息</span><ul><li><span>三级菜单</span><ul><li><a href='###' onclick='addFrameTab("四级菜单", "http://127.0.0.1:8080/webgate/pages/system/form/index?ticket=1489622475604_0.5272848774602615&pt_rtype=m")'><span style='cursor:pointer;'>四级菜单</span></a></li></ul></li></ul></li><li><a href='###' onclick='addFrameTab("资源信息", "http://127.0.0.1:8080/webgate/pages/resource/form/index?ticket=1489622475604_0.5272848774602615&pt_rtype=m")'><span style='cursor:pointer;'>资源信息</span></a></li><li><span>账户信息</span><ul><li><a href='###' onclick='addFrameTab("三级菜单2", "http://127.0.0.1:8080/webgate/pages/system/form/index?ticket=1489622475604_0.5272848774602615&pt_rtype=m")'><span style='cursor:pointer;'>三级菜单2</span></a></li></ul></li><li><a href='###' onclick='addFrameTab("角色信息", "http://127.0.0.1:8080/webgate/pages/role/form/index?ticket=1489622475604_0.5272848774602615&pt_rtype=m")'><span style='cursor:pointer;'>角色信息</span></a></li><li><a href='###' onclick='addFrameTab("组件信息", "http://127.0.0.1:8080/webgate/pages/component/form/index?ticket=1489622475604_0.5272848774602615&pt_rtype=m")'><span style='cursor:pointer;'>组件信息</span></a></li><li><a href='###' onclick='addFrameTab("模块信息", "http://127.0.0.1:8080/webgate/pages/module/form/index?ticket=1489622475604_0.5272848774602615&pt_rtype=m")'><span style='cursor:pointer;'>模块信息</span></a></li><li><a href='###' onclick='addFrameTab("功能信息", "http://127.0.0.1:8080/webgate/pages/function/form/index?ticket=1489622475604_0.5272848774602615&pt_rtype=m")'><span style='cursor:pointer;'>功能信息</span></a></li></ul></li><li><a href='###' onclick='addFrameTab("一级菜单", "http://127.0.0.1:8080/webgate/pages/system/form/index?ticket=1489622475604_0.5272848774602615&pt_rtype=m")'><span style='cursor:pointer;'>一级菜单</span></a></li> -->
		</ul>
	</div>
	<div data-options="region:'center'" style="background: #eee;">
		<div id="tabs">
			<jsp:include page="center.jsp"></jsp:include>
		</div>
	</div>


	<div class="top bottom" data-options="region:'south',border:false">
		<div class="container">
			<div class="topInner">
				<p>
					Copyright © 2080 power by <a
						href="http://www.digitalpublishing.cn/" target="_blank">北京英捷特数字出版技术有限公司</a>
				</p>
			</div>
		</div>
	</div>

	<div id="tab_rightmenu" class="easyui-menu" style="width: 150px;">
		<div name="tab_menu-tabclose">关闭</div>
		<div name="tab_menu-tabcloseall">关闭全部标签</div>
		<div name="tab_menu-tabcloseother">关闭其他标签</div>
		<div class="menu-sep"></div>
		<div name="tab_menu-tabcloseright">关闭右侧标签</div>
		<div name="tab_menu-tabcloseleft">关闭左侧标签</div>
	</div>
	
	<div id="tab_personmenu" data-options="onClick:changeRole" class="easyui-menu" style="width: 150px;">
		<%=	new WebRoleList().getRoleList(reque)%>
		<!-- <div>其他角色</div>   
		<div class="menu-sep"></div>
	    <div>editorial</div>   
	    <div>管理员</div>
	    <div>主任</div>   
	    <div>印刷厂厂长</div>   
	    <div>admin</div>   
	    <div class="menu-sep"></div>   
	    <div>当前角色：</div> -->
	</div>
	
	<div id="tab_shortcutMenu" class="easyui-menu" style="width: 150px;">
		<div data-options="iconCls:'icon-save'">增加快捷菜单</div>   
		<div class="menu-sep"></div>
	    <div>系统信息</div>   
	    <div>资源信息</div>
	    <div>角色信息</div>   
	    <div>组件信息</div>   
	    <div>功能模块</div>   
	    <div class="menu-sep"></div>   
	    <div data-options="iconCls:'icon-remove'">删除快捷菜单</div>
	</div>
	
	
</body>

</html>

<script>
	$(function() {
		$("#dtree").tree('collapseAll');//默认全部展开
	});
</script>