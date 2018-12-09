<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>:::결제페이지:::</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/theme.css"></link>

<link rel="shortcut icon" type="image/x-icon" href="images/title.png">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</head>
<style>
#pay_button {
	list-style: none;
	width: 250px;
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

#btn {
	width: 70px;
	list-style: none;
	background-color: #969937;
	border: none;
	color: #fff;
	padding: 0px 0;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	margin: 4px;
	cursor: pointer;
	padding-bottom: 0px;
}
.red {
	 color: #ee782f;
    font-weight: 700;
}
#frm {
	text-align: center;
}

#card {
	text-align: center;
}

input[type="image" i] {
    cursor: pointer;
  
}

h2 {
	font-size: 60px;
	
}
.image {
    width: 150px;
    height: 100px;
}

#pay {
	margin: 0 auto;
	width: 1000px;
	text-align: center;
}


h3 {
 	text-align: center;
 }

tfoot {
	text-align: center;
}

#right {
	text-align: right;
	font-size: 30px;
}

#real_pay1{
	margin-left: 900px;	
	border: 3px solid #ee782f;
	width: 400px;
	padding-top: 30px;
	padding-bottom: 30px;
	padding-left: 30px;
	padding-right: 30px;
	letter-spacing: -0.02em !important;
    font-weight: 700;
    font-size: 17px;
	
}

#real_pay {	
	
	float: center;
}

#pay_user1 {
	float: left;
	margin-left: 300px;
	margin-top: -512px;

	
}

#pay_user {
	width: 400px;
	height: 50px;
}

#real_pay_font {
	color: red;
}

#txt {
	float: right;
}
#dis_btn{
	border: 0px;
	background-color: transparent;
	color: #ee782f;
	margin-left: 4px;
	margin-bottom: 5px;
	font-weight: bold;
}
#dis_btn:hover {
	color: #E6EE9C;
	font-weight: bold;
}

</style>
<script>
	function select_go(frm) {
		  for (var i = 0; i < frm.elements.length; i++) {
		         if (frm.elements[i].value.trim() == "") {
					if (i >= 14) continue;
		            alert(i + " > 주문정보가 입력되지 않았습니다!"); //각 입력칸에 비어있는곳이 있으면 alert창을 띄운다.
		            frm.elements[i].focus();
		            return;

		         }
		      }
		frm.action = "MyCon?type=payment";
		frm.submit();
	}
	
	function real_pay(frm) {
		frm.action = "MyCon?type=real_pay&user_id=${user_id }&user_pw=${user_pw }";
		frm.submit();
	}
</script>
<script> 
function alert_login() {
	 alert("로그인후 이용가능합니다!");
	
}
</script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
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
               // $('#real_pay1').stop();
               // $('#real_pay1').animate( { 'top' : scrollTop });
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
	$(function() {
		$("[type=text]").css("background-color", "white");
		$("#btn").click(function() {
			//아이디1 -> 아이디2 복사
			var id = $("#user_id1").val(); //val() : 값을 읽어오기
			$("#user_id2").val(id); //val(값) : 값을 설정

			var name = $("#user_name1").val(); //val() : 값을 읽어오기
			$("#user_name2").val(name); //val(값) : 값을 설정

			var phone = $("#user_ph1").val(); //val() : 값을 읽어오기
			$("#user_ph2").val(phone); //val(값) : 값을 설정

			var addr = $("#user_addr1").val(); //val() : 값을 읽어오기
			$("#user_addr2").val(addr); //val(값) : 값을 설정

			var email = $("#user_email1").val(); //val() : 값을 읽어오기
			$("#user_email2").val(email); //val(값) : 값을 설정

			//$("#name2").val($("#name1").val());
		});

		//checkbox, radio, select : click() - 마우스, 키보드 액션
		//checkbox, radio, select : change() - 값에 변화가 있는 경우
		$("#chk").change(function() {
			//체크된 상태인 경우 복사 처리, 체크된 상태가 아니면 값 삭제
			if (this.checked) {
				$("#user_id2").val($("#user_id1").val());
			} else {
				$("#user_id2").val("");
			}

			if (this.checked) {
				$("#user_pw2").val($("#user_pw1").val());
			} else {
				$("#user_pw2").val("");
			}

			if (this.checked) {
				$("#user_name2").val($("#user_name1").val());
			} else {
				$("#user_name2").val("");
			}

			if (this.checked) {
				$("#user_addr2").val($("#user_addr1").val());
			} else {
				$("#user_addr2").val("");
			}

			if (this.checked) {
				$("#user_email2").val($("#user_email1").val());
			} else {
				$("#user_email2").val("");
			}
			
			if (this.checked) {
				$("#user_phone2").val($("#user_phone1").val());
			} else {
				$("#user_phone1").val("");
			}
			
			
			
		});

	});
</script>

<script>
function use_coupon2(frm) {

	frm.action = "MyCon?type=pay_complete";
	frm.submit();
	
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

<form method="post" >
            <div id="area-search" style="width:319px; height:54px;">
               <ul>
                  <input id="input-search" name="product_search_txt" type="text"
                      placeholder="11자 복근 도전! 슬리밍템 모음 ->" style="margin-bottom: 30px">
                  <li>
                  <input id="button-search" type="image" src="main_img/ic_search.png"
                        onclick="go_search(this.form)">
                  <input type="hidden" name="user_id" value="${user_id }">
                  <input type="hidden" name="user_pw" value="${user_pw }">
                  </li>
               </ul>
            </div>
         </form>
      </div>
   </div>
   <br>
   <hr style="margin-top: 98px; margin-bottom: 8px; border-top: 1px solid gray" >
	<div id="menu">
		<ul>
			<li class="active"><a
				href="MyCon?type=category&p_category=skincare&user_id=${user_id }&user_pw=${user_pw }">스킨</a></li>
			<li id="news"><a href="MyCon?type=category&p_category=bodycare&user_id=${user_id }&user_pw=${user_pw }">바디</a></li>
			<li id="contact"><a
				href="MyCon?type=category&p_category=haircare&user_id=${user_id }&user_pw=${user_pw }">헤어</a></li>
			<li id="about"><a href="MyCon?type=category&p_category=makeup&user_id=${user_id }&user_pw=${user_pw }">메이크업</a></li>
			<li id="cleansing"><a
				href="MyCon?type=category&p_category=cleansing&user_id=${user_id }&user_pw=${user_pw }">클렌징</a></li>
					<li id="cleansing"><a href="customer_center.jsp">Q & A</a></li>
		
		</ul>
	</div>





	<h3> ${pvo.getUser_name() } 님의 주문서 </h3>
	<br>
	<table id="pay" class="table table-borderd table-hover">
	<div id="pay1" class="container">
		<thead>
			
			<tr>
				
				<th colspan="2">상품정보</th>
				<th>옵션</th>
				<th>가격</th>
				<th>수량</th>
				<th>금액</th>

			</tr>
		</thead>
		
	<form method="post" action="MyCon?type=pay_complete">
			<tbody>
				<c:if test="${empty c}">
					<tr>
						<td colspan="6">장바구니가 비었습니다.</td>
					</tr>
				</c:if>
				<c:if test="${not empty c}">
					<!-- 장바구니에 데이터가 있는 경우 -->
					<c:forEach var="cvo" items="${c}">
						<tr>
							<td><input type="image" class="image" src="images/${cvo.cart_image }"></td>
							
							<td>${cvo.p_name } </td> <td> ${cvo.p_opt_name }</td>
							<td>${cvo.cart_price }원 <span class="red">(세일가격:
									${cvo.p_saleprice }원)</span>
							</td>
							<td>
							<span>${cvo.cart_cnt }</span>
							<input type="hidden"
								name="cart_idx" value="${cvo.cart_idx}"> <input
								type="hidden" name="user_id" value="${cvo.user_id}"> <input
								type="hidden" name="p_no" value="${cvo.p_no}"> <input
								type="hidden" name="p_saleprice" value="${cvo.p_saleprice }">
								<input type="hidden" name="cart_price"
								value="${cvo.cart_price }"> <input type="hidden"
								name="cart_tot_price" value="${cvo.cart_tot_price }"> <input
								type="hidden" name="cart_image" value="${cvo.cart_image }">
								<input type="hidden" name="p_cnt" value="1"></td>
							<td>${cvo.cart_tot_price }원</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
			
			<tfoot>
				<tr id="right">
					<td colspan="6"><input type="hidden" name="tot_price"
						value="${tot_price }">총결제금액 : <span style="color: red;"><strong>${tot_price }</strong>원</span></td>
				</tr>
			</tfoot>
		</div>	
	</table>
	<br>
	
	
	
	
	<div id="real_pay1" class="container">
		<table id="real_pay" >
		<tr>
		적립금&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="text" name="point" placeholder="1원 이상 사용 가능." size="20" style="margin-left: 10px">&nbsp;&nbsp;원
		<br>
		<br>
		나의 적립금 <span id="txt" style="color: #ee782f;">${user_point }&nbsp;&nbsp;원</span>
		</tr> 		
	<br>
	<tr>(1원 이상부터 적립금 사용이 가능합니다.)</tr>
	<hr>

	<input type="hidden" name="coupon_cnt" value="${user_coupon_cnt }">
	<input type="hidden" name="user_point" value="${user_point }">
	<input type="hidden" name="user_id" value="${pvo.user_id }">
	<input type="hidden" name="user_pw" value="${pvo.user_pw }">
	<input type="hidden" name="result" value="${result }">
	
	<c:choose>
	<c:when test="${result == 1 }">
	쿠폰(보유 쿠폰:${user_coupon_cnt })
 	<select name="use_coupon">
	<option value="no">사용 안함</option>
	<option value="yes">쿠폰 사용</option>
	</select>
	
	<input type="button" value="할인 적용" onclick="use_coupon2(this.form)" id="dis_btn">
	</c:when>
	
	<c:when test="${result == 2 }">
	이미 <span style="color: #ee782f;">할인 적용 중</span> 입니다^^
	
	
	</c:when>
	<c:otherwise>
	보유한 쿠폰이 없습니다.
	</c:otherwise>
	</c:choose>
	 

	 <!--
	 <input type="submit" value="할인 적용">-->
	</form>
	
	<form id="frm" method="post">
	
	<hr>
	 
	<tr>총 할인 금액<span id="txt" style="color: #ee782f;">${discount }&nbsp;&nbsp;원 </span>
		<br>
	<tr>최종 결제 금액<span id="txt" style="color: red;">${real_tot_price }&nbsp;&nbsp;원 </span></tr>
	<br>
	<hr>
	<tr>결제하실 카드의 종류를 선택해주십시오.</tr>
	<tr>
	<br>
	<br>

		<select name="p_idx">
			<option value="신한카드">신한카드</option>
			<option value="롯데카드">롯데카드</option>
			<option value="국민카드">국민카드</option>
			<option value="현대카드">현대카드</option>
			<option value="우리카드">우리카드</option>
	</select>
	
	</span>
	</tr>
	<br>
	<br>
	<tr>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input id="pay_button" type="button" value="결제하기"
					onclick="select_go(this.form)">
	</tr>
	</table>
	</div>
	
	
	<div id="pay_user1" class="container">
	<table id="pay_user" class="table table-bordered" >
	<tr><th>아이디</th> <td><input type="text" name="user_id1" id="user_id1"value="${pvo.getUser_id() }" readonly></td></tr>
	<tr><th>이름</th>  <td><input type="text" name="user_name1" id="user_name1" value="${pvo.getUser_name() }"></td></tr>
	<tr><th>전화번호</th> <td><input type="text" name="user_phone1" id="user_phone1" value="${pvo.getUser_phone() }"></td></tr> 
	<tr><th>주소</th> <td><input type="text" name="user_addr1" id="user_addr1" value="${pvo.getUser_addr() }"></td></tr> 
	<tr><th>이메일</th> <td><input type="text" name="user_email1" id="user_email1" value="${pvo.getUser_email() }"><br></td></tr>
	
<tr><th colspan="2"><input type="checkbox" id="chk" style="margin-left:130px;"> 주문자와 동일</th></tr>
		<input type="hidden" name="user_coupon_cnt" value="${user_coupon_cnt }">
		<input type="hidden" name="user_point" value="${user_point }">
		<input type="hidden" name="user_id" value="${pvo.user_id }"> 
		<input type="hidden" name="user_pw" value="${pvo.user_pw }"> 
		<input type="hidden" name="real_tot_price" value="${real_tot_price }">
		<input type="hidden" name="c_list" value="${c }"> 
		<input type="hidden" name="p_opt_name" value="${p_opt_name }"> 
		<input type="hidden" name="p_name" value="${p_name }"> 
	
	<tr><th>아이디</th> <td><input type="text" name="user_id2" id="user_id2" value="" readonly></td></tr> 
	<tr><th>이름</th> <td><input type="text" name="user_name2" id="user_name2" value=""></td></tr>  
	<tr><th>전화번호</th> <td><input type="text" name="user_phone2" id="user_phone2" value=""></td></tr>  
	<tr><th>주소</th> <td><input type="text" name="user_addr2" id="user_addr2" value=""></td></tr> 
	<tr><th>이메일</th> <td><input type="text" name="user_email2" id="user_email2" value=""></td></tr> 
	</form>
	</table>
	</div>
	
	
		<jsp:include page="footer.jsp"/>
	


</body>
</html>