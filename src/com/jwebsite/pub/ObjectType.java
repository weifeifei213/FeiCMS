package com.jwebsite.pub;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

import com.jwebsite.vo.Photo;

public class ObjectType {
	//将对象转化成sql语句 插入语句
	public static String ObjectToSqlInsert(Object obj){
		String sql="insert ";
		String ColumnStr="";
		String valueStr="";
		Method method=null;
		Class c=obj.getClass();		
		Field[] field=obj.getClass().getDeclaredFields();
		for(Field f:field){						
			try {
				method= c.getMethod("get"+f.getName());
				String value=method.invoke(obj)+"";
				
				String ftype=f.getType().toString();
				int TypeBeginIndex=ftype.lastIndexOf(".")+1;
				int TypeEndIndex=ftype.length();
				ftype=(f.getType().toString()).substring(TypeBeginIndex, TypeEndIndex);
				
				if(null!=value&&!"".equals(value)&&!"null".equals(value)){
					ColumnStr+=f.getName()+",";	
					if("Integer".equals(ftype)||"int".equals(ftype)){					
						valueStr+=value+ ",";
					}else{						
						valueStr+=" '"+value+ "',";
					}				
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 		
		}	
		sql+=c.getName().substring(c.getName().lastIndexOf(".")+1,c.getName().length());
		sql+="("+ColumnStr.substring(0,ColumnStr.length()-1)+") value ("+valueStr.substring(0, valueStr.length()-1)+")";
		return sql;
	}
	//将对象转化成 sql 语句 修改语句
	public static String ObjectToSqlUpdate(Object obj,String Primarykey){
		String sql=" UPDATE ";
		Class c=obj.getClass();	
		Field[] field=obj.getClass().getDeclaredFields();
		Method method=null;
		String SetStr=" SET ";
		String WhereStr=" WHERE ";
		for(Field f:field){		
			try {				
				method= c.getMethod("get"+f.getName());
				String value = method.invoke(obj)+"";
				String ftype=f.getType().toString();
				int TypeBeginIndex=ftype.lastIndexOf(".")+1;
				int TypeEndIndex=ftype.length();
				ftype=(f.getType().toString()).substring(TypeBeginIndex, TypeEndIndex);
				
				if(null!=value&&!"".equals(value)&&!"null".equals(value)){
					SetStr+=f.getName()+" = ";
					if("Integer".equals(ftype)||"int".equals(ftype)){
						SetStr+=value+",";
					}else{
						SetStr+="'"+value+"' ,";
					}
				}
				//System.out.println("类型："+ftype);
				if(Primarykey.equals(f.getName()) ){					
					if("Integer".equals(ftype)||"int".equals(ftype)){
						WhereStr+=f.getName()+" = "+value+" ";
					}else{
						WhereStr+=f.getName()+" = '"+value+"' ";
					}					
				}				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 			
		}		
		sql+=c.getName().substring(c.getName().lastIndexOf(".")+1,c.getName().length());
		sql+=SetStr.substring(0,SetStr.length()-1);
		sql+=WhereStr;
		return sql;
	}
	public static String ObjectToSqlDelete(Object obj,String Primarykey){
		String sql=" DELETE FROM ";
		Class c=obj.getClass();	
		sql+=c.getName().substring(c.getName().lastIndexOf(".")+1,c.getName().length());
		Method method=null;
		try {
			method= c.getMethod("get"+Primarykey);
			String value = method.invoke(obj)+"";
			sql+="  WHERE "+Primarykey+" = "+value;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return sql;
	}
	
	public static void main(String[] args) {
		Photo p=new Photo();
		p.setAddDate("2014-11-12");
		System.out.println(ObjectToSqlInsert(p));
		System.out.println(ObjectToSqlUpdate(p,"ID"));
		System.out.println(ObjectToSqlDelete(p,"ID"));
	}

}
