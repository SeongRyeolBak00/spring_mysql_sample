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

</head>
<body>
<%@ include file="../includes/header.jsp"%>   
        <!-- Product section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6">
                <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                  <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                  </ol>
                  <div class="carousel-inner">
                    <div class="carousel-item active">
                      <img class="d-block w-100" src="/resources/images/product-1-720x480.jpg" alt="First slide">
                    </div>
                    <div class="carousel-item">
                      <img class="d-block w-100" src="/resources/images/product-2-720x480.jpg" alt="Second slide">
                    </div>
                    <div class="carousel-item">
                      <img class="d-block w-100" src="/resources/images/product-3-720x480.jpg" alt="Third slide">
                    </div>
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
                        <div class="small mb-1">??????</div>
                        <!-- Product reviews-->
                        <div class="d-flex justify-content-left big text-warning mb-2">
                             <div class="bi-star-fill" data-rating="1"></div>
                             <div class="bi-star-fill" data-rating="2"></div>
                             <div class="bi-star-fill" data-rating="3"></div>
                        </div>
                        <h1 class="display-5 fw-bolder">?????? ?????? ?????????</h1>
                        <div class="fs-5 mb-5">
                            <%----<span class="text-decoration-line-through">$45.00</span> --%>
                            <span>8,000???</span>
                        </div>
                        <p class="lead">???????????? ???????????? ????????? ????????? ?????? ???????????? ?????? ????????????. ?????? ????????? ?????? ?????? ????????? ????????? ???????????? ???????????? ????????? ??? ??? ??????. ????????? ?????? ????????? ????????? ????????? ????????? ??????, ????????? ????????? ?????? ????????? ?????? ????????? ??????. ???????????? ????????? ??????????????? ????????????, ????????? ?????? ?????? ?????? ????????? ?????? ???????????? ????????? ?????? ?????? ????????? ???????????? ??????. </p>
                        <div class="fs-5 mb-6">
	                      <div class="col-md-6">
	                        <label>Quantity</label>
							<input type="text" class="form-control" placeholder="1">
	                      </div>
	                    </div>
                      
                        <div class="fs-5 mb-5">
                            <button class="btn btn-outline-dark flex-shrink-0" type="button">
                                <i class="bi-cart-fill me-1"></i>
                                	????????????	
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </section>

    <!-- Bootstrap -->
    <script src="/resources/js/bootstrap.min.js"></script> 
    <!-- Plugins -->
    <script src="/resources/js/mixitup.js"></script> 
     
    <%@ include file="../includes/footer.jsp"%>   
</body>
</html>