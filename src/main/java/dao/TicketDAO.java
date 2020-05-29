package dao;

import org.apache.ibatis.session.SqlSession;

import vo.TicketVO;

public class TicketDAO {
	
	SqlSession sqlSession;
	
	public TicketDAO(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	
	public int saveticket(TicketVO vo) {
		
		int res = sqlSession.insert("ticket.saveticket" , vo);
		return res ;
	}
	
	
}
