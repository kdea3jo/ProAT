package org.teamAT.dao;

import java.util.List;

import org.teamAT.vo.SubjectVo;

public interface SubjectDao {
	
	public int setSubject(SubjectVo vo);
	public List<SubjectVo> getSubjectList(int state);
}
