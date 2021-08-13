<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/admin/modify.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/29.0.0/classic/ckeditor.js"></script>
</head>

<body>
<%@include file="../includes/adminHeader.jsp" %>
			<div class="admin_content_main">
				<form id="modifyForm" action="/admin/modify" method="post">

			 	<div class="form_section">
			        <div class="form_section_title">
			        	<label>카테고리</label>
			        </div>
			        <div class="form_section_content">
				        <select class="category" name="cateCode">
				        	<option value="${product.cateCode}" selected>${product.cateName }</option>
			        	</select>
			       </div>
		        </div>

				<div class="form_section">
                	<div class="form_section_title">
                    	<label>상품 이름</label>
                    </div>
                    <div class="form_section_content">
                    	<input name="productName" value="${product.productName}" >
	           			<span class="ck_warn productName_warn">상품 이름을 입력해주세요.</span>
                    </div>
                </div>
                    		
                    		
                <div class="form_section">
                    <div class="form_section_title">
                    	<label>상품 가격</label>
                    </div>
	                <div class="form_section_content">
	                    <input name="productPrice" value="${product.productPrice}" id="price">
	                    <span class="ck_warn productPrice_warn">상품 가격을 입력해주세요.</span>
	                </div>
                </div>          
                     
                <div class="form_section">
                    <div class="form_section_title">
                    	<label>상품 재고</label>
                    </div>
                    <div class="form_section_content">
                    	<input name="stock" value="${product.stock}" id="stock">
                    	<span class="ck_warn stock_warn">상품 재고를 입력해주세요.</span>
                    </div>
                </div>          
                   		
                <div class="form_section">
                    <div class="form_section_title">
                    	<label>상품 내용</label>
                    </div>
                    <div class="form_section_content bit">
                    	<textarea name="contents" rows="5" id="contents_textarea" >${product.contents}</textarea>
                    	<span class="ck_warn contents_warn">상품 내용을 입력해주세요.</span>
                    </div>
                </div>
                
                <div class="form_section">
                    <div class="form_section_title">
                    	<label>상품 이미지</label>
                    </div>
                    <div class="form_section_content">
                    	<div class="form-group uploadDiv">
                    		<input type="file" name='uploadFile' id ="fileItem" name='uploadFile' style="height: 50px;"  multiple="multiple">
						</div>
						<div id="uploadResult">
						</div>
                    </div>
                </div>
                
                <input type="hidden" name="productCode" value="${product.productCode}">
				</form>	
                 <div class="btn1_section">
                   	<button id="listBtn" class="btn1">상품 정보</button>
					<button id="modifyBtn" class="btn1 modify_btn">수 정 </button>	  
					<button id="deleteBtn" class="btn1 delete_btn">삭 제</button>
	            </div> 
        	</div>      
        		
<%@include file="../includes/footer.jsp" %>

<script>
$(document).ready(function(){
var formObj = $("form");
/* 위지윅 적용 */
ClassicEditor
	.create(document.querySelector('#contents_textarea'),{
		toolbar: {
			  toolbar: [
			        'heading', '|',
			        'fontfamily', 'fontsize', '|',
			        'alignment', '|',
			        'fontColor', 'fontBackgroundColor', '|',
			        'bold', 'italic', 'strikethrough', 'underline', 'subscript', 'superscript', '|',
			        'link', '|',
			        'outdent', 'indent', '|',
			        'bulletedList', 'numberedList', 'todoList', '|',
			        'code', 'codeBlock', '|',
			        'insertTable', '|',
			        'uploadImage', 'blockQuote', '|',
			        'undo', 'redo'
			    ],
			    shouldNotGroupWhenFull: true
		}
	})
	.then( editor => {
		console.log( editor );
	})
	.catch(error=>{
		console.error(error);
	});

	
	/* 기존 이미지 호출 */
	let productCode = '<c:out value="${product.productCode}"/>';
	let uploadResult = $("#uploadResult");			
	
	$.getJSON("/getAttachList", {productCode : productCode}, function(arr){	
		  console.log(arr);
		let str = "";
		$(arr).each(function(i, obj){		
			let fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
			str += "<div id='result_card'";
			str += "data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "'";
			str += ">";
			str += "<img src='/display?fileName=" + fileCallPath +"'>";
			str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
			console.log(obj);
			str += "<input type='hidden' name='imageList["+i+"].fileName' value='"+ obj.fileName +"'>";
			str += "<input type='hidden' name='imageList["+i+"].uuid' value='"+ obj.uuid +"'>";
			str += "<input type='hidden' name='imageList["+i+"].uploadPath' value='"+ obj.uploadPath +"'>";		
			str += "</div>";	
		});
		uploadResult.html(str);						
	});	
	
	/* 이미지 삭제 버튼 동작 */
	$("#uploadResult").on("click", ".imgDeleteBtn", function(e){
		deleteFile();
	});
	/* 파일 삭제 메서드 */
	function deleteFile(){
		$("#result_card").remove();
	}

	/* 이미지 업로드 */
	var cloneObj = $(".uploadDiv").clone(); 
	$("input[type='file']").change(function(e){
		let formData = new FormData();
		let fileInput = $("input[name='uploadFile']");
		let fileList = fileInput[0].files;
		//let fileObj = fileList[0];

		for(let i = 0; i < fileList.length; i++){
			if(!fileCheck(fileList[i].name, fileList[i].size)){
			return false;
			} 
			formData.append("uploadFile", fileList[i]);
		}
		$.ajax({
			url: '/admin/uploadAjaxAction',
	    	processData : false,
	    	contentType : false,
	    	data : formData,
	    	type : 'POST',
	    	dataType : 'json',
	    	success : function(result){
	    		console.log(result);
	    		showUploadImage(result);
	    		$(".uploadDiv").html(cloneObj.html());
	    	},
	    	error : function(result){
	    		alert("이미지 파일이 아닙니다.");
	    	}
		});	
	});
	/* 크기,파일 업로드 체크 */
	let regex = new RegExp("(.*?)\.(jpg|png)$");
	let maxSize = 5242880; 	
	function fileCheck(fileName, fileSize){
		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
		if(!regex.test(fileName)){
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		return true;		
	}

	/* 이미지 출력 */
	function showUploadImage(uploadResultArr){
		/* 전달받은 데이터 검증 */
		if(!uploadResultArr || uploadResultArr.length == 0){return}
		let uploadResult = $("#uploadResult");
		let str = "";
		$(uploadResultArr).each(function(i, obj){		
			let fileCallPath = encodeURIComponent(obj.uploadPath.replace(/\\/g, '/') + "/s_" + obj.uuid + "_" + obj.fileName);
			str += "<div id='result_card'";
			str += "data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "'";
			str += ">";
			str += "<img src='/display?fileName=" + fileCallPath +"'>";
			str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
			console.log(obj);
			str += "<input type='hidden' name='imageList["+i+"].fileName' value='"+ obj.fileName +"'>";
			str += "<input type='hidden' name='imageList["+i+"].uuid' value='"+ obj.uuid +"'>";
			str += "<input type='hidden' name='imageList["+i+"].uploadPath' value='"+ obj.uploadPath +"'>";		
			str += "</div>";		
		});
		uploadResult.append(str);     
	}	

});


/* 삭제 버튼 */
$("#deleteBtn").on("click", function(e){
	e.preventDefault();
	var con = confirm("정말로 삭제하시겠습니까?");
	if(con){
	let moveForm = $("#modifyForm");
	moveForm.find("input").remove();
	moveForm.append('<input type="hidden" name="productCode" value="${product.productCode}">');
	moveForm.attr("action", "/admin/delete");
	moveForm.attr("method", "post");
	moveForm.submit();
	}
});

/*컨트롤러에서 카테고리 데이터 받기*/
 var jsonData = JSON.parse('${category}');
 var cateArr = new Array();
 var cateObj = new Object();

 /* 셀렉트 박스에 삽입할 데이터 준비*/
 for(var i = 0; i < jsonData.length; i++) {
  if(jsonData[i].cateCode != "") {
   cateObj = new Object();  //초기화
   cateObj.cateCode = jsonData[i].cateCode;
   cateObj.cateName = jsonData[i].cateName;
   cateArr.push(cateObj);
  }
 }
 
 /* 셀렉트 박스에 데이터 삽입*/
 var cateSelect = $("select.category");
 
 for(var i = 0; i < cateArr.length; i++) {
  cateSelect.append("<option value='" + cateArr[i].cateCode + "'>"
       + cateArr[i].cateName + "</option>"); 
 }

 /* 목록 이동 버튼 */
 $("#listBtn").on("click", function(e){
 	location.href = "/admin/view?n=" + ${product.productCode};
 });	

 /* 수정 페이지 이동 */
 $("#modifyBtn").on("click", function(e){
 	e.preventDefault();	
 	var operation = $(this).data("oper");
 	 console.log(operation);

 	/* 체크 변수 */
 	var productNameCk = false;
 	var cateCodeCk = false;
 	var priceCk = false;
 	var stockCk = false;
 	var contentsCk = false;	
 	
 	/* 체크 대상 변수 */
 	var productName = $("input[name='productName']").val();
 	var cateCode = $("select[name='cateCode']").val();
 	var productPrice = $("input[name='productPrice']").val();
 	var stock = $("input[name='stock']").val();
 	var contents = $(".bct p").html();	
 	
 	/* 공란 체크 */
 	if(productName){
 		$(".productName_warn").css('display','none');
 		productNameCk = true;
 	} else {
 		$(".productName_warn").css('display','block');
 		productNameCk = false;
 	}
 	
 	if(cateCode != 'none'){
 		$(".cateCode_warn").css('display','none');
 		cateCodeCk = true;
 	} else {
 		$(".cateCode_warn").css('display','block');
 		cateCodeCk = false;
 	}	
 	
 	if(productPrice != 0){
 		$(".productPrice_warn").css('display','none');
 		priceCk = true;
 	} else {
 		$(".productPrice_warn").css('display','block');
 		priceCk = false;
 	}	
 	
 	if(stock != 0){
 		$(".stock_warn").css('display','none');
 		stockCk = true;
 	} else {
 		$(".stock_warn").css('display','block');
 		stockCk = false;
 	}		
 	
 	if(contents != '<br data-cke-filler="true">'){
 		$(".contents_warn").css('display','none');
 		contentsCk = true;
 	} else {
 		$(".contents_warn").css('display','block');
 		contentsCk = false;
 	}		
 	/* 최종 확인 */
 	if(productNameCk && cateCodeCk && priceCk && stockCk&& contentsCk ){
 		$("#modifyForm").submit();
 	} else {
 		return false;
 	} 

});	
 
	/* 가격,재고 숫자만 허용 */
	var regExp = /[^0-9]/gi;
	$("#price").keyup(function(){ numCheck($(this)); });
	$("#stock").keyup(function(){ numCheck($(this)); });
	function numCheck(selector) {
	 var tempVal = selector.val();
	 selector.val(tempVal.replace(regExp, ""));
	}
</script>    