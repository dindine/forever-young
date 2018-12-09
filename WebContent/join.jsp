<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>		
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/theme.css"></link>
<link rel="shortcut icon" type="image/x-icon" href="images/title.png">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>


<!-- autoload=false; 파라미터를 이용하여 자동으로 로딩되는 것을 막습니다. 
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>

<script>
    //load함수를 이용하여 core스크립트의 로딩이 완료된 후, 우편번호 서비스를 실행합니다.
    daum.postcode.load(function(){
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
                // 예제를 참고하여 다양한 활용법을 확인해 보세요.
            }
        }).open();
    });
</script>

 -->
<style>




.btn {
	float: right;
}


.container {
	width: 80%;
	margin-top: 60px;
}
</style>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                
                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }
                

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                
                $("[name=addr1]").val(data.zonecode);
                $("[name=addr2]").val(fullRoadAddr);
                /*
                document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('addr').value = fullRoadAddr;
                document.getElementById('sample4_jibunAddress').value = data.jibunAddress;
                */

                
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
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
//------- validation 검사
$( "form" ).submit(function( event ) {
     
    var provision = $('#provision');
    var memberInfo = $('#memberInfo');

    //회원가입약관
    if($('#provisionYn:checked').val()=="N"){
        modalContents.text("회원가입약관에 동의하여 주시기 바랍니다."); //모달 메시지 입력
        modal.modal('show'); //모달 띄우기
         
        provision.removeClass("has-success");
        provision.addClass("has-error");
        $('#memberInfoYn').focus();
        return false;
    }else{
        provision.removeClass("has-error");
        provision.addClass("has-success");
    }
     
    //개인정보취급방침
    if($('#memberInfoYn:checked').val()=="N"){
        modalContents.text("개인정보취급방침에 동의하여 주시기 바랍니다.");
        modal.modal('show');
         
        memberInfo.removeClass("has-success");
        memberInfo.addClass("has-error");
        $('#memberInfoYn').focus();
        return false;
    }else{
        memberInfo.removeClass("has-error");
        memberInfo.addClass("has-success");
    }

</script>

<script>
function isSame() {
	var pw = document.form.pwd1.value;
	alert(pw);
	var confirmPW = document.form.pwd2.value;
	
	if(pw.length < 1 || pw.length < 10) {
		alert("비밀번호는 1글자 이상, 10글자 이하 사용 가능 합니다.");
		document.getElementById('pwd1').value='';
		document.getElementById('pwd2').value='';

		document.getElementById('same').innerHTML = '';
	}
	
	if(document.getElementById('pwd1').value!='' && document.getElementById('pwd2').value!= ''){
		if(document.getElementById('pwd1').value ==  document.getElementById('pwd2').value) {
			document.getElementById('same').innerHTML = '비밀번호가 일치합니다';
			document.getElementById('pwd2').style.color = 'green';
		} else {
			document.getElementById('same').innerHTML = '비밀번호가 일치하지 않습니다.';
			document.getElementById('pwd2').style.color = 'red';
		}
	}
}

</script>

<script>
$(document).ready(function (){

	//lblError 레이어 클리어

	$('#pwd1').keyup(function (){

	    $('#same').text('');//제거

	});

	//암호 확인 기능 구현

	$('#pwd2').keyup(function(){

	    if($('#pwd1').val() != $('#pwd2').val()){

			$('#same').text('');

			$('#same').html("<b>비밀번호가 일치하지 않습니다.</b>");
			$('#same').css("color",'#ee782f');
		}else{

			$('#same').text('');

			$('#same').html("<b>비밀번호가 일치합니다.</b>");
			$('#same').css("color",'#babb3c');

		}

	});



});



</script>

<script>
	function send_go(frm) {
		for (var i = 1; i < frm.elements.length; i++) {
	         if (frm.elements[i].value.trim() == "") {

	        	 if (i == 4)
	                 continue; 
	        	 if (i == 5)
	                 continue; 
	        	 if (i > 10)
	                 continue; 
	        	
	        	alert(frm.elements[i].name +">" +i + "를 입력하세요"); //각 입력칸에 비어있는곳이 있으면 alert창을 띄운다.
	            frm.elements[i].focus();
	            frm.elements[i].value = "";

	            return;

	         }
	         
	         
	       /*  if (frm.elements[1].value != frm.elements[2].value) {
	        	 alert("비밀번호를 다시 입력해주세요.");
	        	 frm.elements[1].focus();
	        	 frm.elements[1].value = '';
	        	 return;
	      }*/
	         }
		frm.action = "MyCon?type=join";
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
</script>
<script> 
function alert_login() {
	 alert("로그인후 이용가능합니다!");	
}

function chk_id(frm) {
	frm.action = "MyCon?type=idchk";
	frm.submit();
	
}
</script>

</head>
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

	
	
	
	<!-- -------------------회원가입 폼------------------- -->
	<form name="frm" method="post">
	<div id="join_form" class="container">
    <div class="row">
    <div class="col-sm-12 text-center" >
    <div class="col-sm-3"></div>
	<table class="table table-bordered">
	<h3>회원가입을 진행합니다.</h3>
	<tr>
	<th>아이디 &nbsp;&nbsp;&nbsp;&nbsp;</th>
	<td>
	<button type="button" id="btn2" class="btn btn-success" onclick="chk_id(this.form)">ID중복확인</button>
	<input type="text" name="id" class="form-control col-sm-10" placeholder="아이디" value="${chk_id }">
	
	</td>
	</tr>
	<tr>
	<th>암호</th>
	<td><input type="password" id="pwd1" name="pw"    class="form-control col-sm-8" placeholder="암호" ></td> 
	</tr>
	<tr>
	<th>암호확인</th>
	<td>
	<%-- <input type="text" name="chkpw" class="form-control col-sm-3" placeholder="일치여부" readonly style="float:right; margin-left:1px">
	--%>
	
	<div id="same" style="float:right; margin-left:1px; margin-top:5px;" ></div>
	<input type="password" id="pwd2"  name="pw2"  class="form-control col-sm-8" placeholder="암호확인">
	</td> 
	</tr>
	<tr>
	<th>이름</th>
	<td><input type="text" name="name"class="form-control" placeholder="이름"></td> 
	</tr>
	


	<tr>
	<th>주소</th>
	<td>
	<button type="button" class="btn btn-danger btn-sm" onclick="sample4_execDaumPostcode()">우편번호 찾기</button>
	<input class="form-control" style=" width:30%; display: inline; float: left;" placeholder="우편번호" name="addr1" id="addr1" type="text" readonly="readonly" >
	<input type="text" id="addr2" name="addr2" class="form-control" placeholder="도로명주소"> 
	<input type="text" id="addr3" name="addr3" class="form-control" placeholder="상세주소"> </td> 
	</tr>
	<tr>
	<th>전화번호</th>
	<td><input type="text" name="phone" class="form-control" placeholder="전화번호"></td> 
	</tr>
	<tr>
	<th>이메일</th>
	<td>
	<div style="float: right; height: 35px;">
	<select name="email2" style="height: 35px;" id="email_sel" onChange="getSelectValue(this.form);">
	<option>직접입력</option>
	<option>@naver.com</option>
	<option>@gmail.com</option>
	<option>@daum.com</option>
	</select> 
	</div>
	<input type="text" id="email" name="email" class="form-control col-sm-10" placeholder="이메일">
	<script>
	
	function getSelectValue(frm)
	{
		var target = document.getElementById("email_sel");
		 document.getElementById("email").value += target.options[target.selectedIndex].text;
		 document.getElementById("email_sel").value = frm.selectBox.options[frm.selectBox.selectedIndex].value;

	}
	

	</script>
	
	
	
	</td> 
	</tr>
	
		<hr><br>
		<div>
		<tr>
		<td id="update_form_p" colspan="2"><strong>ForeverYonug 마켓팅 정보 동의 수신 </strong><br><br>
		포인트/이벤트/문화공연/상품 소식을 전해드립니다. (공지 목적의 발송되는 메일은 제외)<br><br>
		<input type="checkbox" name="checkAll">전체선택 <input
						type="checkbox" value="이메일" name="checkOne"> 이메일 <input
						type="checkbox" value="SNS" name="checkOne"> SNS <input
						type="checkbox" value="휴대전화" name="checkOne"> 휴대전화<br>
						<br>
		
		</td>
		</tr>
		
		<tr>
		<td id="update_form_p" colspan="2">
		<!-- ---------------약관 동의 폼 ------------------------ -->
	<div class="container" style="width: 100%">
	        <form class="form-horizontal" role="form" method="post" action="javascript:alert( 'success!' );">
            <div class="form-group">
                <label for="provision" class="col-lg-10 control-label" style="margin-bottom: 10px"><b>회원가입약관</b></label>
               <label for="provision" class=" control-label" style="margin-left:350px;"> </label>
                <div class="col-lg-20" id="provision">
                    <textarea class="form-control" rows="8" style="resize:none;">
약관동의
<jsp:include page="txt/join.txt"></jsp:include>

                    </textarea>
                    <div class="radio" style="float: left; margin-right: 20px;">
                        <label>
                            <input type="radio" id="provisionYn" name="provisionYn" value="Y" autofocus="autofocus" checked>
                            동의합니다.
                        </label>
                    </div>
                    <div class="radio" style="float: left">
                        <label>
                            <input type="radio" id="provisionYn" name="provisionYn" value="N">
                            동의하지 않습니다.
                        </label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="memberInfo" class="col-lg-10 control-label" style="margin: 30px 0px 30px 0px"><b>개인정보취급방침</b></label>
                <div class="col-lg-20" id="memberInfo">
                    <textarea class="form-control" rows="8" style="resize:none">
<jsp:include page="txt/hi.txt"></jsp:include>
                    </textarea>
                    <div class="radio" style="float: left; margin-right: 20px;">
                        <label>
                            <input type="radio" id="memberInfoYn" name="memberInfoYn" value="Y" checked>
                            동의합니다.
                        </label>
                    </div>
                    <div class="radio" style="float: left">
                        <label>
                            <input type="radio" id="memberInfoYn" name="memberInfoYn" value="N">
                            동의하지 않습니다.
                        </label>
                    </div>
                </div>
            </div>
		</form>
	</div>

		</td>
		</tr>
		</div>

<span id="guide" style="color:#999"></span>

	
	</table>
	<button type="button" id="btn2" class="btn btn-success" onclick="send_go(this.form)">가입하기</button>

	</div>
	</div>
	</div>
	
	</form>
	
	
	<jsp:include page="footer.jsp"/>

</body>
</html>