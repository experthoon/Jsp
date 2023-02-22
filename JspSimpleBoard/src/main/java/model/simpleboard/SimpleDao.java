package model.simpleboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import com.mysql.cj.protocol.Resultset;

import mysql.db.DbConnect;

public class SimpleDao {

   
      DbConnect db=new DbConnect();
      
      public void insertBoard(SimpleDto dto) {
         
         Connection conn= db.getConnection();
         PreparedStatement pstmt=null;
         
         String sql="insert into simpleboard values(null,?,?,?,?,?,0,now())";
         
         try {
            pstmt=conn.prepareStatement(sql);
            
            //바인딩
            pstmt.setString(1, dto.getWriter());
            pstmt.setString(2, dto.getSubject());
            pstmt.setString(3, dto.getContent());
            pstmt.setString(4, dto.getImgname());
            pstmt.setString(5, dto.getPass());
            
            pstmt.execute();
            
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }finally {
            db.dbClose(pstmt, conn);
         }
      }
      //select
      
      public List<SimpleDto> getAllBoardDatas(){
         
         List<SimpleDto> list= new Vector<>();
         Connection conn=db.getConnection();
         PreparedStatement pstmt=null;
         ResultSet rs=null;
         
         String sql="select * from simpleboard order by num desc";
         
         try {
            pstmt=conn.prepareStatement(sql);
            rs=pstmt.executeQuery();
            
            while(rs.next()) {
               SimpleDto dto=new SimpleDto();
               
               dto.setNum(rs.getString("num"));
               dto.setWriter(rs.getString("Writer"));
               dto.setPass(rs.getString("pass"));
               dto.setSubject(rs.getString("subject"));
               dto.setContent(rs.getString("content"));
               dto.setImgname(rs.getString("imgname"));
               dto.setReadcount(rs.getInt("readCount"));
               dto.setWriteday(rs.getTimestamp("writeday"));
               
               //리스트에 추가
               list.add(dto);
            }
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }finally {
            db.dbClose(rs, pstmt, conn);
         }
         return list;
      }
      //dto 하나 세부내용
      public SimpleDto getData(String num) {
    	  SimpleDto dto = new SimpleDto();
    	  
    	  Connection conn =db.getConnection();
    	  PreparedStatement pstmt = null;
    	  ResultSet rs = null;
    	  
    	  String sql = "select * from simpleboard where num=?";
    	  
    	  try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				  dto.setNum(rs.getString("num"));
	               dto.setWriter(rs.getString("Writer"));
	               dto.setPass(rs.getString("pass"));
	               dto.setSubject(rs.getString("subject"));
	               dto.setContent(rs.getString("content"));
	               dto.setImgname(rs.getString("imgname"));
	               dto.setReadcount(rs.getInt("readCount"));
	               dto.setWriteday(rs.getTimestamp("writeday"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(null, pstmt, conn);
			
		}
    	  
    	  return dto;
      }
      
      //조회수 증가
      public void updateReadCount(String num)
      {
    	  Connection conn = db.getConnection();
    	  PreparedStatement pstmt = null;
    	  
    	  String sql = "update simpleboard set readcount = readcount + 1 where num=?";
    	  
    	  try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
      }
      //db수정할때 비밀번호 일치시에만 수정되도록 할 예정...
      public boolean isEqualPass(String num, String pass)
      {
    	  boolean b =false;
    	  Connection conn = db.getConnection();
    	  PreparedStatement pstmt = null;
    	  ResultSet rs = null;
    	  
    	  String sql = "select count(*) from simpleboard where num=? and pass=?";
    	  
    	  try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.setString(2, pass);
			
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				if(rs.getInt(1)==1) //비번이 맞으면
					b=true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
    	  
    	  return b;
      }
      //수정
      public void updateBoard(SimpleDto dto)
      {
    	  //subject,content,image만 수정할 예정
    	  Connection conn = db.getConnection();
    	  PreparedStatement pstmt = null;
    	  
    	  String sql = "update simpleboard set subject=?,content=?,imgname=?where num=?";
    	  
    	  try {
			pstmt = conn.prepareStatement(sql);
			
			//바인딩
			pstmt.setString(1, dto.getSubject());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getImgname());
			pstmt.setString(4, dto.getNum());
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
    	  
      }
      //삭제
      public void deleteSimple(String num)
      {
    	  Connection conn = db.getConnection();
    	  PreparedStatement pstmt = null;
    	  
    	  String sql = "delete from simpleboard where num=?";
    	  
    	  try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
      }
      
}