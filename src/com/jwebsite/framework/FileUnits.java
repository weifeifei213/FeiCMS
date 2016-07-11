package com.jwebsite.framework;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

public class FileUnits {
	private String readPath(String fileName)
	{
		String filePath = this.getClass().getResource("").getPath().toString();
		//System.out.println(filePath);
		
		if (filePath.indexOf("WEB-INF") > 0) {
			GySplit b = new GySplit();
			b.tool(filePath, "/WEB-INF");
			String[] temp_array = b.Show();
			b = null;
			filePath = temp_array[0];
		}

		filePath = filePath + "/" + fileName;
		
		//处理带file：//这种情况
		GyReplace r = new GyReplace();
		filePath = r.replace(filePath, "file:", "");
		r = null;
		
		return filePath;
	}
	
	public String readFile(String fileName) throws IOException {
		/*String filePath = this.getClass().getResource("").getPath().toString();
		System.out.println(filePath);
		
		if (filePath.indexOf("WEB-INF") > 0) {
			GySplit b = new GySplit();
			b.tool(filePath, "/WEB-INF");
			String[] temp_array = b.Show();
			b = null;
			filePath = temp_array[0];
		}

		filePath = filePath + "/" + fileName;
		
		//处理带file：//这种情况
		GyReplace r = new GyReplace();
		filePath = r.replace(filePath, "file:", "");
		r = null;*/
		
		
		String filePath=this.readPath(fileName);
		
		File f = new File(filePath);
		//String content = "";

        StringBuilder strContent = new StringBuilder("");
		try {
			BufferedReader br = new BufferedReader(new InputStreamReader(
					new FileInputStream(f)));
			String line = null;
			while ((line = br.readLine()) != null) {
				//lines.add(line);
                strContent.append(line.toString());
    			strContent.append("\n");
			}
			br.close();
		} catch (IOException e) {

		}

		return strContent.toString();
		//return content;
	}

	public String readFile(String fileName, String iCharset) throws IOException {
		/*String filePath = this.getClass().getResource("").getPath().toString();
		System.out.println(filePath);
		if (filePath.indexOf("WEB-INF") > 0) {
			GySplit b = new GySplit();
			b.tool(filePath, "/WEB-INF");
			String[] temp_array = b.Show();
			b = null;
			filePath = temp_array[0];
		}

		filePath = filePath + "/" + fileName;
		
		//处理带file：//这种情况
		GyReplace r = new GyReplace();
		filePath = r.replace(filePath, "file:", "");
		r = null;*/
		
		String filePath=this.readPath(fileName);
		
		File f = new File(filePath);
		//String mb_content = "";
		List<String> lines = new ArrayList<String>();
		StringBuilder strContent = new StringBuilder("");
		try {
			BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(f), iCharset));
			String iline = null;
			while ((iline = br.readLine()) != null) {
				lines.add(iline.toString());
                strContent.append(iline.toString());
    			strContent.append("\n");
			}
			br.close();
		} catch (IOException e) {

		}
		return strContent.toString();
		//return mb_content;
	}
}
