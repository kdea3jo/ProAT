package org.teamAT.service;

import java.text.SimpleDateFormat;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.teamAT.dao.AndroidDao;
import org.teamAT.dao.AttendanceDao;
import org.teamAT.vo.AttendanceVo;
import org.teamAT.vo.BepresentVo_Android;
import org.teamAT.vo.JobinfoVo_Android;
import org.teamAT.vo.MemberVo_Android;

@Service
public class AndroidService{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	@Autowired
    private BCryptPasswordEncoder passwordEncoder;
	
	public String androidLogin(MemberVo_Android vo){
		JSONObject res = new JSONObject();
		boolean check = true;
		
		AndroidDao dao = sqlSessionTemplate.getMapper(AndroidDao.class);
		MemberVo_Android checkVo = dao.androidLogin(vo);
		
		System.out.println(vo.getUserid());
		System.out.println(vo.getUserpw());
		
		if(checkVo == null)
			check = false;
		else if(!passwordEncoder.matches(vo.getUserpw(), checkVo.getUserpw()))
            check = false;
		
		res.put("res", check);
		return res.toJSONString();
	}
	
	public String androidCheckBepresnet(BepresentVo_Android vo){
		JSONObject res = new JSONObject();
		System.out.println(vo.getUserid());
		System.out.println(vo.getCheckTime());
		System.out.println(vo.getCheckType());
		System.out.println(vo.getToday());		
		
		AndroidDao dao = sqlSessionTemplate.getMapper(AndroidDao.class);
		BepresentVo_Android checkVo = dao.androidCheckToday(vo);
		
		if(checkVo == null)
			return res.toJSONString();		
		
		if(checkVo.getCheckTime() == -1 && !dao.androidCheckTimeUpdate(vo))			
			System.err.println("checkTime udpate Error");		
		
		checkVo = dao.androidCheckToday(vo);
		res.put("today", vo.getToday());
		res.put("checkType", vo.getCheckType());
		res.put("checkTime", checkVo.getCheckTime());
		
		return res.toJSONString();
	}
	
	public String androidGetBepresentList(String userid, String today){
		JSONObject res = new JSONObject();		
		
		AndroidDao adao = sqlSessionTemplate.getMapper(AndroidDao.class);	
		res.put("userin", adao.androidGetBepresentIn(userid, today));
		res.put("userout", adao.androidGetBepresentOut(userid, today));
		
		AttendanceDao dao = sqlSessionTemplate.getMapper(AttendanceDao.class);		
		List<AttendanceVo> list = dao.getAttendList(userid);
		int attendDate=0;
		int absenceDate=0;
		int zo=0;
		for(int i=0; i<list.size(); i++){
			String statue = list.get(i).getStatue();
			System.out.println(statue);
			
			if(statue.equals("출석") || statue.equals("공결")){
				attendDate++;
			}
			
			if(statue.equals("결석")){
				absenceDate++;
			}
			
			if(statue.equals("조퇴")||statue.equals("지각")){
				attendDate++;
				zo++;
			}
		}
		zo=zo/3;
		
		
		SimpleDateFormat jsonFormat = new SimpleDateFormat("yyyyMMdd");
		
		res.put("endDate", jsonFormat.format(dao.getSubjectInfo(userid).getEnddate()));
		res.put("totalDays", dao.getSubjectInfo(userid).getTotalDate());
		res.put("attendDays", attendDate-zo);
		res.put("absenceDays", absenceDate+zo);	
		
		return res.toJSONString();
	}
	
	public String androidGetJobList(){
		AndroidDao dao = sqlSessionTemplate.getMapper(AndroidDao.class);
		
		List<JobinfoVo_Android> jList = dao.androidGetJobList();
		
		JSONArray jArray = new JSONArray();
		for(int i=0; i<jList.size() ; i++){
			JobinfoVo_Android jv = jList.get(i);
			JSONObject jObj = new JSONObject();
			jObj.put("company", jv.getCompany());
			jObj.put("wdate", jv.getWdate());
			jObj.put("hirecount", jv.getHirecount());
			jObj.put("title", jv.getTitle());
			jObj.put("contents", jv.getContents());
			jObj.put("period", jv.getPeriod());
			jArray.add(jObj);
		}
		
		return jArray.toJSONString();
	}
	
}
