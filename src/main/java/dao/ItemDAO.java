package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.ItemVO;

public class ItemDAO {
	
	SqlSession sqlSession;
	
	public ItemDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	// shop 아이템 추가
	public int item_upload(ItemVO vo) {
		return sqlSession.insert("i.item_upload", vo);
	}
	
	// item 리스트 조회
	public List<ItemVO> item_list_select(){
		return sqlSession.selectList("i.item_list_select");
	}
	
	// 선택한 item 한건 조회
	public ItemVO item_select_one(int i_idx) {
		return sqlSession.selectOne("i.item_select_one", i_idx);
	}
	
	// 선택한 item의 모든 색상 조회
	public List<String> item_select_color(String i_name) {
		return sqlSession.selectList("i.item_select_color", i_name);
	}
	
	// 선택한 item의 i_idx, i_amount 조회
	public ItemVO item_find_idx(Map<String, String> i_map) {
		return sqlSession.selectOne("i.item_find_idx", i_map);
	}
	
	// i_name으로 된 상품 전체 삭제
	public int item_delete(String i_name) {
		return sqlSession.delete("i.item_delete", i_name);
	}
	
	// 멤버쉽 유효기간 늘리기
	public int membership_buy(int idx) {
		return sqlSession.update("i.membership_buy", idx);
	}
	
	// 멤버쉽 유효기간 늘리기
	public int membership_check(int idx) {
		return sqlSession.update("i.membership_check", idx);
	}
	
}
