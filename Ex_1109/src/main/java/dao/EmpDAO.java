package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.EmpVO;

public class EmpDAO {
	SqlSession sqlSession;
	
	public EmpDAO( SqlSession sqlSession ) {
		this.sqlSession = sqlSession;
	}
	
	// ์ฌ์์กฐํ
	public List<EmpVO> selectList() {
		List<EmpVO> list = sqlSession.selectList("emp.emplist");
		return list;
	}
}
