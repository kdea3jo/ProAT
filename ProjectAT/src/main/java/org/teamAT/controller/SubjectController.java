package org.teamAT.controller;

import java.lang.ProcessBuilder.Redirect;
import java.security.Principal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.teamAT.service.SubjectService;
import org.teamAT.vo.MemberVo;
import org.teamAT.vo.SubjectVo;

@Controller
@RequestMapping("/subject/")
public class SubjectController {
	
	@Autowired
	private SubjectService ss;
	
	@InitBinder /*form에서 date 타입을 맵핑할 때 필요한 메서드*/
    protected void initBinder(WebDataBinder binder){
        DateFormat  dateFormat = new SimpleDateFormat("yy-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat,true));
    }
	@RequestMapping("createform")
	private String viewCreateSubjectForm(Model model){
		model.addAttribute(new SubjectVo());
		return "/subject/create";
	}
	@RequestMapping(value="create", method=RequestMethod.POST)
	private String createSubject(@Valid SubjectVo vo,BindingResult result){
		ss.setSubject(vo);
		return "/subject/create";
	}
	@RequestMapping(value="list")
	private String viewSubjectList(@RequestParam int state,Model model){
		List<SubjectVo> list=ss.getSubjectList(state);
		model.addAttribute("SubjectList", list);
		return "/subject/list";
	}
	@ResponseBody
	@RequestMapping("apply")
	private int applySubject(@RequestParam int num,Principal principal){
		return ss.applySubject(num,principal.getName());
	}
	@RequestMapping("cancel")
	private String applySubject(Principal principal){
		ss.cancelSubject(principal.getName());
		return "redirect:list?state=1";
	}
	@RequestMapping(value="mysubject")
	private String viewMySubject(HttpServletRequest request,Principal principal){
		if(request.getSession().getAttribute("passwordcheck")==null) return "redirect:/member/check_pw";
		request.getSession().removeAttribute("passwordcheck");
		SubjectVo vo=ss.getMyApplySubject(principal.getName());
		request.setAttribute("subjectVo", vo);
		return "/subject/mysubject";
	}
}
