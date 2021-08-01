<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../includes/header.jsp" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>PPAS foodShop</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="/resources/assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/resources/css/styles.css" rel="stylesheet" />
        <script
		  src="https://code.jquery.com/jquery-3.4.1.js"
		  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
		  crossorigin="anonymous"></script>
    </head>
    <body>

        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-3 justify-content-center">
                
                <c:forEach items="${list}" var="product">

                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- 인기상품
                            <div class="badge bg-warning text-white position-absolute" style="top: 0.5rem; right: 0.5rem">인기상품</div>-->
                            <!-- Product image-->
                            <div id="uploadResult">
                            	<div id=result_card>
									<img class="card-img-top" src="/display?fileName=${product.fileName}/${product.fileName}">
									<script>
					var uploadResult = $("#uploadResult");			
				
					$.getJSON("/getAttachList", {productCode : productCode}, function(arr){	
						if(arr.length === 0){			
							var str = "";
							str += "<div id='result_card'>";
							str += "<img src='/resources/images/NoImage.png'>";
							str += "</div>";
							uploadReslut.html(str);	
						}
						
						console.log(arr);
						var str = "";
						var obj = arr[0];	
							
						var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
						str += "<div id='result_card'";
						str += "data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "'";
						str += ">";
						str += "<img class='card-img-top' src='/display?fileName=" + fileCallPath +"'>";
						str += "</div>";		
						uploadReslut.html(str);									
					});	
				});	
				</script>
								</div>
							</div>
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h4 class="fw-bolder">${product.productName}</h4>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    <!-- Product price-->
                                    <fmt:formatNumber value="${product.productPrice}" pattern="###,###,###"></fmt:formatNumber>원
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="/product/view?n=${product.productCode}">상세보기</a></div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
               
                </div>
            </div>
        </section>
<%@include file="../includes/footer.jsp" %>

<script>
$(document).ready(function(){
	/* 이미지 호출 */
	var productCode = '<c:out value="${product.productCode}"/>';
	var uploadResult = $("#uploadResult");			

	$.getJSON("/getAttachList", {productCode : productCode}, function(arr){	
		if(arr.length === 0){			
			var str = "";
			str += "<div id='result_card'>";
			str += "<img src='/resources/images/NoImage.png'>";
			str += "</div>";
			uploadReslut.html(str);	
		}
		
		console.log(arr);
		var str = "";
		var obj = arr[0];	
			
		var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
		str += "<div id='result_card'";
		str += "data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "'";
		str += ">";
		str += "<img class='card-img-top' src='/display?fileName=" + fileCallPath +"'>";
		str += "</div>";		
		uploadReslut.html(str);									
	});	
});	
</script>