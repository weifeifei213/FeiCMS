package com.jwebsite.pub;

import java.util.HashMap;
import java.util.Map;

/**
 * 转换从页面获取到的值
 * @author 木鱼
 * @param <T>
 */
public class FormUtils<T> {
	private Class<T> cls;
	public FormUtils(Class<T>  cls){
		this.cls=cls;
	}

	public T getForm(Map<String, String[]> map ){
		HashMap<String, String> m=MapToStringMap(map);		
		HashMapOperate<T> ho=new HashMapOperate<T>();
		T t=(T)ho.HashMapToPojo(m, cls);
		return t;
	}
	
	public HashMap<String, String> MapToStringMap(Map<String, String[]> map){
		HashMap<String, String> newmap=new HashMap<String, String>();
		for(String key:map.keySet()){			
			String value=ArrayToString(map.get(key));			
			newmap.put(key,value);
		}		
		return newmap;
	}
	
	public String ArrayToString(String[] Arr){
		StringBuffer strb=new StringBuffer();
		for(String str:Arr){
		   strb.append(str);	
		}
		return strb.toString();
	}
}
