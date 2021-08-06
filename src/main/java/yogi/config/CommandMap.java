package yogi.config;

import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public class CommandMap {//1

	Map<String, Object> map = new HashMap<String, Object>();//3
	//yeh
	public Object get(String key) {
		return map.get(key);
	}
	
	public void put(String key, Object value) {
		map.put(key, value);
	}
	
	public Object remove(String key) {
		return map.remove(key);
	}
	
	public boolean containsKey(String key) {
		return map.containsKey(key);
	}
	
	public boolean containsValue(Object value) {
		return map.containsValue(value);
	}
	
	public void clear() {
		map.clear();
	}
	
	public Set<Entry<String, Object>> entrySet(){
		return map.entrySet();
	}
	
	public Set<String> keySet(){
		return map.keySet();
	}
	
	public boolean isEmpty() {
		return map.isEmpty();
	}
	
	public void putAll(Map<? extends String, ?extends Object> m) {
		map.putAll(m);
	}
	
	public Map<String, Object> getMap(){
		return map;
	}
	
	public int getCurrentPageNo(){
		return map.get("currentPageNo") == null ? 1:Integer.parseInt(map.get("currentPageNo").toString());
	}

}
