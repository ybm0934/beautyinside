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
	// 회원관리 목록 표시 메소드
	public ArrayList<AdminMemberDTO> memberList(String title, String text) {
		ArrayList<AdminMemberDTO> arr = new ArrayList<AdminMemberDTO>();
		String sql = "select * from member";
		System.out.println("파라미터 search : " + title + ", text = " + text);
		if (!(text.equals(""))) {
			sql += " where " + title +" like '%" + text + "%'";
			System.out.println("파라미터 search : " + title + ", text = " + text);
		}
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
				System.out.println("list.size() 결과 : " + arr.size());
				System.out.println("파라미터 search : " + title + ", text = " + text);
			}
			return arr;
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
