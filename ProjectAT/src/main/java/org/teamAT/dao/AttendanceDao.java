package org.teamAT.dao;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.teamAT.vo.AttendanceVo;
import org.teamAT.vo.MemberVo;
import org.teamAT.vo.SubjectVo;

@Repository
public interface AttendanceDao {
	public List<AttendanceVo> getAttendList(@Param("userid") String userid);

	public void insert_bepresent(@Param("userid") String userid);
	public List<MemberVo> getStudentList();

	public SubjectVo getSubjectInfo(@Param("userid") String userid);

	public AttendanceVo getSelectDayInfo(@Param("date")Date date, @Param("userid") String userid);

	public int setAtdException(@Param("date")Date date, @Param("userid") String userid);
}
