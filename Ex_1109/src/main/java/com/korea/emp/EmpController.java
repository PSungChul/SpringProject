package com.korea.emp;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.EmpDAO;
import vo.EmpVO;

@Controller
public class EmpController {
	final String VIEW_PATH = "/WEB-INF/views/emp/";
	
	EmpDAO emp_dao;
	
	public void setEmp_dao(EmpDAO emp_dao) {
		this.emp_dao = emp_dao;
	}
	
	@RequestMapping(value={"/", "list.do"})
	public String empSelect( Model model ) {
		List<EmpVO> list = emp_dao.selectList();
		model.addAttribute("empList", list); // 바인딩
		return VIEW_PATH + "empList.jsp";
	}
}
