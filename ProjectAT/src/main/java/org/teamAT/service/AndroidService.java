package org.teamAT.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.teamAT.dao.AndroidDao;
import org.teamAT.dao.MemberDao;
import org.teamAT.vo.MemberVo;
import org.teamAT.vo.MemberVo_Android;

public class AndroidService{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	@Autowired
    private BCryptPasswordEncoder passwordEncoder;
	
	public String androidLogin(MemberVo_Android vo){
		boolean check = true;
		
		AndroidDao dao = sqlSessionTemplate.getMapper(AndroidDao.class);
		MemberVo_Android checkVo = dao.androidLogin(vo);
		
		if(checkVo == null)
			check = false;		
		if(!passwordEncoder.matches(vo.getPw(), checkVo.getPw()))
            check = false;          		
		
		JSONObject res = new JSONObject();
		res.put("res", check);		
		
		return res.toJSONString();
	}
	
	
	public MemberVo loadUserByUsername(String id) {
		MemberDao dao=sqlSessionTemplate.getMapper(MemberDao.class);
		MemberVo vo=dao.getMember(id);
        if(vo==null){
            throw new UsernameNotFoundException("존재하지 않는 아이디입니다.");
        }
        return vo;
	}
	
	public String getUserName(String id){
		MemberDao dao=sqlSessionTemplate.getMapper(MemberDao.class);
		return dao.getUserName(id);
	}
	
	public boolean checkPw(String pw, HttpServletRequest request){
		MemberDao dao=sqlSessionTemplate.getMapper(MemberDao.class);
		String getPw=dao.getPassword((String)request.getSession().getAttribute("id"));
		if(passwordEncoder.matches(pw, getPw)){
            return true;
        }   
		return false;
	}
	
}