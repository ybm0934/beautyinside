package com.beauty.email;

public class MailDTO {

	// 이메일 보내기
	private String name;
	private String toEmail;
	private String fromEmail;
	private String subject;
	private String content;

	// 이메일 인증
	private int no;
	private String email;
	private String key;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getToEmail() {
		return toEmail;
	}

	public void setToEmail(String toEmail) {
		this.toEmail = toEmail;
	}

	public String getFromEmail() {
		return fromEmail;
	}

	public void setFromEmail(String fromEmail) {
		this.fromEmail = fromEmail;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	@Override
	public String toString() {
		return "MailDTO [name=" + name + ", toEmail=" + toEmail + ", fromEmail=" + fromEmail + ", subject=" + subject
				+ ", content=" + content + ", no=" + no + ", email=" + email + ", key=" + key + "]";
	}

}
