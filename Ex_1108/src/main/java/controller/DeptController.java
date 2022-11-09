package controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.DeptDAO;
import vo.DeptVO;

@Controller // 컨트롤러 클래스에는 반드시 @Controller어노테이션이 추가되어 있어야 한다.
public class DeptController {
	
	final String VIEW_PATH = "/WEB-INF/views/dept/";
	
	// Controller클래스는 DAO들을 모아서 관리하기 위한 클래스
	DeptDAO dept_dao;
	
	public DeptController( DeptDAO dept_dao ) {
		this.dept_dao = dept_dao;
	}
	
//	public void setDept_dao(DeptDAO dept_dao) {
//		this.dept_dao = dept_dao;
//	}
	
	@RequestMapping(value= {"/", "list.do"})
	public String list( Model model ) {
		
		// DAO를 통해서 조회된 목록을 요청
		List<DeptVO> list = dept_dao.selectAll();
		
		// model객체를 통해 list를 바인딩
		model.addAttribute("m_list", list);
		
		// 저장된 데이터를 포워딩
		// 바인딩 된 정보는 return을 통해 호출되는 jsp에서만 사용이 가능
		return VIEW_PATH + "dept_list.jsp";
		
	}
	
}
