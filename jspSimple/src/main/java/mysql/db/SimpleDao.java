package mysql.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

public class SimpleDao {

	DbConnect db = new DbConnect();
	
	//insert
	public void SimpleInsert(SimpleDto dto)
	{
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "insert into Lck(writer, subject, password, content, writeday) values(?,?,?,?,now())";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getPassword());
			pstmt.setString(4, dto.getContent());
			
			
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
	
	List<SimpleDto> list = new Vector<>();
	Connection conn = db.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select * from Lck order by num asc";
	try {
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()) //데이터가 있을때 까지 받아옴
		{
			SimpleDto dto = new SimpleDto();
			
			dto.setNum(rs.getString("num"));
			dto.setWriter(rs.getString("writer"));
			dto.setSubject(rs.getString("subject"));
			dto.setPassword(rs.getString("password"));
			dto.setContent(rs.getString("content"));
			dto.setWriteday(rs.getTimestamp("writeday"));
			
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
	//update
	
	//delete
	
}
