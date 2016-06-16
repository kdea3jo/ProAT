package org.teamAT.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.teamAT.vo.SubjectVo;

public interface SubjectDao {
	
	public int setSubject(SubjectVo vo);
	public List<SubjectVo> getSubjectList(int state);
	public int getApplicantMember(String id);
	public int applySubject(@Param("num") int num,@Param("id") String id);
	public SubjectVo getMyApplySubject(String id);
	public SubjectVo getSubject(int num);
	public int getApplicantCount(int num);
	public int removeSubject(int num);
	public void updateSubject(SubjectVo vo);
}
