<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	request.setCharacterEncoding("UTF-8");

	String b_pwd = request.getParameter("pwd");
	String b_idx = request.getParameter("b_idx");
	
	//EL 사용을 위해 속성 설정
	pageContext.setAttribute("b_pwd", b_pwd);
	pageContext.setAttribute("b_idx", b_idx);
--%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제암호확인</title>
<script>
function del_go(frm) {
	//비밀번호 일치 확인 : 현재페이지 pwd값과 vo의 pwd값 비교
	var DBPwd = "${bvo.b_pwd }"; 
	var inputPwd = frm.pwd.value;
	if (DBPwd == inputPwd) {//암호 일치하는 경우
		//암호 일치하면 delete_ok.jsp 페이지 이동(삭제처리)
		var isDeleteOk = confirm("게시글을  삭제 하시겠습니까?");
		if (isDeleteOk) {
			frm.action = "MyCon?type=b_delete&b_idx=${bvo.b_idx }";
			frm.submit();
		} 
	} else {//암호 다른 경우
		//암호 불일치 : 비밀번호 불일치 메시지 표시 후 현재 페이지
		alert("비밀번호가 일치하지 않습니다. 다시 입력하세요.");
	}		
	frm.pwd.value = "";
	frm.pwd.focus();
}
</script>
</head>
<body>

<form method="post">
	비밀번호 : <input type="password" name="pwd">
	<input type="button" value="삭제"
			onclick="del_go(this.form)">
			
	<input type="hidden" name="delete_chk" value="chk">						
	<input type="hidden" name="b_idx" value="${bvo.b_idx }">
	<input type="hidden" name="p_no" value="${p_no }">
	<input type="hidden" name="user_id" value="${user_id }">
	<input type="hidden" name="user_pw" value="${user_pw }">							
</form>

</body>
</html>