package org.teamAT.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.teamAT.vo.AttendanceVo;

@Repository
public interface AttendanceDao {
	public List<AttendanceVo> getAttendList(@Param("userid") String userid);
}
