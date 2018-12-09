package com.foy.answer_command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foy.command.Command;
import com.foy.mybatis.DAO;
import com.foy.vo.AnsVO;

public class AnswerUpdateCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String chk = request.getParameter("update_chk");
		String idx = request.getParameter("idx");
		String p_no = request.getParameter("p_no");
		String cPage = request.getParameter("cPage");
		String user_id = request.getParameter("writer");
		String user_pw = request.getParameter("pwd");
		
		if (chk != null) {
		
			//전달받은 값을 DB에 수정처리
			AnsVO vo = new AnsVO();
			vo.setC_idx(request.getParameter("c_idx"));
			vo.setWriter(request.getParameter("writer"));
			vo.setContent(request.getParameter("content"));
			vo.setPwd(request.getParameter("pwd"));
			vo.setWrite_date(request.getParameter("write_date"));
			
			DAO.update(vo);
			
		}
		return "MyCon?type=productOne&cPage="+ cPage +"&user_id="+user_id+"&user_pw="+user_pw+"&p_no="+p_no;
		
	}

}
