package com.jwebsite.pub;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Properties;

public class EmailConfig {

	/**
	 * @param args
	 */
	
	static Properties prop = new Properties(); 
	
	public static boolean loadFile(String fileName){ 
		  try { 
		prop.load(PropertiesUtils.class.getClassLoader().getResourceAsStream(fileName)); 
		} catch (IOException e) { 
		e.printStackTrace(); 
		return false; 
		} 
		return true;
		} 
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		writeStringValue("Emailconfig.properties", "jianli", "sssssss");
		editProperty("jianli", "ssssssssssssssssssssssssssss");
		
		
	}
	
	public static void editProperty(String key,String value ){
		
		
	
		try {
			prop.setProperty(key, value);
			
			prop.store(new FileOutputStream("Emailconfig.properties"),"#");
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}   
		
	}
	
	public static void writeStringValue(String fileName, String propertyName, String propertyValue) { 
	       Properties prop = new Properties(); 
	       try { 
	           InputStream inputStream = new FileInputStream(fileName); 
	           //get the property list from the stream,it based thread... 
	           prop.load(inputStream); 
	           OutputStream fos = new FileOutputStream(fileName); 
	           prop.setProperty(propertyName, propertyValue); 
	           //add or update the parameter,and add some comment... 
	           prop.store(fos, "Last Modified"); 
	           inputStream.close(); 
	       } catch (IOException unused) { 

	       } 
	   } 
	
	
	public static String getPropertyValue(String key){ 
		return prop.getProperty(key); 
    } 
	

}
