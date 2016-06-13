package org.teamAT.service;

import java.sql.Date;

import org.json.simple.JSONObject;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.teamAT.dao.AndroidDao;
import org.teamAT.vo.BepresentVo_Android;
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
	
}
