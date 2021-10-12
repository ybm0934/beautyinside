package com.beauty.reserve;

import java.sql.Timestamp;

public class ReserveDTO {

	private int no;
	private String name;
	private String email;
	private String tel;
	private String service;
	private int price;
	private String resDate;
	private String resWords;
	private Timestamp regdate;
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

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getResDate() {
		return resDate;
	}

	public void setResDate(String resDate) {
		this.resDate = resDate;
	}

	public String getResWords() {
		return resWords;
	}

	public void setResWords(String resWords) {
		this.resWords = resWords;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "ReserveDTO [no=" + no + ", name=" + name + ", email=" + email + ", tel=" + tel + ", service=" + service
				+ ", price=" + price + ", resDate=" + resDate + ", resWords=" + resWords + ", regdate=" + regdate
				+ ", status=" + status + "]";
	}

}
