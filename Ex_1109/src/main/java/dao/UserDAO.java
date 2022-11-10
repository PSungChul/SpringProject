package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.UserVO;

public class UserDAO {
	// SqlSession
	SqlSession sqlSession;
	// setter 인젝션
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	// 유저목록 조회
	public List<UserVO> selectAllUser() {
		
		// 맵퍼로 접근해서 모든 유저 정보를 가져온다.
		List<UserVO> list = sqlSession.selectList("user.userlist");
		return list; // 컨트롤러로 작업결과를 반환
	}
}
