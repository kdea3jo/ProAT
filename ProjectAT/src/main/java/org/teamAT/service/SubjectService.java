package org.teamAT.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.teamAT.dao.StudentDao;
import org.teamAT.dao.SubjectDao;
import org.teamAT.vo.SubjectVo;

@Service
public class SubjectService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void setSubject(SubjectVo vo){
		SubjectDao dao=sqlSessionTemplate.getMapper(SubjectDao.class);		
		vo.setStarttime(vo.getStarttime().replaceAll(":", ""));
		vo.setEndtime(vo.getEndtime().replaceAll(":", ""));
		dao.setSubject(vo);
	}
	
	public List<SubjectVo> getSubjectList(int state){
		SubjectDao dao=sqlSessionTemplate.getMapper(SubjectDao.class);		
		return dao.getSubjectList(state);	
	}
	
	public int applySubject(int num, String id, HttpServletRequest request){
		/*
			0=현재 수간신청 중인 강좌가 존재함
			1 이상 수강 신청 가능
		*/
		SubjectDao dao=sqlSessionTemplate.getMapper(SubjectDao.class);	
		int result=dao.getApplicantMember(id);
		if(result>=1) return 0;
		
		dao.applySubject(num,id);
		result=dao.getTotalApplicantCount();
		request.getServletContext().setAttribute("cnt", result);
		return result >= 1 ? result:0;
	}

	public SubjectVo getMyApplySubject(String id) {
		SubjectDao dao=sqlSessionTemplate.getMapper(SubjectDao.class);
		return dao.getMyApplySubject(id);
	}

	public void cancelSubject(String id) {
		StudentDao dao=sqlSessionTemplate.getMapper(StudentDao.class);
		dao.removeApplicant(id);
	}

	public void getSubject(int num, HttpServletRequest request) {
		SubjectDao dao=sqlSessionTemplate.getMapper(SubjectDao.class);	
		String uri=request.getRequestURI();
		SubjectVo vo=dao.getSubject(num);
		
		String changeStr=null;
		if(uri.contains("modifyform")){
			changeStr=vo.getContents().replaceAll("<br>", "\n");
		}else if(uri.contains("read")){
			changeStr=vo.getContents().replaceAll("\n", "<br>");
			int count=dao.getApplicantCount(num);
			request.setAttribute("count",count);
		}
		vo.setContents(changeStr);
		request.setAttribute("subjectVo",vo);
	}

	public void deleteSubject(int num) {
		StudentDao studentDao=sqlSessionTemplate.getMapper(StudentDao.class);
		studentDao.removeAllStudent(num);
		SubjectDao subjectDao=sqlSessionTemplate.getMapper(SubjectDao.class);	
		subjectDao.removeSubject(num);
	}

	public int getTotalApplicantCount() {
		SubjectDao dao=sqlSessionTemplate.getMapper(SubjectDao.class);	
		int cnt=dao.getTotalApplicantCount();
		return cnt;
	}
}
