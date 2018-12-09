<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글수정</title>
<script>

function ans_update(frm) {
	var pwd1 = frm.pwd.value; //새로 입력한 비밀번호
	var pwd2 = "${pwd }";
	if (pwd1 != pwd2) {
		alert("암호가 일치하지 않습니다.");
		frm.pwd.value = "";
		frm.pwd.focus();
		return false;
	}
	frm.action = "MyCon?type=answer_update"; //수정처리작업 페이지로 이동
	frm.submit();
}
</script>
</head>
<body>	
	<form method="post">
		<p>이름 : <input type="text" name="writer" value="${writer }"></p>
		<p>내용 :<textarea name="content" rows="4" cols="55">${content }</textarea></p>
		<p>비밀번호 : <input type="password" name="pwd"></p>
		
		<input type="button" value="수 정" onclick="ans_update(this.form)"> 
		<input type="reset" value="초기화"> 
		
		<input type="hidden" name="c_idx" value="${c_idx }">
		<input type="hidden" name="b_idx" value="${b_idx }"> 
		<input type="hidden" name="update_chk" value="chk">
	</form>
</body>
</html>