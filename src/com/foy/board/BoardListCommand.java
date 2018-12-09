package com.foy.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foy.command.Command;
import com.foy.mybatis.DAO;
import com.foy.mybatis.Paging;
import com.foy.vo.BoardVO;
import com.foy.vo.CustomerVO;


public class BoardListCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {

		
		//로그인 정보 저장
		
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		System.out.println("user: " + user_id + " pw:" + user_pw);

		request.getSession().setAttribute("user_id", user_id);
		request.getSession().setAttribute("user_pw", user_pw);
		
		//상품 상세 정보에 따른 게시물 구하기 위해 p_no값 구하기
		String p_no = request.getParameter("p_no");
		request.setAttribute("p_no", p_no);
		

		
		System.out.println("-----------------------------");

		//페이징 처리를 위한 객체 생성
		Paging p = new Paging();
		
		//1. 전체 게시물의 수를 구한다.
		//p.setTotalRecord(DAO.getB_TotalCount()); // DB로 부터 전체 게시물 수

		
		p.setTotalRecord(DAO.getP_B_TotalCount(p_no)); //DB로 부터 상품정보에 해당하는 게시물 수
		
		p.setTotalPage(); //전체 페이지 갯수 구하기
		
		//2. 현재 페이지 구하기(default : 1)
		String cPage = request.getParameter("cPage");
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}
		System.out.println("게시 cPage : " + cPage);
		//3. 현재페이지의 시작번호(begin)와 끝번호(end) 구하기
		//시작번호 먼저 구하기(복잡) -------------
		//p.setBegin((p.getNowPage() - 1) * p.getNumPerPage() + 1);
		//p.setEnd(p.getBegin() + p.getNumPerPage() - 1);
		
		//끝번호 먼저 구하기 ---------------
		//끝번호(end) = 현재페이지번호 * 페이지당표시글수
		p.setEnd(p.getNowPage() * p.getNumPerPage());
		p.setBegin(p.getEnd() - p.getNumPerPage() + 1);
		
		//4. 블록의 시작페이지, 끝페이지 번호 구하기(현재페이지 번호 이용)
		int nowPage = p.getNowPage();
		p.setBeginPage((nowPage - 1) / p.getPagePerBlock() * p.getPagePerBlock() + 1);
		p.setEndPage(p.getBeginPage() + p.getPagePerBlock() - 1);
		
		//endPage 먼저 구하기
		//현재 페이지 / pagePerBlock 올림처리 * pagePerBlock 
		
		//4-1 끝페이지(endPage)가 총페이지(totalPage)보다 크면
		//endPage = totalPage 설정
		if (p.getEndPage() > p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
		}
		
		//해당 부분은 DAO.getProduct_Board()에서 매핑!
//		Map<String, Integer> map = new HashMap<String, Integer>();
//		map.put("begin", p.getBegin());
//		map.put("end", p.getEnd());
		
		int begin = p.getBegin();
		int end = p.getEnd();
		System.out.println("begin : " + begin);
		System.out.println("end : " + end);

		List<BoardVO> list = DAO.getProduct_Board(String.valueOf(begin), String.valueOf(end), p_no);
		System.out.println("List<BoardVO> list : " + list);
		int p_b_totalcount =  list.size();
		request.setAttribute("p_b_totalcount", p_b_totalcount);
		//EL사용을 위해 scope에 데이타 등록(page 영역)
		//request.setAttribute("attr_list", list);
		
		request.getSession().setAttribute("list", list);
		request.getSession().setAttribute("pvo", p);
	
		request.getSession().setAttribute("cPage", cPage);
		
		
		System.out.println("list : " + list);
		return "boardList.jsp";
		

	}

}
