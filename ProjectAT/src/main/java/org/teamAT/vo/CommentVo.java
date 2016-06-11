package org.teamAT.vo;

import java.sql.Date;

public class CommentVo {
	private int num;
	private String userid;
	private String content;
	private int boardnum;
	private Date wdate;
	private int totalpage;
	
	
	public int getTotalpage() {
		return totalpage;
	}
	public void setTotalpage(int totalpage) {
		this.totalpage = totalpage;
	}
	public int getNum() {
		return num;
	}
	public String getUserid() {
		return userid;
	}
	public String getContent() {
		return content;
	}
	public int getBoardnum() {
		return boardnum;
	}
	public Date getWdate() {
		return wdate;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}
	public void setWdate(Date wdate) {
		this.wdate = wdate;
	}
	
}
