package org.teamAT.service;

import java.util.List;

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
		int result=dao.setJobInfo(vo);
	}
	public List<JobInfoVo> getJobList(){
		JobDao dao=sqlSessionTemplate.getMapper(JobDao.class);
		List<JobInfoVo> list=dao.getJobList();
		return list;
	}
	public JobInfoVo getJobInfo(int num) {
		JobDao dao=sqlSessionTemplate.getMapper(JobDao.class);
		JobInfoVo vo=dao.getJobInfo(num);
		
		/*게시판 줄바꿈 처리를 위한 문자열 교체작업*/
		String changeStr=vo.getContents().replaceAll("\n", "<br>");
		vo.setContents(changeStr);
		
		return vo;
	}
}
