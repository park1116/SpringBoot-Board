package com.example.board.dto;

import java.sql.Date;

public class BoardDto {
	private int num;
	private String title;
	private String content;
	private String name;
	private Date regdate;
	@Override
	public String toString() {
		return "BoardDto [num=" + num + ", title=" + title + ", content=" + content + ", name=" + name + ", regdate="
				+ regdate + "]";
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
}
