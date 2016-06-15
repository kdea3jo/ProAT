package org.teamAT.vo;

import java.sql.Date;

public class CommentVo {
	private int num;
	private String userid;
	private String contents;
	private int boardnum;
	private Date wdate;
	private int totalpage;
	public int getNum() {
		return num;
	}
	public String getUserid() {
		return userid;
	}
	public String getContents() {
		return contents;
	}
	public int getBoardnum() {
		return boardnum;
	}
	public Date getWdate() {
		return wdate;
	}
	public int getTotalpage() {
		return totalpage;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}
	public void setWdate(Date wdate) {
		this.wdate = wdate;
	}
	public void setTotalpage(int totalpage) {
		this.totalpage = totalpage;
	}
	
	
	
}
