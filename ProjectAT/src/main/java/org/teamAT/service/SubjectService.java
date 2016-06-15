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
	
	public int applySubject(int num, String id){
		/*
			1=현재 수간신청 중인 강좌가 존재함
			2=수강 신청 가능
			3=insert 과정에서 exception 발생
		*/
		SubjectDao dao=sqlSessionTemplate.getMapper(SubjectDao.class);	
		int result=dao.getApplicantMember(id);
		if(result>=1) return 1;
		
		result=dao.applySubject(num,id);
		System.out.println(result);
		System.out.println(result >= 1 ? 2:3);
		return result >= 1 ? 2:3 ;
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
		studentDao.removeStudent(num);
		SubjectDao subjectDao=sqlSessionTemplate.getMapper(SubjectDao.class);	
		subjectDao.removeSubject(num);
	}
}
