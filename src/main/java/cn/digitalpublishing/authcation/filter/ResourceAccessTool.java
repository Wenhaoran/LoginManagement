package cn.digitalpublishing.authcation.filter;

import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jdom.input.SAXBuilder;
import org.jdom.Document;
import org.jdom.Element;

public class ResourceAccessTool {
	
	public final static String ACCESS_Y = "Y";
	
	public final static String ACCESS_N = "N";

	public static String permissionXmlToMap(String component,String resource,String roleId) throws Exception{

		String isPermit = ACCESS_N;
		SAXBuilder builder = new SAXBuilder();
		String premissionURL = ResourceAccessConfig.getInstance().get("resourceURL");
		URL url = new URL(premissionURL + "/" + component+"/"+resource.replace("/","_")+"/"+roleId+".xml");
		Document doc = builder.build(url);
		//[element] map
		Element root = doc.getRootElement();
		Element element=root.getChild("type");
		if("1".equals(element.getValue())){
			Element obj=root.getChild("obj");
			if(obj!=null){
				Element result = obj.getChild("string");
				if(result!=null){
					isPermit = result.getText().trim().toUpperCase();
				}
			}
		}
		return isPermit;
	}
	
	@SuppressWarnings("unchecked")
	public static Map<String,String> xmlToMap(String urlString)throws Exception{
		Map<String,String> map = null;
		SAXBuilder builder = new SAXBuilder();
		URL url = new URL(urlString);
		Document doc = builder.build(url);
		Element root = doc.getRootElement();
		Element element=root.getChild("type");
		if("1".equals(element.getValue())){
			Element obj=root.getChild("obj");
			if(obj!=null){
				List<Element> entry_1 = obj.getChildren("map");
				map = new HashMap<String,String>();
				for(int i = 0 , j =entry_1.size() ; i < j ; i++){
					Element entryTemp = entry_1.get(i);
					List<Element> entry_2 = entryTemp.getChildren("entry");
					if(entry_2!=null&&!entry_2.isEmpty()){
						for(int n = 0 , m =entry_2.size() ; n < m ; n++){
							Element entryTemp1 = entry_2.get(n);
							int size = entryTemp1.getChildren("string").size();
							Element name = (Element)entryTemp1.getChildren("string").get(0);
							Element value = null;
							if(size==2){
								value = (Element)entryTemp1.getChildren("string").get(1);
							}
							map.put(name.getText(), value==null?"":value.getText());
						}
					}
				}
			}
		}
		return map;
	}
	
	public static Boolean getResourcePermission(String component,String resource,String roleId)throws Exception{
		Boolean isSuccess = true;
		try{
			String result = permissionXmlToMap(component,resource,roleId);
			if(ACCESS_Y.equals(result)){
				isSuccess = true;
			}else{
				isSuccess = false;
			}
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
		return isSuccess;
	}
	
	public static Map<String,String> getFunctionPermission(String component,String resource,String roleId,Map<String,String> functionPermission,Map<String,Map<String,String>> functionPermissionsGroup)throws Exception{
		//		/pages/rest/getFunctions
		Map<String,String> permissions = functionsXmlToMap(component,resource,roleId);
		if(functionPermissionsGroup!=null&&!functionPermissionsGroup.isEmpty()&&functionPermissionsGroup.containsKey(component+resource)){
			Map<String,String> group  = functionPermissionsGroup.get(component+resource);
			if(group!=null&&!group.isEmpty()){
				for (Map.Entry<String, String> entry : group.entrySet()) {
					String key = entry.getKey();
					if(functionPermission.containsKey(key)){
						functionPermission.remove(key);
					}
				}
				group.clear();
			}
		}
		functionPermissionsGroup.put(component+resource, permissions);
		for (Map.Entry<String, String> entry : permissions.entrySet()) {
			String key = entry.getKey();
			String value = entry.getValue();
			functionPermission.put(key, value);
		}
		return functionPermission;
	}
	
	public static Map<String,String> functionsXmlToMap(String component,String resource,String roleId)throws Exception{
		//		/pages/rest/getFunctions 	+ 组件code + 资源链接 + 角色Id
		String functionURL = ResourceAccessConfig.getInstance().get("functionURL");
		String urlString = functionURL + "/" + component+"/"+resource.replace("/","_")+"/"+roleId+".xml";
		return xmlToMap(urlString);
	}

}
