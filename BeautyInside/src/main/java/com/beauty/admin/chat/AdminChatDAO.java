package com.beauty.admin.chat;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.beauty.connection.ConnectionPoolMgr;

public class AdminChatDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	ConnectionPoolMgr pool;

	public AdminChatDAO() {
		pool = new ConnectionPoolMgr();
	}

	public ArrayList<AdminChatDTO> chatList(String title, String text) {

		ArrayList<AdminChatDTO> arr = new ArrayList<AdminChatDTO>();

		try {
			String sql = "SELECT * FROM (SELECT id, name, content, regdate, RANK()OVER(PARTITION BY id ORDER BY to_char(regdate,'yyyy-mm-dd hh24:mi:ss:ff4')desc)AS rank FROM chat) WHERE RANK = 1 ORDER BY regdate desc";
			
			if (!(text.equals(""))) {
				sql = "SELECT * FROM (SELECT id, name, content, regdate, RANK()OVER(PARTITION BY id ORDER BY to_char(regdate,'yyyy-mm-dd hh24:mi:ss:ff4')desc)AS rank FROM chat) WHERE RANK = 1 and " + title + " like '%" + text + "%' ORDER BY regdate desc";
			}
			if (title.equals("")) {
				sql = "SELECT * FROM (SELECT id, name, content, regdate, RANK()OVER(PARTITION BY id ORDER BY to_char(regdate,'yyyy-mm-dd hh24:mi:ss:ff4')desc)AS rank FROM chat) WHERE RANK = 1 ORDER BY regdate desc";
			}	
			conn = pool.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				AdminChatDTO dto = new AdminChatDTO();
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				arr.add(dto);
			}
			return arr;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pool.dbClose(rs, ps, conn);
			} catch (Exception e) {

			}
		}
		return null;
	}

	public String selectName(String id) throws SQLException {
		String userName = "";
		try {
			System.out.println("selectName 실행");

			conn = pool.getConnection();

			String sql = "select name from member where id = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				userName = rs.getString("name");
			}

			System.out.println("이름 가져오기 결과 userName = " + userName);
			System.out.println("파라미터 id = " + id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.dbClose(rs, ps, conn);
		}

		return userName;
	}
}
