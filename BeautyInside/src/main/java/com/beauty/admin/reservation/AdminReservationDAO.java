package com.beauty.admin.reservation;

import java.sql.*;
import java.sql.Date;
import java.util.*;

import com.beauty.connection.ConnectionPoolMgr;

public class AdminReservationDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	ConnectionPoolMgr pool;
	
	public AdminReservationDAO() {
		pool = new ConnectionPoolMgr();
	}
	// 예약관리 목록 표시 메소드 (검색 목록 표시)
	public ArrayList<AdminReservationDTO> reservationList(String title, String text, String con) {
		
		ArrayList<AdminReservationDTO> arr = new ArrayList<AdminReservationDTO>();
		
		String sql = "select * from reserve order by no desc";
		
		if (!(text.equals(""))) {
			System.out.println("1");
			sql = "select * from reserve where replace (" + title + ", ' ', '') like '%" + text + "%' order by no desc";
		}
		if (title.equals("")) {
			sql = "select * from reserve order by no desc";
		}
		if (con.equals("rsvdateup")) {
			sql = "select * from reserve order by resdate desc";
		} else if (con.equals("rsvdatedown")) {
			sql = "select * from reserve order by resdate";
		} else if (con.equals("regdateup")) {
			sql = "select * from reserve order by regdate desc";
		} else if (con.equals("regdatedown")) {
			sql = "select * from reserve order by regdate";
		}
		try {
			conn = pool.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				AdminReservationDTO dto = new AdminReservationDTO();
				dto.setNo(rs.getInt("no"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setTel(rs.getString("tel"));
				dto.setService(rs.getString("service"));
				dto.setReswords(rs.getString("reswords"));
				dto.setResdate(rs.getString("resdate"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setStatus(rs.getString("status"));
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
	
	// 예약 수정 메소드
		public int reservationUpdate(AdminReservationDTO dto) {
			
			try {
				
				String sql = "update reserve set "
							+ "name = ?, email = ?, tel = ?, "
							+ "service = ?, resdate = ?, "
							+ "regdate = TO_DATE(? , 'yyyy-mm-dd hh24:mi:ss'), status = ? "
							+ "where no = ? ";
				
				conn = pool.getConnection();
				ps = conn.prepareStatement(sql);
				
				ps.setString(1, dto.getName());
				ps.setString(2, dto.getEmail());
				ps.setString(3, dto.getTel());
				ps.setString(4, dto.getService());
				ps.setString(5, dto.getResdate());
				ps.setString(6, dto.getRegdate());
				ps.setString(7, dto.getStatus());
				ps.setInt(8, dto.getNo());
				
				return ps.executeUpdate();
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
