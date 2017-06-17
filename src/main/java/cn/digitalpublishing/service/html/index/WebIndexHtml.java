package cn.digitalpublishing.service.html.index;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import cn.digitalpublishing.base.bean.IndexHtmlList;
import cn.digitalpublishing.base.bean.IndexModuleList;
import cn.digitalpublishing.po.system.SysModule;

/**
 * 
 * @author Administrator
 *	主页html
 */
public class WebIndexHtml {

	public String getIndexHtml(HttpServletRequest request) {
		String ticket = (String) request.getSession().getAttribute("ticket");
		
		if(!"".equals(ticket)&&ticket!=null){
			List<SysModule> module = IndexModuleList.get(ticket);
			if(module!=null&&module.size()>0){
				if("".equals(IndexHtmlList.get(ticket))||IndexHtmlList.get(ticket) == null){
					String html = createIndexHtml(module,ticket);
					IndexHtmlList.put(ticket, html);
					return html;
				}else{
					return IndexHtmlList.get(ticket);
				}
			}
		}
		return "";
		
	}
	
	public String createIndexHtml(List<SysModule> resourceList,String ticket){
		StringBuffer sb = new StringBuffer();
		sb.append("");
		/*
		 * 注意： panel 中 的 iframe 的 src ,有 3种写法。
		 * 1、http://www.baidu.com
		 * 2、/www.baidu.com
		 * 3、www.baidu.com	  会自动带上  当前 服务器名，eg:127.0.0.1:8080/www.baidu.com
		<div id='p' class='easyui-panel' title='Basic Panel' style='width:700px;height:200px;'>
			<iframe src='index' style='border:0;width:100%;height:100%;'>
			</iframe>
		</div> 
											   删除按钮		 只显示 标题			最小化			最大化
		  data-options=\"iconCls:'icon-save',closable:false,collapsible:true,minimizable:false,maximizable:true\">");
		 */
		for (SysModule module:resourceList) {
			if(module.getMust()==1){
				sb.append("<div class='easyui-panel' title='"+module.getName()+"' style='width:"+module.getWidth()+"px;height:"+module.getHeight()+"px;' data-options=\"iconCls:'icon-save',closable:false,collapsible:true,minimizable:false,maximizable:true\">");
			}else{
				sb.append("<div class='easyui-panel' title='"+module.getName()+"' style='width:"+module.getWidth()+"px;height:"+module.getHeight()+"px;' data-options=\"iconCls:'icon-save',closable:true,collapsible:true,minimizable:true,maximizable:true\">");
			}
			
			sb.append("<iframe src='"+module.getLink() +"' style='border:0;width:100%;height:100%;'>");
			sb.append("</iframe>");
			sb.append("</div>");
		}
		return sb.toString();
	}
	
}
 