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
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
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

	@RequestMapping("check_pw")
	public String viewCheckPassword(){
		return "/member/check_pw";
	}
	
	@RequestMapping("mypage")
	public String viewMypage(){
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
		return ms.getUserId(vo);
	}
	
	@RequestMapping("help.pw")
	public String viewHelpPw() {
		return "/member/help_pw";
	}
	
	@ResponseBody
	@RequestMapping(value="searchpw", method = RequestMethod.POST)
	public boolean searchPw(@RequestParam String id) {
		return ms.sendEmailToCreateNewPassword(id);
	}

	@ResponseBody
	@RequestMapping(value="checkpw", method = RequestMethod.POST)
	public boolean viewCheckPw(@RequestParam String pw, Principal principal, HttpServletRequest request) {
		if(ms.checkPw(pw,principal.getName())){
			request.getSession().setAttribute("passwordcheck", true);
			return true;
		}
		return false;
	}
	
	@RequestMapping("modifyform")
	public String viewModifyForm(Principal principal,HttpServletRequest request,Model model) {
		/*	주소창 url을 입력하여 직접 접근하는 것을 막기 위해 password 인증에 성공했을시 session 생성 */
		if(request.getSession().getAttribute("passwordcheck")==null) return "redirect:check_pw";
		request.getSession().removeAttribute("passwordcheck");
		MemberVo vo=ms.loadUserByUsername(principal.getName());
		model.addAttribute(vo);
		return "/member/modify";
	}
	
	@RequestMapping(value = "modify", method = RequestMethod.POST)
	public String modify(@Valid MemberVo memberVo, BindingResult result) {
		if (result.hasErrors()) {
			return "/member/modify";			
		}
		ms.modify(memberVo);
		return "redirect:/main";
	}
	
	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String join(@Valid MemberVo memberVo, BindingResult result) {
		if (result.hasErrors()) {
			return "/member/join";			
		}
		ms.join(memberVo);
		return "redirect:loginform";
	}
	
	@ResponseBody
	@RequestMapping(value = "leavemember", method = RequestMethod.POST)
	public int leaveMember(Principal principal) {
		return ms.leaveMember(principal.getName());
	}
}
