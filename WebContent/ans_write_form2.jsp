<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
	/******* 페이지 표시 부분 스타일(시작) *****/
	.paging { list-style: none; float: right;}
	.paging li {
		float: left;
		margin-right: 8px;
	}
	.paging li a {
		text-decoration: none;
		display: block;
		padding: 3px 7px;
		font-weight: bold;
		color: #bbb;
	}
	.paging li a:hover {
		border-radius: 50%;
		background-color: #babb3c;
		color: white;
	}
	.paging .disable {
		padding: 3px 7px;
		color: silver;
	}
	.paging .now {
		padding: 3px 7px;
		color: black;
		font-weight: bold;
	}
	 /***********************************************************/
	div {
		display: block;
	}
	
	#writer{
	font-size: 13px;
	}
	
	#content{
		font-size: 13px;
	
	}
	
	.comment ul{
		margin-left: 20px;
	}
	.comment_form_field {
	font-size: 0;
	height: auto;
	width: 70%;
	margin-top:10px;
	margin-bottom: 20px;
	padding: 15px 13px;
	border: 1px solid #dadada;
	position: relative;
	}
	
	.comments_form {
	font-size: 12px;
	min-height: 10px;
	height: auto;
	font-size: 13px;
	line-height: 14px;
	margin: 0px;
	border: 0;
	width: 90%;
	outline: transparent;
	resize: none;
	overflow: hidden;
}

.comment_save_btn {
	float: right;
	font-size: 13px;
	padding: 3px 3px;
	border: 1px solid silver;
	color: #b07c58;
	background-color: white;
	
}

.save_btn_span {
margin-bottom: 10px;
}

.div_total_div {
	float:right;
	height:auto;
	width:95%;
	border: 1px solid silver;
	padding: 10px;
	margin: 20px 10px 20px 10px;

}
.review{
width:80%;
height: auto;
}


.review_cnt {
color: #9e1200;
margin-left: 10px;
margin-bottom: 20px;
}

#img {


width: 100%;
height: 100%;

}

#update_form {
	border: 1px solid #dadada;

}
	
	textarea {
	-webkit-appearance: textarea;
	background-color: white;
	-webkit-rtl-ordering: logical;
	flex-direction: column;
	resize: auto;
	cursor: text;
	white-space: pre-wrap;
	overflow-wrap: break-word;
	border-width: 1px;
	border-style: solid;
	border-color: initial;
	border-image: initial;
	padding: 2px;
}
</style>
<script>

	function save_ans(frm) {
		var user_id = frm.user_id.value;

		if (typeof user_id == "undefined" || user_id == null || user_id == "") {
			alert("로그인해주세요");
			return;
		}
		alert("댓글등록이 완료되었습니다");
		frm.action = "MyCon?type=answer_insert";
		frm.submit();

	}

	function answer_delete(frm) {
		alert("댓글이 삭제되었습니다.");

		frm.action = "MyCon?type=answer_delete";
		frm.submit();
	}

	function update_ok(frm) {
		alert("댓글이 수정되었습니다.");
		frm.action = "MyCon?type=answer_update";
		frm.submit();
		//location.href = "MyCon?type=answer_update&pPage=${pPage }&c_idx={c_idx }&writer=${user_id }&content=&{content }&pwd=${user_pw }";
	}
</script>
</head>
<body>
<div class="div_total_div">
<%-- <img id="review" alt="" src="images/review_cnt">--%>
	<%--댓글 입력 폼 --%>
	<form method="post">
		<input type="hidden" name="user_id" value="${user_id }">		
		<input type="hidden" name="user_pw" value="${user_pw }">		
		<input type="hidden" name="c_writer" value="${user_id }">		
		<input type="hidden" name="p_no" value="${p_no }">		
		<input type="hidden" name="b_idx" value="${b_idx }">
		<div class="review_cnt">
		${c_b_tot }개의 댓글이 있어요~!</div>		
		<div class="comment_form_field">
		<textarea class="comments_form" placeholder="댓글을 작성해 주세요 :)"
			maxlength="200" cols="300" name="c_content"></textarea>
		<input  type="hidden"  name="c_pwd" value="${user_pw }">
		<span class="save_btn_span"><input type="button" class="comment_save_btn" value="등록" onclick="save_ans(this.form)"></span>
		<input type="hidden" name="write_chk" value="chk">
		<input type="hidden" name="cPage" value="${cPage }">
		
		</div>
	</form>
	

	<%--댓글 출력(동적 태그 작성) --%>
	<c:choose>
						<c:when test="${empty b_answers }">
							
						</c:when>
	<c:otherwise>
	<%--<c:forEach var="b_answers" items="${b_answers }">
		 --%>
		 <c:forEach var="i" begin="0" end="${b_ans_cnt - 1 }">
		<div class="comment">
			<form  method="post">
				
				<ul>
				<li><span id="writer"><strong>${b_answers[i].writer }</strong></span></li>
				<li><span id="content"><input type="text" id="txt${i }" readonly="readonly" value= "${b_answers[i].content }"  style="display: ''; height: 15px;"></span>
				<input id="update_form${i }" type="text" name="content" value="${b_answers[i].content }" style="display: none; border: 1px solid #b07c58; height: 15px;"> </li>
				<input type="hidden" id="${i }" value="${i }">
						<c:choose>
						<%--로그인 했을 경우 --%>
						<c:when test="${b_answers[i].writer eq user_id }">
							<li style="padding-right: 0px"><input type="button" id="update${i }" class="btn"
								value="수정" onclick="answer_update(this.id)" style="font-size: 11px; display: '';" >
								<input type="button" id="ok${i }" class="btn"
								value="확인" onclick="update_ok(this.form)" style="font-size: 11px; display:none;" ></li>
							<li style="padding-right: 0px"><input type="button" id="delete${i }" class="btn"
								value="삭제" onclick="answer_delete(this.form)" style="font-size: 11px;"></li>
						</c:when>
						<c:otherwise>
						<li style="padding-right: 0px"><input type="button" id="update${i }" class="btn"
								value="수정" onclick="answer_update(this.id)" style="font-size: 11px; display: none;" >
								<input type="button" id="ok${i }" class="btn"
								value="확인" onclick="update_ok(this.form)" style="font-size: 11px; display:none;" ></li>
							<li style="padding-right: 0px"><input type="button" id="delete${i }" class="btn"
								value="삭제" onclick="answer_delete(this.form)" style="font-size: 11px; display: none"></li>
						</c:otherwise>
					</c:choose>
				
			
	<script>
	function answer_update(frm) {
		/*if(document.getElementById("update${i }").value == "수정"){
			
			document.getElementById('txt${i }').style.display = "none";
			document.getElementById('update_form${i }').style.display = "";
			document.getElementById('ok${i }').style.display = "";
			document.getElementById('update${i }').style.display = "none";
			

			
			} else {
				document.getElementById('update_form${i }').style.display = "none";
				document.getElementById('txt${i }').style.display = "";
				document.getElementById('update${i }').style.display = "";
			}*/
		var idx = frm;
		idx = idx.substring(6,7);
			//alert(idx);
		if(document.getElementById(frm).value == "수정"){
			
			document.getElementById('txt' + idx).style.display = "none";
			document.getElementById('update_form' + idx).style.display = "";
			document.getElementById('ok' + idx).style.display = "";
			document.getElementById('update' + idx).style.display = "none";
			

			
			} else {
				document.getElementById('update_form' + idx).style.display = "none";
				document.getElementById('txt' + idx).style.display = "";
				document.getElementById('update' + idx).style.display = "";
			}
		
	}
</script>
			
				
				</ul>
				
				<input type="hidden" name="content" value="${b_answers[i].content }">
				<input type="hidden" name="writer" value="${b_answers[i].writer }">
				<input type="hidden" name="c_idx" value="${b_answers[i].c_idx }">
				<input type="hidden" name="p_no" value="${b_answers[i].p_no }">
				<input type="hidden" name="pwd" value="${b_answers[i].pwd }"> 
			    <input type="hidden" name="b_idx" value="${b_answers[i].b_idx }">
			    <input type="hidden" name="cPage" value="${cPage }">
			    <input type="hidden" name="p_no" value="${p_no }">
			    <input type="hidden" name="update_chk" value="chk">
			
				</form>
			</div>
		</c:forEach>
	</c:otherwise>
</c:choose>
	
	<div>
			<ol class="paging">
				<%--[이전으로]에 대한 사용여부 처리 --%>
				<c:choose>
					<%-- 사용불가(disable) : 첫번째 블록인 경우 --%>
					<c:when test="${paging.beginPage == 1 }">
						<li class="disable">&lt;</li>
					</c:when>
					<%--사용가능(enable) : 두번째 이상(첫번째 아닌경우) --%>
					<c:otherwise>
						<li><a href="MyCon?type=productOne&cPage=${cPage }&b_idx=${b_idx }&p_no=${p_no }&user_id=${user_id }&user_pw=${user_pw }&pressedPage=${paging.beginPage - 1 }">&lt;</a></li>
					</c:otherwise>
				</c:choose>

				<%-- 블록내에 표시할 페이지 반복처리(시작페이지~끝페이지)--%>
				<c:forEach var="k" begin="${paging.beginPage }" end="${paging.endPage }">
					<c:choose>
						<c:when test="${k == paging.nowPage }">
							<li class="now">${k }</li>
						</c:when>
						<c:otherwise>
							<li><a href="MyCon?type=productOne&cPage=${cPage }&b_idx=${b_idx }&p_no=${p_no }&user_id=${user_id }&user_pw=${user_pw }&pressedPage=${k }">${k }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<%--[다음으로]에 대한 사용여부 처리 --%>
				<c:choose>
					<%--사용불가(disable) : endPage가 전체페이지수 보다 크거나 같으면 --%>
					<c:when test="${paging.endPage >= paging.totalPage }">
						<li class="disable">&gt;</li>
					</c:when>
					<%--사용가능(enable) --%>
					<c:otherwise>
						<li><a href="MyCon?type=productOne&cPage=${cPage }&b_idx=${b_idx }&p_no=${p_no }&user_id=${user_id }&user_pw=${user_pw }&pressedPage=${paging.endPage + 1 }">&gt;</a></li>
					</c:otherwise>
				</c:choose>
			</ol>
		</div>
	</div>
</body>
</html>