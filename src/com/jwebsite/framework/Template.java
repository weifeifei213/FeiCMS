package com.jwebsite.framework;

import java.io.IOException;

public class Template {
	public String gytFile = "";
	//private String gytContent = "";
	private String TpFrontSeparator = "{";
	private String TpBackSeparator = "}";
	private String TpCharset;
	private DaoContent TpContent;
	
	public void parse(String iCharset) {
		try {			
			//this.gytContent = readFile(this.gytFile, iCharset);
			gydContent.setContent(readFile(this.gytFile, iCharset));
			gytiCharset = iCharset;
			//System.out.println(this.gytContent);
			// 处理include标签
			RepInclude();
			// 处理判断
			RepIf();
			// this.gytContent=RepIf();
			// 处理list循环
			RepList();
			// 处理循环
			RepFor();			
			// 处理插件
			RepPlus();			
			// 处理替换的标签
			RepString();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void parse() {
		try {
			//this.gytContent = readFile(this.gytFile);
			gydContent.setContent(readFile(this.gytFile));
			// 处理include标签
			RepInclude();			
			// 处理判断
			RepIf();			
			// 处理list循环
			RepList();			
			// 处理循环
			RepFor();			
			// 处理插件
			RepPlus();			
			// 处理替换的标签
			RepString();
			// this.gytContent=RepIf();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
