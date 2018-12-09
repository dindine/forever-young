
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::: 게시판 :::</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>


/******* 페이지 표시 부분 스타일(시작) *****/
.paging {
	list-style: none;
	margin-left: 400px;
}

.paging li {
	float: left;
	margin-right: 8px;
}

.paging li a {
	text-decoration: none;
	display: block;
	padding: 3px 7px;
	font-weight: bold;
	color: black;
}

.paging li a:hover {

	color: #9e1200;
}

.paging .disable {
	padding: 3px 7px;
	color: silver;
}

#now {
	    padding: 3px 7px;
    color: black;
    font-weight: bold;
}

/********************************************/



body {
    font-family: '돋움', Dotum, Helvetica, 'Apple SD Gothic Neo', Sans-serif;
    background-color: transparent;
    font-size: 15px;
    
}

div {
	display: block;
}


body, div, ul, li, h1, h2, h3, h4, h5, h6, form, fieldset, input,
	textarea, button, p, th, td {
	margin: 0;
	padding: 0;
}

#hrsize {
	width: 100%;
	margin-bottom: 30px;
}

#hrslim {
	width: 100%;
	margin-bottom: 30px;
	color: #FFBB00;
}


.review {
/*float: right;
margin-right: 100px;*/

width: 100%;
margin-left: 100px;
}
.review_form__message_field {
	font-size: 0;
	height: auto;
	margin-bottom: 8px;
	padding: 15px 13px;
	border: 1px solid #dadada;
	position: relative;
}

.review_form__message {
	font-size: 12px;
}

.review_form__message {
	min-height: 100px;
	height: auto;
	font-size: 14px;
	line-height: 16px;
	margin: 0px;
	border: 0;
	width: 100%;
	outline: transparent;
	resize: none;
	overflow: hidden;
	
}

.reviewbtnlist {
	float: right;
}

.review_form__add_image_container {
	position: relative;
	left: 0;
	width: 204px;
	height: 33px;
	border: 1px solid #dadada;
	margin-right: 5px;
	text-align: center;
}

.select_star {
	position: relative;
	left: 0;
	width: 204px;
	height: 33px;
	border: 1px solid #dadada;
	margin-right: 5px;
	text-align: center;
}

.select {
 width:100%;
 height: 100%;
 text-align: center;
font-size: 15px;
font-weight: strong;
}

.opt {
text-align: center;
font-size: 15px;
font-weight: strong;
}


.star {
	margin: 30px 20px 30px 40px;
color: #9e1200;
}

.add_image {
	position: absolute;
	color: #8f8f8f;
	top: 5px;
	left: 80px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	font-weight: bold;
	font-size: 15px;
	text-align: left;
	padding: 5px 1px 1px 1px;
}

.review_form__add_image_icon {
	display: inline-block;
	*display: inline;
	position: absolute;
	left: 15px;
	top: 3px;
	padding: 1px 1px 0px 1px;
}

.add_review_btn_continer {
	background-color:black;
	position: relative;
	left: 0;
	width: 204px;
	height: 33px;
	border: 1px solid #dadada;
	margin-right: 5px;
	text-align: center;
}

.add_review {
	width: 100%;
	height: 100%;
	
	display: inline-block;
	*display: inline;
	position: relative;
}

.headerstyle {
	font-size: 33px;
	font-weight: strong;
	color: #8f8f8f;
	margin-top: 80px;
}

/*.review_info_con {
	width: 60%;
}*/
.review_title_container {
	margin-top: 40px;
	
}
.review_title {
	margin-left: 10px;
}

.review_content {
	width: 100%;
	margin: 30px 0px 30px 10px;
}

.review_image {
	width:200px;
	margin: 30px 200px 0px 40px;

}

.btn {
	padding: 3px 7px;
	border: 1px solid silver;
	color: #b07c58;
	background-color: white;
}

.btn_list {
	list-style: none;
	float: right;
	margin-bottom: 30px;
}

.btn_list_container {
	width: 100%;
	margin-top: 50px;
}

.customer_info {
 width: 50%;
 margin-top: 20px;
	margin-left: 160px;
    margin-bottom: 20px;
    margin-right: 0px;}


.review_info_list {
	width: 60%;
}

.bvo_list {
	list-style: none;
	 margin: 10px 0px 50px 40px;
}

#comment {
	margin-top: 100px;
}

.user_info {
	padding-top: 20px;
	margin-bottom: 10px;
	color: gray;
}

.pwd_form {
 	
}
.pwd_div {
	clear:right;
	float: right;
 	border: 1px solid #dadada;
	width: 35%;
	margin-right: 10px;
	left: 400px;
	color: #b07c58;
	padding: 5px;
}

.ok_btn {
 	border: 1px solid #dadada;
	background: transparent;
	color: #b07c58;
}

.yesorno {
color: #b07c58;
 width:55%;
 float:left;
 font-family: "맑은 고딕", "Malgun Gothic";
}

.yesorno > li {
	margin-left: 1px;
}

button, input {
	border: 0;
}

element.style {
	cursor: pointer;
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

/******* 페이지 표시 부분 스타일(종료) ***/
</style>
<script>
	function write_go(frm) {
		//frm.action = "write.jsp?&user_id=${user_id }&user_pw=${user_pw }";
		frm.action = "board_write.jsp";
		frm.submit();
	}
	
	function sendData(frm) {
		var user_id = frm.user_id.value;
		
		if (typeof user_id == "undefined" || user_id == null || user_id == ""){
			alert("로그인해주세요");
			return;
		}
		
		var content = frm.b_content.value;
		if (content.length < 10){
			alert("10자 이상 작성해 주세요!");
			frm.b_content.value = content;
			frm.b_content.focus();
			return;
		}
		
		frm.action="MyCon?type=b_write";
		frm.submit();
		
	}
	
	
	function show_comment(id) {
		var id;
		var comm_id = id.substring(8,9);
		if(document.getElementById(id).value == "댓글 보기"){
			
		document.getElementById('comment'+comm_id).style.display = "";
		document.getElementById(id).value = "댓글 접기";
		} else {
			document.getElementById('comment'+comm_id).style.display = "none";
			document.getElementById(id).value = "댓글 보기";
		}
	}
	
	function modify_go(id) {
		var id;
		var comm_id = id.substring(13,14);
		if(document.getElementById(id).value == "게시글 수정"){
			
			document.getElementById('reviewbtnlist'+comm_id).style.display = "";
			document.getElementById(id).value = "수정중";
			} else {
				document.getElementById('reviewbtnlist'+comm_id).style.display = "none";
				document.getElementById(id).value = "게시글 수정";
			}
		
	}
	
	function delete_go(id) {
		var id;
		var comm_id = id.substring(13,14);
		if(document.getElementById(id).value == "게시글 삭제"){
			
			document.getElementById('delete_review_form'+comm_id).style.display = "";
			document.getElementById(id).value = "삭제중";
			} else {
				document.getElementById('delete_review_form'+comm_id).style.display = "none";
				document.getElementById(id).value = "게시글 삭제";
			}
		
	}
	
	function del_go(frm) {
		//비밀번호 일치 확인 : 현재페이지 pwd값과 vo의 pwd값 비교
		var DBPwd = "${user_pw }"; 
		var inputPwd = frm.pwd.value;
		if (DBPwd == inputPwd) {//암호 일치하는 경우
			//암호 일치하면 delete_ok.jsp 페이지 이동(삭제처리)
			var isDeleteOk = confirm("게시글을  삭제 하시겠습니까?");
			if (isDeleteOk) {
				frm.action = "MyCon?type=b_delete";
				frm.submit();
			} 
		} else {//암호 다른 경우
			//암호 불일치 : 비밀번호 불일치 메시지 표시 후 현재 페이지
			alert("비밀번호가 일치하지 않습니다. 다시 입력하세요.");
		}		
		frm.pwd.value = "";
		frm.pwd.focus();
	}
	
	function updateData(frm) {
		//수정처리작업 페이지로 이동
		frm.action = "MyCon?type=b_modify"; 
		frm.submit();
		
	}
	
</script>


</head>
<body>
	<form method="post" enctype="multipart/form-data">
	<hr id="hrsize">
	<div class="review_form__message_field">
		<textarea class="review_form__message" placeholder="10자 이상 작성하세요" 
			maxlength="2000" cols="3000" name="b_content" id="review_message"></textarea>
			<div class="review_image">
						<img id="imagee" src="#" width='120px' height="115px"style="display: none;">
			</div>
			
	</div>
			   <span id="counter" style="float: right; color: silver; margin-bottom: 10px;">###</span>

		<script type="text/javascript">
		
		$(function() {
		      $('#review_message').keyup(function (e){
		          var content = $(this).val();
		          $(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
		          $('#counter').html(content.length + '자');
		      });
		      $('#review_message').keyup();
		});
		
		
			function readURL2(input) {

				if (input.files && input.files[0]) {
					var reader = new FileReader();
					reader.onload = function(e) {
						$('#imagee').css('display','');
						$('#imagee').attr('src', e.target.result);
						//$('#imagee').style.width = '120px';
						//$('#imagee').style.height = '115px';
					}
					reader.readAsDataURL(input.files[0]);

				}
			}
			$("#b_file_name1").change(function() {
				readURL(this);
			});
		</script>

		<div>
		<ul class="reviewbtnlist">
			<li>
				<div class="review_form__add_image_container">
					<span class="review_form__add_image_icon">
					<input type=file name='b_file_name' id='b_file_name1' style='display: none;' onchange="readURL2(this)"> 
					<input type='text' name='file2' id='file2' style='display: none;'> 
					<img alt="" src="images/camera.PNG" onclick='document.all.b_file_name.click(); document.all.file2.value=document.all.b_file_name.value'></span>
					<div class="add_image">+ 사진추가</div>
				</div>
			</li>
			
			<li>
			<div class="select_star">
				<select class="select" name="star">
					<option class="opt"><span style="color: #9e1200";>★★★★★</span> - 아주좋아요</option>
					<option class="opt"><span class="star">★★★★☆</span> - 맘에 들어요</option>
					<option class="opt"><span class="star">★★★☆☆</span> - 보통이에요</option>
					<option class="opt"><span class="star">★★☆☆☆</span> - 그냥 그래요</option>
					<option class="opt"><span class="star">★☆☆☆☆</span> - 별로야별로!</option>
				</select>
			</div>
			</li>

			<li>
				<div id="add_review_btn_continer">
					<input type="hidden" name="user_id" value="${user_id }"> <input
					type="hidden" name="user_pw" value="${user_pw }"> 
					<input type="hidden" name="p_no" value="${p_no }">
					<input type="hidden" name="cPage" value="${cPage }">
					<input type="hidden" name="b_writer" value="${user_id }">
					<input type="hidden" name="b_pwd" value="${user_pw }">
					<input type="hidden" name="user_grade" value="${user_grade }">
					<input type="hidden" name="cPage" value="${cPage}">
					<input type="image" class="add_review" alt="" src="images/addreview.PNG" onclick="sendData(this.form)">
				</div>
			</li>
		</ul>
	</div>
</form>










	<div id="board">
		
			<h3 class="headerstyle"><strong> R E V I E W </strong></h3>
			<hr id="hrsize">
			
			<div class="review">
					<c:choose>
						<c:when test="${empty list }">
							<div>
								<h2>현재 등록된 게시글이 없습니다.</h2>
							</div>
						</c:when>
					<c:otherwise>
						<%-- <c:forEach var="bvo" items="${list }"> --%>
						<c:forEach var="i" begin="0" end="${p_b_totalcount - 1}">
							
							<ul class="bvo_list">
								<li class="review_info_list">
									<div class="review_title_container">
										<span class="review_title">${list[i].b_write_date.substring(0, 10) }에 작성한 </span>
										<span class="review_title"><strong  style=" color:#9e1200">${list[i].b_writer }</strong> 님의 리뷰예요~♥</span>
										<div class="review_title" style="margin-top: 13px; color:#9e1200"><strong>${list[i].star }</strong>
										<div class="review_title" style="margin-top: 13px; color:gray">(<strong  style=" color:#b07c58">${list[i].tot_cnt() }</strong> 명 중 <b  style=" color:#b07c58"> ${list[i].good }</b> 명이 이 리뷰가 도움이 된다고 선택 했습니다 ^b^)</div>
										</div>
									</div>
									<div class="review_content">
										${list[i].b_content }
										<%--<a href="MyCon?type=bOne&b_idx=${bvo.b_idx }&cPage=${pvo.nowPage}&p_no=${p_no }&user_id=${user_id }&user_pw=${user_pw }">${bvo.b_content }</a> --%>
									</div>
									<c:choose>
									<c:when test="${null ne list[i].b_ori_name }">
									<div class="review_image">
										<img src="images/${list[i].b_ori_name }" width="120px"
											height="115px">
									</div>
									</c:when>
									</c:choose>
								</li>

								<li class="customer_info_list">
									<div class="customer_info">
										<span class="user_info">작성자</span><br> <div  style="margin-top: 7px;">${list[i].b_writer }</div>
										<br>
										<hr class="hrstyle">
										<br><span class="user_info">회원등급</span><br> <div style="margin-top: 7px;">${list[i].user_grade }</div><br><br>
									</div>
								</li>
							</ul>


							<!-- 게시글 수정 -->
							<div id="reviewbtnlist${i }" style="display: none">
								<form method="post" enctype="multipart/form-data">
									<hr id="hrsize">
									<div class="review_form__message_field">
										<textarea class="review_form__message"
											placeholder="20자 이상 작성하세요" maxlength="2000" cols="3000"
											name="b_content" id="review_message">${list[i].b_content }
											</textarea>
											
											<br>
											<c:choose>
											<c:when test="${null ne list[i].b_ori_name }">
											<div class="review_image">
												<img src="images/${list[i].b_ori_name }" width="120px"
											height="115px" id="imagee${i }">
											
									</div>
									
									
									</c:when>
									
									</c:choose>
									
									</div>
									<div id="counter_re" style="float: right; color: silver; margin-bottom: 10px;">###</div>
									
								<script type="text/javascript">
								
								$(function() {
								      $('.review_form__message').keyup(function (e){
								          var content = $(this).val();
								          $(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
								          $('#counter_re').html(content.length + '자');
								      });
								      $('.review_form__message').keyup();
								});
								
									function readURL(input) {

										if (input.files && input.files[0]) {
											var reader = new FileReader();
											reader.onload = function(e) {
											
												$('#imagee${i }').css('display','');
												$('#imagee${i }').attr('src',
														e.target.result);
											}
											reader.readAsDataURL(input.files[0]);
										}
									}
									$("#b_re_file_name${i }").change(function() {
										readURL(this);
									});
								</script>

								<div>
										<ul>
											<li>
												<div class="review_form__add_image_container">
													<span class="review_form__add_image_icon"> <input
														type=file id="b_re_file_name${i }" name="b_re_file_name${i }" style='display: none;' value="${list[i].b_ori_name }" onchange="readURL(this)">
														<input type='text' id='file${i }' name='file${i }'
														style='display: none;'> <img alt=""
														src="images/camera.PNG"
														onclick="document.getElementById('b_re_file_name${i }').click(); 
														document.document.getElementById('file${i }').value=document.document.getElementById('b_re_file_name${i }').value;
														"></span>
													<div class="add_image">+ 사진추가</div>
												</div>
											</li>

											<li>
												<div class="select_star">
													<select class="select" name="star">
														<option class="opt"><span style="color: #9e1200";>★★★★★</span>
															- 아주좋아요
														</option>
														<option class="opt"><span class="star">★★★★☆</span>
															- 맘에 들어요
														</option>
														<option class="opt"><span class="star">★★★☆☆</span>
															- 보통이에요
														</option>
														<option class="opt"><span class="star">★★☆☆☆</span>
															- 그냥 그래요
														</option>
														<option class="opt"><span class="star">★☆☆☆☆</span>
															- 별로야별로!
														</option>
													</select>
												</div>
											</li>

											<li>
												<div id="add_review_btn_continer">
													<input type="hidden" name="cPage" value="${cPage}">
												
													<input type="hidden" name="user_id" value="${user_id }">
													<input type="hidden" name="user_pw" value="${user_pw }">
													<input type="hidden" name="p_no" value="${list[i].p_no }">
													<input type="hidden" name="b_idx" value="${list[i].b_idx }">
													<input type="hidden" name="ori_f_name" value="${list[i].b_ori_name }">
													<input type="hidden" name="b_writer" value="${user_id }">
													<input type="hidden" name="b_re_file_name" value="b_re_file_name${i }">
													
													<input type="hidden" name="b_pwd" value="${user_pw }">
													<input type="hidden" name="user_grade"
														value="${list[i].user_grade }"> <input type="image"
														class="add_review" alt="" src="images/addreview.PNG"
														onclick="updateData(this.form)">
												</div>
											</li>
										</ul>
									</div>
								</form>
							</div>
							
							<!-- 게시글 삭제 -->
						<div class="pwd_div" id="delete_review_form${i }"
							style="display: none">
							<form id="pwd_form" method="post">
								비밀번호 : <input type="password" name="pwd" size="20"> 
								<input type="hidden" name="cPage" value="${cPage}">
								<input
									type="hidden" name="delete_chk" value="chk"> <input
									type="hidden" name="user_id" value="${user_id }"> <input
									type="hidden" name="user_pw" value="${user_pw }"> <input
									type="hidden" name="p_no" value="${list[i].p_no }"> <input
									type="hidden" name="b_idx" value="${list[i].b_idx }"> <input
									type="hidden" name="b_writer" value="${user_id }"> <input
									type="hidden" name="b_pwd" value="${user_pw }"> <input
									class="ok_btn" type="button" value="확인"
									onclick="del_go(this.form)">
							</form>
						</div>

						<div class="btn_list_container">
							<form method="post" id="frm_read">
							<ul class="yesorno">
							    
								<li style="margin-left:15px; margin-top: 5px;">이 리뷰가 도움이 됐나요~?</li>
								<li>

								<img  alt="" class="like"  id="like_btn" src="images/ok.png" style="margin-top: 2px;"  
								onclick="var n_cnt = Number(document.getElementById('no_cnt1${i }').value);
										var g_cnt = Number(document.getElementById('like_cnt${i }').value);
										g_cnt++;
										document.getElementById('like_cnt${i }').value = g_cnt;
										javascript:location.href = 'MyCon?type=yesorno&like_cnt='+g_cnt+'&no_cnt='+n_cnt+'&b_idx=${list[i].b_idx }&user_id=${user_id }&user_pw=${user_pw }&cPage=${cPage }&p_no=${p_no }'">
								<input type="text" size="3" name="like_cnt" id="like_cnt${i }" value="${list[i].good }" style="color: #ee782f"></li>

								<li><img id="dislike" alt="" class="like" src="images/no.png" style="margin-top: 4px" 
										onclick="var n_cnt = Number(document.getElementById('no_cnt1${i }').value);
										var g_cnt = Number(document.getElementById('like_cnt${i }').value);
										n_cnt++;
										document.getElementById('no_cnt1${i }').value = n_cnt;
										javascript:location.href = 'MyCon?type=yesorno&like_cnt='+g_cnt+'&no_cnt='+n_cnt+'&b_idx=${list[i].b_idx }&user_id=${user_id }&user_pw=${user_pw }&cPage=${cPage }&p_no=${p_no }'">
								<input type="text" size="3" id = "no_cnt1${i }" name="no_cnt" readonly="readonly" style="color: #babb3c" value="${list[i].bad }">
								
								<input type="hidden"  id = "b_idx" name="b_idx" value="${list[i].b_idx }">
								<input type="hidden"  id = "user_id" name="user_id" value="${user_id }">
								<input type="hidden"  id = "user_pw" name="user_pw" value="${user_pw }">
								<input type="hidden"  id = "cPage" name="cPage" value="${cPage }">
								<input type="hidden"  id = "p_no" name="p_no" value="${p_no }">
								
								
								</li>
									
							</ul>					
							</form>
								<ul class="btn_list">
									
									
									
									
									
									<c:choose>
										<%--로그인 했을 경우 --%>
										<c:when test="${list[i].b_writer eq user_id }">
											<li><input type="button" id="update_review${i }" class="btn" value="게시글 수정"
												onclick="modify_go(this.id)"></li>
											<li><input type="button" id="delete_review${i }" class="btn" value="게시글 삭제"
												onclick="delete_go(this.id)"></li>
										</c:when>
									</c:choose>

									<li>
									<input type="button" id="show_btn${i }" class="btn" name="show" value="댓글 접기"
										onclick="show_comment(this.id)">
									</li>
								</ul>
							</div>


							<div id="comment${i }"  style="display:">
								<c:import
									url="MyCon?type=anwser_list&cPage=${cPage }&p_no=${list[i].p_no }&b_idx=${list[i].b_idx }&user_id=${user_id }&user_pw=${user_pw }">
								</c:import>
							</div>


							<hr id="hrslim">

						</c:forEach>
					</c:otherwise>
				</c:choose>


			<div class="botton_paging">
				<%-- <tr> 
						<td colspan="4"> --%>
				<ol class="paging">
					<%--[이전으로]에 대한 사용여부 처리 --%>
					<c:choose>
						<%-- 사용불가(disable) : 첫번째 블록인 경우 --%>
						<c:when test="${pvo.beginPage == 1 }">
							<li class="disable"> <strong>&lt;</strong></li>
						</c:when>
						<%--사용가능(enable) : 두번째 이상(첫번째 아닌경우) --%>
						<c:otherwise>
							<%-- <li><a
											href="MyCon?type=bList&cPage=${pvo.beginPage - 1 }&p_no=${p_no }&user_id=${user_id }&user_pw=${user_pw }">이전으로</a>
										</li>--%>
							<li><a
								href="MyCon?type=productOne&cPage=${pvo.beginPage - 1 }&p_no=${p_no }&user_id=${user_id }&user_pw=${user_pw }"> <strong>&lt;</strong></a>
							</li>
						</c:otherwise>
					</c:choose>

					<%-- 블록내에 표시할 페이지 반복처리(시작페이지~끝페이지)--%>
					<c:forEach var="k" begin="${pvo.beginPage }" end="${pvo.endPage }">
						<c:choose>
							<c:when test="${k == pvo.nowPage }">
								<li id="now">${k }</li>
							</c:when>
							<c:otherwise>
								<%-- <li><a href="MyCon?type=bList&cPage=${k }&p_no=${p_no }&user_id=${user_id }&user_pw=${user_pw }">${k }</a></li>
											--%>
								<li><a
									href="MyCon?type=productOne&cPage=${k }&p_no=${p_no }&user_id=${user_id }&user_pw=${user_pw }">${k }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<%--[다음으로]에 대한 사용여부 처리 --%>
					<c:choose>
						<%--사용불가(disable) : endPage가 전체페이지수 보다 크거나 같으면 --%>
						<c:when test="${pvo.endPage >= pvo.totalPage }">
							<li class="disable"> <strong>&gt;</strong></li>
						</c:when>
						<%--사용가능(enable) --%>
						<c:otherwise>
							<%-- <li><a href="MyCon?type=bList&p_no=${p_no }&user_id=${user_id }&user_pw=${user_pw }&cPage=${pvo.endPage + 1 }">다음으로</a>
										--%>
							<li><a
								href="MyCon?type=productOne&p_no=${p_no }&user_id=${user_id }&user_pw=${user_pw }&cPage=${pvo.endPage + 1 }">  <strong>&gt;</strong> </a>
							</li>
						</c:otherwise>
					</c:choose>
				</ol>
		
				<input type="hidden" name="user_id" value="${user_id }"> <input
					type="hidden" name="user_pw" value="${user_pw }"> <input
					type="hidden" name="p_no" value="${p_no }">
			</div>
	</div>
	

</body>
</html>












