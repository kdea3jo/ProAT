package org.teamAT.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.teamAT.dao.StudentDao;
import org.teamAT.vo.MemberVo;

@Service
public class AdminService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<MemberVo> getStudentList(){
		StudentDao dao=sqlSessionTemplate.getMapper(StudentDao.class);
		List<MemberVo> list=dao.getStudentList();
		return list;
	}
	
	public List<MemberVo> getApplicantList(){
		StudentDao dao=sqlSessionTemplate.getMapper(StudentDao.class);
		List<MemberVo> list=dao.getApplicantList();
		return list;
	}
	
	public List<MemberVo> setStudent(String id){
		StudentDao dao=sqlSessionTemplate.getMapper(StudentDao.class);
		dao.setStudent(id);
		dao.removeApplicant(id);
		return null;
	}
}
