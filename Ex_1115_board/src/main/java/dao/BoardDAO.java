package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.BoardVO;

public class BoardDAO {
	SqlSession sqlSession;
	// SI
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	// 전체 게시물 조회
	public List<BoardVO> selectList() {
		List<BoardVO> list = sqlSession.selectList("b.board_list");
		return list;
	}
	
	// 새 글 작성
	public int insert(BoardVO vo) {
		int res = sqlSession.insert("b.board_insert", vo);
		return res;
	}
}
