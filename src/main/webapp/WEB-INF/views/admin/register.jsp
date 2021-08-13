<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/admin/register.css">
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
    <form action="/admin/register.do" method="post" id="registerForm">
    	
    	<div class="form_section">
	        <div class="form_section_title">
	        	<label>카테고리</label>
	        </div>
	        <div class="form_section_content">
	            <select class="category" name="cateCode">
	            	<option value="none" selected>=== 선택 ===</option>
	           </select>
	           <span class="ck_warn cateCode_warn">카테고리를 선택해주세요.</span> 
	       </div>
        </div>
                    		             		
	       <div class="form_section">
	           <div class="form_section_title">
	                <label>상품 이름</label>
	           </div>
	       		<div class="form_section_content">
	           		<input name="productName">
	           		<span class="ck_warn productName_warn">상품 이름을 입력해주세요.</span>
	       		</div>
	      </div>
         
          <div class="form_section">
                <div class="form_section_title">
                    <label>상품 가격</label>
                </div>
          		<div class="form_section_content">
                    <input name="productPrice" type="text" id="price">
                    <span class="ck_warn productPrice_warn">상품 가격을 입력해주세요.</span>
                </div>
          </div>
         
          <div class="form_section">
                <div class="form_section_title">
                    <label>상품 재고</label>
                </div>
                <div class="form_section_content">
                    <input name="stock" type="text" value="100" id="stock">
                    <span class="ck_warn stock_warn">상품 재고를 입력해주세요.</span>
                </div>
          </div>
                   
          <div class="form_section">
                <div class="form_section_title">
                    <label>상품 내용</label>
                </div>
                <div class="form_section_content">
                    <textarea id="contents_textarea" name="contents"></textarea>
                    <span class="ck_warn contents_warn">상품 내용을 입력해주세요.</span>
                </div>
          </div>
          
          <div class="form_section">
                <div class="form_section_title">
                    <label>상품 이미지</label>
                </div>
                <div class="form_section_content">
					<input type="file" id ="fileItem" name='uploadFile' style="height: 50px;" multiple>	
					<div id="uploadResult">
					</div>				
                </div>
          </div>           
          
          <div class="btn1_section">
          	    <button id="registerBtn" class="btn1 register_btn">등 록</button>
                <button id="cancelBtn" class="btn1">취 소</button>
	      </div> 
     </form>

     </div>				
<%@include file="../includes/footer.jsp" %>
 
<script>
$(document).ready(function(){
let registerForm = $("#registerForm")	
/* 취소 버튼 */
$("#cancelBtn").click(function(){
	location.href="/admin/register"
});

/* 상품 등록 버튼 */
$("#registerBtn").on("click",function(e){
	e.preventDefault();	
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
		//alert('통과');
		registerForm.submit();
	} else {
		return false;
	}
});
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
	
 	/* 이미지 업로드 */
	$("input[type='file']").on("change", function(e){
		var formData = new FormData();
		var fileInput = $('input[name="uploadFile"]');
		var fileList = fileInput[0].files;
		var fileObj = fileList[0];
		if(!fileCheck(fileObj.name, fileObj.size)){
			return false;
		}
		for(let i = 0; i < fileList.length; i++){
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
	    	},
	    	error : function(result){
	    		alert("이미지 파일이 아닙니다.");
	    	}
		});	
	});
	/* 크기,파일 업로드 체크 */
	var regex = new RegExp("(.*?)\.(jpg|png)$");
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
			str += "<div id='result_card'>";
			str += "<img src='/display?fileName=" + fileCallPath +"'>";
			str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
			str += "<input type='hidden' name='imageList["+i+"].fileName' value='"+ obj.fileName +"'>";
			str += "<input type='hidden' name='imageList["+i+"].uuid' value='"+ obj.uuid +"'>";
			str += "<input type='hidden' name='imageList["+i+"].uploadPath' value='"+ obj.uploadPath +"'>";		
			str += "</div>";		
		});
   		uploadResult.append(str);     
        
	}	
	 
	/* 이미지 삭제 버튼 동작 */
	$("#uploadResult").on("click", ".imgDeleteBtn", function(e){
		deleteFile();
	});
	
	/* 파일 삭제 메서드 */
	function deleteFile(){
		let targetFile = $(".imgDeleteBtn").data("file");
		let targetDiv = $("#result_card");
		$.ajax({
			url: '/admin/deleteFile',
			data : {fileName : targetFile},
			dataType : 'text',
			type : 'POST',
			success : function(result){
				console.log(result);
				targetDiv.remove();
				$("input[type='file']").val("");
			},
			error : function(result){
				console.log(result);
				alert("파일을 삭제하지 못하였습니다.")
			}
		});
	}
	/* 가격,재고 숫자만 허용 */
	var regExp = /[^0-9]/gi;
	$("#price").keyup(function(){ numCheck($(this)); });
	$("#stock").keyup(function(){ numCheck($(this)); });
	function numCheck(selector) {
	 var tempVal = selector.val();
	 selector.val(tempVal.replace(regExp, ""));
	}

});
</script> 	