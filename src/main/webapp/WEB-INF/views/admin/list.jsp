<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/admin/list.css">

</head>
<body>

<%@include file="../includes/adminHeader.jsp" %>
	<div class="product_table_wrap">
                    	<!-- 상품 리스트 O -->
	                    <c:if test="${listcheck != 'empty'}">
	                    	<table class="product_table">
	                    		<thead>
	                    			<tr>
										<td class="th_column_1">상품 번호</td>
	                    				<td class="th_column_2">상품 이름</td>
	                    				<td class="th_column_3">카테고리</td>
	                    				<td class="th_column_4">상품 가격</td>
	                    				<td class="th_column_5">재고</td>
	                    			</tr>
	                    		</thead>	
	                    		<c:forEach items="${list}" var="list">
	                    		<tr>
	                    			<td><c:out value="${list.productCode}"></c:out></td>
	                    			<td>
	                    				<a href="/admin/view?n=${list.productCode}"><c:out value="${list.productName}"></c:out></a>
	                    			</td>
	                    			<td><c:out value="${list.cateName}"></c:out></td>
	                    			<td>
	                    				<fmt:formatNumber value="${list.productPrice}" pattern="###,###,###"></fmt:formatNumber>
	                    			</td>
	                    			<td><c:out value="${list.stock}"></c:out></td>
	                    		</tr>
	                    		</c:forEach>
	                    	</table>
	                    </c:if>

                	</div>

	
<%@include file="../includes/footer.jsp" %>
 
<script>
$(document).ready(function(){
	/* 등록 성공 이벤트 */
	let eResult = '<c:out value="${enroll_result}"/>';
	checkResult(eResult);
	function checkResult(result){
		
		if(result === ''){
			return;
		}
		
		alert("상품'"+ eResult +"'을 등록하였습니다.");
		
	}
	
	/* 수정 성공 이벤트 */
	let modify_result = '${modify_result}';
	
	if(modify_result == 1){
		alert("수정 완료");
	}	
	
	/* 삭제 결과 경고창 */
	let delete_result = '${delete_result}';
	
	if(delete_result == 1){
		alert("삭제 완료");
	}	
});
</script> 	