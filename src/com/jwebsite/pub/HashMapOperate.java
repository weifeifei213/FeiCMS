package com.jwebsite.pub;

import java.lang.reflect.Field;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.jwebsite.vo.PhotoClass;

import java.lang.reflect.Method;

public  class HashMapOperate<T> {
	
	public  Object HashMapToPojo(HashMap<String, String> m,Class<T> c){		
		Method method=null;
		Object ob=null;
		try {
			ob=c.newInstance();
			//System.out.println("map 大小"+m.keySet().size());
			if(null!=m){
				for(String key:m.keySet()){				
					try {
						String ftype=GetFieldType(c, key);
						int TypeBeginIndex=ftype.lastIndexOf(".")+1;
						int TypeEndIndex=ftype.length();
						ftype=ftype.substring(TypeBeginIndex, TypeEndIndex);					
						String value= m.get(key)+"";
						if(null!=value&&!"".equals(value)&&!"null".equals(value)){				
						if("Integer".equals(ftype)||"int".equals(ftype)){
							 method= c.getMethod("set"+key, new Class[]{Integer.class});
							 method.invoke(ob, Integer.parseInt(value));	
						}else  if("String".equals(ftype)){
		                	 method= c.getMethod("set"+key, new Class[]{String.class});
		                	 method.invoke(ob, value);	
						}else{					
							 method= c.getMethod("set"+key, new Class[]{String.class});
		                	 method.invoke(ob, value);		
						}	
						}
					    //method.invoke(ob, m.get(key));				
					} catch (Exception e) {
						// TODO Auto-generated catch block
						System.out.println("有异常");
						e.printStackTrace();
					} 		
				}				
			}else{
				return null;
			}				
		} catch (InstantiationException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (IllegalAccessException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return ob;
	}
	public List<Object> HashMapToObjectList(ArrayList<HashMap<String, String>> cml,Class<T> c){		
		ArrayList<Object> list=new ArrayList<Object>();
		for(HashMap<String, String> map:cml){
			Object obj=HashMapToPojo(map,c);
			list.add(obj);
		}	
		System.out.println("转换成list"+list.size());
		return list;		
	}	
	
	public String GetFieldType(Class<T> c,String FieldName){
		Field[] field= c.getDeclaredFields();
		String FType="String";
		for(Field f:field){
			if(f.getName().equals(FieldName)){				
				FType=f.getType().getName();
				break;
			}			
		}	
		return  FType;
	}
	
public static void main(String[] args) {
	HashMap<String, String> m=new HashMap<String, String>();
	m.put("ClassID", "1");
	m.put("ParentPath", "1");
	m.put("ClassName", "你好");
	
	
	HashMapOperate<PhotoClass> ho=new HashMapOperate<PhotoClass>();
	PhotoClass pc= (PhotoClass)ho.HashMapToPojo(m,PhotoClass.class);
	
	System.out.println(pc.getClassName());	
	System.out.println(pc.getClassID());
	System.out.println(pc.getParentPath());
	//System.err.println(ho.GetFieldType(PhotoClass.class, "ClassID"));
	
	
}
}
