package com.beauty.chat;

import java.sql.Timestamp;

public class ChatDTO {

	private String id;
	private String name;
	private String content;
	private Timestamp regdate;

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
		return "ChatDTO [id=" + id + ", name=" + name + ", content=" + content + ", regdate=" + regdate + "]";
	}

}
