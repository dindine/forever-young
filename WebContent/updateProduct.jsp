<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/theme.css"></link>
<link rel="shortcut icon" type="image/x-icon" href="images/title.png">
<script>
	var arrInput = new Array(0);
	var arrInputValue = new Array(0);

	function addInput() {//옵션 텍스트 필드 추가
		var cnt = ${cnt + 1 };
		arrInput.push(arrInput.length + cnt);
		arrInputValue.push("");
		display();
	}

	function display() { //옵션 텍스트박스 화면 출력
		document.getElementById('opt').innerHTML = "";
		for (intI = 0; intI < arrInput.length; intI++) {
			document.getElementById('opt').innerHTML += createInput(
					arrInput[intI], arrInputValue[intI]);
		}
	}

	function saveValue(intId, strValue) {// 추가되는 텍스트 박스의 값 저장
		arrInputValue[intId] = strValue;
	}

	function createInput(id, value) { //옵션 텍스트 태그 추가
		return "<input type='text' name='opt" + id
		+ "' onChange='javascript:saveValue(" + id
		+ ",this.value)' value='" + value + "'><br>";
	}

	function deleteInput() { //옵션 텍스트 필드 삭제
		if (arrInput.length > 0) {
			arrInput.pop();
			arrInputValue.pop();
		}
		display();
	}

	function list_go() {
		location.href = "MyCon?type=productList";
	}

	function sendData(frm) {
		//form에 name속성을 지정안하면, document에서 form들을 배열형태로 찾는데 첫번째 폼을 찾겠다!
		for (var i = 0; i < frm.elements.length; i++) {
			if (frm.elements[i].value.trim() == "") {
				if (i == 0) continue; // 파일첨부는 안해도 입력되도록 처리!
				if (i >= 12) continue; // 파일첨부는 안해도 입력되도록 처리!
				alert(frm.elements[i].name  +"를 입력하세요"); //각 입력칸에 비어있는곳이 있으면 alert창을 띄운다.
				frm.elements[i].focus();
				return;

			}
		}
		frm.action = "MyCon?type=updateProduct";
		frm.submit();
	}
</script>
<script> 
function alert_login() {
	 alert("로그인후 이용가능합니다!");
	
}
</script>
<script>
	function go_search(frm) {
		frm.action = "MyCon?type=product_search";
		frm.submit();
	}
</script>

<script>
	$(function() {
		$(window).scroll(function() {
			if ($(this).scrollTop() > 500) {
				$('#MOVE_TOP_BTN').fadeIn();
			} else {
				$('#MOVE_TOP_BTN').fadeOut();
			}
		});

		$("#MOVE_TOP_BTN").click(function() {
			$('html, body').animate({
				scrollTop : 0
			}, 400);
			return false;
		});
	});
</script>
<script>
$(document).ready(function(){ 
	var fileTarget = $('.filebox .upload-hidden'); 
	fileTarget.on('change', function(){ // 값이 변경되면
	if(window.FileReader){ // modern browser 
		var filename = $(this)[0].files[0].name; 
	} else { // old IE 
		var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
	} 
	// 추출한 파일명 삽입 
	$(this).siblings('.upload-name').val(filename); 
	}); 
	//preview image 
	var imgTarget = $('.preview-image .upload-hidden'); 
	imgTarget.on('change', function(){ 
		var parent = $(this).parent(); 
		parent.children('.upload-display').remove(); if(window.FileReader){ //image 파일만
			if (!$(this)[0].files[0].type.match(/image\'//')) return;
		var reader = new FileReader();
		reader.onload = function(e){ 
			var src = e.target.result; 
			parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap">
			<img src="'+src+'" class="upload-thumb"></div></div>'); } 
		reader.readAsDataURL($(this)[0].files[0]); 
		} else { 
			$(this)[0].select();
			$(this)[0].blur(); 
			var imgSrc = document.selection.createRange().text; 
			parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap">
			<img class="upload-thumb"></div></div>'); var img = $(this).siblings('.upload-display').find('img'); 
			img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")"; } });

});


</script>
</head>
<style>
#pro {
	width: 500px;
	margin: 0 auto;
	border: 2px solid #ee782f;
}

#pro li {
	text-align: left;
	padding: 7px;
	list-style: none;
}

h1 {
	text-align: center;
}

#txt {
	text-align: center;
	padding: 7px 20px;
}

#button {
	width: 90px;
	background-color: #ee782f;
	border: none;
	color: #fff;
	padding: 10px 0px ;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 12px;
	margin: 7px;
	cursor: pointer;
	height: 40px;
}
#button_add_del{
	width: 50px;
	background-color: #ee782f;
	border: none;
	color: #fff;
	padding: 10px 0px ;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 8px;
	margin: 7px;
	cursor: pointer;
	
}
#txt_file {
	width: 80px;
	background-color: #ee782f;
	border: none;
	color: #fff;
	padding: 15px 0;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	margin: 7px;
	cursor: pointer;
	height: 50px;
}

/* imaged preview */
.filebox .upload-display { /* 이미지가 표시될 지역 */
	margin-bottom: 5px;
}

@media ( min-width : 768px) {
	.filebox .upload-display {
		display: inline-block;
		margin-right: 5px;
		margin-bottom: 0;
	}
}

.filebox .upload-thumb-wrap { /* 추가될 이미지를 감싸는 요소 */
	display: inline-block;
	width: 54px;
	padding: 2px;
	vertical-align: middle;
	border: 1px solid #ddd;
	border-radius: 5px;
	background-color: #fff;
}

.filebox .upload-display img { /* 추가될 이미지 */
	display: block;
	max-width: 100%;
	width: 100% \9;
	height: auto;
}
</style>
<jsp:useBean id="optvo" class="com.foy.vo.ProductOptVO" />
<body>
	<div id="top_button">
		<a id="MOVE_TOP_BTN"><strong>TOP</strong></a>
	</div>
	<div id="header-button">
		<ul>
			<br>
					<c:choose>
					<%--로그인 했을 경우 --%>
					<c:when test="${user_id ne null and user_id ne ''}">
						<li id="logo_menu"><a
							href="MyCon?type=order_info&user_id=${user_id }&user_pw=${user_pw }">주문배송</a></li>
						<li id="logo_menu"><a
							href="MyCon?type=cartlist&user_id=${user_id }&user_pw=${user_pw }">장바구니</a></li>
						<li id="logo_menu"><a
							href="MyCon?type=userinfo&user_id=${user_id }&user_pw=${user_pw }">마이페이지</a></li>
						<li id="logo_menu"><a href="MyCon?type=logout">로그아웃</a></li>
						<li id="logo_menu"><a href="#"> ${user_grade }&nbsp;${user_id }</a></li>
					</c:when>

					<c:otherwise>
						<%--비로그인 상태 --%>
						<li id="logo_menu" onclick="alert_login()"><a>주문배송</a></li>
						<li id="logo_menu" onclick="alert_login()"><a>장바구니</a></li>
						<li id="logo_menu"><a href="login.jsp">로그인</a></li>
						<li id="logo_menu"><a href="join.jsp">회원가입</a></li>
					</c:otherwise>
				</c:choose>
		</ul>

		<div id="header-search">

			<div id="header_main_logo">

				<ul>
					<li><a href="Main.jsp"> <strong>FOREVER YOUNG</strong></a></li>
				</ul>
			</div>

			<form method="post">
				<div id="area-search">
					<ul>
						<input id="input-search" name="product_search_txt" type="text"
							placeholder="11자 복근 도전! 슬리밍템 모음 ->">
						<li><input id="button-search" type="image"
							src="main_img/ic_search.png" onclick="go_search(this.form)">
							
				  <input type="hidden" name="user_id" value="${user_id }">
                  <input type="hidden" name="user_pw" value="${user_pw }">	
						</li>
					</ul>
				</div>
			</form>

		</div>
	</div>
	<hr>
	<div id="menu">
		<ul>
			<li class="active"><a
				href="MyCon?type=category&p_category=skincare&user_id=${user_id }&user_pw=${user_pw }">스킨</a></li>
			<li id="news"><a
				href="MyCon?type=category&p_category=bodycare&user_id=${user_id }&user_pw=${user_pw }">바디</a></li>
			<li id="contact"><a
				href="MyCon?type=category&p_category=haircare&user_id=${user_id }&user_pw=${user_pw }">헤어</a></li>
			<li id="about"><a
				href="MyCon?type=category&p_category=makeup&user_id=${user_id }&user_pw=${user_pw }">메이크업</a></li>
			<li id="cleansing"><a
				href="MyCon?type=category&p_category=cleansing&user_id=${user_id }&user_pw=${user_pw }">클렌징</a></li>
							<li id="cleansing"><a href="customer_center.jsp">Q & A</a></li>
		
		</ul>
	</div>

	<h1>${vo.p_name } 상품 수정</h1>
	<br>
	<br>
	<div id="pro">
		<form action="MyCon?type=productReg" method="post"
			enctype="multipart/form-data">


			<ul>
				<li>상품 고유 번호<span id="txt"><input
						type="text" name="p_name" size="10" value="${vo.p_no }" readonly="readonly"></span></li>
				<li>카테고리<span id="txt"><select name="category">
							<c:forEach var="cate" items="${category_list }">
								<option>${cate }</option>
							</c:forEach>
					</select></span></li>


				<li>이름<span id="txt"><input
						type="text" name="p_name" size="40" value="${vo.p_name }"></span></li>


				<li>가격<span id="txt"><input
						type="text" name="p_price" size="12" value="${vo.p_price }">원</span></li>
				<li>할인율<span id="txt"><input
					type="text" name="p_salerate" size="2" value="${vo.p_salerate }">%</span>
				</li>

				<li>옵션<br> <%-- <c:forEach
							var="optvo" items="${volist }">
								</c:forEach>--%>
							<c:forEach var="i" begin="0" end="${cnt }" step="1">
							<input type="text" name="${volist[i].p_op_no }"value="${volist[i].p_op_content }"><br>
							<input type="hidden" name="${i }" value="${volist[i].p_op_no }">
							
						</c:forEach>
						
				<div id="optlist"></div>
					<div id="opt"></div> 
					<input id="button_add_del" type="button" value="추가" onclick="addInput()" /> 
					<input id="button_add_del" type="button" value="삭제" onclick="deleteInput()" />
				</li>


				<li><div style="margin-bottom: 10px;">내용</div> <span id="txt">
						<textarea name="p_content" rows="8" cols="50">${vo.p_content }</textarea>
				</span></li>

				<input type="hidden" name="p_no" value="${vo.p_no }">



				<div class="filebox preview-image">&nbsp;
					<label for="input-file">파일 업로드</label> 
					<input class="upload-name" value="파일 미설정시, 기존의 파일이 업로드 됨." disabled="disabled" size="30">
					<span id="txt"><input type="file" id="input-file" class="upload-hidden" name="p_file_name"></span>
				</div>

				<li>
				<input id="button" type="button"
					value="저장" onclick="sendData(this.form)"> <input id="button"
					type="reset" value="다시작성"> <input id="button" type="button"
					value="목록" onclick="list_go()"> <input type="hidden"
					name="product_reg_chk" value="chk">
					<input type="hidden" name="user_id" value="${user_id }"> 
					<input type="hidden" name="user_pw" value="${user_pw }">
					<input type="hidden" name="p_ori_file_name" value="${vo.p_ori_image }">
					<input type="hidden" name="cPage" value="1">
					</li>
			</ul>
		</form>
	</div>

	<!-- 밑에 로고 시작하는 부분 -->
	<jsp:include page="footer.jsp"/>
</body>
</html>