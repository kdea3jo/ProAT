package org.teamAT.vo;

import java.sql.Date;

public class AttendanceVo {

	private String userid;
	private Date adate;
	private String userin;
	private String userout;
	private int atexception;
	private String statue;
	
	public String getUserid() {
		return userid;
	}
	public Date getAdate() {
		return adate;
	}
	public String getUserin() {
		return userin;
	}
	public String getUserout() {
		return userout;
	}
	public int getAtexception() {
		return atexception;
	}
	public String getStatue() {
		return statue;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public void setAdate(Date adate) {
		this.adate = adate;
	}
	public void setUserin(String userin) {
		this.userin = userin;
	}
	public void setUserout(String userout) {
		this.userout = userout;
	}
	public void setAtexception(int atexception) {
		this.atexception = atexception;
	}
	public void setStatue(String statue) {
		this.statue = statue;
	}
	
}
