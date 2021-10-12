package com.beauty.reserve;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.beauty.connection.ConnectionPoolMgr;

public class ReserveDAO {

	ConnectionPoolMgr pool;
	Connection con;
	PreparedStatement ps;
	ResultSet rs;

	public ReserveDAO() {
		pool = new ConnectionPoolMgr();
	}

	// 예약하기
	public int reserve(ReserveDTO resDto) throws SQLException {
		int cnt = 0;
		try {
			System.out.println("reserve 실행");

			con = pool.getConnection();
			System.out.println("파라미터 resDto = " + resDto);
			String sql = "INSERT INTO reserve(NO, NAME, email, tel, service, price, resdate, reswords, regdate, status) "
					+ "VALUES(reserve_seq.nextval, ?, ?, ?, ?, ?, ?, ?, DEFAULT, DEFAULT)";
			ps = con.prepareStatement(sql);
			ps.setString(1, resDto.getName());
			ps.setString(2, resDto.getEmail());
			ps.setString(3, resDto.getTel());
			ps.setString(4, resDto.getService());
			ps.setInt(5, resDto.getPrice());
			ps.setString(6, resDto.getResDate());
			ps.setString(7, resDto.getResWords());
			cnt = ps.executeUpdate();

			System.out.println("예약하기 결과 cnt = " + cnt);
			System.out.println("파라미터 resDto = " + resDto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.dbClose(ps, con);
		}

		return cnt;
	} // reserve

}
