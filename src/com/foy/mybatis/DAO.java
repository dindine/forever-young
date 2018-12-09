package com.foy.mybatis;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.foy.vo.AnsVO;
import com.foy.vo.BoardVO;
import com.foy.vo.CartVO;
import com.foy.vo.CustomerVO;
import com.foy.vo.PayVO;
import com.foy.vo.ProductOptVO;
import com.foy.vo.ProductVO;
import com.foy.vo.UserVO;

public class DAO {
	private static SqlSession ss;

	private synchronized static SqlSession getSql() {
		if (ss == null) {
			ss = DBService.getFactory().openSession(true); // 자동커밋처리
		}
		return ss;
	}

	// 회원가입
	public static int insert(UserVO vo) {
		int result = getSql().insert("join", vo);
		// auto commit상태가 아니므로 명시적 commit처리 필요
		getSql().commit();
		return result;
	}

	// 로그인
	public static CustomerVO login(CustomerVO vo) {
		return getSql().selectOne("one", vo);
	}

	// 로그인 비밀번호 체크
	public static String pwchk(String id) {
		return getSql().selectOne("pwchk", id);
	}

	//////////////////////////////////////////////////////
	// 표시할 게시글 조회
	public static List<BoardVO> getList(Map<String, Integer> map) {
		List<BoardVO> list = getSql().selectList("bList", map);
		getSql().commit();
		return list;
		// return getSql().selectList("list");
	}

	// 게시글 상세정보의 댓글 조회
	public static List<BoardVO> getProduct_Board(String begin, String end, String p_no) {
		// Map<String, Integer> map = new HashMap<>();
		Map<String, String> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
		map.put("p_no", p_no);

		System.out.println("상품상세정보의 게시글찾기 map : " + map);

		return getSql().selectList("bListforProduct", map);
	}

	// 게시글 상세보기 데이터 조회
	public static BoardVO bOne(String b_idx) {
		BoardVO bvo = getSql().selectOne("bOne", b_idx);
		return bvo;
	}

	// 게시물(Board)의 전체 건수 조회
	public static int getB_TotalCount() {
		int totalCount = getSql().selectOne("b_totalCount");
		return totalCount;
	}
	
	// 게시물(Board)의 전체 건수 조회
	public static int getP_c_TotalCount(String category_name) {
		int totalCount = getSql().selectOne("productlist_cate_totalCount", category_name);
		return totalCount;
	}

	// 상세정보에 따른 게시물(Board)의 총 갯수
	public static int getP_B_TotalCount(String p_no) {
		return getSql().selectOne("product_b_totalCount", p_no);
	}

	// 게시만 데이터 입력 처리
	public static int b_write(BoardVO bvo) {
		// return getSql().insert("bWrite", bvo);
		return getSql().insert("b_write", bvo);
	}

	// 조회수 수정 처리(1 증가)
	public static int updateHit(BoardVO bvo) {
		return getSql().update("hitVO", bvo);
	}

	// 조회수 증가 처리(1 증가)
	public static int updateHit(int b_idx) {
		return getSql().update("hit", b_idx);
	}

	// 게시글 수정
	public static int b_modify(BoardVO bvo) {
		// System.out.println("DAO.update bvo: " + bvo);
		// return 1; //--> 잘 넘어오는지 확인해보기(Console)
		return getSql().update("b_modify", bvo);
	}

	// 게시글 삭제
	public static int b_delete(String b_idx) {
		return getSql().delete("b_delete", b_idx);
	}

	///////////////////////////////////////////////////////////////
	// 물건등록
	public static int productReg(ProductVO vo) {
		return getSql().insert("regProduct", vo);
	}

	// 물건전체 조회
	public static List<ProductVO> productlist() {
		return getSql().selectList("product_tot_list");
	}

	// 표시할 상품리스트 조회
	public static List<ProductVO> get_productList(Map<String, String> map) {

		return getSql().selectList("product_list", map);
	}
	// 표시할 상품리스트 조회 - cate
	public static List<ProductVO> get_cate_productList(Map<String, String> map) {
		
		return getSql().selectList("product_cate_list", map);
	}
	// 표시할 상품리스트 조회 - search
	public static List<ProductVO> get_search_productList(Map<String, String> map) {
		
		return getSql().selectList("product_search_list", map);
	}

	// 상품리스트의 전체 건수 조회

	public static int getproduct_TotalCount() {
		int totalCount = getSql().selectOne("productlist_totalCount");
		return totalCount;
	}

	// 특정 물건 정보 조회
	public static ProductVO productOne(String p_no) {
		return getSql().selectOne("productOne", p_no);
	}

	// 상품고유번호 지정을 위해 해당 카테고리의 데이터 갯수 조회
	public static int getP_no(String p_category) {
		int cnt = getSql().selectOne("getPno", p_category);
		return cnt;
	}

	// 존재하는 해당 카테고리의 상품 고유 번호 리스트
	public static List<String> exitsP_no(String category) {
		return getSql().selectList("exitsgetPno", category);
	}

	// 카테고리 목록 조회
	public static List<String> getCategory() {
		return getSql().selectList("getCategory");
	}

	// 카테고리 목록 조회
	public static String getCategory_IDX(String category_name) {
		return getSql().selectOne("getCategoryIDX", category_name);
	}

	// 상품수정
	public static int updateProduct(ProductVO vo) {
		return getSql().update("updateProduct", vo);
	}

	// 상품삭제
	public static int deleteProudct(String p_no) {
		return getSql().delete("deleteProduct", p_no);
	}

	// 상품 옵션 리스트저장
	public static int addOpt(ProductOptVO vo) {
		return getSql().insert("addOpt", vo);
	}

	// 상품 옵션 리스트
	public static List<ProductOptVO> optList(String p_no) {
		return getSql().selectList("optList", p_no);
	}

	// 상품 옵션 리스트
	public static List<String> optname(String p_no) {
		return getSql().selectList("optname", p_no);
	}
	// 상품 옵션 리스트
	public static String optList_no(String p_no, String p_op_content) {
		
		Map<String, String> map = new HashMap<>();
		map.put("p_no", p_no);
		map.put("p_op_content", p_op_content);
		return getSql().selectOne("optList_no", map);
	}

	// 상품수정
	public static int optupdate(ProductOptVO vo) {
		return getSql().update("optupdate", vo);
	}

	// 상품정보에 딸린, 댓글 조회
	public static List<AnsVO> getCommList(String p_no) {
		return getSql().selectList("product_commList", p_no);
	}

	////////////////////////////////////////////////////////////////

	// 댓글 삭제
	public static int deleteComment(String a_idx) {
		return getSql().delete("c_delete", a_idx);
	}

	public static int delete(String c_idx) {
		return getSql().delete("c_delete", c_idx);
	}

	// 댓글 전체 조회
	public static List<AnsVO> getAnswers(int begin, int end) {
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);

		return getSql().selectList("c_idx", map);
	}

	// 게시글 상세정보의 댓글 조회
	public static List<AnsVO> getBoard_Answers(String begin, String end, String b_idx) {
		// Map<String, Integer> map = new HashMap<>();
		Map<String, String> map = new HashMap<>();
		map.put("b_idx", b_idx);
		map.put("end", end);
		map.put("begin", begin);

		System.out.println("게시글의 댓글찾기  map : " + map);
		return getSql().selectList("board_c_idx", map);
	}

	// 댓글 입력
	public static int insertComment(AnsVO avo) {
		return getSql().insert("c_insert", avo);
	}

	// 댓글의 총 갯수
	public static int getC_TotalCount() {
		return getSql().selectOne("c_total_count");
	}

	// 게시물(Board)에 따른 댓글 총 갯수
	public static int getC_B_TotalCount(String b_idx) {
		return getSql().selectOne("c_b_totalCount", b_idx);
	}

	// 댓글 업데이트
	public static int update(AnsVO vo) {
		return getSql().update("update", vo);

	}

	// 개인정보 수정
	public static int customer_update(CustomerVO vo) {
		return getSql().update("cus_update", vo);

	}

	// 탈퇴
	public static int customer_delete(String cus_delete) {
		return getSql().delete("cus_delete", cus_delete);
	}

	// 상품 장바구니에 추가
	public static int addproduct(CartVO vo) {
		return getSql().insert("addproduct", vo);
	}

	// 상품 장바구니 보기
	public static List<CartVO> cartlist(String user_id) {
		return getSql().selectList("cartlist", user_id);
	}

	// 동일 제품 수량 세기
	public static int productcnt(String user_id, String p_no, String p_opt_no) {
		Map<String, String> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("p_no", p_no);
		map.put("p_opt_no", p_opt_no);

		System.out.println("map이 새끼 : " + map);
		return getSql().selectOne("productcnt", map);

	}

	// 상품 수량 합치기
	public static int updatecart(String p_no, String user_id, String p_opt_no) {

		Map<String, String> map = new HashMap<>();
		map.put("p_opt_no", p_opt_no);
		map.put("p_no", p_no);
		map.put("user_id", user_id);
		System.out.println("map그 새끼 : " + map);

		return getSql().update("updatecnt", map);
	}

	// 장바구니에서 물품 삭제
	public static int deletecart(String cart_idx) {
		return getSql().delete("deletecart", cart_idx);
	}

	// 장바구니 총 결제 금액
	public static int totalprice(String user_id) {
		return getSql().selectOne("totalprice", user_id);
	}

	// 장바구니 수정
	public static int modifycart(CartVO vo) {
		System.out.println("modify vo: " + vo);
		return getSql().update("modifycart", vo);
	}

	// 장바구니 수량에 대한 단가 금액
	public static int cntprice(String p_no, String p_opt_no) {
		Map<String, String> map = new HashMap<>();
		map.put("p_no", p_no);
		map.put("p_opt_no", p_opt_no);
		// return getSql().selectOne("cntprice", p_no);
		return getSql().update("cntpriceupdate", map);
	}	//주문할 목록 보기
	public static CartVO order_info(String user_id) {
		return getSql().selectOne("order_info", user_id);
		}
	
	//결제시 적립금, 쿠폰 사용하기
	public static int use_coupon_point(CustomerVO vo) {
		return getSql().update("use_coupon_point", vo);
	}
	
	//결제 정보 저장
	public static int save_bill (PayVO vo) {
		return getSql().insert("bill", vo);
	}
	
	// 장바구니에서 물품 삭제
	public static int pay_deletecart(String user_id) {
		return getSql().delete("pay_deletecart", user_id);
	}
	
	//영수증 정보 불러오기
	public static List<PayVO> bill_info (String user_id) {
		return getSql().selectList("bill_info", user_id);
	}
	
	//메인페이지 카테고리
	public static List<ProductVO> list(String category){
		System.out.println("category : " + category);
		return getSql().selectList("list", category);
	}

	//메인페이지 검색
	public static List<ProductVO> search_list(String product){
		System.out.println("product : " + product);
		return getSql().selectList("search_list", product);
	}
	//메인페이지 검색 후 데이터 수
	public static int search_list_cnt(String product){
		System.out.println("product : " + product);
		return getSql().selectOne("search_list_cnt", product);
	}
	
	// 동일 제품 수량 세기
	public static int updateGrade(String user_id, String user_coupon_cnt, String user_grade) {
			Map<String, String> map = new HashMap<>();
			map.put("user_id", user_id);
			map.put("user_coupon_cnt", user_coupon_cnt);
			map.put("user_grade", user_grade);

			System.out.println("등급조정 map: " + map);
			return getSql().update("updateGrade", map);

		}
	
	public static int update_l_b(String good, String bad, String b_idx) {
		Map<String, String> map = new HashMap<>();
		map.put("good", good);
		map.put("bad", bad);
		map.put("b_idx", b_idx);

		System.out.println("좋아요 map: " + map);
		return getSql().update("update_L_B", map);
	}
//	
//	//동적검색
//		public static List<ProductVO> getSearch(String idx, String keyword) {
//			Map<String, String> map = new HashMap<>();
//			map.put("idx", idx);
//			map.put("keyword", keyword);
//			List<ProductVO> list = getSql().selectList("search", map);
//			return list;
//		}
}
