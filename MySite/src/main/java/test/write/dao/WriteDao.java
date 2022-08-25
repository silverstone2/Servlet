package test.write.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.write.dto.WriteDto;
import test.util.DbcpBean;

public class WriteDao {
	private static WriteDao dao;
	
	private WriteDao() {}
	
	public static WriteDao getInstance() {
		if(dao==null) {
			dao=new WriteDao();
		}
		return dao;
	}
	//조회수 올리는 메소드
	public boolean addViewCount(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문
			String sql = "UPDATE board_write"
					+ " SET viewCount=viewCount+1"
					+ " WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			//? 에 값 바인딩하기
			pstmt.setInt(1, num);
			flag = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean update(WriteDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문
			String sql = "UPDATE board_write"
					+ " SET title=?, content=?"
					+ " WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			//? 에 값 바인딩하기
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, dto.getNum());
			flag = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean delete(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문
			String sql = "DELETE FROM board_write"
					+ " WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			//? 에 값 바인딩하기
			pstmt.setInt(1, num);
			flag = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	//글 하나의 정보를 리턴하는 메소드
	public WriteDto getData(int num) {
		
		WriteDto dto=null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			//select 문의 뼈대 구성하기
			String sql = "SELECT writer, title, content, viewCount, regdate"
					+ " FROM board_write"
					+ " WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			//? 에 값 바인딩 할게 있으면 하기
			pstmt.setInt(1, num);
			//sql 문 수행하고 ResultSet 객체 얻어내기
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto=new WriteDto();
				dto.setNum(num);
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setViewCount(rs.getInt("viewCount"));
				dto.setRegdate(rs.getString("regdate"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return dto;
	}
	
	//글 하나의 정보를 저장하는 메소드 
	public boolean insert(WriteDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문
			String sql = "INSERT INTO board_write"
					+ " (num, writer, title, content, viewCount, regdate)"
					+ " VALUES(board_write_seq.NEXTVAL, ?, ?, ?, 0, SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			//? 에 값 바인딩하기
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			flag = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	//전체 row 의 갯수를 리턴하는 메소드 
	public int getCount() {
		int count=0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			//select 문의 뼈대 구성하기
			String sql = "SELECT MAX(ROWNUM) AS count FROM board_write";
			pstmt = conn.prepareStatement(sql);
			//? 에 값 바인딩 할게 있으면 하기

			//sql 문 수행하고 ResultSet 객체 얻어내기
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count=rs.getInt("count");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		
		return count;
	}
	
	//페이징 처리에 부합하는 글 목록을 리턴하는 메소드 
	public List<WriteDto> getList(WriteDto dto){
		
		List<WriteDto> list=new ArrayList<WriteDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			//select 문의 뼈대 구성하기
			String sql = "SELECT *"
					+ " FROM"
					+ "    (SELECT result1.*, ROWNUM AS rnum"
					+ "    FROM"
					+ "        (SELECT num, writer, title, viewCount, regdate"
					+ "        FROM board_write"
					+ "        ORDER BY num DESC) result1)"
					+ " WHERE rnum BETWEEN ? AND ?";
			pstmt = conn.prepareStatement(sql);
			//? 에 값 바인딩 할게 있으면 하기
			pstmt.setInt(1, dto.getStartRowNum());
			pstmt.setInt(2, dto.getEndRowNum());
			//sql 문 수행하고 ResultSet 객체 얻어내기
			rs = pstmt.executeQuery();
			while (rs.next()) {
				//select 된 row 하나의 정보를 WriteDto 객체를 생성해서 담고 
				WriteDto tmp=new WriteDto();
				tmp.setNum(rs.getInt("num"));
				tmp.setWriter(rs.getString("writer"));
				tmp.setTitle(rs.getString("title"));
				tmp.setViewCount(rs.getInt("viewCount"));
				tmp.setRegdate(rs.getString("regdate"));
				//WriteDto 객체의 참조값을 List 에 누적 시키기
				list.add(tmp);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return list;
	}
	
	//전체 글의 목록을 리턴하는 메소드 
	public List<WriteDto> getList(){
		
		List<WriteDto> list=new ArrayList<WriteDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			//select 문의 뼈대 구성하기
			String sql = "SELECT num, writer, title, viewCount, regdate"
					+ " FROM board_write"
					+ " ORDER BY num DESC";
			pstmt = conn.prepareStatement(sql);
			//? 에 값 바인딩 할게 있으면 하기

			//sql 문 수행하고 ResultSet 객체 얻어내기
			rs = pstmt.executeQuery();
			while (rs.next()) {
				//select 된 row 하나의 정보를 WriteDto 객체를 생성해서 담고 
				WriteDto dto=new WriteDto();
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setViewCount(rs.getInt("viewCount"));
				dto.setRegdate(rs.getString("regdate"));
				//WriteDto 객체의 참조값을 List 에 누적 시키기
				list.add(dto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return list;
	}
}














