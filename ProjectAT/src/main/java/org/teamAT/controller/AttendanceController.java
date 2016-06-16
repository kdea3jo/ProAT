package org.teamAT.controller;


import java.security.Principal;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.teamAT.service.AttendanceServiece;
import org.teamAT.vo.AttendanceVo;

@Controller
@RequestMapping("/attendance/")
public class AttendanceController {
	
	@Autowired
	AttendanceServiece service;
	
	@RequestMapping(value="list")
	public String getlist(Principal principal, HttpServletRequest request){
		service.getSubjectInfo(principal.getName(), request);
		service.getAttendList(principal.getName(), request);
		return "/attendance/list";
	}
	
	@ResponseBody
	@RequestMapping(value="selectDay", method=RequestMethod.POST)
	public AttendanceVo getSelectDayInfo(Date date, Principal principal){
		return service.getSelectDayInfo(date,principal.getName());
	}

}
