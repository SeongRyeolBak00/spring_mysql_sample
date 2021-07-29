<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
  
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="/resources/assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/resources/css/styles.css" rel="stylesheet" />
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="/main"></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="/main">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">베스트</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">신제품</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">카테고리</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!">오늘의 상품</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="/product/list?c=1">과일</a></li>
                                <li><a class="dropdown-item" href="/product/list?c=2">채소</a></li>
                                <li><a class="dropdown-item" href="/product/list?c=3">정육</a></li>
                                <li><a class="dropdown-item" href="/product/list?c=4">수산물</a></li>
                                <li><a class="dropdown-item" href="/product/list?c=5">냉동신품</a></li>
                                <li><a class="dropdown-item" href="/product/list?c=6">반찬</a></li>
                                <li><a class="dropdown-item" href="/product/list?c=7">음료</a></li>
                                <li><a class="dropdown-item" href="/product/list?c=8">유제품</a></li>
                            </ul>
                        </li>
                        <!-- 로그인 하지 않은 상태 -->
                        <c:if test = "${user == null }">
	                        <li class="nav-item"><a class="nav-link" href="/user/login">로그인</a></li>
	                        <li class="nav-item"><a class="nav-link" href="/user/join">회원가입</a></li>
                   		</c:if>
                   		<!-- 로그인한 상태 -->
		                <c:if test="${ user != null }">
		                	<c:if test="${user.userAdmin == 1 }">
		                        <li class="nav-item"><a class="nav-link" href="/admin/main">관리자 페이지</a></li>
		                    </c:if>
		            	    <li class="nav-item"><a class="nav-link" href="/user/userinfo">내정보</a></li>
		            	    <li class="nav-item"><a class="nav-link" id="nav-link-logout">로그아웃</a></li>
		                </c:if>
                    </ul>
                    <form class="d-flex">
                        <button class="btn btn-outline-dark" type="submit">
                            <i class="bi-cart-fill me-1"></i>
                            	장바구니
                            <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                        </button>
                    </form>
                </div>
            </div>
        </nav>

<script>
    /*  로그아웃 버튼 작동 */
    $("#nav-link-logout").click(function(){
        $.ajax({
            type:"POST",
            url:"/user/logout.do",
            success:function(data){
                //alert("로그아웃 성공");
                document.location.reload();     
            } 
        }); // ajax 
    });
</script>
        