package org.teamAT.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.teamAT.service.AndroidService;
import org.teamAT.vo.MemberVo_Android;

@Controller
@RequestMapping("/android/")
@JsonIgnoreProperties(ignoreUnknown = true)
public class AndroidController {

	@Autowired
	private AndroidService as;
	
	@InitBinder /*form에서 date 타입을 맵핑할 때 필요한 메서드*/
    protected void initBinder(WebDataBinder binder){
        DateFormat  dateFormat = new SimpleDateFormat("yy-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat,true));
    }
	
	@RequestMapping(value="login", method = RequestMethod.GET)
	public String getList(HttpServletRequest request){
		MemberVo_Android vo = new MemberVo_Android();
		String aid = request.getParameter("id");
		String apw = request.getParameter("pw");
		vo.setUserid(aid);
		vo.setUserpw(apw);
		
		request.setAttribute("dataForAndroid", as.androidLogin(vo));
		return "/android/android_result";
	}
	
	

}