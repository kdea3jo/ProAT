package org.teamAT.dao;

import org.teamAT.vo.BepresentVo_Android;
import org.teamAT.vo.MemberVo_Android;

public interface AndroidDao {

	public MemberVo_Android androidLogin(MemberVo_Android vo);
	public BepresentVo_Android androidCheckToday(BepresentVo_Android vo);
	public boolean androidCheckTimeUpdate(BepresentVo_Android vo);

}
