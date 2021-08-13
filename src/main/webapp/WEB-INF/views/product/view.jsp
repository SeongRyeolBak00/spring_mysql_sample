<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html>
<head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Shop Item</title>
	    <link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.min.css">	    
	    <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="/resources/assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link rel="stylesheet" href="/resources/css/styles.css">
        <script type="text/javascript" src="https://cdn.ckeditor.com/ckeditor5/29.0.0/classic/ckeditor.js"></script>
		<script>
		function replyList(){
			var productCode = ${product.productCode};
		 	$.getJSON("/product/view/replyList" + "?n=" + productCode, function(data){
		  	var str = "";
		 	$(data).each(function(){
			   	console.log(data);
			   	var repDate = new Date(this.repDate);
			   	var result=this.rating;
			   	repDate = repDate.toLocaleDateString("ko-US")
			  	  for (var i = 0; i < result.length; i++){
			  		document.write("5")
				  };
			    str += "<li data-productCode='" + this.productCode + "'>"
			     + "<div class='userInfo'>"			    
			     + "<span class='userId'>" + this.userId + "</span>"
			     + "<span class='date'>" + repDate + "</span>"
			     + "<span class='rating'>" + result + "</span>"
			     + "</div>"
			     + "<div><c:forEach var='reply' items='${reply}' varStatus='status' >★</c:forEach></div>"
			     + "<div class='reply'>" + this.reply + "</div>"
			     + "<div class='replyFooter'>"
			     + "<button type='button' class='modify' data-replyCode='" + this.replyCode + "'>수정</button>"
			     + "<button type='button' class='delete' data-replyCode='" + this.replyCode + "'>삭제</button>"
			     + "</div>"
			     + "</li>";           
			  	});
			  $("section.replyList ol").html(str);
			 });
		}
		</script>
</head>
<body>
<%@ include file="../includes/header.jsp"%>   
        <!-- Product section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
            
            <form role="form" method="post">
				<input type="hidden" name="productCode" name="n" value="${product.productCode}" />
			</form>
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6">
                <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                  <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                  </ol>
                  <div class="carousel-inner">
                    <%-- <div class="carousel-item active">
                   
                   		 <img class="d-block w-100" src="/resources/images/product-1-720x480.jpg" alt="First slide">
                    </div>
                    <div class="carousel-item">
                      <img class="d-block w-100" src="/resources/images/product-2-720x480.jpg" alt="Second slide">
                    </div>
                    <div class="carousel-item">
                      <img class="d-block w-100" src="/resources/images/product-3-720x480.jpg" alt="Third slide"> 
                    </div>-->--%>
                  </div>
                  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                  </a>
                  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                  </a>
                </div>

                <br>
              </div>
                    
                    <div class="col-md-6">
                        <div class="small mb-1">${product.cateName }</div>
                        <!-- Product reviews-->
                        <div class="d-flex justify-content-left big text-warning mb-2">
                             <div class="bi-star-fill" data-rating="1"></div>
                             <div class="bi-star-fill" data-rating="2"></div>
                             <div class="bi-star-fill" data-rating="3"></div>
                        </div>
                        <h1 class="display-5 fw-bolder">${product.productName}</h1>
                        <div class="fs-5 mb-5">
                            <span>${product.productPrice}원</span>
                        </div>
                        <p class="lead">${product.contents}</p>
                        
                        <div class="fs-5 mb-6">
	                      <div class="col-md-6">
	                        <label>Quantity</label>
							<input type="text" class="form-control" placeholder="1">
	                      </div>
	                    </div>
                      
                        <div class="fs-5 mb-5">
                            <button class="btn btn-outline-dark flex-shrink-0" type="button">
                                <i class="bi-cart-fill me-1"></i>
                                	장바구니
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            
            <div id="replyview">
            	<c:if test="${user == null }">
  					<p>소감을 남기시려면 <a href="/user/login">로그인</a>해주세요</p>
 				</c:if>

 				<c:if test="${user != null}">
			 		<section class="replyForm">
				  		<form role="form" method="post" autocomplete="off">
				  		<input type="hidden" name="productCode" id="productCode" value="${product.productCode}">
				  			<div class="rating">				  			     
				  			     <fieldset>
							        <input type="radio" name="rating" value="5" id="rate1"><label for="rate1">⭐</label>
							        <input type="radio" name="rating" value="4" id="rate2"><label for="rate2">⭐</label>
							        <input type="radio" name="rating" value="3" id="rate3"><label for="rate3">⭐</label>
							        <input type="radio" name="rating" value="2" id="rate4"><label for="rate4">⭐</label>
							        <input type="radio" name="rating" value="1" id="rate5"><label for="rate5">⭐</label>
							    </fieldset>
				  			</div>
				  			<div class="input_area">
				  			    <div class="warning_msg">5자 이상으로 작성해 주세요.</div>
						   		<textarea name="reply" class="reply" id="reply" rows="5"></textarea>
						    </div>
<c:forEach var='reply' items='${reply}' varStatus='status' begin='1' end="3">${reply.rating}★</c:forEach>
						    <div class="input_area">
						    	<button type="submit" id="reply_btn">소감 남기기</button>
						    </div>
				  		</form>
			 		</section>
			  	</c:if>

			 	<section class="replyList">
				   <ol>
				   

				   	<!--<c:forEach items="${reply}" var="reply">
					  <li>
					      <div class="userInfo">
					      	<span class="date"><fmt:formatDate value="${reply.repDate}" pattern="yyyy-MM-dd" /></span>
					      </div>
					      <div class="replyContent">${reply.reply}</div>
					    </li>
					</c:forEach>-->
				   </ol>    
				   <script>
				   		replyList();
				   </script>
	
					
			 	</section>
			</div>
        </section>

    <!-- Bootstrap -->
    <script src="/resources/js/bootstrap.min.js"></script> 
    <!-- Plugins -->
    <script src="/resources/js/mixitup.js"></script> 
     
    <%@ include file="../includes/footer.jsp"%>   
    
   
<script>
$(document).ready(function(){
	$( ".star_rating label" ).click(function() {
	     $(this).parent().children("label").removeClass("on");
	     $(this).addClass("on").prevAll("label").addClass("on");
	     return false;
	});
	ClassicEditor
		.create(document.querySelector('#reply'),{
			toolbar: {
				  items: [
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
	/* 이미지 정보 호출 */
	let productCode = '<c:out value="${product.productCode}"/>';
	let uploadResult = $(".carousel-inner");			
	
	$.getJSON("/getAttachList", {productCode : productCode}, function(arr){	
		let str = "";
		console.log(arr);
		$(arr).each(function(i, obj){		
			let fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
			str += "<div class='carousel-item active'";
			str += "data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "'";
			str += ">";
			str += "<img class='d-block w-100' width='270px' height='360px' src='/display?fileName=" + fileCallPath +"'>";
			str += "</div>";	
			str += "<div class='carousel-item'";
			str += "data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "'";
			str += ">";
			str += "<img class='d-block w-100' width='400px' height='350px' src='/display?fileName=" + fileCallPath +"'>";
			str += "</div>";
		});
		uploadResult.html(str);						
	});	
	
});	

</script>