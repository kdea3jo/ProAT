package org.teamAT.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.teamAT.dao.JobDao;
import org.teamAT.vo.JobInfoVo;

@Service
public class JobService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public void writeJobInfo(JobInfoVo vo) {
		JobDao dao=sqlSessionTemplate.getMapper(JobDao.class);
		int result=dao.setJobiInfo(vo);
		
	}

}
