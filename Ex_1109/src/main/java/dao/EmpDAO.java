package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.EmpVO;

public class EmpDAO {
	SqlSession sqlSession;
	
	public EmpDAO( SqlSession sqlSession ) {
		this.sqlSession = sqlSession;
	}
	
	// 사원조회
	public List<EmpVO> selectList() {
		List<EmpVO> list = sqlSession.selectList("emp.emplist");
		return list;
	}
}
