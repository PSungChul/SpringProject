package com.korea.vs;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import dao.VisitDAO;
import util.Comm;
import vo.VisitVO;

@Controller
public class VisitController {
	
	// @Autowired : 스프링 내장객체를 자동으로 생성해주는 기능
	@Autowired
	ServletContext app; // 현재 프로젝트의 기본정보들을 저장하고 있는 클래스
	
	@Autowired
	HttpServletRequest request;
	
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
	
	// 게시글 작성
	@RequestMapping("/insert.do")
	// 나중에 받아올 값이 많아지면 힘들어지기에 잘 안쓴다.
	// public String insert(String name, String content, String pwd) {
	// VO의 getter/setter를 이용
	public String insert( VisitVO vo ) {
		// insert.do?name=홍&content=12345&pwd=1111
		
		// 접속자의 ip 가져오기
		String ip = request.getRemoteAddr();
		vo.setIp(ip);
		
		// 클라이언트의 파일 업로드를 위한 절대경로 생성
		String webPath = "/resources/upload/"; // 상대경로
		String savePath = app.getRealPath(webPath); // 절대경로
		System.out.println("경로 : " + savePath);
		
		// 업로드를 위해 파라미터로 넘어온 사진의 정보
		MultipartFile photo = vo.getPhoto();
		
		String filename = "no_file";
		
		// 업로드 된 파일이 존재할 때!!
		if ( !photo.isEmpty() ) {
			// 업로드가 된 실제 파일의 이름
			filename = photo.getOriginalFilename();
			
			// 이미지를 저정할 경로를 지정
			File saveFile = new File(savePath, filename);
			
			if ( !saveFile.exists() ) {
				saveFile.mkdirs();
			} else {
				
				// 동일 파일명 변경
				long time = System.currentTimeMillis();
				filename = String.format("%d_%s", time, filename);
				saveFile = new File(savePath, filename);
				
			}
			
			try {
				// 업로드를 위한 파일을 실제로 등록해주는 메서드
				photo.transferTo(saveFile);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		vo.setFilename(filename);
		
		// DB에 새 글을 추가하기 위해 DAO에게 VO를 전달
		visit_dao.insert(vo);
		
		// redirect: view로 이동하는 것이 아닌, 컨트롤러의 url매핑을 호출하기 위한 키워드
		return "redirect:list.do";
	}
	
	// 게시글 삭제
	@RequestMapping("delete.do")
	@ResponseBody // Ajax로 요청된 메소드는 결과를 콜백메소드로 돌려주기 위해 반드시 @ResponseBody가 필요!!
	public String delete(int idx) {
		// delete.do?idx=1
		int res = visit_dao.delete(idx);
		
		String result = "no";
		if ( res == 1 ) {
			result = "yes";
		}
		
		// yes, no값을 가지고 콜백메소드(resultFn)로 돌아간다
		// 콜백으로 리턴되는 값은 영문으로 보내준다 (한글로 보내면 한글이 깨져서 나온다)
		return result;
	}
	
	// 글 수정 폼으로 전환
	@RequestMapping("/modify_form.do")
	public String modify_form(Model model, int idx) {
		// modify_form.do?idx=2&pwd=1111&c_pwd=1111
		VisitVO vo = visit_dao.selectOne(idx);
		
		if ( vo != null ) {
			model.addAttribute("vo", vo);
		}
		
		return Comm.VIEW_PATH + "visit_modify_form.jsp";
	}
	
//	// 게시글 수정하기
//	@RequestMapping("/modify.do")
//	@ResponseBody
//	public String modify( VisitVO vo, HttpServletRequest request ) {
//		// modify.do?idx=2&name=hong&content=가나다&pwd=1111
//		String ip = request.getRemoteAddr();
//		vo.setIp(ip);
//		
//		int res = visit_dao.update(vo);
//		
//		String result = "no";
//		if ( res != 0 ) {
//			result = "yes";
//		}
//		
//		return result;
//	}
	
	@RequestMapping("/modify.do")
	@ResponseBody
	public String modify( VisitVO vo, HttpServletRequest request ) {
		// modify.do?idx=2&name=hong&content=가나다&pwd=1111
		String ip = request.getRemoteAddr();
		vo.setIp(ip);
		
		int res = visit_dao.update(vo);
		
		String result = "{'result':'no'}";
		if ( res != 0 ) {
			result = "{'result':'yes'}";
		}
		
		return result;
	}
}
