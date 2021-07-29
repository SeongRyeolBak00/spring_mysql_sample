<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manager Page</title>
<link rel="stylesheet" href="../resources/css/admin/main.css">

<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
</head>
<body>
	<%@include file="../includes/header.jsp" %>
				

    <div class="wrapper">
        <div class="wrap">

            <!-- top_subject_area -->
            <div class="admin_top_wrap">
                <span>관리자 페이지</span>
                
            </div>
            <!-- contents-area -->
            <div class="admin_wrap">
                <!-- 네비영역 -->
                <div class="admin_navi_wrap">
                    <ul>
                        <li >
                            <a class="admin_list_01" href="/admin/register">상품 등록</a>
                        </li>
                        <li>
                            <a class="admin_list_02" href="/admin/list">상품 목록</a>
                        </li>
                        <lI>
                            <a class="admin_list_03">회원 관리</a>                            
                        </lI>                                                                                        
                    </ul>
                </div>
                <div class="admin_content_wrap">
                    <h1>환영합니다. 관리자 페이지 입니다.</h1>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
 
 	<%@include file="../includes/footer.jsp" %>

</body>
</html>