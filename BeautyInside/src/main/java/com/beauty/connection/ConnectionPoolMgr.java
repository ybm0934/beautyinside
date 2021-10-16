package com.beauty.connection;

import java.sql.*;

public class ConnectionPoolMgr {

	public ConnectionPoolMgr() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("드라이버 로딩 성공");
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패");
			e.printStackTrace();
		}
	} // 생성자

	public Connection getConnection() throws SQLException {
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "beauty";
		String pwd = "1234";

		Connection con = DriverManager.getConnection(url, user, pwd);
		System.out.println("DB연결 con : " + con);

		return con;
	}// getConnection

	public void dbClose(PreparedStatement ps, Connection con) throws SQLException {
		if (ps != null)
			ps.close();
		if (con != null)
			con.close();
	}

	public void dbClose(ResultSet rs, PreparedStatement ps, Connection con) throws SQLException {
		if (rs != null)
			rs.close();
		if (ps != null)
			ps.close();
		if (con != null)
			con.close();
	}

}
