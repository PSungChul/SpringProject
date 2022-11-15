package com.korea.bbs;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.BoardDAO;
import util.Common;
import vo.BoardVO;

@Controller
public class BoardController {
	
	@Autowired
	HttpServletRequest request;
	
	BoardDAO board_dao;
	// SI
	public void setBoard_dao(BoardDAO board_dao) {
		this.board_dao = board_dao;
	}
	
	// 게시글 전체목록 조회
	@RequestMapping( value= {"/", "/list.do"} )
	public String list() {
		
		List<BoardVO> list = board_dao.selectList();
		
		// list 바인딩
		request.setAttribute("list", list);
		
		return Common.PATH + "board_list.jsp";
	}
	
	// 새 글 작성을 위한 폼으로 화면전환
	@RequestMapping("/insert_form.do")
	public String insert_form() {
		return Common.PATH + "board_write.jsp";
	}
	
	// 새 글 작성
	@RequestMapping("/insert.do")
	public String insert( BoardVO vo ) {
		
		// 접속자의 ip 가져오기
		String ip = request.getRemoteAddr();
		vo.setIp(ip);
		
		board_dao.insert(vo);
		
		return "redirect:list.do";
	}
}
