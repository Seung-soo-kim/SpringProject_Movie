package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.SeatVO;

public class SeatDAO {
	SqlSession sqlSession;
	public SeatDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	public int seatinsert(SeatVO vo) {
		int res =sqlSession.insert("s.seatsave" , vo);
		return res;
	}
	public List<SeatVO> foundseat(SeatVO vo){
		List<SeatVO> list= null;
		list=sqlSession.selectList("s.foundseat" ,vo);
		return list;
	}
	
	
}
