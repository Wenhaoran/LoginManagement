package cn.digitalpublishing.service.cache;

import java.beans.PropertyDescriptor;
import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import net.sf.ehcache.Cache;
import net.sf.ehcache.Element;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConstructorUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.beanutils.converters.BigDecimalConverter;
import org.apache.commons.beanutils.converters.BooleanConverter;
import org.apache.commons.beanutils.converters.ByteConverter;
import org.apache.commons.beanutils.converters.CharacterConverter;
import org.apache.commons.beanutils.converters.DateConverter;
import org.apache.commons.beanutils.converters.DoubleConverter;
import org.apache.commons.beanutils.converters.FloatConverter;
import org.apache.commons.beanutils.converters.IntegerConverter;
import org.apache.commons.beanutils.converters.LongConverter;
import org.apache.commons.beanutils.converters.ShortConverter;
import org.apache.commons.beanutils.converters.SqlDateConverter;
import org.apache.commons.beanutils.converters.SqlTimeConverter;
import org.apache.commons.beanutils.converters.SqlTimestampConverter;
import org.apache.commons.beanutils.converters.StringConverter;

import cn.digitalpublishing.service.cache.CacheService;
import cn.digitalpublishing.util.MathUtil;
import cn.digitalpublishing.util.spring.SpringUtils;

import com.google.common.base.Strings;

/**
 * 
 * @author ggh
 * @since 2013/8/14
 */
public class DicCache {

	private Cache cache;
	private Cache searcherCache;
	private boolean newInst;
	private CacheService cacheService;
	private static DicCache instance;
	private static String searchSymbol = "#";

	private static final List<String> primitiveTypes = new ArrayList<String>();
	static {
		primitiveTypes.add("String");
		primitiveTypes.add("Integer");
		primitiveTypes.add("Double");
		primitiveTypes.add("Long");
		primitiveTypes.add("BigDecimal");
		primitiveTypes.add("Date");
		primitiveTypes.add("Float");
		primitiveTypes.add("Short");
		primitiveTypes.add("Boolean");
		primitiveTypes.add("Byte");
		primitiveTypes.add("Character");
		primitiveTypes.add("Time");
		primitiveTypes.add("Timestamp");
		ConvertUtils.register(new StringConverter(null), String.class);
		ConvertUtils.register(new IntegerConverter(null), Integer.class);
		ConvertUtils.register(new DoubleConverter(null), Double.class);
		ConvertUtils.register(new LongConverter(null), Long.class);
		ConvertUtils.register(new BigDecimalConverter(null), BigDecimal.class);
		ConvertUtils.register(new DateConverter(null), Date.class);
		ConvertUtils.register(new FloatConverter(null), Float.class);
		ConvertUtils.register(new ShortConverter(null), Short.class);
		ConvertUtils.register(new BooleanConverter(null), Boolean.class);
		ConvertUtils.register(new ByteConverter(null), Byte.class);
		ConvertUtils.register(new CharacterConverter(null), Character.class);
		ConvertUtils.register(new SqlDateConverter(null), java.sql.Date.class);
		ConvertUtils.register(new SqlTimeConverter(null), Time.class);
		ConvertUtils.register(new SqlTimestampConverter(null), Timestamp.class);
	}

	private DicCache() {
		cache = (Cache) SpringUtils.getBean("dicCache");
		searcherCache = (Cache) SpringUtils.getBean("searcherCache");
		cacheService = (CacheService) SpringUtils.getBean("cacheService");
		newInst = true;
	}

	private static synchronized DicCache get() {
		if (instance == null) {
			instance = new DicCache();
			instance.loadFullCache();
		} else {
			instance.newInst = false;
		}
		return instance;
	}

	private void loadFullCache() {
		try {
			cache.removeAll();
			searcherCache.removeAll();
			cacheService.refresh();
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}

	private void modifyData(List<Map<String, Object>> cacheData, String removeSearch) {
		if (!Strings.isNullOrEmpty(removeSearch)) {
			removeData(removeSearch);
		}
		List<String> newDataKeys = new ArrayList<String>();
		for (Map<String, Object> entry : cacheData) {
			newDataKeys.add((String) entry.get("id"));
		}
		for (Map<String, Object> entry : cacheData) {
			String entryId = (String) entry.get("id");
			if (entryId != null) {
				Element entryElement = cache.get(entryId);
				if (entryElement != null) {
					Map<String, Object> entryCache = (Map<String, Object>) entryElement.getObjectValue();
					List<String> children = (List<String>) entryCache.get("children");
					if (children != null) {
						for (String childrenKey : children) {
							if (!newDataKeys.contains(childrenKey)) {
								cache.remove(childrenKey);
							}
						}
					}
				}
			}
		}
		for (Map<String, Object> entry : cacheData) {
			if (entry.get("parent") == null) {
				entry.put("children", new ArrayList<String>());
			}
			cache.put(new Element(entry.get("id"), entry));
		}
		for (Map<String, Object> entry : cacheData) {
			String entryId = (String) entry.get("id");
			String entryParentId = (String) entry.get("parent");
			if (entryParentId != null) {
				Element parentElement = cache.get(entryParentId);
				if (parentElement != null) {
					Map<String, Object> parentEntry = (Map<String, Object>) parentElement.getObjectValue();
					if (parentEntry != null) {
						List<String> children = (List<String>) parentEntry.get("children");
						if (children != null) {
							children.add(entryId);
						}
					}
				}
			}
		}
		buildSearcher();
	}

	private Map<String, Object> searchCacheData(String search) {
		Element cacheElement = cache.get(search);
		if (cacheElement == null) {
			Element searcherElement = searcherCache.get(search);
			if (searcherElement != null) {
				cacheElement = cache.get(searcherElement.getObjectValue());
			}
		}
		if (cacheElement != null) {
			return (Map<String, Object>) cacheElement.getObjectValue();
		}
		return null;
	}

	private void removeData(String key) {
		Map<String, Object> cacheData = searchCacheData(key);
		if (cacheData != null) {
			List<String> childrenIds = (List<String>) cacheData.get("children");
			if (childrenIds != null) {
				for (String childrenId : childrenIds) {
					cache.remove(childrenId);
				}
			} else {
				String parentId = (String) cacheData.get("parent");
				if (parentId != null) {
					Map<String, Object> parentCacheData = searchCacheData(parentId);
					if (parentCacheData != null) {
						List<String> parentCacheDataChildren = (List<String>) parentCacheData.get("children");
						parentCacheDataChildren.remove(cacheData.get("id"));
					}
				}
			}
			cache.remove(cacheData.get("id"));
		}
		buildSearcher();
	}

	/**
	 * 构建索引
	 */
	private void buildSearcher() {
		searcherCache.removeAll();
		List<String> cacheKeys = cache.getKeys();
		for (String key : cacheKeys) {
			Map<String, Object> cacheDataPair = (Map<String, Object>) cache.get(key).getObjectValue();
			String parentId = (String) cacheDataPair.get("id");
			String parentCode = (String) cacheDataPair.get("code");
			List<String> parentChildren = (List<String>) cacheDataPair.get("children");
			if (parentChildren != null) {
				searcherCache.put(new Element(parentCode, parentId));
				if (!parentChildren.isEmpty()) {
					for (String childrenId : parentChildren) {
						Element childrenElement = cache.get(childrenId);
						if (childrenElement != null) {
							Map<String, Object> childrenItem = (Map<String, Object>) childrenElement.getObjectValue();
							if (childrenItem != null) {
								String childrenCode = (String) childrenItem.get("code");
								String childrenName = (String) childrenItem.get("name");
								if (!Strings.isNullOrEmpty(childrenCode)) {
									searcherCache.put(new Element(parentCode + searchSymbol + childrenCode, childrenId));
								}
								if (!Strings.isNullOrEmpty(childrenName)) {
									searcherCache.put(new Element(parentCode + searchSymbol + childrenName, childrenId));
								}
							}
						}
					}
				}
			}
		}
	}
	

	private Map<String, Object> readCache(String search) {
		Map<String, Object> cacheData = searchCacheData(search);
		if (cacheData != null) {
			Map<String, Object> result = new LinkedHashMap<String, Object>();
			for (Entry<String, Object> cacheEntry : cacheData.entrySet()) {
				if (!cacheEntry.getKey().equals("parent") && !cacheEntry.getKey().equals("children")) {
					result.put(cacheEntry.getKey(), cacheEntry.getValue());
				}
			}
			List<String> childrenMarks = (List<String>) cacheData.get("children");
			if (childrenMarks != null) {
				List<Map<String, Object>> resultChildren = new ArrayList<Map<String, Object>>();
				for (String childrenMark : childrenMarks) {
					Map<String, Object> cacheItem = searchCacheData(childrenMark);
					if (cacheItem != null) {
						Map<String, Object> resultItem = new LinkedHashMap<String, Object>();
						for (Entry<String, Object> cacheItemEntry : cacheItem.entrySet()) {
							if (!cacheItemEntry.getKey().equals("parent") && !cacheItemEntry.getKey().equals("children")) {
								resultItem.put(cacheItemEntry.getKey(), cacheItemEntry.getValue());
							}
						}
						resultChildren.add(resultItem);
					}
				}
				result.put("children", resultChildren);
			}
			return result;
		}
		return null;
	}

	/**
	 * 更新缓存
	 * 
	 * @param item
	 */
	public static void writeCache(List<Map<String, Object>> cacheData, String removeSearch) {
		if (!get().newInst) {
			get().modifyData(cacheData, removeSearch);
		}
	}

	public static void removeCache(String key) {
		if (!get().newInst) {
			get().removeData(key);
		}
	}

	public static void refresh() {
		if (!get().newInst) {
			get().loadFullCache();
		}
	}

	public static String getMemory() {
		StringBuilder str = new StringBuilder();
		str.append("数据占用内存：");
		str.append(MathUtil.round(get().cache.calculateInMemorySize() / 1048576d, 4) + "M");
		str.append("，");
		str.append("索引占用内存：");
		str.append(MathUtil.round(get().searcherCache.calculateInMemorySize() / 1048576d, 4) + "M");
		return str.toString();
	}

	public static int getSize() {
		return get().cache.getSize();
	}

	/**
	 * 这方法的作用是把集合中的id转换成对应的汉字值，从数据字典（缓存中）中取
	 * @param data
	 * @param rule
	 * Creator:ruixue.cheng
	 * LastEditor:
	 * LastDate:9 Jan 2016
	 */
	public static void match(Object data, String rule) {
		if (data == null) {
			return;
		}
		List<Object> list = new ArrayList<Object>();
		if (data instanceof List) {
			list.addAll((List) data);
		} else {
			list.add(data);
		}
		if (list.isEmpty()) {
			return;
		}
		Map<String, String> matchPair = new HashMap<String, String>();
		if (!Strings.isNullOrEmpty(rule)) {
			String[] rules = rule.split(",");
			for (String ruleItem : rules) {
				String srcName = null;
				String destName = "name";
				if (ruleItem.contains("=")) {
					String[] ruleItemOptions = ruleItem.split("=");
					if (ruleItemOptions.length == 2) {
						srcName = ruleItemOptions[0].trim();
						destName = ruleItemOptions[1].trim();
					}
				} else {
					srcName = ruleItem.trim();
				}
				if (!Strings.isNullOrEmpty(srcName) && !Strings.isNullOrEmpty(destName)) {
					matchPair.put(srcName, destName);
				}
			}
		}
		if (!matchPair.isEmpty()) {
			for (Object obj : list) {
				for (Entry<String, String> entry : matchPair.entrySet()) {
					try {
						String srcValue = BeanUtils.getProperty(obj, entry.getKey());
						if (!Strings.isNullOrEmpty(srcValue)) {
							String destValue = getData(srcValue, entry.getValue());
							if (!Strings.isNullOrEmpty(destValue)) {
								BeanUtils.setProperty(obj, entry.getKey(), destValue);
							}
						}
					} catch (Exception e) {
					}
				}
			}
		}
	}
	
	private static void forceSetProperty(Object obj, String name, Object value) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException, InstantiationException {
		Object inst = obj;
		String[] nameTree = name.split("\\.");
		for (int i = 0; i < nameTree.length - 1; i++) {
			Object objectProperty = PropertyUtils.getProperty(inst, nameTree[i]);
			if (objectProperty == null) {
				objectProperty = ConstructorUtils.invokeConstructor(PropertyUtils.getPropertyType(inst, nameTree[i]), null);
				PropertyUtils.setProperty(inst, nameTree[i], objectProperty);
			}
			inst = objectProperty;
		}
		PropertyUtils.setProperty(obj, name, value);
	}
	
	private static String forceGetProperty(Object obj, String name) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
		try {
			return BeanUtils.getProperty(obj, name);
		} catch (Exception e) {
			return null;
		}
	}
	
	public static void setProperty(Object data, String[]... rules) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException, InstantiationException {
		if (data == null) {
			return;
		}
		List<Object> list = new ArrayList<Object>();
		if (data instanceof List) {
			list.addAll((List) data);
		} else {
			list.add(data);
		}
		if (list.isEmpty()) {
			return;
		}
		for (Object obj : list) {
			for (String[] rule : rules) {
				String search = forceGetProperty(obj, rule[0]); // 缓存索引
				if (!Strings.isNullOrEmpty(search)) {
					Map<String, Object> cacheData = getFullData(search);
					String[] propertySettings = rule[1].split(",");
					for (String propertySetting : propertySettings) {
						String[] propertyPair = propertySetting.split("=");
						forceSetProperty(obj, propertyPair[0], cacheData.get(propertyPair[1]));
					}
				}
			}
		}
	}
	

	public static Map<String, Object> getFullData(String search) {
		return get().readCache(search);
	}

	public static List<Map<String, Object>> getData(String search) {
		Map<String, Object> cacheData = getFullData(search);
		if (cacheData != null) {
			if (cacheData.get("children") != null) {
				return (List<Map<String, Object>>) cacheData.get("children");
			}
		}
		return new ArrayList<Map<String, Object>>();
	}

	public static <T> List<T> getData(String search, Class<T> klass) throws Exception {
		return getData(search, klass, null);
	}

	public static <T> List<T> getData(String search, Class<T> klass, String rule) throws Exception {
		List<T> list = new ArrayList<T>();
		List<Map<String, Object>> cacheData = getData(search);
		if (!cacheData.isEmpty()) {
			for (Map<String, Object> cacheDataItem : cacheData) {
				list.add(simpleMapToBean(klass, cacheDataItem));
			}
		}
		if (!Strings.isNullOrEmpty(rule)) {
			match(list, rule);
		}
		return list;
	}

	public static Map<String, Object> simpleBeanToMap(Object obj) {
		return simpleBeanToMap(obj, null);
	}

	public static Map<String, Object> simpleBeanToMap(Object obj, String[] columns) {
		List<String> columnsName = new ArrayList<String>();
		if (columns == null || columns.length == 0) {
			PropertyDescriptor[] pds = PropertyUtils.getPropertyDescriptors(obj);
			for (PropertyDescriptor pd : pds) {
				String cn = pd.getPropertyType().getSimpleName();
				if (primitiveTypes.contains(cn)) {
					columnsName.add(pd.getName());
				}
			}
		} else {
			for (String column : columns) {
				try {
					String cn = PropertyUtils.getPropertyDescriptor(obj, column).getPropertyType().getSimpleName();
					if (primitiveTypes.contains(cn)) {
						columnsName.add(column);
					}
				} catch (Exception e) {
				}
			}
		}
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		for (String columnName : columnsName) {
			try {
				map.put(columnName, BeanUtils.getProperty(obj, columnName));
			} catch (Exception e) {
			}
		}
		return map;
	}

	public static <T> T simpleMapToBean(Class<T> klass, Map<String, Object> map) throws Exception {
		T obj = (T) ConstructorUtils.invokeConstructor(klass, null);
		if (map != null && !map.isEmpty()) {
			for (Entry<String, Object> entry : map.entrySet()) {
				try {
					BeanUtils.setProperty(obj, entry.getKey(), entry.getValue());
				} catch (Exception e) {
				}
			}
		}
		return obj;
	}

	public static String getData(String search, String column) {
		return getData(search, column, false);
	}

	public static String getData(String search, String column, boolean nullToEmpty) {
		Object cacheValue = null;
		Map<String, Object> cacheData = getFullData(search);
		if (cacheData != null) {
			cacheValue = cacheData.get(column);
		}
		if (cacheValue != null) {
			return String.valueOf(cacheValue).trim();
		} else {
			if (nullToEmpty) {
				return "";
			}
			return null;
		}
	}

	// key：字典分类；value：字典数据
	// 通过key获取对应的下拉框数据
	public static Map<String, String> getDicData(String key) {
		Map<String, String> result = new LinkedHashMap<String, String>();
		List<Map<String, Object>> cacheData = getData(key);
		if (!cacheData.isEmpty()) {
			for (Map<String, Object> cacheDataEntry : cacheData) {
				result.put((String) cacheDataEntry.get("id"), (String) cacheDataEntry.get("name"));
			}
		}
		return result;
	}
	
	/**
	 * 获取缓存数据
	 * @param key 缓存关键字
	 * @param keyFieldName map.key
	 * @param valueFieldName map.value
	 * @return
	 * Creator:ruixue.cheng
	 * LastEditor:
	 * LastDate:11 Feb 2016
	 */
	public static Map<String, String> getDicData(String key,String keyFieldName,String valueFieldName) {
		Map<String, String> result = new LinkedHashMap<String, String>();
		List<Map<String, Object>> cacheData = getData(key);
		if (!cacheData.isEmpty()) {
			for (Map<String, Object> cacheDataEntry : cacheData) {
				result.put((String) cacheDataEntry.get(keyFieldName), (String) cacheDataEntry.get(valueFieldName));
			}
		}
		return result;
	}
	
	/**
	 * 根据 数据字典分类信息数据字典 code 值 获取主键
	 * 
	 * @param dicClassName
	 * @param code
	 * @return by Ma Guoqing
	 */

	public static String getIdByCode(String dicClassName, Integer code) {
		return getIdByCode(dicClassName, String.valueOf(code));
	}

	/**
	 * 根据 数据字典分类信息， 数据字典 code 值 获取主键 by String
	 * 
	 * @param dicClassName
	 * @param code
	 * @author Ma Guoqing
	 */
	public static String getIdByCode(String dicClassName, String code) {
		return getData(dicClassName + searchSymbol + code, "id");
	}
	
	

	/**
	 * @param classCode 字典类别code
	 * @author liujls
	 * @return 字典类别id
	 */
	public static String getClassIdByCode(String classCode) {
		return getData(classCode, "id");
	}

	/**
	 * 根据 数据字典分类code和数据字典名称获取数据字典名称所对应的id
	 * 
	 * @param dicName 数据字典名称
	 * @param dicClassCode 数据字典分类code
	 * @return
	 */
	public static String getDicIdByName(String dicName, String dicClassCode) {
		return getData(dicClassCode + searchSymbol + dicName, "id", true);
	}
	
	/**
	 * 通过ID获取code
	 * @param dicClassName
	 * @param id
	 * @return
	 * Creator:ruixue.cheng
	 * LastEditor:
	 * LastDate:20 Jan 2016
	 */
	public static String getCodeById(String dicClassName, String id){
		String code = "";
		List<Map<String, Object>> cacheData = getData(dicClassName);
		if (!cacheData.isEmpty()) {
			for (Map<String, Object> cacheDataEntry : cacheData) {
				if(id.equals(((String) cacheDataEntry.get("id")))){
					code = (String) cacheDataEntry.get("code");
				}
				
			}
		}
		return code;
	}
	/**
	 * 通过code获取name
	 * @param dicClassName
	 * @param code
	 * @return
	 * Creator:ruixue.cheng
	 * LastEditor:
	 * LastDate:28 Jan 2016
	 */
	public static String getNameByCode(String dicClassName, String code){
		String name = "";
		List<Map<String, Object>> cacheData = getData(dicClassName);
		if (!cacheData.isEmpty()) {
			for (Map<String, Object> cacheDataEntry : cacheData) {
				if(code.equals(((String) cacheDataEntry.get("code")))){
					name = (String) cacheDataEntry.get("name");
				}
				
			}
		}
		return name;
	}

}