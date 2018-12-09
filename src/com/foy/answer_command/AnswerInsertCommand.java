package com.foy.answer_command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.paging.PagingFactory;
import com.foy.command.Command;
import com.foy.mybatis.DAO;
import com.foy.mybatis.Paging;
import com.foy.vo.AnsVO;


public class AnswerInsertCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		//로그인 정보 저장
		
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		System.out.println("user: " + user_id + " pw:" + user_pw);

		request.setAttribute("user_id", user_id);
		request.setAttribute("user_pw", user_pw);
		
		
		String chk = request.getParameter("write_chk");
		String p_no = request.getParameter("p_no");
		System.out.println("댓글 등록의 p_no : " + p_no);
		String b_idx = request.getParameter("b_idx");
		String cPage = request.getParameter("cPage");
		System.out.println("댓글 등록의 cPage : " + cPage);

		if (chk != null) {
			//전달받은 값을 DB에 입력처리
			AnsVO vo = new AnsVO();
			vo.setWriter(request.getParameter("c_writer"));
			vo.setP_no(p_no);
			vo.setB_idx(b_idx);
			vo.setContent(request.getParameter("c_content"));
			vo.setPwd(request.getParameter("c_pwd"));
			//vo.setWrite_date(request.getParameter("write_date"));
			
			System.out.println("댓글 등록 : "  + vo);
			DAO.insertComment(vo);
		}
		
		Paging paging = PagingFactory.create(DAO.getC_TotalCount(), 1);
//		List<AnsVO> answers = DAO.getAnswers(paging.getBegin(), paging.getEnd());
		List<AnsVO> answers = DAO.getBoard_Answers(String.valueOf(paging.getBegin()), String.valueOf(paging.getEnd()),p_no);
		
		request.setAttribute("answers", answers);
		request.setAttribute("paging", paging);
		request.setAttribute("cPage", cPage);
		
		return "MyCon?type=productOne&cPage="+ cPage +"&p_no=" + p_no + "&b_idx=" + b_idx + "&user_id=" + user_id + "&user_pw=" + user_pw;
	}
	
}