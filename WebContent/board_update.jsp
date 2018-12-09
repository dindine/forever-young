<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정</title>
<script>
	//2. 암호 일치시 DB 데이타 수정, 불일치시 권한없음 메시지
	function save_go(frm) {
		var pwd1 = frm.b_pwd.value; //새로 입력한 비밀번호
		var pwd2 = "${user_pw }";
		if (pwd1 != pwd2) {
			alert("암호가 일치하지 않습니다.");
			frm.b_pwd.value = "";
			frm.b_pwd.focus();
			return false;
		}
		
		//수정처리작업 페이지로 이동
		frm.action = "MyCon?type=b_modify"; 
		frm.submit();
	}
	
	function list_go(frm) {
		frm.action = "MyCon?type=productOne";
		frm.submit();
	}
</script>
</head>
<body>

	<div id="bbs">
	<form action="MyCon?type=b_modify" method="post" enctype="multipart/form-data">
		<table>
			<caption>글 수정하기</caption>
			<tbody>
			<tr>
				<th>상품번호</th>
				<td>
					<input type="text" name="p_no" size="45" title="상품번호" value="${p_no }">
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="b_subject" size="45" title="제목" value="${bvo.b_subject }">
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="b_writer" size="12" title="이름" value="${bvo.b_writer }" readonly>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea name="b_content" rows="8" cols="50" >${bvo.b_content }</textarea>
				</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td>
					<input type="file" name="b_file_name" value=${bvo.b_file_name }>
				</td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td>
					<input type="password" name="b_pwd" size="12">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="수정"
						onclick="save_go(this.form)">
					<input type="reset" value="다시작성">
					<input type="button" value="목록"
						onclick="list_go()">
						<input type="hidden" name="b_idx" value="${bvo.b_idx }">
						<input type="hidden" name="p_no" value="${p_no }">
						<input type="hidden" name="user_id" value="${user_id }">
						<input type="hidden" name="user_pw" value="${user_pw }">
				</td>
			</tr>
		</tbody>
			
		</table>
	</form>
	</div>
	

</body>
</html>



