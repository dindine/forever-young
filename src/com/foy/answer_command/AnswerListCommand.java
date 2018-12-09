package com.foy.answer_command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.paging.PagingFactory;
import com.foy.command.Command;
import com.foy.mybatis.DAO;
import com.foy.mybatis.Paging;
import com.foy.vo.AnsVO;

public class AnswerListCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String pressedPage = request.getParameter("pressedPage");
		
		//로그인 정보 저장
		
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		System.out.println("user: " + user_id + " pw:" + user_pw);

		request.getSession().setAttribute("user_id", user_id);
		request.getSession().setAttribute("user_pw", user_pw);
		
		
		String p_no = request.getParameter("p_no"); 
		String b_idx = request.getParameter("b_idx"); 
		String cPage = request.getParameter("cPage"); 
		System.out.println("cPage : " + cPage + ", p_no : " + p_no + " , b_idx : " + b_idx);
		
		int pagingPage = 1;
		if (pressedPage != null) {
			pagingPage = Integer.parseInt(pressedPage);
		}
		int c_b_tot = DAO.getC_B_TotalCount(b_idx);
		System.out.println("DAO.getC_B_TotalCount(b_idx) : " + DAO.getC_B_TotalCount(b_idx) + " pagingPage : " + pagingPage);
		Paging paging = PagingFactory.create(DAO.getC_B_TotalCount(b_idx), pagingPage);
		//List<AnsVO> answers = DAO.getAnswers(paging.getBegin(), paging.getEnd());
		List<AnsVO> b_answers = DAO.getBoard_Answers(String.valueOf(paging.getBegin()), String.valueOf(paging.getEnd()), b_idx);
		int b_ans_cnt = b_answers.size();
		System.out.println("b_answers : " +b_answers);
		System.out.println("b_ans_cnt : " +b_ans_cnt);
		
		request.setAttribute("paging", paging);
		//request.setAttribute("answers", answers);
		request.setAttribute("b_answers", b_answers);
		//request.setAttribute("ansVO", b_answers);
		request.setAttribute("b_ans_cnt", b_ans_cnt);

		request.setAttribute("p_no", p_no);
		request.setAttribute("b_idx", b_idx);
		request.setAttribute("cPage", cPage);
		request.setAttribute("c_b_tot", c_b_tot);

		return "ans_write_form2.jsp";
	}

	
}
