package org.teamAT.controller;

import java.security.Principal;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.teamAT.service.JobService;
import org.teamAT.vo.JobInfoVo;

@Controller
@RequestMapping("/job/")
public class JobController {
	
	@Autowired
	private JobService js;

	@RequestMapping("writeform")
	private String viewWriteForm(Model model){
		model.addAttribute(new JobInfoVo());
		return "/job/write";
	}
	
	@RequestMapping("write")
	private String write(@Valid JobInfoVo vo, BindingResult result, Principal principal){
		if(result.hasErrors()){
			return "/job/write";
		}
		vo.setUserid(principal.getName());
		js.writeJobInfo(vo);
		return "/job/write";
	}
}
