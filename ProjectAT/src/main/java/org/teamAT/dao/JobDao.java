package org.teamAT.dao;

import java.util.List;

import org.teamAT.vo.JobInfoVo;

public interface JobDao {

	public int setJobInfo(JobInfoVo vo);
	public List<JobInfoVo> getJobList();
}
