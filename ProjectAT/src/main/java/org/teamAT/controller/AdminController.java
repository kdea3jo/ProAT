package org.teamAT.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.teamAT.service.AdminService;
import org.teamAT.vo.MemberVo;

@Controller
@RequestMapping("/admin/")
public class AdminController {
	
	@Autowired
	private AdminService as;

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
	@RequestMapping("addstudent")
	public String addStudent(@RequestParam String id) {
		as.setStudent(id);
		return "redirect:applicantView";
	}
	@RequestMapping("removeapplicant")
	public String removeApplicant(@RequestParam String id) {
		as.removeApplicant(id);
		return "redirect:applicantView";
	}
}
