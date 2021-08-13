<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PPAS 쇼핑몰 - 회원정보 수정</title>
<link rel="stylesheet" href="/resources/css/user/usermodify.css">

<script src="https://code.jquery.com/jquery-3.4.1.js"
 		integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  		crossorigin="anonymous"></script>
</head>
<body>
<%@ include file="../includes/header.jsp"%>  
	<div class="wrapper">
		<form id="modify_form" class="modify-form" method="post">
			<div class="wrap">
				<div class="top_title_area">
					<span>회원정보수정</span>
				</div>
				<div class="id_wrap">
					<div class="id_name">아이디</div> 
					<div class="id_input_box">
						<input class="id_input" id="userId" name="userId" value="${user.userId}" readonly>
					</div>
				</div>
				
				<div class="pw_wrap">
					<div class="pw_name">비밀번호</div>
					<div class="pw_input_box">
						<input class="pw_input" id="userPw" name="userPw" type="password" id="password">
					</div>
					<span class="final_pw_ck">비밀번호를 입력해주세요.</span>
				</div>
				
				<div class="pwck_wrap">
					<div class="pwck_name">비밀번호 확인</div>
					<div class="pwck_input_box">
						<input class="pwck_input" type="password">
					</div>
					<span class="final_pwck_ck">비밀번호 확인을 입력해주세요.</span>
					<span class="pwck_input_re_1">비밀번호가 일치합니다.</span>
					<span class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
				</div>
			
				<div class="user_wrap">
					<div class="user_name">이름 </div>
					<div class="user_input_box">
						<input class="user_input" id="userName" name="userName" value="${user.userName}">
					</div>
					<span class="final_name_ck">이름을 입력해주세요.</span>
				</div>
				
				<div class="mail_wrap">
					<div class="mail_name">이메일</div> 
					<div class="mail_input_box">
						<input class="mail_input" id="userMail" name="userMail" value="${user.userMail}">
					</div>
					<span class="final_mail_ck">이메일을 입력해주세요.</span>
				</div>
				
				<div class="phone_wrap">
					<div class="phone_name">휴대폰 번호</div>
					<div class="phone_input_box">
						<input class="phone_input" id="userPhone" name="userPhone" value="${user.userPhone}">
					</div>
					<span class="final_phone_ck">휴대폰 번호를 입력해주세요.</span>
				</div>
				
				<div class="modify_button_wrap">
					<input type="button" class="modify_button" value="회원정보수정">
				</div>
			</div>
		</form>
	</div>
	<%@ include file="../includes/footer.jsp"%> 
	
</body>


<script>
	/* 유효성 검사 통과유무 변수 */
	var pwCheck = false;			// 비번
	var pwckCheck = false;			// 비번 확인
	var pwckcorCheck = false;		// 비번 확인 일치 확인
	var nameCheck = false;			// 이름
	var mailCheck = false;            // 이메일
	var phoneCheck = false;        // 휴대폰 확인
	var addressCheck = false         // 주소	
// 	let modifyForm = $("#modify_Form");
	
	$(document).ready(function(){
		//회원정보 버튼(정보수정 기능)
		$(".modify_button").click(function(){
			alert("회원정보 수정 완료 다시 로그인해주세요.")
			var pw = $('.pw_input').val();				// 비밀번호 입력란
			var pwck = $('.pwck_input').val();			// 비밀번호 확인 입력란
			var name = $('.user_input').val();			// 이름 입력란
			var mail = $('.mail_input').val();            // 이메일 입력란
	        var phone = $('.phone_input').val();            // phone 입력란
	        var addr = $('.address_input_3').val();        // 주소 입력란
	         
			/* 비밀번호 유효성 검사 */
			if(pw == ""){
				$('.final_pw_ck').css('display','block');
				pwCheck = false;
			}else{
				$('.final_pw_ck').css('display', 'none');
				pwCheck = true;
			}
			
			/* 비밀번호 확인 유효성 검사 */
			if(pwck == ""){
				$('.final_pwck_ck').css('display','block');
				pwckCheck = false;
			}else{
				$('.final_pwck_ck').css('display', 'none');
				pwckCheck = true;
			}
			
			/* 이름 유효성 검사 */
			if(name == ""){
				$('.final_name_ck').css('display','block');
				nameCheck = false;
			}else{
				$('.final_name_ck').css('display', 'none');
				nameCheck = true;
			}	
			 /* 이메일 유효성 검사 */
	        if(mail == ""){
	            $('.final_mail_ck').css('display','block');
	            mailCheck = false;
	        }else{
	            $('.final_mail_ck').css('display', 'none');
	            mailCheck = true;
	        }
	                
	        /* 휴대폰 번호 유효성 검사 */
	        if(phone == ""){
	            $('.final_phone_ck').css('display','block');
	            phoneCheck = false;
	        }else{
	            $('.final_phone_ck').css('display', 'none');
	            phoneCheck = true;
	        }
	        
	        /* 주소 유효성 검사 */
	        if(addr == ""){
	            $('.final_addr_ck').css('display','block');
	            addressCheck = false;
	        }else{
	            $('.final_addr_ck').css('display','none');
	            addressCheck = true;
	        }
	        /* 최종 유효성 검사 */
	        if(pwCheck&&pwckCheck&&pwckcorCheck&&nameCheck&&mailCheck&&phoneCheck&&addressCheck ){
	 			$("#modify_form").attr("action", "/user/usermodify");
 				$("#modify_form").submit();			
// 				modifyForm.submit();
			}		
			return false;
		});
	});
/* 
 	비밀번호 영문 + 숫자 + 특수문자 조합 8자 이상
	3자리 이상 연속하는 영문 금지
*/
	$("#password").change(function(){
	    checkPassword($('#password').val());
	});
	function checkPassword(password){
	    
	    if(!/^(?=.*[a-zA-Z])(?=.*[.,!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(password)){            
	        alert('숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.');
	        $('#password').val('').focus();
	        return false;
	    }    
	    var checkNumber = password.search(/[0-9]/g);
	    var checkEnglish = password.search(/[a-z]/ig);
	    if(checkNumber <0 || checkEnglish <0){
	        alert("숫자와 영문자를 혼용하여야 합니다.");
	        $('#password').val('').focus();
	        return false;
	    }
	    if(/(\w)\1\1\1/.test(password)){
	        alert('같은 문자를 4번 이상 사용하실 수 없습니다.');
	        $('#password').val('').focus();
	        return false;
	    }
	        
	    return true;
	}
	
	/* 비밀번호 확인 일치 유효성 검사 */
	$('.pwck_input').on("propertychange change keyup paste input", function(){
		var pw = $('.pw_input').val();
		var pwck = $('.pwck_input').val();
		$('.final_pwck_ck').css('display', 'none');
		if(pw == pwck){
			$('.pwck_input_re_1').css('display','block');
			$('.pwck_input_re_2').css('display','none');
			pwckcorCheck = true;
		}else{
			$('.pwck_input_re_1').css('display','none');
			$('.pwck_input_re_2').css('display','block');
			pwckcorCheck = false;
		}
	});

</script>
</html>