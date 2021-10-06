package com.beauty.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import com.beauty.connection.ConnectionPoolMgr;

public class MemberDAO {

	ConnectionPoolMgr pool;
	Connection con;
	PreparedStatement ps;
	ResultSet rs;

	public static final int LOGIN_OK = 1; // 로그인 성공
	public static final int DISCORD_ID = 2; // 아이디 불일치
	public static final int DISCORD_PWD = 3; // 패스워드 불일치

	public MemberDAO() {
		pool = new ConnectionPoolMgr();
	}

	// 아이디 중복 검사
	public boolean idCheck(String id) throws SQLException {
		boolean flag = false;

		try {
			System.out.println("idCheck 실행\r\n");

			con = pool.getConnection();

			String sql = "SELECT id FROM member WHERE ID = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				flag = true;
			}
			System.out.println("아이디 중복 검사 결과 flag : " + flag + ", 파라미터 : " + id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.dbClose(rs, ps, con);
		}

		return flag;
	}// idCheck

	// 회원 가입
	public int register(MemberDTO memberDto) throws SQLException {
		int cnt = 0;

		try {
			System.out.println("register 실행\r\n");

			con = pool.getConnection();

			String sql = "INSERT INTO MEMBER VALUES (member_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate, default)";
			ps = con.prepareStatement(sql);
			ps.setString(1, memberDto.getId());
			ps.setString(2, memberDto.getPwd());
			ps.setString(3, memberDto.getName());
			ps.setString(4, memberDto.getBirth());
			ps.setString(5, memberDto.getTel());
			ps.setString(6, memberDto.getGender());
			ps.setString(7, memberDto.getEmail());
			ps.setInt(8, memberDto.getZipcode());
			ps.setString(9, memberDto.getAddress1());
			ps.setString(10, memberDto.getAddress2());

			cnt = ps.executeUpdate();

			System.out.println("회원가입 결과 cnt = " + cnt);
			System.out.println("파라미터 memberDto = " + memberDto + "\r\n");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.dbClose(ps, con);
		}

		return cnt;
	}// register

	// 로그인
	public int login(String id, String pwd) throws SQLException {
		int n = 0;

		try {
			System.out.println("login 실행\r\n");

			con = pool.getConnection();

			String sql = "select pwd from member where id = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				if (pwd.equals(rs.getString("pwd"))) {
					n = LOGIN_OK;
				} else {
					n = DISCORD_PWD;
				}
			} else {
				n = DISCORD_ID;
			}

			System.out.println("로그인 결과 n = " + n);
			System.out.println("파라미터 id = " + id + ", pwd = " + pwd + "\r\n");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.dbClose(ps, con);
		}

		return n;
	}// login

	// 회원 정보 불러오기
	public MemberDTO selectByNo(String userid) throws SQLException {
		MemberDTO memberDto = new MemberDTO();
		int cnt = 0;

		try {
			System.out.println("selectByNo 실행\r\n");

			con = pool.getConnection();

			String sql = "select * from member where id = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, userid);
			rs = ps.executeQuery();

			while(rs.next()) {
				int no = rs.getInt("no");
				String id = rs.getString("id");
				String pwd = rs.getString("pwd");
				String name = rs.getString("name");
				String birth = rs.getString("birth");
				String tel = rs.getString("tel");
				String gender = rs.getString("gender");
				String email = rs.getString("email");
				int zipcode = rs.getInt("zipcode");
				String address1 = rs.getString("address1");
				String address2 = rs.getString("address2");
				Timestamp regdate = rs.getTimestamp("regdate");
				String dormant = rs.getString("dormant");

				memberDto.setNo(no);
				memberDto.setId(id);
				memberDto.setPwd(pwd);
				memberDto.setName(name);
				memberDto.setBirth(birth);
				memberDto.setTel(tel);
				memberDto.setGender(gender);
				memberDto.setEmail(email);
				memberDto.setZipcode(zipcode);
				memberDto.setAddress1(address1);
				memberDto.setAddress2(address2);
				memberDto.setRegdate(regdate);
				memberDto.setDormant(dormant);
			}

			System.out.println("회원 정보 불러오기 결과 cnt = " + cnt);
			System.out.println("파라미터 userid = " + userid);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.dbClose(rs, ps, con);
		}

		return memberDto;
	}// selectByNo

}
