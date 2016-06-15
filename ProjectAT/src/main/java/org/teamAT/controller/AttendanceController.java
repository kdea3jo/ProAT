package org.teamAT.controller;


import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.teamAT.service.AttendanceServiece;

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
}
