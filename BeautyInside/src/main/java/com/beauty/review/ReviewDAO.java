package com.beauty.review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.beauty.connection.ConnectionPoolMgr;

public class ReviewDAO {

	ConnectionPoolMgr pool;
	Connection con;
	PreparedStatement ps;
	ResultSet rs;

	public ReviewDAO() {
		pool = new ConnectionPoolMgr();
	}

	// 목록
	public List<ReviewDTO> reviewList(String category, String keyword) throws SQLException {
		List<ReviewDTO> list = new ArrayList<ReviewDTO>();

		try {
			System.out.println("reviewList 실행\r\n");

			con = pool.getConnection();

			String sql = "SELECT no, title, name, regdate, (sysdate-regdate) * 24 as newTerm, count, fileName, orgFileName FROM review";
			if (keyword != null && !keyword.isEmpty()) {
				sql += " WHERE " + category + " LIKE '%" + keyword + "%'";
			}
			sql += " ORDER BY no DESC";

			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				int no = rs.getInt("no");
				String title = rs.getString("title");
				String name = rs.getString("name");
				Timestamp regdate = rs.getTimestamp("regdate");
				double newTerm = rs.getInt("newTerm");
				int count = rs.getInt("count");
				String fileName = rs.getString("fileName");
				String orgFileName = rs.getString("orgFileName");

				ReviewDTO reviewDto = new ReviewDTO();

				reviewDto.setNo(no);
				reviewDto.setTitle(title);
				reviewDto.setName(name);
				reviewDto.setRegdate(regdate);
				reviewDto.setNewTerm(newTerm);
				reviewDto.setCount(count);
				reviewDto.setFileName(fileName);
				reviewDto.setOrgfileName(orgFileName);

				list.add(reviewDto);
			} // while

			System.out.println("글 목록 결과 list.size() = " + list.size());
			System.out.println("파라미터 category : " + category + ", keyword : " + keyword + "\r\n");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.dbClose(rs, ps, con);
		}

		return list;
	}// reviewList

	// 글쓰기
	public int reviewWrite(ReviewDTO reviewDto) throws SQLException {
		int cnt = 0;
		try {
			System.out.println("reviewWrite 실행\r\n");

			con = pool.getConnection();

			String sql = "INSERT INTO review(NO, id, name, title, CONTENT, fileName, orgfileName, fileSize) VALUES(review_seq.nextval, ?, ?, ?, ?, ?, ?, ?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, reviewDto.getId());
			ps.setString(2, reviewDto.getName());
			ps.setString(3, reviewDto.getTitle());
			ps.setString(4, reviewDto.getContent());
			ps.setString(5, reviewDto.getFileName());
			ps.setString(6, reviewDto.getOrgfileName());
			ps.setDouble(7, reviewDto.getFileSize());

			cnt = ps.executeUpdate();
			System.out.println("글쓰기 결과 cnt = " + cnt);
			System.out.println("파라미터 reviewDto = " + reviewDto + "\r\n");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.dbClose(ps, con);
		}

		return cnt;
	}// reviewWrite

	// 상세보기
	public ReviewDTO reviewByNo(int no) throws SQLException {
		ReviewDTO reviewDto = null;

		try {
			System.out.println("reviewByNo 실행\r\n");

			con = pool.getConnection();

			String sql = "SELECT * FROM review WHERE no = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			rs = ps.executeQuery();
			if (rs.next()) {
				String id = rs.getString("id");
				String name = rs.getString("name");
				String title = rs.getString("title");
				String content = rs.getString("content");
				int count = rs.getInt("count");
				Timestamp regdate = rs.getTimestamp("regdate");
				String fileName = rs.getString("fileName");
				String orgfileName = rs.getString("orgfileName");
				double fileSize = rs.getDouble("fileSize");

				reviewDto = new ReviewDTO();
				reviewDto.setId(id);
				reviewDto.setName(name);
				reviewDto.setTitle(title);
				reviewDto.setContent(content);
				reviewDto.setCount(count);
				reviewDto.setRegdate(regdate);
				reviewDto.setFileName(fileName);
				reviewDto.setOrgfileName(orgfileName);
				reviewDto.setFileSize(fileSize);
			}

			System.out.println("detail 파라미터 no : " + no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.dbClose(rs, ps, con);
		}

		return reviewDto;
	}// reviewByNo

	// 조회 수 증가
	public int readCount(int no, String id) throws SQLException {
		int cnt = 0;
		if (id == null)
			return cnt;
		try {
			System.out.println("readCount 실행");

			con = pool.getConnection();

			String sql = "update review set count = count + 1 where no = ? and id != ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			ps.setString(2, id);
			cnt = ps.executeUpdate();

			System.out.println("조회 수 증가 결과 cnt = " + cnt);
			System.out.println("파라미터 no = " + no + ", id = " + id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.dbClose(ps, con);
		}

		return cnt;
	}// readCount

	// 수정
	public int reviewUpdate(ReviewDTO reviewDto) throws SQLException {
		int cnt = 0;

		try {
			System.out.println("updateReview 실행 \r\n");

			con = pool.getConnection();

			String sql = "UPDATE review SET title = ?, CONTENT = ?, fileName = ?, orgfileName = ?, fileSize = ? WHERE NO = ? and id = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, reviewDto.getTitle());
			ps.setString(2, reviewDto.getContent());
			ps.setString(3, reviewDto.getFileName());
			ps.setString(4, reviewDto.getOrgfileName());
			ps.setDouble(5, reviewDto.getFileSize());
			ps.setInt(6, reviewDto.getNo());
			ps.setString(7, reviewDto.getId());
			cnt = ps.executeUpdate();

			System.out.println("리뷰 게시판 글 수정 결과 cnt = " + cnt);
			System.out.println("파라미터 reviewDto = " + reviewDto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.dbClose(ps, con);
		}

		return cnt;
	}// updateReview

	// 삭제
	public int reviewDelete(int no, String userid) throws SQLException {
		int cnt = 0;
		try {
			System.out.println("reviewDelete 실행\r\n");

			con = pool.getConnection();
			
			String sql = "delete from review where no = ? and id = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			ps.setString(2, userid);
			cnt = ps.executeUpdate();
			System.out.println("리뷰 삭제 결과 cnt = " + cnt);
			
			// 해당 글 하위 댓글도 모두 삭제
			if (cnt > 0) {
				sql = "delete from comments where ogNo = ?";
				ps = con.prepareStatement(sql);
				ps.setInt(1, no);
				int cnt2 = ps.executeUpdate();
				System.out.println("댓글 삭제 결과 cnt2 = " + cnt2);
			}

			System.out.println("파라미터 no = " + no + ", userid = " + userid);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.dbClose(ps, con);
		}

		return cnt;
	}// reviewDelete

}
