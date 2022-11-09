package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.DeptVO;

public class DeptDAO {
	// DAO(Data Access Object) : DB접근을 목표로 하는 클래스
	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	// 전체 부서목록을 조회하기 위한 메소드
	public List<DeptVO> selectAll() {
		// sqlSession이라는 객체를 통해 mapper로 접근
		List<DeptVO> list = sqlSession.selectList("d.deptlist");
		return list;
	}
}
