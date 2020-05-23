package dao;

import org.apache.ibatis.session.SqlSession;

public class TicketDAO {
	
	SqlSession sqlSession;
	
	public TicketDAO(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	

	
	
}
