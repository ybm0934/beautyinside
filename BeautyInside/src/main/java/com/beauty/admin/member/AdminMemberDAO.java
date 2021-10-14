package com.beauty.admin.member;

import java.sql.*;
import java.sql.Date;
import java.util.*;

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
			sql += " where " + title + " like '%" + text + "%'";
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
				dto.setZipcode(rs.getInt("zipcode"));
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
	public ArrayList<AdminMemberDTO> memberUpdateList(AdminMemberDTO dto) {

		ArrayList<AdminMemberDTO> arr = new ArrayList<AdminMemberDTO>();

		String cd[] = dto.getCd();

		String sql = "select * from member where id IN ( ?";

		for (int i = 1; i < cd.length; i++) {
			sql += " , ?";
		}

		sql += ") order by no desc ";
		try {
			conn = pool.getConnection();
			ps = conn.prepareStatement(sql);

			for (int i = 0; i < cd.length; i++) {
				ps.setString(i + 1, cd[i]);
			}

			rs = ps.executeQuery();
			while (rs.next()) {
				dto = new AdminMemberDTO();
				dto.setNo(rs.getInt("no"));
				dto.setId(rs.getString("id"));
				dto.setPwd(rs.getString("pwd"));
				dto.setName(rs.getString("name"));
				dto.setBirth(rs.getString("birth"));
				dto.setTel(rs.getString("tel"));
				dto.setGender(rs.getString("gender"));
				dto.setEmail(rs.getString("email"));
				dto.setZipcode(rs.getInt("zipcode"));
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

	// 회원 수정 메소드
	public int memberUpdate(String no, String name, String birth, String tel, String gender, String email,
			String zipcode, String address1, String address2, String regdate, String dormant) {

		String sql = "update member set name = ?, birth = ?, tel = ?, gender = ?, email = ?, zipcode = ?, address1 = ?, address2 = ?, regdate = ?, dormant = ?  where no = ?";
		try {
			conn = pool.getConnection();
			ps = conn.prepareStatement(sql);
			if (name.equals("") || birth.equals("") || tel.equals("") || gender.equals("") || email.equals("") || zipcode.equals("") || address1.equals("") || address2.equals("") || regdate.equals("") || dormant.equals("")) {
				return 0; // 미입력시
			}
			ps.setString(1, name);
			ps.setString(2, birth);
			ps.setString(3, tel);
			ps.setString(4, gender);
			ps.setString(5, email);
			ps.setInt(6, Integer.parseInt(zipcode));
			ps.setString(7, address1);
			ps.setString(8, address2);
			ps.setDate(9, Date.valueOf(regdate));
			ps.setString(10, dormant);
			ps.setInt(11, Integer.parseInt(no));
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

	// 회원 삭제 메소드
	public int memberDelete(String no) {
		try {
			conn = pool.getConnection();
			int count = 0;
			String sql = "select * from chat where id = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, no);
			rs = ps.executeQuery();
			
			if (rs.next()) {
				System.out.println(2);
				sql = "delete from chat where id = ?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, no);
				count = ps.executeUpdate();
				if (rs.next()) {
					sql = "delete from member where id = ?";
					ps = conn.prepareStatement(sql);
					ps.setString(1, no);
					count = ps.executeUpdate();
				}
			}
			if (!(rs.next())) {
				System.out.println(3);
				sql = "delete from member where id = ?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, no);
				count = ps.executeUpdate();
			}
			return count;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pool.dbClose(rs ,ps, conn);
			} catch (Exception e2) {

			}
		}
		return -1; // 오류
	}

	// 회원 휴면등록 메소드
	public int memberDormantUpdate(String no) {
		String sql = "update member set dormant = 'Y' where id = ?";
		try {
			conn = pool.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, no);
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
	public int memberDormantRelease(String no) {
		String sql = "update member set dormant = 'N' where id = ?";
		try {
			conn = pool.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, no);
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

	// 총 회원 수 메소드
	public int memberCount() {
		String sql = "select count(*) from member";
		try {
			conn = pool.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			rs.next();
			int count = rs.getInt(1);
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

	public ArrayList<AdminMemberDTO> memberUpdateList2(String[] cks) {
		ArrayList<AdminMemberDTO> arr = new ArrayList<AdminMemberDTO>();

		try {
			conn = pool.getConnection();

			String sql = "select * from member where id in(" + cks[0];

			if (cks != null) {
				for (int i = 1; i < cks.length; i++) {
					sql += ", " + cks[i];
				}
			}

			sql += ") order by no desc";

			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				int no = rs.getInt("no");
				String id = rs.getString("id");
				String name = rs.getString("name");

				AdminMemberDTO dto = new AdminMemberDTO();

				dto.setNo(no);
				dto.setId(id);
				dto.setName(name);

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
}
