package context;

import org.apache.ibatis.session.SqlSession;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import dao.ItemDAO;
import dao.PMemberDAO;

@Configuration
public class Context_3_dao {
	
	@Bean
	public PMemberDAO memberDAO(SqlSession sqlSession) {
		return new PMemberDAO(sqlSession);
	}
	
	@Bean
	public ItemDAO itemDAO(SqlSession sqlSession) {
		return new ItemDAO(sqlSession);
	}
}