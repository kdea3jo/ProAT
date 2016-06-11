package org.teamAT.controller;

import java.security.Principal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.teamAT.service.MemberService;
import org.teamAT.vo.MemberVo;

@Controller
@RequestMapping("/member/")
@JsonIgnoreProperties(ignoreUnknown = true)
public class MemberController {

	@Autowired
	private MemberService ms;
	
	@InitBinder /*form에서 date 타입을 맵핑할 때 필요한 메서드*/
    protected void initBinder(WebDataBinder binder){
        DateFormat  dateFormat = new SimpleDateFormat("yy-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat,true));
    }

	@RequestMapping("loginform")
	public String viewLoginForm() {
		return "/member/login";
	}

	@RequestMapping("joinform")
	public String viewJoinForm(Model model) {
		model.addAttribute(new MemberVo());
		return "/member/join";
	}
	
	@RequestMapping("loginsuccess")
	public String loginSuccess(Principal principal,HttpServletRequest request) {
		String username=ms.getUserName(principal.getName());
		request.getSession().setAttribute("name", username);
		return "redirect:/main";
	}

	@RequestMapping("mypage")
	public String viewMypage() {
		return "/member/mypage";
	}
		
	@RequestMapping("help")
	public String viewHelp() {
		return "/member/help";
	}
	
	@RequestMapping("help.id")
	public String viewHelpId() {
		return "/member/help_id";
	}
	
	@ResponseBody
	@RequestMapping(value="searchid", method = RequestMethod.POST)
	public MemberVo searchId(MemberVo vo) {
		System.out.println("아이디 서칭");
		
		return ms.getUserId(vo);
	}
	
	@RequestMapping("help.pw")
	public String viewHelpPw() {
		return "/member/help_pw";
	}
	
	@ResponseBody
	@RequestMapping(value="searchpw", method = RequestMethod.POST)
	public boolean searchPw(@RequestParam String id) {
		System.out.println(id);
		return ms.sendEmailToCreateNewPassword(id);
	}

	@ResponseBody
	@RequestMapping("modifyform")
	public boolean viewModifyForm(@RequestParam String pw, HttpServletRequest request) {
		return ms.checkPw(pw, request);
	}

	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String join(@Valid MemberVo memberVo, BindingResult result) {
		if (result.hasErrors()) {
			return "/member/join";			
		}
		ms.join(memberVo);
		return "redirect:loginform";
	}

}
