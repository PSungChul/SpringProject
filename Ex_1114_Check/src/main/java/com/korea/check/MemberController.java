package com.korea.check;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.MemberDAO;
import vo.MemberVO;

@Controller
public class MemberController {
	
	MemberDAO member_dao;
	// CI
	public MemberController( MemberDAO member_dao ) {
		this.member_dao = member_dao;
	}
	
	@RequestMapping(value= {"/", "/login.do"})
	public String login_form() {
		return "/WEB-INF/views/loginpage.jsp";
	}
	
	@RequestMapping("/login_check.do")
	@ResponseBody
	public String login( MemberVO vo ) {
		
		String id = vo.getId();
		String pwd = vo.getPwd();
		
		// DAO에게 id를 요청
		vo = member_dao.loginCheck( id );
		
		if ( vo == null ) { // DB에 아이디가 존재하지 않는다.
			return "{'result':'no_id'}";
		}
		
		// 아이디는 존재함
		if ( !vo.getPwd().equals(pwd) ) { // 입력된 pwd와 DB에 pwd가 일치하지 않는다.
			return "{'result':'no_pwd'}";
		}
		
		// 로그인 가능
		return "{'result':'clear'}";
	}
}
