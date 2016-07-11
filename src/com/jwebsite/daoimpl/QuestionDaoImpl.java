package com.jwebsite.daoimpl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.jwebsite.dao.QuestionDao;
import com.jwebsite.pub.DbConnection;
import com.jwebsite.vo.Question;

public class QuestionDaoImpl implements QuestionDao {
	
	public void delQuestion(int id) throws Exception {
		// TODO Auto-generated method stub
		DbConnection conn=null;
		PreparedStatement pstmt=null;
		String strSql="delete from question where ID=?";
		try {
		conn=new DbConnection();
			pstmt=conn.getConnection().prepareStatement(strSql);
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("删除试题出错！");
			System.out.println(e);
		}
		conn.closeConnection();

	}

	public void insertQuestion(Question question) throws Exception {
		// TODO Auto-generated method stub
		DbConnection conn=null;
		PreparedStatement pstmt=null;
		String strSql="insert into question (TestID,Title,Answer,Selects,Type,Status,Score,SelA,SelB,SelC,SelD,DSelA,DSelB,DSelC,DSelD) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			conn=new DbConnection();
			pstmt=conn.getConnection().prepareStatement(strSql);
			pstmt.setInt(1, question.getTestID());
			pstmt.setString(2, question.getTitle());
			pstmt.setInt(3, question.getAnswer());
			pstmt.setString(4, question.getSelects());
			pstmt.setInt(5, question.getType());
			pstmt.setInt(6, question.getStatus());
			pstmt.setInt(7, question.getScore());
			pstmt.setString(8, question.getSelA());
			pstmt.setString(9, question.getSelB());
			pstmt.setString(10, question.getSelC());
			pstmt.setString(11, question.getSelD());
			pstmt.setString(12, question.getDSelA());
			pstmt.setString(13, question.getDSelB());
			pstmt.setString(14, question.getDSelC());
			pstmt.setString(15, question.getDSelD());
			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("添加试卷出错！");
			System.out.println(e);
		}
		conn.closeConnection();

	}

	public ResultSet showAllQuestion() throws Exception {
		// TODO Auto-generated method stub
		DbConnection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		String strSql="select * from  question order  by ID";
		try {
			conn=new DbConnection();
			stmt=conn.getConnection().createStatement();
			rs=stmt.executeQuery(strSql);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("查询试题出错！");
			System.out.println(e);
		}
		//conn.closeConnection();
		return rs;
	}
	public ResultSet queryQuestion(int testID,int type) throws Exception
	{
		
		DbConnection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		String strSql="select * from  question where Status=1 and TestID="+testID+" and Type="+type+" order by ID desc";
		try {
			conn=new DbConnection();
			stmt=conn.getConnection().createStatement();
			rs=stmt.executeQuery(strSql);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("查询试题出错！");
			System.out.println(e);
		}
		//conn.closeConnection();
		return rs;
		
		
	}
	public Question showQuestion(int id) throws Exception {
		// TODO Auto-generated method stub
		DbConnection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		Question question=new Question();
		String strSql="select * from  question where ID="+id+" order  by ID";
		try {
			conn=new DbConnection();
			stmt=conn.getConnection().createStatement();
			rs=stmt.executeQuery(strSql);
			if(rs.next())
			{
			  question.setTestID(rs.getInt("TestID"));
			  question.setTitle(rs.getString("Title"));
			  question.setAnswer(rs.getInt("Answer"));
			  question.setType(rs.getInt("Type"));
			  question.setSelects(rs.getString("Selects"));
			  question.setStatus(rs.getInt("Status"));
			  question.setScore(rs.getInt("Score"));
			  question.setSelA(rs.getString("SelA"));
			  question.setSelB(rs.getString("SelB"));
			  question.setSelC(rs.getString("SelC"));
			  question.setSelD(rs.getString("SelD"));
			  question.setDSelA(rs.getString("DSelA"));
			  question.setDSelB(rs.getString("DSelB"));
			  question.setDSelC(rs.getString("DSelC"));
			  question.setDSelD(rs.getString("DSelD"));
			  
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("查询试题出错！");
			System.out.println(e);
		}
		//conn.closeConnection();
		return question;
	}
	 //判断答案是否正确
	public boolean  checkQuestion(int questionID,String answer) throws Exception
	{
		boolean checkResult=false;
		DbConnection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		String strSql="select * from  question where ID="+questionID+"";
		try {
			conn=new DbConnection();
			stmt=conn.getConnection().createStatement();
			rs=stmt.executeQuery(strSql);
			if(rs.next())
			{
			  //判断试题类型
				if(rs.getInt("Type")==1||rs.getInt("Type")==2)
				{
					
					if(Integer.parseInt(answer)==rs.getInt("Answer"))
					{
						
						checkResult=true;
						
					}
					
				}
				else if(rs.getInt("Type")==3)
				{
					
					if(answer.equals(rs.getString("Selects")))
					{
						
						checkResult=true;
						
					}
					
				}
			  
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("查询试题出错！");
			System.out.println(e);
		}
		
		return checkResult;
	}
	public void updateQuestion(Question question) throws Exception {
		// TODO Auto-generated method stub
		DbConnection conn=null;
		PreparedStatement pstmt=null;
		String strSql="update  question  set TestID=?,Title=?,Answer=?,Type=?,Status=?,Score=?  where ID=?";
		try {
			conn=new DbConnection();
			pstmt=conn.getConnection().prepareStatement(strSql);
			pstmt.setInt(1, question.getTestID());
			pstmt.setString(2, question.getTitle());
			pstmt.setInt(3, question.getAnswer());
			pstmt.setInt(4, question.getType());
			pstmt.setInt(5, question.getStatus());
			pstmt.setInt(6, question.getScore());		
			pstmt.setInt(7, question.getId());
			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("添加试卷出错！");
			System.out.println(e);
		}
		conn.closeConnection();

	}
	

}
