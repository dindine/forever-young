
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- 전달받은 파라미터 값 b_idx, cPage
	1. 게시글의 조회수 1 증가
	2. 게시글(b_idx) 정보 조회 후 화면 표시
	3. 게시글(b_idx)에 딸린 댓글 있으면 화면에 표시
--%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<style>
#bbs table {
	width: 580px;
	margin-left: 10px;
	border: 1px solid black;
	border-collapse: collapse;
	font-size: 14px;
}

#bbs table caption {
	font-size: 20px;
	font-weight: bold;
	margin-bottom: 10px;
}

#bbs table th {
	text-align: center;
	border: 1px solid black;
	padding: 4px 10px;
	width: 30%;
}

#bbs table td {
	text-align: left;
	border: 1px solid black;
	padding: 4px 10px;
}
</style>
<script>
	function modify_go() {
		document.frm.action = "board_update.jsp";
		document.frm.submit();
	}
	function delete_go() {
		document.frm.action = "board_delete.jsp";
		document.frm.submit();
	}
	function list_go() {
		var p_no = ${p_no };
		document.frm.action = "MyCon?type=bList&p_no=${p_no }";
		document.frm.submit();
	}
</script>
</head>
<body>

	<div id="bbs">
		<%--게시글 내용 표시 --%>
		<form method="post" action="MyCon?type=bOne" name="frm">
			<table>
				<caption>상세보기</caption>
				<tbody>
					<tr>
						<th>제목</th>
						<td>${bvo.b_subject }</td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td><c:if test="${empty bvo.b_file_name }">
						첨부파일 없음
					</c:if> <c:if test="${not empty bvo.b_file_name }">
								<a href="download.jsp?f_name=${bvo.b_file_name }">${bvo.b_file_name }</a>
							</c:if></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>${bvo.b_writer }</td>
					</tr>
					<tr>
						<th>내용</th>
						<td><pre>${bvo.b_content }</pre></td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2"><input type="button" value="게시글 수정"
							onclick="modify_go()"> <input type="button"
							value="게시글 삭제" onclick="delete_go()"> <input
							type="button" value="목록" onclick="javascript:location.href='MyCon?type=productOne&p_no=${p_no }'"> <input
							type="hidden" name="cPage" value="${cPage }"> <input
							type="hidden" name="pwd" value="${bvo.b_pwd }"> <input
							type="hidden" name="subject" value="${bvo.b_subject }"> <input
							type="hidden" name="writer" value="${bvo.b_writer }"> <input
							type="hidden" name="content" value="${bvo.b_content }"> <input
							type="hidden" name="file_name" value="${bvo.b_file_name }">
							<input type="hidden" name="p_no" value="${p_no }"> 
							<input type="hidden" name="b_idx" value="${bvo.b_idx }">
							<input type="hidden" name="user_id" value="${user_id }">
							<input type="hidden" name="user_pw" value="${user_pw }">
							</td>
					</tr>
				</tfoot>
			</table>
			<c:import url="MyCon?type=anwser_list&cPage=${cPage }&p_no=${p_no }&b_idx=${bvo.b_idx }&c_page=${cPage }&user_id=${user_id }&user_pw=${user_pw }">
			</c:import>
			
		</form>
		<hr>
	</div>
	
</body>
</html>








