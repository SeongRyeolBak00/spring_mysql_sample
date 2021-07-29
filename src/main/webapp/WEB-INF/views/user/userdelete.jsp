<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PPAS 쇼핑몰 - 회원탈퇴</title>
<link rel="stylesheet" href="/resources/css/user/userdelete.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
</head>
<body>
<%@ include file="../includes/header.jsp"%>   

	<div class="wrapper">
		<div class="wrap">
			<div class="top_title_area">
					<span>회원 탈퇴</span>
			</div>
			<div class="user_withdrawal_cause">
				<div class="user_withdrawal_cause_wrap">
					<span>* 탈퇴 이유가 무엇인가요?</span>
					
					<div class="user_withdrawal_causeck">
						<input type="radio" name="cause" id="cause1"/>
						<label for="cause1">없어요.</label>
						<input type="radio" name="cause" id="cause2"/>
						<label for="cause2">이유 1</label>
						<input type="radio" name="cause" id="cause3"/>
						<label for="cause3">그냥 맘에 안들어요.</label>
					</div>
					
				</div>	
				
				<div class="user_withdrawal_message_wrap">
					<span>관리자에게 남기고 싶은 메세지(최대 1000자)</span>
					<textarea name="user_withdrawal_message"></textarea>
				</div>
			</div>

			<div class="delete_button_wrap">
				<input type="button" class="delete_button" value="탈퇴 신청">
			</div>
		</div>
	</div>
	<form id="moveForm" method="get">
		<input type="hidden" name="userId" value='<c:out value="${user.userId}"/>'>
	</form>
</body>
<%@ include file="../includes/footer.jsp"%>  

<script>
var moveForm = $("#moveForm");
/* 삭제 버튼 */
$(".delete_button").on("click", function(e){
	e.preventDefault();
	var isRemove=confirm('정말 회원탈퇴를 하시겠습니까?');
	 if(!isRemove){
		 return;
	 }
	moveForm.find("input").remove();
	moveForm.append('<input type="hidden" name="userId" value="${user.userId}">');
	moveForm.attr("action", "/user/userdelete");
	moveForm.attr("method", "post");
	moveForm.submit();
});

</script>
</html>