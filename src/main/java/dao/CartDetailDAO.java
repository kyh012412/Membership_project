package dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public class CartDetailDAO {
	SqlSession sqlSession;
	
	public CartDetailDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int cart_insert(Map<String, Integer> idx_map) {
		return sqlSession.insert("c.cart_insert", idx_map);
	}
	
<<<<<<< Updated upstream
=======
	// 장바구니 전체 조회
	public List<CartDetailVO> cart_select_list(int m_idx) {
		return sqlSession.selectList("cd.cart_select_list", m_idx);
	}
>>>>>>> Stashed changes
}
