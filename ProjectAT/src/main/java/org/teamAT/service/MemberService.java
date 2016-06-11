package org.teamAT.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.teamAT.dao.MemberDao;
import org.teamAT.vo.MemberVo;

public class MemberService{

	@Autowired
	protected JavaMailSender mailSender;
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	@Autowired
    private BCryptPasswordEncoder passwordEncoder;
	
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
	
	public void join(MemberVo vo) {
		MemberDao dao=sqlSessionTemplate.getMapper(MemberDao.class);
		System.out.println(vo.getUserpw());
		vo.setUserpw(passwordEncoder.encode(vo.getUserpw()));
		vo.setGrade("member");
		System.out.println("여기까진..");
		dao.setMember(vo);
	}
	
	public boolean checkPw(String pw, HttpServletRequest request){
		MemberDao dao=sqlSessionTemplate.getMapper(MemberDao.class);
		String getPw=dao.getPassword((String)request.getSession().getAttribute("id"));
		if(passwordEncoder.matches(pw, getPw)){
            return true;
        }   
		return false;
	}
	
	public MemberVo getUserId(MemberVo vo) {
		MemberDao dao=sqlSessionTemplate.getMapper(MemberDao.class);	
		vo.setUserid(dao.getUserId(vo));
		return vo;
	}
	
	public boolean sendEmailToCreateNewPassword(String email) {
		MemberDao dao=sqlSessionTemplate.getMapper(MemberDao.class);	
		
		String pw=createRandomPassword();
		int result=dao.resetPassword(email,passwordEncoder.encode(pw));
		if(result<1) return false;
		
		MimeMessage msg=mailSender.createMimeMessage();		
		try {
			msg.setFrom("admin@projectat.co.kr");
			msg.setSubject("[AT출결관리시스템]임시 비밀번호 입니다.");
			msg.setText("임시 비밀번호는 ["+pw+"]입니다.\n"
					+ "로그인 페이지로 이동>>> http://192.168.8.30:8000/ProjectAT/member/loginform");
            msg.setRecipient(RecipientType.TO , new InternetAddress(email));
            mailSender.send(msg);
            return true;
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public String createRandomPassword(){
		Random rnd =new Random();
		StringBuffer buf =new StringBuffer();
		 
		for(int i=0;i<20;i++){
		    if(rnd.nextBoolean()){
		        buf.append((char)((int)(rnd.nextInt(26))+97));
		    }else{
		        buf.append((rnd.nextInt(10))); 
		    }
		}
		return buf.toString();
	}
}
