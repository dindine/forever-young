<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 파일 다운로드 처리 --%>
<%
	//한글처리 UTF-8
	request.setCharacterEncoding("utf-8");

	String path = "/upload";
	String name = request.getParameter("name");
	
	//실제 파일이 저장된 경로 확인
	String r_path = this.getServletContext().getRealPath(path);
	System.out.println("r_path(파일저장위치) + " + r_path);
	
	//다운로드 받을 수 있도록 클라이언트 응답 문서타입 변경
	response.setContentType("application/x-msdownload");
	//클라이언트의 헤더정보를 첨부파일이 있는 것으로 변경
	response.setHeader("Content-Disposition", 
			"attachment;filename="+ name);
	
	/* **** 실제 입출력 스트림 하기 *****/
	//물리적으로 실제파일을 복사하는 작업 구현(바이트계열 처리)
	//원본파일에서 읽어서 대상파일에 쓰기
	File file = new File(r_path + "/" + name);
	
	//input, output 스트림(바이트계열) 객체 생성
	FileInputStream fis = null;
	BufferedInputStream bis = null;
	
	BufferedOutputStream bos = null;
	
	if (file.isFile()) { //파일인 경우 복사진행
		try {
			//(서버위치에 있는) 파일을 읽기 위한 처리
			fis = new FileInputStream(file);
			bis = new BufferedInputStream(fis);
			
			//파일 쓰기 위한 객체 생성
			bos = new BufferedOutputStream(response.getOutputStream());
			
			int b;
			while ((b = bis.read()) != -1) {
				bos.write(b);
			}
			bos.flush();
			
			//JSP 출력스트림과 서블릿 출력스트림 겹쳐서
			//오류 발생하는 경우에 대한 문제 해결
			out.clear();
			out = pageContext.pushBody();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			bos.close();
			bis.close();
			fis.close();
		}
	}
%>












