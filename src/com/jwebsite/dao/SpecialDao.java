package com.jwebsite.dao;


import java.util.List;

import com.jwebsite.vo.Special;

public interface SpecialDao {
	//添加专题
	public void insertSpecial(Special special) throws Exception;
	//查询所有专题
	public List<Special> quaryAllSpecial() throws Exception;
	//删除一条记录
	public void delOneSpecial(int SpecialID) throws Exception;
	//查询一条
	public Special quaryOneSpecial(int specialID) throws Exception;
	//更新专题
	public void updateSpecial(Special special) throws Exception;
	//在下拉列表中显示专题
	public String  showSpecialInSel(String specialID) throws Exception;
    
}
