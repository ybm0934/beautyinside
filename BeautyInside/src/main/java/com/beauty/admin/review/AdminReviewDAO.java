package com.beauty.admin.review;

import java.sql.*;
import java.sql.Date;
import java.util.*;
import com.beauty.connection.ConnectionPoolMgr;


public class AdminReviewDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	ConnectionPoolMgr pool;
	
	public AdminReviewDAO() {
		pool = new ConnectionPoolMgr();
	}
	// 리뷰관리 목록 표시 메소드 (검색 목록 표시)
	public ArrayList<AdminReviewDTO> reviewList(String title, String text) {
		
		ArrayList<AdminReviewDTO> arr = new ArrayList<AdminReviewDTO>();
		
		String sql = "select * from review";
		
		if (!(text.equals(""))) {
			sql += " where " + title + " like '%" + text + "%'";
		}
		if (title.equals("")) {
			sql = "select * from review";
		}
		sql += " order by no desc ";
		
		try {
			conn = pool.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				AdminReviewDTO dto = new AdminReviewDTO();
				dto.setNo(rs.getInt("no"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setCount(rs.getInt("count"));
				dto.setRegdate(rs.getDate("regdate"));
				dto.setFilename(rs.getString("filename"));
				dto.setFilesize(rs.getInt("filesize"));
				arr.add(dto);
			}
			return arr; // 목록 반환
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
	// 리뷰관리 내용 표시 메소드 
	public ArrayList<AdminReviewDTO> reviewContent(int no) {
		
		ArrayList<AdminReviewDTO> arr = new ArrayList<AdminReviewDTO>();
		
		try {
			String sql = "select * from review where no = ?";
			conn = pool.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			rs = ps.executeQuery();
			while (rs.next()) {
				AdminReviewDTO dto = new AdminReviewDTO();
				dto.setNo(rs.getInt("no"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setCount(rs.getInt("count"));
				dto.setRegdate(rs.getDate("regdate"));
				dto.setFilename(rs.getString("filename"));
				arr.add(dto);
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
		return null;
	}
	// 리뷰 수정 메소드
	public int reviewUpdate(AdminReviewDTO dto, int no) {
		
		try {
			String sql = "update review set title = ?, content = ? where no = ?";
			if (dto.getTitle() == null || dto.getContent() == null) {
				return -2; // 미입력시
			}
			conn = pool.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getTitle());
			ps.setString(2, dto.getContent());
			ps.setInt(3, no);
			int count = ps.executeUpdate();
			return count;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pool.dbClose(ps, conn);
			} catch (Exception e2) {

			}
		}
		return -1; // 오류
	}
	// 총 리뷰 수 메소드
	public int reviewCount() {
		String sql = "select count(*) from review";
		try {
			conn = pool.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			rs.next();
			int count = rs.getInt(1);
			return count;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pool.dbClose(ps, conn);
			} catch (Exception e2) {
				
			}
		}
		return -1; // 오류
	}
	// 리뷰 삭제 메소드
	public int reviewDelete(int no) {
		
		try {
			String sql = "delete from review where no = ?";
			conn = pool.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			int count = ps.executeUpdate();
			return count;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pool.dbClose(ps, conn);
			} catch (Exception e2) {

			}
		}
		return -1; // 오류
	}
}
