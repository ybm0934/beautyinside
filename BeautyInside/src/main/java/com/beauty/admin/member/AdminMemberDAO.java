package com.beauty.admin.member;

import java.sql.*;
import java.util.ArrayList;

import com.beauty.connection.*;

public class AdminMemberDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	ConnectionPoolMgr pool;
	
	public AdminMemberDAO() {
		// 오라클 드라이버
		pool = new ConnectionPoolMgr();
	}
	// 회원관리 목록 표시 메소드 (검색 목록 표시)
	public ArrayList<AdminMemberDTO> memberList(String title, String text) {
		
		ArrayList<AdminMemberDTO> arr = new ArrayList<AdminMemberDTO>();
		
		String sql = "select * from member";
		// 검색 텍스트 입력시
		if (!(text.equals(""))) {
			sql += " where " + title +" like '%" + text + "%'";
		}
		// (유효성) 조건선택으로 검색시
		if (title.equals("")) {
			sql = "select * from member";
		}
		sql += " order by no desc ";
		
		try {
			conn = pool.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				AdminMemberDTO dto = new AdminMemberDTO();
				dto.setNo(rs.getInt("no"));
				dto.setId(rs.getString("id"));
				dto.setPwd(rs.getString("pwd"));
				dto.setName(rs.getString("name"));
				dto.setBirth(rs.getString("birth"));
				dto.setTel(rs.getString("tel"));
				dto.setGender(rs.getString("gender"));
				dto.setEmail(rs.getString("email"));
				dto.setZipcod(rs.getInt("zipcode"));
				dto.setAddress1(rs.getString("address1"));
				dto.setAddress2(rs.getString("address2"));
				dto.setRegdate(rs.getDate("regdate"));
				dto.setDormant(rs.getString("dormant"));
				arr.add(dto);
			}
			return arr; // 목록 반환
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pool.dbClose(rs, ps, conn);
			} catch (Exception e2) {
				
			}
		}
		return null; // 오류
	}
	// 회원 수정 목록 출력 메소드
	public ArrayList<AdminMemberDTO> memberUpdateList(int no) {
		
		ArrayList<AdminMemberDTO> arr = new ArrayList<AdminMemberDTO>();
		
		String sql = "select * from member where no = ?";
		try {
			conn = pool.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			rs = ps.executeQuery();
			while (rs.next()) {
				AdminMemberDTO dto = new AdminMemberDTO();
				dto.setNo(rs.getInt("no"));
				dto.setId(rs.getString("id"));
				dto.setPwd(rs.getString("pwd"));
				dto.setName(rs.getString("name"));
				dto.setBirth(rs.getString("birth"));
				dto.setTel(rs.getString("tel"));
				dto.setGender(rs.getString("gender"));
				dto.setEmail(rs.getString("email"));
				dto.setZipcod(rs.getInt("zipcode"));
				dto.setAddress1(rs.getString("address1"));
				dto.setAddress2(rs.getString("address2"));
				dto.setRegdate(rs.getDate("regdate"));
				dto.setDormant(rs.getString("dormant"));
				arr.add(dto);
			}
			return arr; // 목록 반환
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pool.dbClose(rs, ps, conn);
			} catch (Exception e2) {
				
			}
		}
		return null; // 오류
	}
	// 회원 삭제 메소드 
	public int memberDelete(int no) {
		String sql = "delete from member where no = ?";
		try {
			conn = pool.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			int count = ps.executeUpdate();
			return count;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pool.dbClose(ps, conn);
			} catch (Exception e2) {
				
			}
		}
		return -1; // 오류
	}
	// 회원 휴면등록 메소드
	public int memberDormantUpdate(int no) {
		String sql = "update member set dormant = 'Y' where no = ?";
		try {
			conn = pool.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			int count = ps.executeUpdate();
			return count;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pool.dbClose(ps, conn);
			} catch (Exception e2) {
				
			}
		}
		return -1; // 오류
	}
	// 회원 휴면해제 메소드
	public int memberDormantRelease(int no) {
		String sql = "update member set dormant = 'N' where no = ?";
		try {
			conn = pool.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			int count = ps.executeUpdate();
			return count;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pool.dbClose(ps, conn);
			} catch (Exception e2) {
				
			}
		}
		return -1; // 오류
	}
}
