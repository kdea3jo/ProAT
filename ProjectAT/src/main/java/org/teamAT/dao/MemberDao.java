package org.teamAT.dao;

import org.apache.ibatis.annotations.Param;
import org.teamAT.vo.MemberVo;

public interface MemberDao {

	public MemberVo getMember(String id);
	public String getUserName(String id);
	public String getUserId(MemberVo vo);
	public int setMember(MemberVo vo);
	public String getPassword(String id);
	public int resetPassword(@Param("id") String id,@Param("pw") String pw);
	public int resetMember(MemberVo vo);
	public int backupRemoveMember(String id);
	public int removeMember(String id);
	public int checkUserId(String id);
}
