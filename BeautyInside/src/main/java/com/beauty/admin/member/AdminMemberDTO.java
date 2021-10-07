package com.beauty.admin.member;

import java.sql.*;


public class AdminMemberDTO {
	
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
	private Date regdate; // 등록일
	private String dormant; // 휴면 계정 여부
	
	
	// member_update.jsp
	private String cd[];
	public String[] getCd() {
		return cd;
	}
	public void setCd(String[] cd) {
		this.cd = cd;
	}
	// member_update_action.jsp
	private String no_update[];
	private String name_update[];
	private String birth_update[];
	private String tel_update[];
	private String gender_update[];
	private String email_update[];
	private String zipcode_update[];
	private String address1_update[];
	private String address2_update[];
	private String regdate_update[];
	private String dormant_update[];
	public String[] getNo_update() {
		return no_update;
	}
	public void setNo_update(String[] no_update) {
		this.no_update = no_update;
	}
	public String[] getName_update() {
		return name_update;
	}
	public void setName_update(String[] name_update) {
		this.name_update = name_update;
	}
	public String[] getBirth_update() {
		return birth_update;
	}
	public void setBirth_update(String[] birth_update) {
		this.birth_update = birth_update;
	}
	public String[] getTel_update() {
		return tel_update;
	}
	public void setTel_update(String[] tel_update) {
		this.tel_update = tel_update;
	}
	public String[] getGender_update() {
		return gender_update;
	}
	public void setGender_update(String[] gender_update) {
		this.gender_update = gender_update;
	}
	public String[] getEmail_update() {
		return email_update;
	}
	public void setEmail_update(String[] email_update) {
		this.email_update = email_update;
	}
	public String[] getZipcode_update() {
		return zipcode_update;
	}
	public void setZipcode_update(String[] zipcode_update) {
		this.zipcode_update = zipcode_update;
	}
	public String[] getAddress1_update() {
		return address1_update;
	}
	public void setAddress1_update(String[] address1_update) {
		this.address1_update = address1_update;
	}
	public String[] getAddress2_update() {
		return address2_update;
	}
	public void setAddress2_update(String[] address2_update) {
		this.address2_update = address2_update;
	}
	public String[] getRegdate_update() {
		return regdate_update;
	}
	public void setRegdate_update(String[] regdate_update) {
		this.regdate_update = regdate_update;
	}
	public String[] getDormant_update() {
		return dormant_update;
	}
	public void setDormant_update(String[] dormant_update) {
		this.dormant_update = dormant_update;
	}
	// 메인 
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
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getDormant() {
		return dormant;
	}
	public void setDormant(String dormant) {
		this.dormant = dormant;
	}
	
}

