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

			String sql = "SELECT * FROM review";
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
				int count = rs.getInt("count");

				ReviewDTO boardDto = new ReviewDTO();

				boardDto.setNo(no);
				boardDto.setTitle(title);
				boardDto.setName(name);
				boardDto.setRegdate(regdate);
				boardDto.setCount(count);

				list.add(boardDto);
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

			String sql = "INSERT INTO review(NO, id, NAME, title, CONTENT, fileName, fileSize) VALUES(board_seq.nextval, ?, ?, ?, ?, ?, ?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, reviewDto.getId());
			ps.setString(2, reviewDto.getName());
			ps.setString(3, reviewDto.getTitle());
			ps.setString(4, reviewDto.getContent());
			ps.setString(5, reviewDto.getFileName());
			ps.setDouble(6, reviewDto.getFileSize());

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
	public ReviewDTO reviewByNo(int no, String userid) throws SQLException {
		ReviewDTO reviewDto = new ReviewDTO();

		try {
			System.out.println("reviewByNo 실행\r\n");

			con = pool.getConnection();

			String sql = "SELECT * FROM review WHERE no = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			rs = ps.executeQuery();
			if (rs.next()) {
				String name = rs.getString("name");
				String id = rs.getString("id");
				String title = rs.getString("title");
				String content = rs.getString("content");
				int count = rs.getInt("count");
				Timestamp regdate = rs.getTimestamp("regdate");
				String fileName = rs.getString("fileName");
				double fileSize = rs.getDouble("fileSize");
				
				// 조회 수 증가
				if (userid != null) { // 로그인 한 사람만 조회수 증가
					sql = "update review set count = count + 1 where no = ? and id != ?";
					ps = con.prepareStatement(sql);
					ps.setInt(1, no);
					ps.setString(2, userid); // 자신의 글은 조회수 증가 방지
					int cnt = ps.executeUpdate();
					System.out.println("조회수 증가 결과 cnt : " + cnt);
				}

				reviewDto.setName(name);
				reviewDto.setId(id);
				reviewDto.setTitle(title);
				reviewDto.setContent(content);
				reviewDto.setCount(count);
				reviewDto.setRegdate(regdate);
				reviewDto.setFileName(fileName);
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

	// 수정
	public int reviewUpdate(ReviewDTO reviewDto) throws SQLException {
		int cnt = 0;

		try {
			System.out.println("updateReview 실행 \r\n");

			con = pool.getConnection();

			String sql = "UPDATE review SET title = ?, CONTENT = ?, fileName = ?, fileSize = ? WHERE NO = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, reviewDto.getTitle());
			ps.setString(2, reviewDto.getContent());
			ps.setString(3, reviewDto.getFileName());
			ps.setDouble(4, reviewDto.getFileSize());
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
			if(cnt > 0) {
				sql = "delete from comments where ogNo = ?";
				ps = con.prepareStatement(sql);
				ps.setInt(1, no);
				cnt = ps.executeUpdate();
				System.out.println("댓글 삭제 결과 cnt = " + cnt);
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
