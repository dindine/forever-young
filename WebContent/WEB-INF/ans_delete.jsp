<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제암호확인</title>
<script>
	function del_go() {
		var frmDel = document.frm;
		var myPwd = "${pwd }";
				
		//비밀번호 일치여부 확인
		if (frmDel.pwd.value == myPwd) {
			//비밀번호 일치하는 경우 
			var isDelete = confirm("정말 삭제 할까요?");
			if (isDelete) {
				frmDel.action = "MyCon?type=answer_delete";
				frmDel.submit();
			} else {
				history.back();
			}
		} else {
			//비밀번호 불일치
			alert("비밀번호가 일치하지 않습니다.");
			frmDel.pwd.value = "";
			frmDel.pwd.focus();
			return;
		}
	}
</script>
</head>
<body>

<form method="post" name="frm">
	비밀번호 : <input type="password" name="pwd">
	<input type="button" value="삭제" onclick="del_go()">
	
	<input type="hidden" name="c_idx" value="${c_idx }"> 
	<input type="hidden" name="delete_chk" value="chk"> 
							
</form>

</body>
</html>