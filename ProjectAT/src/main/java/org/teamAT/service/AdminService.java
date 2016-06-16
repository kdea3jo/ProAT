package org.teamAT.service;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.teamAT.dao.MemberDao;
import org.teamAT.dao.StudentDao;
import org.teamAT.vo.MemberVo;

@Service
public class AdminService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<MemberVo> getStudentList(){
		StudentDao dao=sqlSessionTemplate.getMapper(StudentDao.class);
		List<MemberVo> list=dao.getStudentList();
		return list;
	}
	
	public List<MemberVo> getApplicantList(){
		StudentDao dao=sqlSessionTemplate.getMapper(StudentDao.class);
		List<MemberVo> list=dao.getApplicantList();
		return list;
	}
	
	public boolean setStudent(String id){
		StudentDao dao=sqlSessionTemplate.getMapper(StudentDao.class);
		int result=dao.setStudent(id);
		if(result>=1){
			result=dao.removeApplicant(id);
		}
		return result >=1 ? true : false;
	}
	
	public boolean removeApplicant(String id){
		StudentDao dao=sqlSessionTemplate.getMapper(StudentDao.class);
		int result=dao.removeApplicant(id);
		return result >=1 ? true : false;
	}

	public boolean removeStudent(String id) {
		StudentDao dao=sqlSessionTemplate.getMapper(StudentDao.class);
		int result=dao.removeStudent(id);
		System.out.println(result);
		return result>=1 ? true:false; 
	}

	@Autowired
	private AttendanceServiece as;
	public void getUserDetails(String id, HttpServletRequest request) {
		MemberDao dao=sqlSessionTemplate.getMapper(MemberDao.class);
		as.getSubjectInfo(id, request);
		as.getAttendList(id, request);
		request.setAttribute("memberVo", dao.getMember(id));	
	}
}
