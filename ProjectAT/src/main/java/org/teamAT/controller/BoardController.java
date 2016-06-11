package org.teamAT.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.teamAT.service.BoardService;
import org.teamAT.vo.BoardVo;
import org.teamAT.vo.CommentVo;

@Controller
@RequestMapping("/board/")
public class BoardController {
	
	@Autowired
	BoardService service;
	
	@RequestMapping(value="*/list", method = RequestMethod.GET)
	public String getList(HttpServletRequest request){
		service.getList(request, getBoardName(request));
		request.setAttribute("boardname", getBoardName(request));
		return "/board/"+getBoardName(request)+"/list";
	}
	@RequestMapping(value="*/read", method = RequestMethod.GET)
	public String getContent(HttpServletRequest request){
		service.getContent(request,getBoardName(request));
		request.setAttribute("boardname", getBoardName(request));
		return "/board/"+getBoardName(request)+"/read";
	}
	
	@RequestMapping(value="*/write", method = RequestMethod.GET)
	public String write(HttpServletRequest request){
		request.setAttribute("boardname", getBoardName(request));
		return "/board/"+getBoardName(request)+"/write";
	}
	
	@ResponseBody
	@RequestMapping(value="*/insert", method=RequestMethod.POST)
	public int insert(BoardVo board, HttpServletRequest request){
		System.out.println(board.getUserid());
		service.insert(board,getBoardName(request));
		return service.getCurrentContent(board,getBoardName(request)).getNum();
	}
	
	@RequestMapping(value="*/modify", method = RequestMethod.GET)
	public String modify(HttpServletRequest request){
		request.setAttribute("boardname", getBoardName(request));
		service.getContent(request,getBoardName(request));
		return "/board/"+getBoardName(request)+"/update";
	}
	
	@ResponseBody
	@RequestMapping(value="*/update", method=RequestMethod.POST)
	public boolean update(BoardVo board, HttpServletRequest request){
		return service.update(board,getBoardName(request));
	}
	
	@ResponseBody
	@RequestMapping(value="*/delete", method=RequestMethod.POST)
	public boolean delete(BoardVo board, HttpServletRequest request){
		return service.delete(board,getBoardName(request));
	}
	
	
	@RequestMapping(value="*/comment", method = RequestMethod.POST)
	public String commentInsert(CommentVo comment, HttpServletRequest request){
		String boardname = getBoardName(request);
		service.commentInsert(comment, boardname);
		return "redirect:/board/"+getBoardName(request)+"/read?num="+comment.getBoardnum();
	}
	@RequestMapping(value="*/present", method = RequestMethod.GET)
	public String present(HttpServletRequest request){
		return "/board/notice/present";
	}
	
	@RequestMapping(value="calendar", method = RequestMethod.GET)
	public String calendar(HttpServletRequest request){
		return "/calendar/calendar";
	}
	
	public String getBoardName(HttpServletRequest request){
		String[] temp = request.getRequestURI().split("/");
		return temp[3];
	}
	
}
