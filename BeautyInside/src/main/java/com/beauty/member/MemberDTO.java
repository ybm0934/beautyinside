package com.beauty.member;

import java.sql.Timestamp;

// 회원가입 DTO
public class MemberDTO {

	private int no; // 회원 번호
	private String id; // 아이디
	private String pwd; // 패스워드
	private String name; // 이름
	private String birth; // 생년월일
	private String tel; // 전화번호
	private String gender; // 성별
	private String email; // 이메일
	private int zipcode; // 우편번호
	private String address1; // 기본 주소
	private String address2; // 상세 주소
	private Timestamp regdate; // 등록일
	private String dormant; // 휴면 계정 여부

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getZipcode() {
		return zipcode;
	}

	public void setZipcode(int zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public String getDormant() {
		return dormant;
	}

	public void setDormant(String dormant) {
		this.dormant = dormant;
	}

	@Override
	public String toString() {
		return "MemberDTO [no=" + no + ", id=" + id + ", pwd=" + pwd + ", name=" + name + ", birth=" + birth + ", tel="
				+ tel + ", gender=" + gender + ", email=" + email + ", zipcode=" + zipcode + ", address1=" + address1
				+ ", address2=" + address2 + ", regdate=" + regdate + ", dormant=" + dormant + "]";
	}

}
