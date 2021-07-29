<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/admin/view.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/29.0.0/classic/ckeditor.js"></script>
</head>
<body>

<%@include file="../includes/adminHeader.jsp" %>
			<div class="admin_content_main">
			 	<div class="form_section">
			        <div class="form_section_title">
			        	<label>카테고리</label>
			        </div>
			        <div class="form_section_content">
			        	<input name="cateName" value="${product.cateName }" disabled>
			       </div>
		        </div>
		                 
				<div class="form_section">
                	<div class="form_section_title">
                    	<label>상품 이름</label>
                    </div>
                    <div class="form_section_content">
                    	<input name="productName" value="${product.productName}" disabled>
                    </div>
                </div>
                    		
                    		
                <div class="form_section">
                    <div class="form_section_title">
                    	<label>상품 가격</label>
                    </div>
	                <div class="form_section_content">
	                    <input name="productPrice" value="${product.productPrice}" disabled>
	                </div>
                </div>          
                     
                <div class="form_section">
                    <div class="form_section_title">
                    	<label>상품 재고</label>
                    </div>
                    <div class="form_section_content">
                    	<input name="stock" value="${product.stock}" disabled>
                    </div>
                </div>          
                   		
                <div class="form_section">
                    <div class="form_section_title">
                    	<label>상품 내용</label>
                    </div>
                    <div class="form_section_content bit">
                    	<textarea name="contents" id="contents_textarea" disabled>${product.contents}</textarea>
                    </div>
                </div>        		

 				<div class="form_section">
                    <div class="form_section_title">
                    	<label>상품 이미지</label>
                    </div>
                    <div class="form_section_content">
						<div id="uploadResult">
						</div>
                    </div>
                </div>
                
                <div class="btn1_section">
                   	<button id="listBtn" class="btn1">상품 목록</button>
					<button id="modifyBtn" class="btn1 enroll_btn">수정 </button>	                
	            </div> 
	            <form id="form" action="/admin/modify" method="get">
        			<input type="hidden" id="productCode" name="n" value="${product.productCode}">
        		</form>	
        	</div>      
<%@include file="../includes/footer.jsp" %>

<script>
$(document).ready(function(){
	/* 위지윅 적용 */
	ClassicEditor
		.create(document.querySelector('#contents_textarea'))
		.then(editor => {
			console.log(editor);
			editor.isReadOnly = true;
		})
		.catch(error=>{
			console.error(error);
		});
	
	/* 이미지 정보 호출 */
	let productCode = '<c:out value="${product.productCode}"/>';
	let uploadResult = $("#uploadResult");			
	
	$.getJSON("/getAttachList", {productCode : productCode}, function(arr){	
		let str = "";
		$(arr).each(function(i, obj){		
			let fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
			str += "<div id='result_card'";
			str += "data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "'";
			str += ">";
			str += "<img src='/display?fileName=" + fileCallPath +"'>";
			str += "</div>";	
		});
		uploadResult.html(str);						
	});	

});	
var formObj = $("#form");
	
/* 목록 이동 버튼 */
$("#listBtn").on("click", function(e){
	e.preventDefault();
	formObj.find("#productCode").remove();
	formObj.attr("action", "/admin/list");
	formObj.submit();	
});	

/* 수정 페이지 이동 */
$("#modifyBtn").on("click", function(e){
	e.preventDefault();
	formObj.attr("action", "/admin/modify");
	formObj.submit();
});

	
</script>    