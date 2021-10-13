package com.beauty.admin.chat;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
	public ArrayList<AdminChatDTO> chatList() {
		
		ArrayList<AdminChatDTO> arr = new ArrayList<AdminChatDTO>();
		
		try {
			System.out.print("메소드실행");
			String sql = "SELECT * FROM (SELECT id, name, content, regdate, RANK()OVER(PARTITION BY id ORDER BY to_char(regdate,'yyyy-mm-dd hh24:mi:ss')desc)AS rank FROM chat) WHERE RANK = 1 ORDER BY regdate desc";
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
}
