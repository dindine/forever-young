package com.foy.board;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foy.command.Command;
import com.foy.mybatis.DAO;
import com.foy.vo.BoardVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class WriteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		
		
		System.out.println("request getContentType : " + request.getContentType());

		MultipartRequest mr = null;
		String path = null;
		try {
		
		String filepath = request.getSession().getServletContext().getRealPath("/upload");
			mr = new MultipartRequest(request, filepath, 10 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy());
			
			BoardVO bvo = new BoardVO();
			
			String p_no = mr.getParameter("p_no");
			String user_id = mr.getParameter("b_writer");
			String user_pw = mr.getParameter("b_pwd");
			String user_grade = mr.getParameter("user_grade");
			String cPage = mr.getParameter("cPage");
			
			bvo.setP_no(p_no);
			bvo.setB_subject(mr.getParameter("b_subject"));
			bvo.setB_writer(user_id);
			bvo.setB_content(mr.getParameter("b_content"));
			bvo.setB_pwd(user_pw);
			bvo.setUser_grade(user_grade);
			bvo.setStar(mr.getParameter("star"));
			System.out.println("star : " + mr.getParameter("star"));
			
			
			System.out.println("writecomm bvo : " + bvo);
			//첨부파일 처리
			if (mr.getFile("b_file_name") != null) {
				bvo.setB_file_name(mr.getFilesystemName("b_file_name"));
				bvo.setB_ori_name(mr.getOriginalFileName("b_file_name"));
			} else {
				bvo.setB_file_name(""); //실제 저장시 사용된 파일명
				bvo.setB_ori_name(""); //원본 파일명
			}
			
			System.out.println("bvo : " + bvo);
			DAO.b_write(bvo);
			

			path = "MyCon?type=productOne&cPage="+ cPage +"&user_id="+user_id+"&user_pw="+user_pw+"&p_no="+p_no;

			
			
		} catch (IOException e) {
			e.printStackTrace();

			request.setAttribute("msg", "리뷰 등록이 실패 되었습니다.");
			request.setAttribute("url", path);
			return "return_loginpage.jsp"; //여기서 alert창 띄우고 바로 로그인 페이지로 자동 이동
		}
		request.setAttribute("msg", "리뷰 등록이 완료 되었습니다.");
		request.setAttribute("url", path);
		return "return_loginpage.jsp"; //여기서 alert창 띄우고 바로 로그인 페이지로 자동 이동
		//return path;

		
	}
	
}
	
	