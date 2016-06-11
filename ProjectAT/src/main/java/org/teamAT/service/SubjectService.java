package org.teamAT.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
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
}
