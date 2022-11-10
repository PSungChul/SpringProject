package com.korea.emp;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.UserDAO;
import vo.UserVO;

@Controller
public class UserController {
	final String VIEW_PATH = "/WEB-INF/views/user/";
	// UserDAO
	UserDAO user_dao;
	// setter 인젝션
	public void setUser_dao(UserDAO user_dao) {
		this.user_dao = user_dao;
	}
	
	@RequestMapping("/ulist.do")
	public String alluser( Model model ) {
		
		// DAO로 부터 검색결과를 반환받는다
		List<UserVO> list = user_dao.selectAllUser();
		model.addAttribute("list", list);
		return VIEW_PATH + "userList.jsp";
		
	}
	
}
