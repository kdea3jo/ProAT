package org.teamAT.controller;

import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.teamAT.service.AndroidService;
import org.teamAT.vo.BepresentVo_Android;
import org.teamAT.vo.MemberVo_Android;

@Controller
@RequestMapping("/android/")
@JsonIgnoreProperties(ignoreUnknown = true)
public class AndroidController {

	@Autowired
	private AndroidService as;
		
	@RequestMapping(value="login", method = RequestMethod.GET)
	public String getLogin(HttpServletRequest request){
		MemberVo_Android vo = new MemberVo_Android();
		String aid = request.getParameter("id");
		String apw = request.getParameter("pw");
		vo.setUserid(aid);
		vo.setUserpw(apw);
		
		request.setAttribute("dataForAndroid", as.androidLogin(vo));
		return "/android/android_result";
	}
	
	@RequestMapping(value="bepresent", method = RequestMethod.GET)
	public String getBepresent(HttpServletRequest request){
		
		String aid = request.getParameter("userid");
		String checkType = request.getParameter("checkType");
		String checkTime = request.getParameter("checkTime");
		String today = request.getParameter("today");
		
		BepresentVo_Android vo = new BepresentVo_Android();
		vo.setUserid(aid);
		vo.setCheckType(checkType);
		vo.setCheckTime(Integer.parseInt(checkTime));
		vo.setToday(today);
		
		request.setAttribute("dataForAndroid", as.androidCheckBepresnet(vo));
		return "/android/android_result";
	}
	
	@RequestMapping(value="totalBepresent", method = RequestMethod.GET)	
	public String getBepresentList(HttpServletRequest request){
	
		String aid = request.getParameter("userid");
		String today = request.getParameter("today");
		
		request.setAttribute("dataForAndroid", as.androidGetBepresentList(aid, today));
		return "/android/android_result";
	}
	
	@RequestMapping(value="jobList", method = RequestMethod.GET)	
	public String getJobList(HttpServletRequest request){
		request.setAttribute("dataForAndroid", as.androidGetJobList());
		return "/android/android_result";
	}
	

}
