package org.teamAT.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.teamAT.dao.AttendanceDao;
import org.teamAT.vo.AttendanceVo;
import org.teamAT.vo.MemberVo;
import org.teamAT.vo.SubjectVo;

@Service
public class AttendanceServiece {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public SubjectVo getSubjectInfo(String userid, HttpServletRequest request) {
		AttendanceDao dao = sqlSessionTemplate.getMapper(AttendanceDao.class);
		SubjectVo sub = dao.getSubjectInfo(userid);
		request.setAttribute("subjectInfo", sub);
		return sub;
	}
	public void getAttendList(String userid, HttpServletRequest request) {
		AttendanceDao dao = sqlSessionTemplate.getMapper(AttendanceDao.class);
		List<AttendanceVo> list = dao.getAttendList(userid);
		int attendDate=0;
		int absenceDate=0;
		int zo=0;
		for(int i=0; i<list.size(); i++){
			if(list.get(i).getStatue().equals("출석")){
				attendDate++;
			}if(list.get(i).getStatue().equals("결석")){
				absenceDate++;
			}if(list.get(i).getStatue().equals("조퇴")||list.get(i).getStatue().equals("지각")){
				zo++;
			}
		}
		zo=zo/3;
		
		request.setAttribute("attendDate", attendDate);
		request.setAttribute("absenceDate", absenceDate+zo);
		
		request.setAttribute("attList", list);
	}
	
	@org.springframework.scheduling.annotation.Scheduled(cron = "0 0 0 * * MON-FRI") // 0 0 9-17 * * MON-FRI : 주중 9시부터 17시까지
    public void test(){
		AttendanceDao dao = sqlSessionTemplate.getMapper(AttendanceDao.class);
		List<MemberVo> student = dao.getStudentList();
		for(int i=0; i<student.size(); i++ ){
			dao.insert_bepresent(student.get(i).getUserid());
		}
    }

	

}
