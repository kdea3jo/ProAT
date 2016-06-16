package org.teamAT.controller;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.teamAT.service.AdminService;
import org.teamAT.service.AttendanceServiece;
import org.teamAT.vo.AttendanceVo;
import org.teamAT.vo.MemberVo;

@Controller
@RequestMapping("/admin/")
public class AdminController {
	
	@Autowired
	private AdminService as;
	@Autowired
	private AttendanceServiece atts;

	@RequestMapping("studentView")
	public String viewStudentList(Model model) {
		List<MemberVo> list=as.getStudentList();
		model.addAttribute("StudentList", list);
		return "/admin/studentlist";
	}
	@RequestMapping("applicantView")
	public String viewApplicantList(Model model) {
		List<MemberVo> list=as.getApplicantList();
		model.addAttribute("ApplicantList", list);
		return "/admin/applicantlist";
	}
	@ResponseBody
	@RequestMapping("addstudent")
	public boolean addStudent(@RequestParam String id) {
		return as.setStudent(id);
	}
	@ResponseBody
	@RequestMapping("removestudent")
	public boolean removeStudent(@RequestParam String id) {
		return as.removeStudent(id);
	}
	@ResponseBody
	@RequestMapping("removeapplicant")
	public boolean removeApplicant(@RequestParam String id) {
		return as.removeApplicant(id);
	}
	@RequestMapping("userdetails")
	public String viewUserDetails(@RequestParam String id, HttpServletRequest request) {
		as.getUserDetails(id,request);
		return "/admin/userdetails";
	}
	
	@ResponseBody
	@RequestMapping(value="selectDayforadmin", method=RequestMethod.POST)
	public AttendanceVo getSelectDayInfo(Date date,@RequestParam String id){
		return atts.getSelectDayInfo(date,id);
	}
	
	@ResponseBody
	@RequestMapping(value="atdexception", method=RequestMethod.POST)
	public boolean setAtdException(@RequestParam Date date,@RequestParam String id){
		return atts.setAtdException(date, id);
	}
}
