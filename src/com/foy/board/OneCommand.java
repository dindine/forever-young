package com.foy.board;

import javax.servlet.http.HttpServletRequest
;
import javax.servlet.http.HttpServletResponse;

import com.foy.command.Command;
import com.foy.mybatis.DAO;
import com.foy.vo.BoardVO;



public class OneCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		//파라미터 값 추출
		String p_no = request.getParameter("p_no");
		String b_idx = request.getParameter("b_idx");
		System.out.println("****b_idx : " +b_idx);
		String cPage = request.getParameter("cPage");
		
		//1. 게시글의 조회수 1 증가
		DAO.updateHit(Integer.parseInt(b_idx));
		
		BoardVO bvo = DAO.bOne(b_idx);
		
		//DAO.updateHit(bvo);
		System.out.println("데이타 one : " + bvo);
			
		//EL,JSTL 사용을 위한 속성 등록 ------------------
		request.getSession().setAttribute("cPage", cPage);
		request.getSession().setAttribute("b_idx", b_idx);
		request.getSession().setAttribute("p_no", p_no);
		
		//게시글 수정,삭제 페이지에서도 사용토록 세션영역에 등록
		request.getSession().setAttribute("bvo", bvo);
		
		return "board_view.jsp";
	}

}





