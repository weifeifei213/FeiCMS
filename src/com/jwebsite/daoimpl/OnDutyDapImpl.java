package com.jwebsite.daoimpl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.jwebsite.dao.OnDutyDao;
import com.jwebsite.pub.DbConnection;
import com.jwebsite.vo.FriendSite;
import com.jwebsite.vo.OnDuty;

public class OnDutyDapImpl implements OnDutyDao {

	public void delODt(OnDuty onduty) throws Exception {
		// TODO Auto-generated method stub
		DbConnection conn=null;
		PreparedStatement pstmt=null;
		String strSql="delete from onduty where ID=?";
		try {
			conn=new DbConnection();
			pstmt=conn.getConnection().prepareStatement(strSql);
			pstmt.setInt(1, onduty.getId());			
			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("删除友情链接出错！");
			System.out.println(e);
		}
		conn.closeConnection();

	}

	public void insertODt(OnDuty onduty) throws Exception {
		// TODO Auto-generated method stub
		DbConnection conn=null;
		PreparedStatement pstmt=null;
		String strSql="insert into onduty(date,dutyManager,dutydept1,dutydept2,dutydept3,dutydept4,ManagerJob) values (?,?,?,?,?,?,?)";
		try {
			conn=new DbConnection();
			pstmt=conn.getConnection().prepareStatement(strSql);
			pstmt.setString(1, onduty.getDate());
			pstmt.setString(2, onduty.getDutyManager());
			
			pstmt.setString(3, onduty.getDutyDept1());
			pstmt.setString(4, onduty.getDutyDept2());
			pstmt.setString(5, onduty.getDutyDept3());
			pstmt.setString(6, onduty.getDutyDept4());
			pstmt.setString(7, onduty.getManagerJob());
			
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("添加值班信息出错！");
			System.out.println(e);
		}
		conn.closeConnection();
	}

	public OnDuty quaryOneODt(int ID) throws Exception {
		// TODO Auto-generated method stub
		OnDuty  ODt=new OnDuty(); 
		DbConnection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		String strSql="select * from onduty where ID="+ID+"";
		try {
			conn=new DbConnection();
			stmt=conn.getConnection().createStatement();			
			rs=stmt.executeQuery(strSql);
			if(rs.next())
			{
				ODt.setId(Integer.parseInt(rs.getString("Id")));
				ODt.setDate(rs.getString("date"));
				ODt.setDutyManager(rs.getString("dutyManager"));
				ODt.setManagerJob(rs.getString("ManagerJob"));
				ODt.setDutyDept1(rs.getString("dutydept1"));
				ODt.setDutyDept2(rs.getString("dutydept2"));
				ODt.setDutyDept3(rs.getString("dutydept3"));
				ODt.setDutyDept4(rs.getString("dutydept4"));
				
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("查询一条值班信息出错！");
			System.out.println(e);
		}
		//conn.closeConnection();
        
		return ODt;
			
	}

	public ResultSet showAllODt() throws Exception {
		// TODO Auto-generated method stub
		DbConnection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		String strSql="select * from onduty order by ID";
		try {
			conn=new DbConnection();
			stmt=conn.getConnection().createStatement();			
			rs=stmt.executeQuery(strSql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("显示全部值班信息出错！");
			System.out.println(e);
		}
		//conn.closeConnection();
        
		return rs;
				
	}

	public void updateODt(OnDuty onduty) throws Exception {
		// TODO Auto-generated method stub
		DbConnection conn=null;
		PreparedStatement pstmt=null;
		String strSql="update onduty set  date=?,dutyManager=?,dutydept1=?,dutydept2=?,dutydept3=?,dutydept4=?,ManagerJob=? where Id=?";
		try {
			conn=new DbConnection();
			pstmt=conn.getConnection().prepareStatement(strSql);
			pstmt.setString(1, onduty.getDate());
			pstmt.setString(2, onduty.getDutyManager());
			pstmt.setString(3, onduty.getDutyDept1());
			pstmt.setString(4, onduty.getDutyDept2());
			pstmt.setString(5, onduty.getDutyDept3());
			pstmt.setString(6, onduty.getDutyDept4());
			pstmt.setString(7, onduty.getManagerJob());
			
			pstmt.setInt(8, onduty.getId());
			
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("更新值班信息出错！");
			System.out.println(e);
		}
		conn.closeConnection();
	}

	public String showSel(String selstr) throws Exception {
		// TODO Auto-generated method stub
		
		DbConnection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		String strSql="select * from onduty order by ID";
		String restr="";
		try {
			conn=new DbConnection();
			stmt=conn.getConnection().createStatement();			
			rs=stmt.executeQuery(strSql);
			int i=1;
			while(rs.next()){
				
					
					restr+="<option value='"+i+"'  > ("+rs.getString("Id")+")"+rs.getString("dutyManager")+"--"+rs.getString("ManagerJob")+"</option>";

				
				i++;
			}
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("查询选中日期出错！");
			System.out.println(e);
		}
		conn.closeConnection();				
		
		return restr;
	}

	
	

}
