package com.beauty.admin.reservation;

import java.sql.*;

public class AdminReservationDTO {
	
	private int no;
	private String name;
	private String email;
	private String tel;
	private String service;
	private String reswords;
	private String resdate;
	private String regdate;
	private String status;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getService() {
		return service;
	}
	public void setService(String service) {
		this.service = service;
	}
	public String getResdate() {
		return resdate;
	}
	public void setResdate(String rsvdate) {
		this.resdate = rsvdate;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getReswords() {
		return reswords;
	}
	public void setReswords(String reswords) {
		this.reswords = reswords;
	}
	
	
}
