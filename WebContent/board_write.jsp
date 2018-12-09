<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 입력화면 작성하고 작성된 데이타를 
	write_ok.jsp 페이지로 전달(post 방식)--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
<script>
	function sendData() {
		var firstForm = document.forms[0];		
		
		for (var i=0; i<firstForm.elements.length; i++) {
			
			var pw1 = "${user_pw }";
			var pw2 = firstForm[5].value;
			if(pw1 != pw2){
				alert("비밀번호가 일치하지않습니다.");
				firstForm[5].value = "";
				firstForm[5].focus();
				return;
			}
			
			if (firstForm.elements[i].value.trim() == "") {
				if (i == 4) continue; //파일항목
				alert(firstForm.elements[i].title 
						+ " 입력하세요");
				firstForm.elements[i].focus();
				return;
			}
		}
		firstForm.action = "MyCon?type=b_write";
		firstForm.submit();
	}
	function list_go() {
		location.href = "MyCon?type=bList";
	}
</script>
</head>
<body>

<div id="bbs">
<form action="MyCon?type=b_write" method="post" enctype="multipart/form-data">

	<table>
		<caption>게시판 글쓰기</caption>
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
					<input type="text" name="b_subject" size="45" title="제목">
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="b_writer" size="12" title="이름" value="${user_id }">
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea name="b_content" rows="8" cols="50"></textarea>
				</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td>
					<input type="file" name="b_file_name">
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
					<input type="button" value="저장"
						onclick="sendData()">
					<input type="reset" value="다시작성">
					<input type="button" value="목록"
						onclick="list_go()">
				</td>
			</tr>
		</tbody>
	</table>
</form>
</div>

</body>
</html>
