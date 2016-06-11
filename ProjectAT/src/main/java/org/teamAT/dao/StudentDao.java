package org.teamAT.dao;

import java.util.List;
import org.teamAT.vo.MemberVo;

public interface StudentDao {
	public List<MemberVo> getStudentList();
	public List<MemberVo> getApplicantList();
	public void setStudent(String id);
	public void removeApplicant(String id);
}
