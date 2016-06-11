package org.teamAT.vo;

import java.util.Date;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class MemberVo {
	
	@NotEmpty
	@Email
	@Size(min=5, max=30)
	private String userid;
	
	@NotEmpty
	private String userpw;
	
	@NotEmpty
	private String username;
	
	@NotEmpty
	private String phone;
	
	@NotNull
	private Date birthday;
	
	private String educlass;
	
	private String grade;
	
	private Date applicantDate;
	
	public Date getApplicantDate() {
		return applicantDate;
	}
	public void setApplicantDate(Date applicantDate) {
		this.applicantDate = applicantDate;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getEduclass() {
		return educlass;
	}
	public void setEduclass(String educlass) {
		this.educlass = educlass;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
}
