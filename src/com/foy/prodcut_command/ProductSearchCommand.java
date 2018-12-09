package com.foy.prodcut_command;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foy.command.Command;
import com.foy.mybatis.DAO;
import com.foy.vo.ProductVO;



public class ProductSearchCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String product = request.getParameter("product_search_txt");
		System.out.println("product 검색어 : " + product);
		
		List<ProductVO> list = DAO.search_list(product);
		System.out.println("제품목록: " + list);
		//로그인 정보 저장
		
				String user_id = request.getParameter("user_id");
				String user_pw = request.getParameter("user_pw");
				System.out.println("물건 검색 리스트의 ===== > user: " + user_id + " pw:" + user_pw);

				request.getSession().setAttribute("user_id", user_id);
				request.getSession().setAttribute("user_pw", user_pw);
				
				

				// 페이징 처리
				System.out.println("뭐니");
				Paging p = new Paging();
				// p.setNumPerPage(); //페이지당 게시되는 게시물 수 정하기 // 숫자를 지정안하면, Paging클래스에서 default를
				// 3으로지정
				p.setPagePerBlock(12); // 한 화면에 설정되는 페이지 갯수 정하기 // 숫자를 지정안하면, Paging클래스에서 default를 3으로지정

				// 1. 전체 게시물의 수를 구한다.
				
				int cnt = DAO.search_list_cnt(product);
				p.setTotalRecord(cnt);
				p.setTotalPage(); // 전체 페이지 갯수 구하기

				System.out.println("\n--------------------------------------------");
				System.out.println("\n전체 건수: " + p.getTotalRecord());
				System.out.println("전체 페이지 갯수: " + p.getTotalPage());

				// 2. 현재 페이지 구하기(default : 1)
				String pPage = request.getParameter("pPage");
				if (pPage != null) {
					p.setNowPage(Integer.parseInt(pPage));
				}

				// 3. 현재페이지의 시작번호(begin)와 끝번호(end) 구하기
				/*
				 * int nowPage = p.getNowPage(); int numPerPage = p.getNumPerPage(); // 바로 전 페이지
				 * // (현재페이지 - 1) * 페이지당 글 수 + 1 int begin = (nowPage - 1) * numPerPage + 1;
				 * 
				 * // 6 = 4(begin) + 3(numPerPage) - 1 int end = begin + numPerPage - 1; // 끝번호
				 * = 시작번호 + 페이지당 글수 - 1; System.out.println("현재페이지(nowPage) : " + nowPage);
				 * System.out.println("시작번호(begin) : " + begin);
				 * System.out.println("끝번호(end) : " + end);
				 */

				// 위의 코드를 단순하게 정리하자면,
				// 끝번호 먼저 구하기 ------------------------
				// 끝번호(end) = 현재페이지 번호 * 페이지당 표시 글수
				
				p.setNumPerPage(12); //한 블럭당 6개의 게시물 표시!!!
				
				p.setEnd((p.getNowPage() * p.getNumPerPage()));
				p.setBegin(p.getEnd() - p.getNumPerPage() + 1);

				System.out.println("\n현재페이지(nowPage) : " + p.getNowPage());
				System.out.println("시작번호(begin) : " + p.getBegin());
				System.out.println("끝번호(end) : " + p.getEnd());

				// 4. 블록의 시작페이지, 끝 페이지 번호 구하기(현재페이지 번호 사용)
				int nowPage = p.getNowPage();
				p.setBeginPage((nowPage - 1) / p.getPagePerBlock() * p.getPagePerBlock() + 1);
				p.setEndPage(p.getBeginPage() + p.getPagePerBlock() - 1);

				System.out.println("\n현재페이지(nowPage) : " + p.getNowPage());
				System.out.println("시작페이지(beginPage) : " + p.getBeginPage());
				System.out.println("끝페이지(endPage) : " + p.getEndPage());

				// 4-1. 끝페이지(endPage)가 총페이지 (totalPage)보다 크면
				// endPage = totalPage 설정
				if (p.getEndPage() > p.getTotalPage()) {
					p.setEndPage(p.getTotalPage());
					System.out.println("\n 변경 후 끝페이지(endPage) : " + p.getEndPage());
				}

				// 현재페이지 기준 게시글 가져오기
				// DB에서 게시글 데이터 가져오기
				Map<String, String> map = new HashMap<>();
				map.put("begin", String.valueOf(p.getBegin()));
				map.put("end", String.valueOf(p.getEnd()));
				map.put("p_search", product);
				
				System.out.println("검색 리스트 map : " + map);
				List<ProductVO> prdouctsearchlist = DAO.get_search_productList(map);

				System.out.println("List<ProductVO> prdouctsearchlist : " + prdouctsearchlist);

				// EL사용을 위해 scope에 데이터 등록
				request.setAttribute("pvo", p);
				request.setAttribute("cnt", cnt);
				request.setAttribute("product", product);

				request.setAttribute("pPage", pPage);
				request.getSession().setAttribute("list", list);
				request.getSession().setAttribute("prdouctsearchlist", prdouctsearchlist);
				return "Product_search.jsp";
	}

}
