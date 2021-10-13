package com.beauty.chat;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import com.beauty.connection.ConnectionPoolMgr;

public class ChatDAO {

	ConnectionPoolMgr pool;
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	// 불러올 채팅 갯수
	private static final int ROWNUM = 100;

	public ChatDAO() {
		pool = new ConnectionPoolMgr();
	}

	// 채팅 불러오기
	public ArrayList<ChatDTO> chatList(String userid) throws SQLException {
		ArrayList<ChatDTO> list = new ArrayList<ChatDTO>();

		try {
			System.out.println("chatList 실행");

			con = pool.getConnection();

			String sql = " SELECT b.*"
					+ "    FROM ( SELECT ROWNUM AS rnum, a.*"
					+ "              FROM ( SELECT *"
					+ "                        FROM chat"
					+ "                       WHERE id = ?"
					+ "                    ORDER BY regdate DESC ) a"
					+ "          ORDER BY rnum ) b"
					+ "   WHERE b.rnum <= " + ROWNUM
					+ "ORDER BY rnum DESC";
			ps = con.prepareStatement(sql);
			ps.setString(1, userid);
			rs = ps.executeQuery();
			while (rs.next()) {
				String id = rs.getString("id");
				String name = rs.getString("name");
				String content = rs.getString("content");
				Timestamp regdate = rs.getTimestamp("regdate");

				ChatDTO chatDto = new ChatDTO();
				chatDto.setId(id);
				chatDto.setName(name);
				chatDto.setContent(content);
				chatDto.setRegdate(regdate);

				list.add(chatDto);
			}

			System.out.println("chatList 결과 list.size() = " + list.size());
			System.out.println("파라미터 userid : " + userid);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.dbClose(rs, ps, con);
		}

		return list;
	}// chatList

	// 채팅 전송
	public int chatWrite(ChatDTO chatDto) throws SQLException {
		int cnt = 0;

		try {
			System.out.println("chatWrite 실행");

			con = pool.getConnection();

			String sql = "insert into chat(id, name, content, regdate) values(?, ?, ?, default)";
			ps = con.prepareStatement(sql);
			ps.setString(1, chatDto.getId());
			ps.setString(2, chatDto.getName());
			ps.setString(3, chatDto.getContent());
			cnt = ps.executeUpdate();

			System.out.println("채팅 전송 결과 cnt = " + cnt);
			System.out.println("파라미터 chatDto : " + chatDto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.dbClose(ps, con);
		}

		return cnt;
	}// chatWrite

}
