package com.jwebsite.pub;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.NodeList;

public class XmlOperate {

	public List<HashMap<String, String>> XmlRead(String path,String TagName) throws Exception{
		ArrayList<HashMap<String, String>> list=new ArrayList<HashMap<String,String>>();			
		System.out.println(path);
		File f=new File(path);		
	    DocumentBuilderFactory factory=DocumentBuilderFactory.newInstance();
	    DocumentBuilder builder=factory.newDocumentBuilder();
	    Document doc = builder.parse(f);
	    NodeList nl = doc.getElementsByTagName(TagName);	    
	    for (int i=0;i<nl.getLength();i++){	
	    	HashMap<String, String> row=new HashMap<String, String>();
	    	NodeList cnl=nl.item(i).getChildNodes();
	    	for(int j=0;j<cnl.getLength();j++){
	    		row.put(cnl.item(j).getNodeName(), cnl.item(j).getTextContent());
	    		
	    		System.out.println(cnl.item(j).getNodeName()+"|"+cnl.item(j).getTextContent());
	    	} 
	    	list.add(row);
	    }		
		return list;
	}	

	public static void main(String[] args) {
		XmlOperate xo=new XmlOperate();
		try {			
			xo.XmlRead("Template/config.xml","Template");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
