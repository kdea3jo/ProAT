package org.teamAT.dao;

import java.util.List;
import org.teamAT.vo.MemberVo;

public interface StudentDao {
	public List<MemberVo> getStudentList();
	public List<MemberVo> getApplicantList();
	public int setStudent(String id);
	public int removeApplicant(String id);
	public int removeAllStudent(int num);
	public int removeStudent(String id);
}
