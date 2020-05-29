package dao;

import org.apache.ibatis.session.SqlSession;

import vo.TicketVO;

public class TicketDAO {
	
	SqlSession sqlSession;
	
	public TicketDAO(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	
	public int saveticket(TicketVO vo) {
		System.out.println(vo.getM_name());
		System.out.println(vo.getDate_s());
		int res = sqlSession.insert("ticket.saveticket" , vo);
		return res ;
	}
	
	
}
