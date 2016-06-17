package org.teamAT.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.teamAT.vo.BepresentVo_Android;
import org.teamAT.vo.JobinfoVo_Android;
import org.teamAT.vo.MemberVo_Android;

public interface AndroidDao {

	public MemberVo_Android androidLogin(MemberVo_Android vo);
	public BepresentVo_Android androidCheckToday(BepresentVo_Android vo);
	public boolean androidCheckTimeUpdate(BepresentVo_Android vo);
	
	public List<JobinfoVo_Android> androidGetJobList();
	
	public int androidGetBepresentIn(@Param("userid") String userid, @Param("today") String today);
	public int androidGetBepresentOut(@Param("userid") String userid, @Param("today") String today);

}
