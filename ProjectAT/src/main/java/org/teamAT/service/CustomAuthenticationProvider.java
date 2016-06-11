package org.teamAT.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;
import org.teamAT.vo.MemberVo;

@Component
public class CustomAuthenticationProvider implements AuthenticationProvider{
    
    @Autowired
    private MemberService ms;
    
    @Autowired
    private BCryptPasswordEncoder passwordEncoder;
	
	public boolean supports(Class<?> authentication) {
        return true;
    }
	
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		String id=(String)authentication.getPrincipal();
        String pw=(String)authentication.getCredentials();
        
        MemberVo vo=ms.loadUserByUsername(id);
        SimpleGrantedAuthority auth=new SimpleGrantedAuthority(vo.getGrade());
        List<GrantedAuthority> list=new ArrayList();
        list.add(auth);
        
        if(!passwordEncoder.matches(pw, vo.getUserpw())){
            throw new BadCredentialsException("패스워드가 일치하지 않습니다.");
        }
        return new UsernamePasswordAuthenticationToken(vo.getUserid(), null, list);
	}
}

