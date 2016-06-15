package org.teamAT.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.teamAT.service.MainService;

@Controller
public class MainController {
	@Autowired
	MainService service;
	
	@RequestMapping(value="main")
	public String getBoardList(HttpServletRequest request){
		service.getBoardList(request);
		return "main";
	}
	
}
