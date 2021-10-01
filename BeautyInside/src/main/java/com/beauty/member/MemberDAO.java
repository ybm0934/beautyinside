package com.beauty.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.beauty.connection.ConnectionPoolMgr;

public class MemberDAO {

	ConnectionPoolMgr pool;
	Connection con;
	PreparedStatement ps;
	ResultSet rs;

	public MemberDAO() {
		pool = new ConnectionPoolMgr();
	}

	// 아이디 체크
	public boolean idCheck(String id) throws SQLException {
		boolean flag = false;

		try {
			System.out.println("idCheck 실행\r\n");

			con = pool.getConnection();

			String sql = "SELECT id FROM member WHERE ID = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				flag = true;
			}
			System.out.println("아이디 중복 검사 결과 flag : " + flag + ", 파라미터 : " + id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.dbClose(rs, ps, con);
		}

		return flag;
	}// idCheck

	// 회원 가입
	public int register(MemberDTO memberDto) throws SQLException {
		int cnt = 0;

		try {
			System.out.println("register 실행\r\n");
			
			con = pool.getConnection();
			
			String sql = "";
			ps = con.prepareStatement(sql);
			
			

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.dbClose(ps, con);
		}
		
		return cnt;
	}// register

}
