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

			String sql = "INSERT INTO comments(no, ogno, groupno, id, name, target, content, regdate) "
					+ "VALUES(comments_seq.nextval, ?, comments_seq.nextval, ?, ?, null, ?, sysdate)";
			ps = con.prepareStatement(sql);
			ps.setInt(1, comDto.getOgNo());
			ps.setString(2, comDto.getId());
			ps.setString(3, comDto.getName());
			ps.setString(4, comDto.getContent());

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
	public ArrayList<CommentDTO> commentList(int reviewNo) throws SQLException {
		ArrayList<CommentDTO> list = new ArrayList<CommentDTO>();
		try {
			System.out.println("commentList 실행\r\n");

			con = pool.getConnection();

			String sql = "SELECT * FROM comments WHERE ogNo = ? ORDER BY groupNo ASC, no ASC, sortNo DESC";
			ps = con.prepareStatement(sql);
			ps.setInt(1, reviewNo);
			rs = ps.executeQuery();
			while (rs.next()) {
				int no = rs.getInt("no");
				int ogNo = rs.getInt("ogNo");
				int groupNo = rs.getInt("groupNo");
				int sortNo = rs.getInt("sortNo");
				String id = rs.getString("id");
				String name = rs.getString("name");
				String target = rs.getString("target");
				String content = rs.getString("content");
				Timestamp regdate = rs.getTimestamp("regdate");
				String delFlag = rs.getString("delFlag");

				CommentDTO comDto = new CommentDTO();
				comDto.setNo(no);
				comDto.setOgNo(ogNo);
				comDto.setGroupNo(groupNo);
				comDto.setSortNo(sortNo);
				comDto.setId(id);
				comDto.setName(name);
				comDto.setTarget(target);
				comDto.setContent(content);
				comDto.setRegdate(regdate);
				comDto.setDelFlag(delFlag);

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

	// 대댓글 쓰기
	public int reCommentWrite(CommentDTO comDto) throws SQLException {
		int cnt = 0;
		try {
			System.out.println("reCommentWrite 실행\r\n");

			con = pool.getConnection();

			String sql = "UPDATE comments SET sortNo = sortNo + 1 WHERE ogNo = ? AND groupNo = ? AND sortNo > 0";
			ps = con.prepareStatement(sql);
			ps.setInt(1, comDto.getOgNo());
			ps.setInt(2, comDto.getGroupNo());
			cnt = ps.executeUpdate();
			System.out.println("대댓글 쓰기 sortNo 증가 결과 cnt = " + cnt);

			sql = "INSERT INTO comments(no, ogNo, groupNo, sortNo, id, name, target, content, regdate) "
					+ "VALUES(comments_seq.nextval, ?, ?, ?, ?, ?, ?, ?, sysdate)";
			ps = con.prepareStatement(sql);
			ps.setInt(1, comDto.getOgNo());
			ps.setInt(2, comDto.getGroupNo());
			ps.setInt(3, comDto.getSortNo() + 1);
			ps.setString(4, comDto.getId());
			ps.setString(5, comDto.getName());
			ps.setString(6, comDto.getTarget());
			ps.setString(7, comDto.getContent());
			cnt = ps.executeUpdate();

			System.out.println("대댓글 쓰기 결과 cnt = " + cnt);
			System.out.println("대댓글 쓰기 파라미터 comDto = " + comDto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.dbClose(ps, con);
		}

		return cnt;
	}// reCommentWrite

	// 댓글 수정
	public int commentEdit(CommentDTO comDto) throws SQLException {
		int cnt = 0;
		try {
			System.out.println("commentEdit 실행");

			con = pool.getConnection();

			String sql = "update comments set content = ? where no = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, comDto.getContent());
			ps.setInt(2, comDto.getNo());
			cnt = ps.executeUpdate();

			System.out.println("댓글 수정 결과 cnt = " + cnt);
			System.out.println("댓글 수정 파라미터 comDto = " + comDto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.dbClose(ps, con);
		}

		return cnt;
	}// commentEdit

	// 댓글 삭제
	public int commentDelete(int no, int sortNo) throws SQLException {
		int cnt = 0;
		try {
			System.out.println("commentDelete 실행");

			con = pool.getConnection();

			// 대댓글을 가지고 있는 댓글인지 우선 판별
			String sql = "select * from comments where groupno = ? and sortno > 0";
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			rs = ps.executeQuery();

			// 부모글일 경우 delFlag 부여, 아닐 경우 삭제
			if (rs.next() && sortNo == 0) {
				sql = "update comments set delflag = 'Y' where no = " + no;
				ps = con.prepareStatement(sql);
				cnt = ps.executeUpdate();

				System.out.println("부모글 delflag 부여 결과 cnt = " + cnt);
			} else {
				sql = "delete from comments where no = " + no;
				ps = con.prepareStatement(sql);
				cnt = ps.executeUpdate();

				System.out.println("댓글 삭제 결과 cnt = " + cnt);
			}

			System.out.println("댓글 삭제 파라미터 no = " + no + ", sortNo = " + sortNo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.dbClose(rs, ps, con);
		}

		return cnt;
	}// commentDelete

	// 삭제 된 댓글인지 확인
	public boolean delCheck(int no) throws SQLException {
		boolean flag = false;
		try {
			System.out.println("delCheck 실행");

			con = pool.getConnection();

			String sql = "select delFlag from comments where no = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			rs = ps.executeQuery();
			if (rs.next()) {
				String delFlag = rs.getString("delFlag");

				if (delFlag.equals("Y")) {
					flag = true;
				}
			} else {
				flag = true;
			}

			System.out.println("댓글 삭제 확인 결과 flag = " + flag);
			System.out.println("파라미터 no = " + no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.dbClose(rs, ps, con);
		}

		return flag;
	}// delCheck

	// 수정, 삭제 시 아이디 식별
	public boolean identify(int no, String id) throws SQLException {
		boolean flag = false;
		try {
			System.out.println("identify 실행");

			con = pool.getConnection();

			String sql = "select * from comments where no = ? and id = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			ps.setString(2, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				flag = true;
			}

			System.out.println("아이디 식별 결과 flag = " + flag);
			System.out.println("파라미터 no = " + no + ", id = " + id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.dbClose(rs, ps, con);
		}

		return flag;
	}// identify

}
