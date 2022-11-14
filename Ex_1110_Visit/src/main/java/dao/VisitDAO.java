package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.VisitVO;

public class VisitDAO {
	// sqlSession
	SqlSession sqlSession;
	// setter injection
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	// 방명록 전체목록 조회
	public List<VisitVO> selectList() {
		List<VisitVO> list = sqlSession.selectList("v.visit_list");
		return list;
	}
	
	// 새 글 추가
	public int insert(VisitVO vo) {
		// 맵퍼로 딱 한개의 객체만 넘겨줄 수 있다.
		int res = sqlSession.insert("v.visit_insert", vo);
		return res;
	}
	
	// 글 삭제
	public int delete(int idx) {
		int res = sqlSession.delete("v.visit_delete", idx);
		return res;
	}
	
	// 수정을 위한 게시글 한 건 조회
	public VisitVO selectOne(int idx) {
		VisitVO vo = sqlSession.selectOne("v.visit_one", idx);
		return vo;
	}
	
	// 게시글 수정
	public int update( VisitVO vo ) {
		int res = sqlSession.update("v.visit_update", vo);
		return res;
	}
}
