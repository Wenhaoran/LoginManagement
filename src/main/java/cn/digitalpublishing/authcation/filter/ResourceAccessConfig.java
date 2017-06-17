package cn.digitalpublishing.authcation.filter;

import java.util.HashMap;
import java.util.Map;

public class ResourceAccessConfig {

	private static ResourceAccessConfig instance = null;
	
	private static Map<String,String> cfg = new HashMap<String,String>();
	
	private static Object lock=new Object();

	public void put(String key, String value) {
		cfg.put(key, value);
	}
	
	private ResourceAccessConfig() {
	}

	public String get(String key) {
		return cfg.get(key);
	}

	public static ResourceAccessConfig getInstance() {
		if (instance == null) {
			synchronized(lock){
				if(instance == null)
					instance = new ResourceAccessConfig();
			}
		}
		return instance;
	}

}
