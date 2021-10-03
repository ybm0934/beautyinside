package com.beauty.admin;

import java.sql.*;
import com.beauty.connection.*;

public class AdminDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	ConnectionPoolMgr pool;
	
	public AdminDAO() {
		// 오라클 드라이버
		pool = new ConnectionPoolMgr();
	}
	// 로그인 메소드
	public int login(String id, String pwd) {
		String sql = "select pwd from member where id = ?";
		try {
			conn = pool.getConnection();
			ps = conn.prepareStatement(sql);
			if (!(id.equals("admin"))) {
				return -1;
			}
			ps.setString(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				if (rs.getString("pwd").equals(pwd)) {
					return 1; // 로그인 성공
				} else {
					return -1; // 로그인 실패
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pool.dbClose(rs, ps, conn);
			} catch (Exception e2) {
				
			}
		}
		return -1; // 로그인 실패
	}
	// 메인 화면 사용자 이름 출력 메소드 
	public String loginName(String id) {
		String sql = "select name from member where id = ?";
		try {
			conn = pool.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			rs.next();
			return rs.getString("name"); // 사용자 이름
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
