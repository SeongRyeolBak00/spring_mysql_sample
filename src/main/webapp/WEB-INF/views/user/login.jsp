<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Login Form</title>
    <script
	  src="https://code.jquery.com/jquery-3.4.1.js"
	  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	  crossorigin="anonymous"></script>
	  
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" href="/resources/css/user/login.css">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
	 
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.2/jquery.validate.min.js"></script>
    <script src="/resources/js/main.js"></script>
    <style class="cp-pen-styles">
    </style>
</head>
<body>

<div class="wrapper">
    <div class="container">
        <a class="nav-link active" href="/main"><img src="../resources/images/home.jpg"></a>
			<form id="login-form" method="post">
               <div class="login_wrap"> 
					<div class="id_wrap">
						<div class="id_input_box">
							<input class="id_input" name="userId" placeholder="아이디" >
						</div>
					</div>
					<div class="pw_wrap">
						<div class="pw_input_box">
							<input class="pw_iput" name="userPw" type="password" placeholder="비밀번호">
						</div>
					</div>
					
					<c:if test = "${result == 0 }">
						<div class = "login_warn">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
					</c:if>
					
					<div class="row"><button type="button" id="login-button" class="login_button">로그인</button></div>
					<br>
					<br>
						<a href="/user/join">아직 회원이 아니신가요?</a>
				</div>
            </form>
    </div>
</div>

</body>
<script>
jQuery(document).ready(function($){
	/* 로그인 버튼 클릭 메서드 */
	
	$(".login_button").click(function(){	
		/* 로그인 메서드 서버 요청 */
		$("#login-form").attr("action", "/user/login.do");
		$("#login-form").submit();
	});
});
</script>
</html>


