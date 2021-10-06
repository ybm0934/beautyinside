package com.beauty.review;

import java.sql.Timestamp;

public class ReviewDTO {

	private int no; // 글 번호
	private String id; // 작성자 아이디
	private String name; // 작성자
	private String title; // 글 제목
	private String content; // 내용
	private int count; // 조회수
	private Timestamp regdate; // 등록일
	private String fileName; // 파일명
	private double fileSize; // 파일 크기

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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public double getFileSize() {
		return fileSize;
	}

	public void setFileSize(double fileSize) {
		this.fileSize = fileSize;
	}

	@Override
	public String toString() {
		return "ReviewDTO [no=" + no + ", id=" + id + ", name=" + name + ", title=" + title + ", content=" + content
				+ ", count=" + count + ", regdate=" + regdate + ", fileName=" + fileName + ", fileSize=" + fileSize
				+ "]";
	}

}
