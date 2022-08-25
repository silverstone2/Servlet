package test.user.dao;

import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import test.user.dto.UserDto;
import test.util.DbcpBean;

public class UserDao {
	private static UserDao dao;
	//외부에서 객체 생성할수 없도록
	private UserDao() {}
	//참조값을 리턴해주는 static 메소드
	public static UserDao getInstance() {
		if(dao==null) {
			dao=new UserDao();
		}
		return dao;
	}
	//비밀 번호를 수정 반영하는 메소드 
	public boolean updatePwd(UserDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문
			String sql = "UPDATE buser"
					+ " SET pwd=?"
					+ " WHERE id=? AND pwd=?";
			pstmt = conn.prepareStatement(sql);
			//? 에 값 바인딩하기
			pstmt.setString(1, dto.getNewPwd());
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getPwd());
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
	
	//인자로 전달된 아이디에 해당하는 가입정보를 삭제하는 메소드
	public boolean delete(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 insert, update, delete 문 구성
			String sql = "DELETE FROM buser"
					+ " WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩할 내용이 있으면 바인딩한다.
			pstmt.setString(1, id);
			flag = pstmt.executeUpdate(); //sql 문 실행하고 변화된 row 갯수 리턴 받기
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
	
	//회원 가입 정보를 수정반영하는 메소드
	public boolean update(UserDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 insert, update, delete 문 구성
			String sql = "UPDATE buser"
					+ " SET email=?, profile=?"
					+ " WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩할 내용이 있으면 바인딩한다.
			pstmt.setString(1, dto.getEmail());
			pstmt.setString(2, dto.getProfile());
			pstmt.setString(3, dto.getId());
			flag = pstmt.executeUpdate(); //sql 문 실행하고 변화된 row 갯수 리턴 받기
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
	
	
	//인자로 전달된 아이디에 해당하는 가입정보를 리턴해주는 메소드
	public UserDto getData(String id) {
		//회원 정보를 담을 UserDto 
		UserDto dto=null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			//select 문 작성
			String sql = "SELECT pwd,email,profile,regdate"
					+ " FROM buser"
					+ " WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			// ? 에 바인딩 할게 있으면 여기서 바인딩한다.
			pstmt.setString(1, id);
			//select 문 수행하고 ResultSet 받아오기
			rs = pstmt.executeQuery();
			//while문 혹은 if문에서 ResultSet 으로 부터 data 추출
			if (rs.next()) {
				dto=new UserDto();
				dto.setId(id);
				dto.setPwd(rs.getString("pwd"));
				dto.setEmail(rs.getString("email"));
				dto.setProfile(rs.getString("profile"));
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
	
	//인자로 전달되는 dto 에 있는 id, pwd 가 유효한 정보인지 여부를 리턴해 주는 메소드
	public boolean isValid(UserDto dto) {
		//맞는 정보인지 여부를 담을 지역 변수를 선언하고 초기값 false 넣어주기 
		boolean isValid=false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection 객체의 참조값 얻어오기 
			conn = new DbcpBean().getConn();
			//실행할 sql 문 준비
			String sql = "SELECT *"
					+ " FROM buser"
					+ " WHERE id=? AND pwd=?";
			pstmt = conn.prepareStatement(sql);
			//? 에 값 바인딩하기
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			//query 문 수행하고 결과 받아오기 
			rs = pstmt.executeQuery();
			if (rs.next()) { //만일 select 된 row 가 있으면
				isValid=true;
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
		return isValid;
	}
	
	//회원 정보를 저장하는 메소드
	public boolean insert(UserDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 insert, update, delete 문 구성
			String sql = "INSERT INTO buser"
					+ " (id, pwd, email, regdate)"
					+ " VALUES(?, ?, ?, SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩할 내용이 있으면 바인딩한다.
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getEmail());
			flag = pstmt.executeUpdate(); //sql 문 실행하고 변화된 row 갯수 리턴 받기
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
}
