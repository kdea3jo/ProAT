package org.teamAT.service;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.teamAT.dao.BoardDao;
import org.teamAT.vo.SearchVo;

@Service
public class MainService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void getBoardList(HttpServletRequest request) {
		BoardDao dao = sqlSessionTemplate.getMapper(BoardDao.class);
		SearchVo search = new SearchVo();
		search.setType(request.getParameter("type"));
		search.setKeyword(request.getParameter("keyword"));
		request.setAttribute("noticeList", dao.getList(1, "notice", search)); 
		request.setAttribute("qnaList", dao.getList(1, "qna", search)); 
	}

}
