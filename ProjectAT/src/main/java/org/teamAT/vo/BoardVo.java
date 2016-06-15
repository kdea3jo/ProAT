package org.teamAT.vo;

import java.sql.Date;

public class BoardVo {
	
	private int num;
	private String userid;
	private String title;
	private String contents;
	private Date wDate;
	private String username;
	private int totalpage;
	private int hit;
	public int getNum() {
		return num;
	}
	public String getUserid() {
		return userid;
	}
	public String getTitle() {
		return title;
	}
	public String getContents() {
		return contents;
	}
	public Date getwDate() {
		return wDate;
	}
	public String getUsername() {
		return username;
	}
	public int getTotalpage() {
		return totalpage;
	}
	public int getHit() {
		return hit;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public void setwDate(Date wDate) {
		this.wDate = wDate;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public void setTotalpage(int totalpage) {
		this.totalpage = totalpage;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	
	
}
