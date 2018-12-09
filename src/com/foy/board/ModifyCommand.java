package com.foy.board;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import com.foy.command.Command;
import com.foy.mybatis.DAO;
import com.foy.vo.BoardVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ModifyCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("modify 넘어온다 : ");
		String path = null;
		
		try {

			String filepath = request.getSession().getServletContext().getRealPath("/upload");

			MultipartRequest mr = new MultipartRequest(request, filepath, 10 * 1024 * 1024, "UTF-8",
					new DefaultFileRenamePolicy());
			
			String b_idx = mr.getParameter("b_idx");
		
			// 전달받은 값을 DB에 입력처리

			BoardVO bvo = new BoardVO();

			String p_no = mr.getParameter("p_no");
			String user_id = mr.getParameter("b_writer");
			String user_pw = mr.getParameter("b_pwd");
			String user_grade = mr.getParameter("user_grade");
			String star = mr.getParameter("star");
			String cPage = mr.getParameter("cPage");
			System.out.println("cPage : " + cPage);
			
			bvo.setP_no(p_no);
			bvo.setB_idx(mr.getParameter("b_idx"));
			bvo.setB_subject(mr.getParameter("b_subject"));
			bvo.setB_writer(user_id);
			bvo.setB_content(mr.getParameter("b_content"));
			bvo.setB_pwd(user_pw);
			bvo.setUser_grade(user_grade);
			bvo.setStar(star);
			
			
			String u_file_name = mr.getParameter("b_re_file_name");
			System.out.println("수정파일 변수 이름 : " + u_file_name);
			
			
			System.out.println("수정 사진 : " + mr.getFile("b_re_file_name"));
			System.out.println("수정 사진 : " + mr.getFile(u_file_name));
			// 첨부파일 처리
			if (mr.getFile(u_file_name) != null) {
				bvo.setB_file_name(mr.getFilesystemName(u_file_name));
				bvo.setB_ori_name(mr.getOriginalFileName(u_file_name));
			} else {
				String ori_f_name = mr.getParameter("ori_f_name");
				bvo.setB_file_name(ori_f_name); // 실제저장시 사용된 파일명
				bvo.setB_ori_name(ori_f_name); // 원본 파일명
			}

			System.out.println("modify bvo : " + bvo);
			DAO.b_modify(bvo);

			path = "MyCon?type=productOne&cPage="+cPage+"&b_idx=" + b_idx + "&user_id=" + user_id + "&user_pw=" + user_pw + "&p_no=" + p_no;
			
		} catch (IOException e) {
			e.printStackTrace();
			
			request.setAttribute("msg", "리뷰 수정이 실패 되었습니다.");
			request.setAttribute("url", path);
			return "return_loginpage.jsp"; //여기서 alert창 띄우고 바로 로그인 페이지로 자동 이동
		}
		request.setAttribute("msg", "리뷰 수정이 완료 되었습니다.");
		request.setAttribute("url", path);
		return "return_loginpage.jsp"; //여기서 alert창 띄우고 바로 로그인 페이지로 자동 이동
		//return path;
	}

}
