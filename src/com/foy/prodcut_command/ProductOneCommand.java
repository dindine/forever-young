package com.foy.prodcut_command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foy.command.Command;
import com.foy.mybatis.DAO;
import com.foy.vo.AnsVO;
import com.foy.vo.CustomerVO;
import com.foy.vo.ProductOptVO;
import com.foy.vo.ProductVO;

public class ProductOneCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		//로그인 정보 저장
		
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		System.out.println("물건 상세정보의 ===== > user: " + user_id + " pw:" + user_pw);

		request.getSession().setAttribute("user_id", user_id);
		request.getSession().setAttribute("user_pw", user_pw);

		
		//유저 정보 저장
		if (!((user_id == null || (user_id == "")))) {
			
			CustomerVO vo = new CustomerVO();
			vo.setUser_id(user_id);
			vo.setUser_pw(user_pw);
			vo = DAO.login(vo);
			String user_grade = vo.getUser_grade();
			request.getSession().setAttribute("user_grade", user_grade);
			System.out.println("회원 등급 : " + user_grade);
		}
		
		
		String p_no = request.getParameter("p_no");
		System.out.println("p_no : " + p_no);

		// 상품 상세정보
		ProductVO vo = DAO.productOne(p_no);
		System.out.println("상품 정보 : " + vo);

		List<ProductOptVO> optlist = DAO.optList(p_no);
		System.out.println("옵션 정보 : " + optlist);

		request.getSession().setAttribute("vo", vo); // request.getSession()으로 하여 세션 스코프에 저장할 수 있다.
		request.getSession().setAttribute("optlist", optlist); // request.getSession()으로 하여 세션 스코프에 저장할 수 있다.

		// 상품정보에 딸린 댓글 있으면 화면에 표시
		List<AnsVO> c_list = DAO.getCommList(p_no); // 데이터가 여러건이니까 list에 담기
		System.out.println("댓글목록 : " + c_list);

		// EL, JSTL 사용을 위한 속성 등록
		// pageContext.setAttribute("bvo", bvo);

		request.setAttribute("c_list", c_list);

		// pageContext.setAttribute("cPage", cPage); //페이지에서만 등록 및 사용
		String pPage = request.getParameter("pPage");
		request.getSession().setAttribute("pPage", pPage); // 세션에 등록, 여러곳에서 사용이 가능!
		String cPage = request.getParameter("cPage");
		System.out.println("젭알 cPage : " + cPage);
		request.getSession().setAttribute("cPage", cPage); // 세션에 등록, 여러곳에서 사용이 가능!

		return "product_content.jsp";
	}

}
