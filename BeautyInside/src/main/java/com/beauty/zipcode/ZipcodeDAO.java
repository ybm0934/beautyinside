package com.beauty.zipcode;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.beauty.connection.ConnectionPoolMgr;

public class ZipcodeDAO {

	ConnectionPoolMgr pool;
	Connection con;
	PreparedStatement ps;
	ResultSet rs;

	public ZipcodeDAO() {
		pool = new ConnectionPoolMgr();
	}

	// 주소 검색
	public ArrayList<ZipcodeDTO> searchList(String address) throws SQLException {
		ArrayList<ZipcodeDTO> list = new ArrayList<ZipcodeDTO>();

		try {
			System.out.println("addrList 실행\r\n");

			con = pool.getConnection();

			if (!address.isEmpty()) {
				String[] str = address.split(" "); // 주소 분할
				String sql = "";

				boolean flag = false;
				int temp = 0;
				for (int i = 0; i < str.length; i++) {
					// 숫자 체크
					for (int j = 0; j < str[str.length - 1].length(); j++) {
						char c = str[str.length - 1].charAt(j);
						if (!(c >= 48 && c <= 57)) {
							flag = true;
						}
					}
					if (flag == false) {
						temp = Integer.parseInt(str[str.length - 1]);
					}

					// 알고리즘 미완성
					sql = "select * from v_zipcode where 시도 like '%" + str[i] + "%' or 시군구 like '%" + str[i]
							+ "%' or 도로명 = '" + str[i] + "' or 도로번지 = '" + temp + "' or 지명 = '" + str[i] + "' or 동 = '"
							+ str[i] + "'";
				} // for

				System.out.println("sql : " + sql);

				if (!sql.isEmpty()) {
					ps = con.prepareStatement(sql);
					rs = ps.executeQuery();
					while (rs.next()) {
						String zipcode = rs.getString("우편번호");
						String sido = rs.getString("시도");
						String sigungu = rs.getString("시군구");
						String doro = rs.getString("도로명");
						String haengjung = rs.getString("지명");
						String dong = rs.getString("동");
						int build_a = rs.getInt("도로번지");
						String eupkey = rs.getString("지명번지");

						ZipcodeDTO zipDto = new ZipcodeDTO();
						zipDto.setZipcode(zipcode);
						zipDto.setSido(sido);
						zipDto.setSigungu(sigungu);
						zipDto.setDoro(doro);
						zipDto.setHaengjung(haengjung);
						zipDto.setDetaildong(dong);
						zipDto.setBuild_a(build_a);
						zipDto.setEupkey(eupkey);

						list.add(zipDto);
					}
				} // if
			}

			System.out.println("주소 검색 결과 list.size() = " + list.size());
			System.out.println("파라미터 address = " + address + "\r\n");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.dbClose(rs, ps, con);
		}

		return list;
	}// addrList

}