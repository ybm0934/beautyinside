package com.beauty.review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import com.beauty.connection.ConnectionPoolMgr;

public class CommentDAO {

	ConnectionPoolMgr pool;
	Connection con;
	PreparedStatement ps;
	ResultSet rs;

	public CommentDAO() {
		pool = new ConnectionPoolMgr();
	}

	// 댓글 쓰기
	public int commentWrite(CommentDTO comDto) throws SQLException {
		int cnt = 0;

		try {
			System.out.println("commentWrite 실행\r\n");

			con = pool.getConnection();

			String sql = "INSERT INTO comments(no, ogno, groupno, name, content, regdate) "
					+ "VALUES(comments_seq.nextval, ?, comments_seq.nextval, ?, ?, sysdate)";
			ps = con.prepareStatement(sql);
			ps.setInt(1, comDto.getOgNo());
			ps.setString(2, comDto.getName());
			ps.setString(3, comDto.getContent());

			cnt = ps.executeUpdate();

			System.out.println("댓글쓰기 결과 cnt = " + cnt);
			System.out.println("댓글쓰기 파라미터 comDto = " + comDto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.dbClose(ps, con);
		}

		return cnt;
	}// commentWrite

	// 댓글 목록
	public ArrayList<CommentDTO> commentList() throws SQLException {
		ArrayList<CommentDTO> list = new ArrayList<CommentDTO>();

		try {
			System.out.println("commentList 실행\r\n");

			con = pool.getConnection();

			String sql = "SELECT * FROM comments ORDER BY no ASC";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				int no = rs.getInt("no");
				int ogNo = rs.getInt("ogNo");
				int groupNo = rs.getInt("groupNo");
				int sortNo = rs.getInt("sortNo");
				String id = rs.getString("id");
				String name = rs.getString("name");
				String content = rs.getString("content");
				Timestamp regdate = rs.getTimestamp("regdate");

				CommentDTO comDto = new CommentDTO();
				comDto.setNo(no);
				comDto.setOgNo(ogNo);
				comDto.setGroupNo(groupNo);
				comDto.setSortNo(sortNo);
				comDto.setId(id);
				comDto.setName(name);
				comDto.setContent(content);
				comDto.setRegdate(regdate);

				list.add(comDto);
			}

			System.out.println("댓글 list 결과 list.size = " + list.size() + "\r\n");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.dbClose(ps, con);
		}

		return list;
	}// commentList

	// 댓글 상세보기
	public CommentDTO commentByNo(int no, String userid) throws SQLException {
		CommentDTO comDto = new CommentDTO();

		try {
			System.out.println("commentByNo 실행\r\n");

			con = pool.getConnection();

			String sql = "SELECT * FROM comments WHERE no = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			rs = ps.executeQuery();
			if (rs.next()) {
				int ogNo = rs.getInt("ogNo");
				int groupNo = rs.getInt("groupNo");
				int sortNo = rs.getInt("sortNo");
				String id = rs.getString("id");
				String name = rs.getString("name");
				String content = rs.getString("content");

				comDto.setOgNo(ogNo);
				comDto.setGroupNo(groupNo);
				comDto.setSortNo(sortNo);
				comDto.setId(id);
				comDto.setName(name);
				comDto.setContent(content);
			}

			System.out.println("댓글 상세보기 결과 comDto = " + comDto);
			System.out.println(" 파라미터 no : " + no + ", userid : " + userid + "\r\n");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.dbClose(rs, ps, con);
		}

		return comDto;
	}// commentByNo

	// 댓글 수정
	public int commentUpdate(CommentDTO comDto) throws SQLException {
		int cnt = 0;

		try {
			System.out.println("commentUpdate 실행\r\n");

			con = pool.getConnection();

			String sql = "UPDATE comments SET CONTENT = ? WHERE NO = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, comDto.getContent());
			ps.setInt(2, comDto.getNo());
			cnt = ps.executeUpdate();

			System.out.println("리뷰 게시판 글 수정 결과 cnt = " + cnt);
			System.out.println("파라미터 reviewDto = " + comDto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.dbClose(ps, con);
		}

		return cnt;
	}// commentUpdate

	// 댓글 삭제
	public int commentDelete(int no, String userid) throws SQLException {
		int cnt = 0;
		try {
			System.out.println("commentDelete 실행\r\n");

			con = pool.getConnection();

			String sql = "delete from comments where no = ? and id = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			ps.setString(2, userid);
			cnt = ps.executeUpdate();

			System.out.println("댓글 삭제 결과 cnt = " + cnt);
			System.out.println("파라미터 no = " + no + ", userid = " + userid);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.dbClose(ps, con);
		}

		return cnt;
	}// commentDelete

}
