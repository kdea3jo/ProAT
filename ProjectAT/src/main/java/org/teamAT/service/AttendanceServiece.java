package org.teamAT.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.teamAT.dao.AttendanceDao;
import org.teamAT.vo.AttendanceVo;

@Service
public class AttendanceServiece {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void getAttendList(String userid, HttpServletRequest request) {
		AttendanceDao dao = sqlSessionTemplate.getMapper(AttendanceDao.class);
		List<AttendanceVo> list = dao.getAttendList(userid);
		request.setAttribute("attList", list);
	}

}
