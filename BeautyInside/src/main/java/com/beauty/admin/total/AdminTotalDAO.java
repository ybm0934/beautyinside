package com.beauty.admin.total;

import java.sql.*;
import java.util.ArrayList;

import com.beauty.connection.ConnectionPoolMgr;

public class AdminTotalDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	ConnectionPoolMgr pool;
	
	public AdminTotalDAO() {
		pool = new ConnectionPoolMgr();
	}
	// 서비스 통계 (수분공급)
	public ArrayList<String> serviceList(String year) {
		try {
			String sql = "select count(decode(service,'수분공급',1)),"
						+ "count(decode(service,'젤 매니큐어',1)),"
						+ "count(decode(service,'페디큐어',1)),"
						+ "count(decode(service,'네일아트',1)),"
						+ "count(decode(service,'매니큐어 손질',1)),"
						+ "count(decode(service,'퓨어 클렌징',1)),"
						+ "count(decode(service,'퓨어 마사지',1))"
						+ "from reserve where to_char(regdate, 'yyyy') = '" + year + "'";
			conn = pool.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if (rs.next()) {
				ArrayList<String> arr = new ArrayList<String>();
				arr.add(rs.getString(1));
				arr.add(rs.getString(2));
				arr.add(rs.getString(3));
				arr.add(rs.getString(4));
				arr.add(rs.getString(5));
				arr.add(rs.getString(6));
				arr.add(rs.getString(7));
				return arr;
			}
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
	// 일자별 
	public ArrayList<AdminTotalDTO> datelist() {
		ArrayList<AdminTotalDTO> list = new ArrayList<AdminTotalDTO>();
		try {
			String sql = "select * from summarydate order by regdate desc";
			conn = pool.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				AdminTotalDTO dto = new AdminTotalDTO();
				dto.setRegdate(rs.getString("regdate"));
				dto.setService(rs.getInt("service"));
				dto.setTake(rs.getInt("take"));
				dto.setUserjoin(rs.getInt("userjoin"));
				dto.setReview(rs.getInt("review"));
				list.add(dto);
			}
			return list;
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
	// 일자별 검색 
	public void dateSearch(String date, int service, int take, int joinCount, int reviewCount) {
		try {
			String sql = "insert into summarydate values (to_date(" + date + ",'yyyymmdd'), " + service +", " + take + ", " + joinCount + ", " + reviewCount +" )";
			conn = pool.getConnection();
			ps = conn.prepareStatement(sql);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pool.dbClose(ps, conn);
			} catch (Exception e2) {
				
			}
		}
	}
	// 서비스 건
	public int serviceCount(String date) {
		try {
			String sql = "select count(*) from reserve where to_char(regdate,'yyyymmdd') = " + date;
			conn = pool.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			rs.next();
			return rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pool.dbClose(rs, ps, conn);
			} catch (Exception e2) {
				
			}
		}
		return -1;
	}
	// 매출액
	public int take(String date) {
		try {
			String sql = "select sum(price) from reserve where to_char(regdate,'yyyymmdd') = " + date;
			conn = pool.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			rs.next();
			return rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pool.dbClose(rs, ps, conn);
			} catch (Exception e2) {
				
			}
		}
		return -1;
	}
	// 가입수
	public int joinCount(String date) {
		try {
			String sql = "select count(*) from member where to_char(regdate,'yyyymmdd') = " + date;
			conn = pool.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			rs.next();
			return rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pool.dbClose(rs, ps, conn);
			} catch (Exception e2) {
				
			}
		}
		return -1;
	}
	// 리뷰수
	public int reviewCount(String date) {
		try {
			String sql = "select count(*) from review where to_char(regdate,'yyyymmdd') = " + date;
			conn = pool.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			rs.next();
			return rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pool.dbClose(rs, ps, conn);
			} catch (Exception e2) {
				
			}
		}
		return -1;
	}
	// 검색 초기화
	public int dateListDelete() {
		try {
			String sql = "TRUNCATE TABLE SUMMARYDATE";
			conn = pool.getConnection();
			ps = conn.prepareStatement(sql);
			return ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				
			} catch (Exception e2) {
				
			}
		}
		return -1;
	}
}
