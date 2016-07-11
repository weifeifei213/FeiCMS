package com.jwebsite.daoimpl;

import com.jwebsite.dao.TemplateTypeDao;

public class TemplateTypeDaoImpl implements TemplateTypeDao{

	public String getTypeName(int TemplateType) throws Exception {
		// TODO Auto-generated method stub
		String str="";		
		switch (TemplateType) {
		case 0:
			str="无类型";
			break;
		case 1:
			str="主页模板";
			break;
		case 2:
			str="列表模板";
			break;
		case 3:
			str="内容模板";
			break;
		default:
			break;
		}
		
		return str;
	}

}
