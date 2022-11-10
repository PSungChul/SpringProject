package com.korea.vs;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.VisitDAO;
import util.Comm;
import vo.VisitVO;

@Controller
public class VisitController {
	// VisitDAO
	VisitDAO visit_dao;
	// setter injection
	public void setVisit_dao(VisitDAO visit_dao) {
		this.visit_dao = visit_dao;
	}
	
	// 방명록 조회
	@RequestMapping(value={"/", "/list.do"})
	public String list( Model model ) {
		
		List<VisitVO> list = visit_dao.selectList();
		model.addAttribute("list", list);
		return Comm.VIEW_PATH + "visit_list.jsp";
		
	}
	
	@RequestMapping("/insert_form.do")
	public String insert_form() {
		return Comm.VIEW_PATH + "visit_insert_form.jsp";
	}
	
	@RequestMapping("/insert.do")
	// 나중에 받아올 값이 많아지면 힘들어지기에 잘 안쓴다.
	// public String insert(String name, String content, String pwd) {
	// VO의 getter/setter를 이용
	public String insert( VisitVO vo, HttpServletRequest request ) {
		// insert.do?name=홍&content=12345&pwd=1111
		
		// 접속자의 ip 가져오기
		String ip = request.getRemoteAddr();
		vo.setIp(ip);
		
		// DB에 새 글을 추가하기 위해 DAO에게 VO를 전달
		visit_dao.insert(vo);
		
		// redirect: view로 이동하는 것이 아닌, 컨트롤러의 url매핑을 호출하기 위한 키워드
		return "redirect:list.do";
	}
}
