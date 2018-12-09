<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="images/title.png">
<meta charset="UTF-8">
<title>개인정보 수정 화면</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/theme.css"></link>
<script>
	function cus_update(frm) {
		
		for (var i = 0; i < frm.elements.length; i++) {
	         if (frm.elements[i].value.trim() == "") {
	        	
	        	 alert(frm.elements[i].name + "를 입력하세요"); //각 입력칸에 비어있는곳이 있으면 alert창을 띄운다.
	            frm.elements[i].focus();
	            frm.elements[i].value = "";
	            return;

	         }
		}
		
		
		
		if ($("input:checkbox[name='info_Chk']").is(":checked") == false) {
			alert("개인정보를  동의 해주세요.");

		} else {
			alert("개인정보가 수정 되었습니다.");
			frm.action = "MyCon?type=customer_update"; //수정처리작업 페이지로 이동
			frm.submit();
		}
	}

	function go_main(frm) {
		frm.action = "MyCon?type=main";
		frm.submit();
	}
</script>
<script>
	function go_search(frm) {
		frm.action = "MyCon?type=product_search";
		frm.submit();
	}
</script>
<script>
//sns동의 체크박스
function allcheckFunc(obj) {
	$("[name=checkOne]").prop("checked", $(obj).prop("checked"));
}

/* 체크박스 체크시 전체선택 체크 여부 */
function onecheckFunc(obj) {
	var allObj = $("[name=checkAll]");
	var objName = $(obj).attr("name");

	if ($(obj).prop("checked")) {
		checkBoxLength = $("[name=" + objName + "]").length;
		checkedLength = $("[name=" + objName + "]:checked").length;

		if (checkBoxLength == checkedLength) {
			allObj.prop("checked", true);
		} else {
			allObj.prop("checked", false);
		}
	} else {
		allObj.prop("checked", false);
	}
}

$(function() {
	$("[name=checkAll]").click(function() {
		allcheckFunc(this);
	});
	$("[name=checkOne]").each(function() {
		$(this).click(function() {
			onecheckFunc($(this));
		});
	});
});

//개인정보 체크박스
function allCheckFunc(obj) {
	$("[name=info_chk]").prop("checked", $(obj).prop("checked"));

}

/* 체크박스 체크시 전체선택 체크 여부 */
function oneCheckFunc(obj) {
	var allObj = $("[name=info_Chk]");
	var objName = $(obj).attr("name");

	if ($(obj).prop("checked")) {
		checkBoxLength = $("[name=" + objName + "]").length;
		checkedLength = $("[name=" + objName + "]:checked").length;

		if (checkBoxLength == checkedLength) {
			allObj.prop("checked", true);
		} else {
			allObj.prop("checked", false);
		}
	} else {
		allObj.prop("checked", false);
	}
}

$(function() {
	$("[name=info_Chk]").click(function() {
		allCheckFunc(this);
	});
	$("[name=info_chk]").each(function() {
		$(this).click(function() {
			oneCheckFunc($(this));
		});
	});
});

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
</head>
<style>
#update_form {
	margin: 0 auto; text-align : center;
	width: 700px;
	text-align: center;
}

#update_form_p {
	text-align: left;
	list-style: none;
}

#update {
	width: 150px;
	background-color: #ee782f;
	border: none;
	color: #fff;
	padding: 15px 0;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	margin: 4px;
	cursor: pointer;
}
#chk{
	float:right;
}

</style>

<script> 
function alert_login() {
	 alert("로그인후 이용가능합니다!");
	
}
</script>
<body>
	<div id="top_button">
		<a id="MOVE_TOP_BTN"><strong>TOP</strong></a>
	</div>
	<div id="header-button">
		<ul>
			<br>
							<c:choose>
					<%--로그인 했을 경우 --%>
					<c:when test="${user_id ne null }">
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
	<div id="update_form">
		<h1>회원정보 수정</h1>
		<br>
		<h4>회원님의 소중한 정보를 안전하게 관리하세요.</h4><br><br>

		<form method="post">
			<h3 style="text-align: left;">기본정보 수정</h3><br>
			<hr><br>
			<p id="update_form_p">아이디&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="user_id" value="${vo.user_id }" readonly="readonly"></p><br>
			<!-- <p id="update_form_p">이름&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><input type="text" name="user_name" value="${vo.user_name }"> -->
			<p id="update_form_p">이름&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="user_name" value="${vo.user_name }" ></p><br>
			<p id="update_form_p">비밀번호&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name="user_pw" value="${vo.user_pw }"></p><br>
			<p id="update_form_p">이메일&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="user_email" value="${vo.user_email }"></p><br>
			<p id="update_form_p">핸드폰 번호&nbsp;<input type="text" name="user_phone"value="${vo.user_phone }"><br><br></p>
			<p id="update_form_p">주소&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="user_addr" value="${vo.user_addr }"></p><br><br>
			<input type="hidden" name="customer_update" value="chk">
			<input type="hidden" name="user_grade" value="${vo.user_grade }">
			<input type="hidden" name="user_point" value="${vo.user_point }">
			<input type="hidden" name="user_coupon_cnt" value="${vo.user_coupon_cnt }">
			<input type="hidden" name="user_tot_pur" value="${vo.user_tot_pur }">

			<!--   <input type="button"
				value="메인으로 이동" onclick="go_main(this.form)">-->
		
		<h3 style="text-align: left;">선택정보 수정</h3><br>
		<hr><br>
		<div>
		<ul>
		<li id="update_form_p">ForeverYonug 마켓팅 정보 동의 수신 <br><br>
		포인트/이벤트/문화공연/상품 소식을 전해드립니다. (공지 목적의 발송되는 메일은 제외)<br><br>
		<input type="checkbox" name="checkAll">전체선택 <input
						type="checkbox" value="이메일" name="checkOne"> 이메일 <input
						type="checkbox" value="SNS" name="checkOne"> SNS <input
						type="checkbox" value="휴대전화" name="checkOne"> 휴대전화<br>
						<br>
		
		</li>
		</ul>
		</div>
		
		<h3 style="text-align: left;">정보 제공 동의여부</h3><br>
		<hr><br>
		<div>
		<ul>
					<li id="update_form_p">전체선택 <input id="chk" type="checkbox"
						value="info" name="info_Chk"><br> <br> 개인정보 수집
						및 활용 동의 <input id="chk" type="checkbox" value="info"
						name="info_chk"><br> <br> <textarea rows="8"
							cols="98"><jsp:include page="txt/join.txt"
								flush="false"></jsp:include></textarea> <br> <br> 스탬프 서비스 활용을 위한
						개인정보 수집 및 활용 동의 <input id="chk" type="checkbox" value="info"
						name="info_chk"><br> <br> <textarea rows="8"
							cols="98">
						<jsp:include page="txt/hi.txt" flush="false"></jsp:include></textarea> <br>
						<br> 고객 맞춤 상품/서비스추천을 위한 개인정보 수집 및 활용 동의 <input id="chk"
						type="checkbox" value="info" name="info_chk"><br> <br>
						<textarea rows="8" cols="99"><jsp:include
								page="txt/join.txt" flush="false"></jsp:include></textarea> <br> <br>
						ForeverYonug 제 3자 정보 제공 동의 <input id="chk" type="checkbox"
						value="info" name="info_chk"><br> <br> <textarea
							rows="8" cols="98"><jsp:include page="txt/hi.txt"
								flush="false"></jsp:include></textarea> <br> <br> ForeverYonug
						서비스 이용을 위한 정보제공 및 활용동의<input id="chk" type="checkbox" value="info"
						name="info_chk"><br> <br> <textarea rows="8"
							cols="98"><jsp:include page="txt/join.txt"
								flush="false"></jsp:include></textarea>

					</li>
				</ul>
		</div>
			<input id="update" type="button" value="수 정" onclick="cus_update(this.form)">
			<input id="update" type="reset" value="초기화"> 
			<br><br>
		</form>
	</div>

	<jsp:include page="footer.jsp"/>

</body>
</html>