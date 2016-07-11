package com.jwebsite.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.jwebsite.vo.OnDuty;



public interface  OnDutyDao {
	//显示所有值班信息
	  public ResultSet showAllODt() throws Exception;
	 
	  //添加值班信息
	  public void insertODt(OnDuty onduty)  throws Exception;
	  //删除值班信息
	  public void delODt(OnDuty onduty) throws Exception;
	  //更新值班信息
	  public void updateODt(OnDuty onduty) throws Exception;
	  //查询一条 
	  public OnDuty quaryOneODt(int ID) throws Exception;
	  
	  public String showSel(String selstr)throws Exception;
	  
	
	
}
