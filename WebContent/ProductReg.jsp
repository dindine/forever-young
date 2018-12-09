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
<link rel="shortcut icon" type="image/x-icon" href="images/title.png">
<link rel="stylesheet" type="text/css" href="css/theme.css"></link>
<script>
   var arrInput = new Array(0);
   var arrInputValue = new Array(0);

   function addInput() {//옵션 텍스트 필드 추가
      arrInput.push(arrInput.length);
      arrInputValue.push("");
      display();
   }

   function display() { //옵션 텍스트박스 화면 출력
      document.getElementById('opt').innerHTML = "";
      for (intI = 0; intI < arrInput.length; intI++) {
         document.getElementById('opt').innerHTML += createInput(arrInput[intI], arrInputValue[intI]);
      }
   }

   function saveValue(intId, strValue) {// 추가되는 텍스트 박스의 값 저장
      arrInputValue[intId] = strValue;
   }

   function createInput(id, value) { //옵션 텍스트 태그 추가
      return "<input type='text' name='opt" + id + "' onChange='javascript:saveValue(" + id + ",this.value)' value='" + value + "'><br>";
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
            if (i == 5)
               continue; // 파일첨부는 안해도 입력되도록 처리!
            alert(frm.elements[i].name + "를 입력하세요"); //각 입력칸에 비어있는곳이 있으면 alert창을 띄운다.
            frm.elements[i].focus();
            return;

         }
      }
      frm.action = "MyCon?type=productReg";
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
#pro {
	width: 440px;
	margin: 0 auto;
}

#pro li {
	text-align: left;
	padding: 7px;
	list-style: none;
	padding: 10px;
}

h1 {
	text-align: center;
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
	width: 40px;
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

#txt{
	text-align: left;
	padding: 7px 20px 0px;
}
#form{
	border: 2px solid #ee782f;
}

</style>

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
			
				<ul><li><a href="Main.jsp">
					<strong>FOREVER YOUNG</strong></a></li>
				</ul>
			</div>
			
			<form method="post">
				<div id="area-search">
					<ul>
						<input id="input-search" name="product_search_txt" type="text" placeholder="11자 복근 도전! 슬리밍템 모음 ->">
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
	<hr>
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
   <div id="pro">
      <form action="MyCon?type=productReg" method="post" enctype="multipart/form-data">
       
            <h1>상품등록</h1><br>
           <div id="form">
                  <li>카테고리<span id="txt"><select name="category">
                        <c:forEach var="cate" items="${category_list }">
                           <option>${cate }</option>
                        </c:forEach>
                  </select></span></li>
               
                  <li>이름
                  <span id="txt"><input type="text" name="p_name" size="12"></span></li>
               
                  <li>가격 
                  <span id="txt"><input type="text" name="p_price"
                     size="12">원</span>
                   </li>
                   <li>할인율    
                     <span id="txt"><input type="text" name="p_salerate"
                     size="12" style="margin-top:3px;">%</span>
                 </li>
               
                  <li>옵션<div id="opt"></div><input id="button_add_del"type="button" value="추가"
                     onclick="addInput()" /> <input id="button_add_del"type="button" value="삭제"
                     onclick="deleteInput()" /></li>
               
                  <li>내용<span id="txt"><textarea name="p_content" rows="8" cols="50"></textarea></span></li>
               
                  <div class="filebox preview-image">
					<!--<input class="upload-name" value="파일선택" disabled="disabled">
					  <label for="input-file">업로드</label> -->
					  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="file" id="input-file" class="upload-hidden" name="p_file_name">
				</div>
             
                  <li>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <input id="button" type="button" value="저장" onclick="sendData(this.form)"> 
                  <input id="button" type="reset" value="다시작성">
                     <input id="button" type="button" value="목록" onclick="list_go()"> <input
                     type="hidden" name="product_reg_chk" value="chk">
                     <input type="hidden" name="user_id" value="${user_id }"> 
                        <input type="hidden" name="user_pw" value="${user_pw }"> </li>
                        <input type="hidden" name="p_category" value="${p_category }"> 
                        </div>
             
       
      </form>
   </div>
   <br><br>
   <hr>
		<jsp:include page="footer.jsp"/>

</body>
</html>