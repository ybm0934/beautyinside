package com.beauty.review;

import java.sql.Timestamp;

public class CommentDTO {

	private int no;
	private int ogNo;
	private int groupNo;
	private int step;
	private int sortNo;
	private String id;
	private String name;
	private String target;
	private String content;
	private Timestamp regdate;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getOgNo() {
		return ogNo;
	}

	public void setOgNo(int ogNo) {
		this.ogNo = ogNo;
	}

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public int getSortNo() {
		return sortNo;
	}

	public void setSortNo(int sortNo) {
		this.sortNo = sortNo;
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

	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "CommentDTO [no=" + no + ", ogNo=" + ogNo + ", groupNo=" + groupNo + ", step=" + step + ", sortNo="
				+ sortNo + ", id=" + id + ", name=" + name + ", target=" + target + ", content=" + content
				+ ", regdate=" + regdate + "]";
	}

}
