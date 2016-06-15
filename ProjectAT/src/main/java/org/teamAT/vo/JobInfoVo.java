package org.teamAT.vo;

import java.util.Date;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

public class JobInfoVo {
	
	private int num; //auto
	private String userid; //auto
	@NotEmpty
	private String title;
	@NotEmpty
	private String contents;
	private Date wdate; //auto
	@NotNull
	private int hirecount;
	@Size(min=23,max=23)
	private String period;
	@NotEmpty
	private String company;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getWdate() {
		return wdate;
	}
	public void setWdate(Date wdate) {
		this.wdate = wdate;
	}
	public int getHirecount() {
		return hirecount;
	}
	public void setHirecount(int hirecount) {
		this.hirecount = hirecount;
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
}
