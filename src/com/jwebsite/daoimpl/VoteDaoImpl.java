package com.jwebsite.daoimpl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.jwebsite.dao.VoteDao;
import com.jwebsite.pub.DbConnection;
import com.jwebsite.vo.Vote;

public class VoteDaoImpl implements VoteDao {
	
	public void delVote(int id) throws Exception {
		// TODO Auto-generated method stub
		DbConnection conn=null;
		PreparedStatement pstmt=null;
		String strSql="delete from vote where ID=?";
		try {
			conn=new DbConnection();
			pstmt=conn.getConnection().prepareStatement(strSql);
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("删除调查出错！");
			System.out.println(e);
		}
		conn.closeConnection();

	}

	public void insertVote(Vote vote) throws Exception {
		// TODO Auto-generated method stub
		DbConnection conn=null;
		PreparedStatement pstmt=null;
		String strSql="insert into vote (Title,Select1,Answer1,Select2,Answer2,Select3,Answer3,Select4,Answer4,Select5,Answer5,Select6,Answer6,Select7,Answer7,Select8,Answer8,VoteTime,EndTime,VoteType,IsSelected) " +
				"values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			conn=new DbConnection();
			pstmt=conn.getConnection().prepareStatement(strSql);
			pstmt.setString(1, vote.getTitle());
			pstmt.setString(2, vote.getSelect1());
			pstmt.setInt(3, vote.getAnswer1());
			pstmt.setString(4, vote.getSelect2());
			pstmt.setInt(5, vote.getAnswer2());
			pstmt.setString(6, vote.getSelect3());
			pstmt.setInt(7, vote.getAnswer3());
			pstmt.setString(8, vote.getSelect4());
			pstmt.setInt(9, vote.getAnswer4());
			pstmt.setString(10, vote.getSelect5());
			pstmt.setInt(11, vote.getAnswer5());
			pstmt.setString(12, vote.getSelect6());
			pstmt.setInt(13, vote.getAnswer6());
			pstmt.setString(14, vote.getSelect7());
			pstmt.setInt(15, vote.getAnswer7());
			pstmt.setString(16, vote.getSelect8());
			pstmt.setInt(17, vote.getAnswer8());
			pstmt.setString(18, vote.getVoteTime());
			pstmt.setString(19, vote.getEndTime());
			pstmt.setInt(20, vote.getVoteType());
			pstmt.setInt(21, vote.getIsSelected());
			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("增加调查出错！");
			System.out.println(e);
		}
		conn.closeConnection();

	}

	public ResultSet queryAllVote() throws Exception {
		// TODO Auto-generated method stub
		DbConnection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		String strSql="select * from vote order by ID";
		try {
			conn=new DbConnection();
			stmt=conn.getConnection().createStatement();
			rs=stmt.executeQuery(strSql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e);
		}
		
		
		
		return rs;
	}

	public ResultSet queryOneVote(int id) throws Exception {
		// TODO Auto-generated method stub
		DbConnection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		String strSql="select * from vote where ID="+id+" order by ID";
		try {
			conn=new DbConnection();
			stmt=conn.getConnection().createStatement();
			rs=stmt.executeQuery(strSql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e);
		}
		
		
		
		return rs;
	}

	public void startVote(int id) throws Exception {
		// TODO Auto-generated method stub
		DbConnection conn=null;
		Statement stmt=null;
		String strSql="update vote set IsSelected=1 where ID="+id+" ";
		try {
			conn=new DbConnection();
			stmt=conn.getConnection().createStatement();
			stmt.execute(strSql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e);
		}


	}

	public void upDateVote(Vote vote) throws Exception {
		// TODO Auto-generated method stub
		DbConnection conn=null;
		PreparedStatement pstmt=null;
		String strSql="update vote set  Title=?,Select1=?,Answer1=?,Select2=?,Answer2=?,Select3=?,Answer3=?,Select4=?,Answer4=?,Select5=?,Answer5=?," +
				"Select6=?,Answer6=?,Select7=?,Answer7=?,Select8=?,Answer8=?,VoteTime=?,EndTime=?,VoteType=?,IsSelected=? where ID=?";
		try {
			conn=new DbConnection();
			pstmt=conn.getConnection().prepareStatement(strSql);
			pstmt.setString(1, vote.getTitle());
			pstmt.setString(2, vote.getSelect1());
			pstmt.setInt(3, vote.getAnswer1());
			pstmt.setString(4, vote.getSelect2());
			pstmt.setInt(5, vote.getAnswer2());
			pstmt.setString(6, vote.getSelect3());
			pstmt.setInt(7, vote.getAnswer3());
			pstmt.setString(8, vote.getSelect4());
			pstmt.setInt(9, vote.getAnswer4());
			pstmt.setString(10, vote.getSelect5());
			pstmt.setInt(11, vote.getAnswer5());
			pstmt.setString(12, vote.getSelect6());
			pstmt.setInt(13, vote.getAnswer6());
			pstmt.setString(14, vote.getSelect7());
			pstmt.setInt(15, vote.getAnswer7());
			pstmt.setString(16, vote.getSelect8());
			pstmt.setInt(17, vote.getAnswer8());
			pstmt.setString(18, vote.getVoteTime());
			pstmt.setString(19, vote.getEndTime());
			pstmt.setInt(20, vote.getVoteType());
			pstmt.setInt(21, vote.getIsSelected());
			pstmt.setInt(22, vote.getId());
			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("修改调查出错！");
			System.out.println(e);
		}
		conn.closeConnection();

	}
	public void upDateVoteNum(Vote vote) throws Exception
	{
		DbConnection conn=null;
		PreparedStatement pstmt=null;
		String strSql="update vote set Answer1=?,Answer2=?,Answer3=?,Answer4=?,Answer5=?,Answer6=?,Answer7=?,Answer8=? where ID=?";
		try {
			conn=new DbConnection();
			pstmt=conn.getConnection().prepareStatement(strSql);
			pstmt.setInt(1, vote.getAnswer1());
			pstmt.setInt(2, vote.getAnswer2());
			pstmt.setInt(3, vote.getAnswer3());
			pstmt.setInt(4, vote.getAnswer4());
			pstmt.setInt(5, vote.getAnswer5());
			pstmt.setInt(6, vote.getAnswer6());
			pstmt.setInt(7, vote.getAnswer7());
			pstmt.setInt(8, vote.getAnswer8());
			pstmt.setInt(9, vote.getId());
			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("更新调查数据出错！");
			System.out.println(e);
		}
		conn.closeConnection();
		
		
	}
}
