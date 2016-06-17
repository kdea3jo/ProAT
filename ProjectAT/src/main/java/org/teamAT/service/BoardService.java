package org.teamAT.service;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.teamAT.dao.BoardDao;
import org.teamAT.vo.BoardVo;
import org.teamAT.vo.CommentVo;
import org.teamAT.vo.PageVo;
import org.teamAT.vo.SearchVo;

@Service
public class BoardService {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void getList(HttpServletRequest request, String boardname) {
			BoardDao dao=sqlSessionTemplate.getMapper(BoardDao.class);
			String sPage = request.getParameter("pg");
			int page=0;
			if(sPage==null || sPage.equals("")) page=1;
			else page = Integer.parseInt(sPage);
			
			SearchVo search = new SearchVo();
			search.setType(request.getParameter("type"));
			search.setKeyword(request.getParameter("keyword"));
			
			int rowsPerScreen = 10;
			int linksPerScreen = 5;
			
			List<BoardVo> list = dao.getList(page,boardname, search);
			PageVo pagination = new PageVo();
			int totalpage=0;
			if(list.size()!=0){
				totalpage = list.get(0).getTotalpage();
		    }
			int linkGroup = (page-1)/linksPerScreen+1;
			int linkEnd = linkGroup*linksPerScreen;
			int linkBegin = linkEnd-linksPerScreen+1;
			if(linkEnd>totalpage)linkEnd= totalpage;
			
			pagination.setTotalPages(totalpage);
			pagination.setCurrPage(page);
			pagination.setLeftMore(linkGroup!=1? true:false);
			pagination.setRightMore(linkEnd<totalpage? true:false);
			pagination.setLinkBegin(linkBegin);
			pagination.setLinkEnd(linkEnd);
			request.setAttribute("pageNation", pagination);
			request.setAttribute("boardList", dao.getList(page, boardname, search));
			request.setAttribute("search", search);
			
	}

	public void getContent(HttpServletRequest request, String boardName, Principal principal) {
		BoardDao dao=sqlSessionTemplate.getMapper(BoardDao.class);
		int num = Integer.parseInt(request.getParameter("num"));
		BoardVo content = dao.getContent(num, boardName);
		dao.updateHit(content.getHit()+1,num,boardName);
		content.setHit(content.getHit()+1);
		request.setAttribute("content", content);
		request.setAttribute("isId", principal.getName());
		if(content.getUserid().equals(principal.getName())){
			request.setAttribute("isWriter", "yes");
		}else{
			request.setAttribute("isWriter", "no");
		}
		
		String sPage = request.getParameter("pg");
		int page=0;
		if(sPage==null || sPage.equals("")) page=1;
		else page = Integer.parseInt(sPage);
		
		
		int rowsPerScreen = 10;
		int linksPerScreen = 5;
		
		List<CommentVo> list = dao.commentList(num,boardName,page);
		
		PageVo pagination = new PageVo();
		int totalpage=0;
		if(list.size()!=0){
			totalpage = list.get(0).getTotalpage();
	    }
		int linkGroup = (page-1)/linksPerScreen+1;
		int linkEnd = linkGroup*linksPerScreen;
		int linkBegin = linkEnd-linksPerScreen+1;
		if(linkEnd>totalpage)linkEnd= totalpage;
		
		pagination.setTotalPages(totalpage);
		pagination.setCurrPage(page);
		pagination.setLeftMore(linkGroup!=1? true:false);
		pagination.setRightMore(linkEnd<totalpage? true:false);
		pagination.setLinkBegin(linkBegin);
		pagination.setLinkEnd(linkEnd);
		request.setAttribute("commentList", list);
		request.setAttribute("commentPage", pagination);
	}
	
	public void insert(BoardVo board, String boardName) {
		BoardDao dao=sqlSessionTemplate.getMapper(BoardDao.class);
		dao.insert(board, boardName);
	}

	public BoardVo getCurrentContent(BoardVo board, String boardName) {
		BoardDao dao=sqlSessionTemplate.getMapper(BoardDao.class);
		dao.getCurrentContent(board.getUserid(), boardName);
		return dao.getCurrentContent(board.getUserid(), boardName);
	}

	public boolean update(BoardVo board, String boardName) {
		BoardDao dao=sqlSessionTemplate.getMapper(BoardDao.class);
		return dao.update(board, boardName);
	}

	public boolean delete(BoardVo board, String boardName) {
		BoardDao dao=sqlSessionTemplate.getMapper(BoardDao.class);
		return dao.delete(board.getNum(), boardName);
	}
	
	public void search(HttpServletRequest request, String boardname) {
		BoardDao dao=sqlSessionTemplate.getMapper(BoardDao.class);
		String sPage = request.getParameter("pg");
		int page=0;
		if(sPage==null || sPage.equals("")) page=1;
		else page = Integer.parseInt(sPage);
		
		SearchVo search = new SearchVo();
		search.setType((String)request.getParameter("type"));
		search.setKeyword((String)request.getParameter("keyword"));
		
		String type = search.getType();
		if(type.equals("제목")){
			search.setType("title");
		}else if(type.equals("내용")){
			search.setType("conetne");
		}else if(type.equals("글번호")){
			search.setType("num");
		}else if(type.equals("글쓴이")){
			search.setType("userid");
		}
		
		int rowsPerScreen = 10;
		int linksPerScreen = 5;
		
		List<BoardVo> list = dao.search(page,search, boardname);
		
		PageVo pagination = new PageVo();
		int totalpage = list.get(0).getTotalpage();
		int linkGroup = (page-1)/linksPerScreen+1;
		int linkEnd = linkGroup*linksPerScreen;
		int linkBegin = linkEnd-linksPerScreen+1;
		if(linkEnd>totalpage)linkEnd= totalpage;
		
		pagination.setTotalPages(totalpage);
		pagination.setCurrPage(page);
		pagination.setLeftMore(linkGroup!=1? true:false);
		pagination.setRightMore(linkEnd<totalpage? true:false);
		pagination.setLinkBegin(linkBegin);
		pagination.setLinkEnd(linkEnd);
		
		request.setAttribute("pageNation", pagination);
		request.setAttribute("boardList", list);
	}

	public boolean commentInsert(CommentVo comment, String boardname) {
		BoardDao dao=sqlSessionTemplate.getMapper(BoardDao.class);
		return dao.commentInsert(comment, boardname);		
	}

	public boolean commdelete(int num, String boardname) {
		BoardDao dao=sqlSessionTemplate.getMapper(BoardDao.class);
		return dao.commdelete(num, boardname);
	}
	

}
