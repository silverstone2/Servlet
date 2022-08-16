package test.member.dao;
/*
 * Application 전역에서 MemberDao 객체는 오직 하나만 생성되어서 사용되도도록 만들기
 */

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.member.dto.MemberDto;
import test.util.DbcpBean;

public class MemberDao {
	// 자신의 참조값을 저장할 수 있는 static 필드 선언
	private static MemberDao dao;
	
	// 외부에서 객체 생성하지 못하게
	private MemberDao() {}
	
	// MemberDao 객체의 참조값을 리턴해주는 public static 메소드 만들어 놓기
	public static MemberDao getInstance() {
		// 만일 static 필드가 null 이면(최초로 getInstance() 메소드가 호출된 것이라면)
		if(dao==null) {
			// MemberDao 객체를 생성해서 static 필드에 저장한다.
			dao = new MemberDao();
		}
		// static 필드에 저장된 MemberDao 객체의 참조값을 리턴해준다.
		return dao;
	}
	
	// 인자로 전달되는 MemberDto 객체에 회원의 이름과 주소를 DB에 저장하는 메소드
	public boolean insert(MemberDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int updateRowCount = 0;
		try {
			// Connection 객체의 참조값 얻어오기 (Connection Pool 에서 하나 가져오기)
			conn = new DbcpBean().getConn();
			// 실행할 sql문
			String sql = "INSERT INTO member"
					+ " (num, name, addr)"
					+ " VALUES(member_seq.NEXTVAL, ?, ?)";
			// PrepareStatementm 객체의 참조값 얻어오기
			pstmt = conn.prepareStatement(sql);
			// ? 에 값을 바인딩 할게 있으면 바인딩 해준다.
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getAddr());
			// insert, update, delete 를 수행하고 변화된 row 의 갯수를 return 받기
			updateRowCount = pstmt.executeUpdate();
			System.out.println("회원 정보 추가 성공");
			// 반복문 돌면서 ResultSet의 Cursor를 한칸씩 내린다.
		} catch (Exception e) {
			// 혹시 예외가 발생한다면 예외 정보를 콘솔에 출력해서 에러의 원인 찾기
			e.printStackTrace();
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close(); // Connection 반납
			} catch (Exception e) {}
		}
		if(updateRowCount > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean delete(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int updateRowCount = 0;
		try {
			// Connection 객체의 참조값 얻어오기 (Connection Pool 에서 하나 가져오기)
			conn = new DbcpBean().getConn();
			// 실행할 sql문
			String sql = "DELETE FROM member" 
						+ " WHERE num=?";
			// PrepareStatementm 객체의 참조값 얻어오기
			pstmt = conn.prepareStatement(sql);
			// ? 에 값을 바인딩 할게 있으면 바인딩 해준다.
			pstmt.setInt(1, num);
			// insert, update, delete 를 수행하고 변화된 row 의 갯수를 return 받기
			updateRowCount = pstmt.executeUpdate();
			// 반복문 돌면서 ResultSet의 Cursor를 한칸씩 내린다.
		} catch (Exception e) {
			// 혹시 예외가 발생한다면 예외 정보를 콘솔에 출력해서 에러의 원인 찾기
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close(); // Connection 반납
			} catch (Exception e) {
			}
		}
		if (updateRowCount > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean update(MemberDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int updateRowCount = 0;
		try {
			// Connection 객체의 참조값 얻어오기 (Connection Pool 에서 하나 가져오기)
			conn = new DbcpBean().getConn();
			// 실행할 sql문
			String sql = "UPDATE member"
						+ " SET name=?, addr=?" 
						+ " WHERE num=?";
			// PrepareStatementm 객체의 참조값 얻어오기
			pstmt = conn.prepareStatement(sql);
			// ? 에 값을 바인딩 할게 있으면 바인딩 해준다.
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getAddr());
			pstmt.setInt(3, dto.getNum());
			// insert, update, delete 를 수행하고 변화된 row 의 갯수를 return 받기
			updateRowCount = pstmt.executeUpdate();
			// 반복문 돌면서 ResultSet의 Cursor를 한칸씩 내린다.
		} catch (Exception e) {
			// 혹시 예외가 발생한다면 예외 정보를 콘솔에 출력해서 에러의 원인 찾기
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close(); // Connection 반납
			} catch (Exception e) {
			}
		}
		if (updateRowCount > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	public MemberDto getData(int num) {
		MemberDto dto=null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection 객체의 참조값 얻어오기 (Connection Pool 에서 하나 가져오기)
			conn = new DbcpBean().getConn();
			//실행할 sql 문 작성
			String sql = "SELECT name, addr"
		               + " FROM member"
		               + " WHERE num=?";
			//sql 문을 전달하면서 PreparedStatement 객체의 참조값 얻어오기
			pstmt = conn.prepareStatement(sql);
			//? 에 값을 바인딩 할게 있으면 한다.
			pstmt.setInt(1, num);
			//select 문 수행하고 결과를 ResultSet 으로 받아온다.
			rs = pstmt.executeQuery();
			//반복문 돌면서 ResultSet 의 cursor 를 한칸씩 내린다.
			while (rs.next()) {
				//cursor 가 위치한 곳의 칼럼 데이터 추출해서 어딘가에 담기 
				dto=new MemberDto();
				dto.setNum(num);
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
			}
			} catch (Exception e) {
		         //혹시 예외가 발생한다면 예외정보를 콘솔에 출력해서 에러의 원인 찾기 
		         e.printStackTrace();
			} finally {
				try {
		            if (rs != null)
		               rs.close();
		            if (pstmt != null)
		               pstmt.close();
		            if (conn != null)
		               conn.close(); //Connection 반납
		         } catch (Exception e) {
		         }
		      }
		      return dto;
		   }
	
	// 전체 회원의 목록을 리턴하는 메소드
	public List<MemberDto> getList() {
		
		// 회원 목록을 담을 객체 생성
		List<MemberDto> list = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// Connection 객체의 참조값 얻어오기 (Connection Pool 에서 하나 가져오기)
			conn = new DbcpBean().getConn();
			// 실행할 sql문
			String sql = "SELECT num, name, addr"
					+ " FROM member"
					+ " ORDER BY num ASC";
			// PrepareStatementm 객체의 참조값 얻어오기
			pstmt = conn.prepareStatement(sql);
			// ? 에 값을 바인딩 할게 있으면 바인딩 해준다.
			
			// select문 수행하고 결과를 ResultSet으로 받아온다.
			rs = pstmt.executeQuery();
			// 반복문 돌면서 ResultSet의 Cursor를 한칸씩 내린다.
			while(rs.next()) {
				// cursor가 위치한 곳의 칼럼 데이터 추출해서 어딘가에 담기
				
				//MemberDto 객체를 생성해서
				MemberDto dto = new MemberDto();
				// ResultSet에서 읽어온 정보를 MemberDto 객체의 setter 메소드를 이용해서 담는다.
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
				// 회원 하명의 정보를 담고 있는 MemberDto 객체의 참조값을 ArrayList 객체에 누적시키기
				list.add(dto);
			}
		} catch (Exception e) {
			// 혹시 예외가 발생한다면 예외 정보를 콘솔에 출력해서 에러의 원인 찾기
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close(); // Connection 반납
			} catch (Exception e) {}
		}
		
		// ArrayList 객체의 참조값 리턴하기
		return list;
	}
}
