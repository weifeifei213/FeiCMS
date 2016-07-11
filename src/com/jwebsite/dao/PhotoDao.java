package com.jwebsite.dao;

import java.sql.ResultSet;
import java.util.List;

import com.jwebsite.vo.Photo;

public interface PhotoDao {
	  //显示所有
	  public ResultSet showAllPhoto() throws Exception;	 
	  //添加图片
	  public void insertPhoto(Photo p)  throws Exception;
	  //删除图片
	  public void delPhoto(int ID) throws Exception;
	  public void delPhotofile(int ID,String url) throws Exception;
	  //更新图片
	  public void updatePhoto(Photo p) throws Exception;
	  //查询一条 
	  public Photo quaryOnePhoto(int ID) throws Exception;
	  
	  public ResultSet quaryOnePhotoRS(int ID) throws Exception;
	  //转移到回收站
	  public void recPhoto(int ID) throws Exception;
	  //还原图片
	  public void restorePhoto(int ID,String status) throws Exception;
	  //清空回收站
	  public void clearRecyclebin() throws Exception;
	  //置顶
	  public void SetIsTop(int ID,String type) throws Exception;
	  //
	  public void SetRecommend(int ID,String type) throws Exception;
	  //审核图片
	  public void CheckPhoto(int ID,String type) throws Exception;
	  //审核时评分
	  public void CheckPhoto(int ID,int Score, String type) throws Exception;
	  
	  public String showSel(String selstr)throws Exception;
	
	  
	  
}
