package org.teamAT.service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
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
		System.out.println(result);
		if(result>=1) return 0;
		result=dao.applySubject(num,id);
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
		
		/*게시판 줄바꿈 처리를 위한 문자열 교체작업*/
		String changeStr=null;
		if(uri.contains("modifyform")){
			changeStr=vo.getContents().replaceAll("<br>", "\n");
		}else if(uri.contains("read")){
			changeStr=vo.getContents().replaceAll("\n", "<br>");
			int count=dao.getApplicantCount(num);
			request.setAttribute("count",count);
		}
		vo.setContents(changeStr);
			
		vo.setStarttime(stringToTimeType(vo.getStarttime()));
		vo.setEndtime(stringToTimeType(vo.getEndtime()));
				
		request.setAttribute("subjectVo",vo);
	}

	public void deleteSubject(int num) {
		StudentDao studentDao=sqlSessionTemplate.getMapper(StudentDao.class);
		studentDao.removeAllStudent(num);
		SubjectDao subjectDao=sqlSessionTemplate.getMapper(SubjectDao.class);	
		subjectDao.removeSubject(num);
	}
	
	public String stringToTimeType(String str){
		StringBuffer sb=new StringBuffer(str);
		if(str.length()==4){
			sb.insert(2, ":");
		}else{
			sb.insert(0, "0");
			sb.insert(2, ":");
		}
		return sb.toString();
	}

	public void modifySubject(SubjectVo vo) {
		SubjectDao dao=sqlSessionTemplate.getMapper(SubjectDao.class);
		dao.updateSubject(vo);
	}
}
