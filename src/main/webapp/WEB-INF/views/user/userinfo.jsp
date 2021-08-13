<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<script
	  src="https://code.jquery.com/jquery-3.4.1.js"
	  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	  crossorigin="anonymous"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>PPAS 쇼핑몰 - ${user.userName} 님의 회원정보입니다.</title>
<link rel="stylesheet" href="/resources/css/user/userinfo.css">
</head>
<body>
<%@ include file="../includes/header.jsp"%>  

<div class="wrapper">
	<div class="wrap">
		<div class="top_title_area">
			<span>회원정보</span>
		</div>
		
		<div class="user_info_area">
			<span>아이디 : ${user.userId}</span>
			<span>이름 : ${user.userName}</span>
			<span>이메일 : ${user.userMail}</span>
			<span>휴대폰번호 : ${user.userPhone}</span>
			<span>충전금액 : <fmt:formatNumber value="${user.money }" pattern="\#,###.##"/></span>
			<span>포인트 : <fmt:formatNumber value="${user.point }" pattern="#,###" /></span>
		</div>
		
		<div class="product_shopping">
			<li>장바구니</li>
			<li>상품취소 / 환불하기</li>
		</div>
		
		<div class="user_info_btn_area">
				<li><a href="/user/usermodify">회원정보 수정</a></li>
				<li><a href="/user/userdelete">회원탈퇴</a></li>
				<li><a href="/user/logout.do">로그아웃</a></li>
				<li><a href="/main">메인으로 돌아가기</a></li>
		</div>
	</div>
</div>
<%@ include file="../includes/footer.jsp"%> 
<script>
	/*회원정보 수정 페이지 이동*/
	jQuery(document).ready(function($){
		$("#userUpdateBtn").on("click", function(){
			location.href="/user/usermodify/";
		})
	})
</script>

</body>
</html>