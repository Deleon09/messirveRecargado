<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="/WEB-INF/vistas/include-css.jsp" %>
        <%@include file="/WEB-INF/vistas/include-js.jsp" %>
        <script>
        	$(document).ready(function(){
        		
        		//Carousel Setup
        		var swiper = new Swiper(".swiper", {
			        slidesPerView: 3,
			        spaceBetween: 25,
			        loop: true,
			        centerSlide: 'true',
			        fade: 'true',
			        watchSlidesProgress: 'true',
			        grabCursor: 'true',
			        pagination: {
			          el: ".swiper-pagination",
			          clickable: true,
			          dynamicBullets: true,
			        },
			        autoplay: {
					  delay: 4000,
					},
			        navigation: {
			          nextEl: ".swiper-button-next",
			          prevEl: ".swiper-button-prev",
			        },
			        breakpoints: {
			        	0: {
			        		slidesPerView: 1,
			        	},
			        	520: {
			        		slidesPerView: 2,
			        	},
			        	950: {
			        		slidesPerView: 3,
			        	},
			        },
			    });
        		
        		//Add to Cart Handler
        		$( ".addToCart" ).click(function() {
  					var id = $(this).attr("id");
  					
  					var retrievedObject = JSON.parse(localStorage.getItem('userInfo'));
                        
                    var cartItem;    
                        
                    if(retrievedObject){                        
						cartItem = {
	  						user: retrievedObject.id,
	  						products: id,
	  						cantidad: 1
  						};	
  						
  						$.ajax({
		                    data: cartItem,
		                    url: '${pageContext.request.contextPath}/guardarCart',
		                    type: "POST",
		                    success: function (response) {
		                        Swal.fire('Saved in cart!', '', 'success');
		                    },
		                    error: function (x, e) {
		                        Swal.fire('The product is on the Cart already!', '', 'info')
		                    }
	                    });
  						
                    } else {
                    	Swal.fire('Not authenticated!', '', 'info')
                    }
  					
				});
				
				//Funcion para agregar una nueva carta
	    		document.getElementById("newsletterForm").addEventListener("submit", function(event){
		  			event.preventDefault();
		  			var newsletterForm = $("#newsletterForm");
		  	
		  			Swal.fire({
					  title: 'Are you sure?',
					  text: "Your letter will be sent!",
					  icon: 'warning',
					  showCancelButton: true,
					  confirmButtonColor: '#3085d6',
					  cancelButtonColor: '#d33',
					  confirmButtonText: 'Yes continue!'
					}).then((result) => {
		  				if (result.value) {
		  	
		  					$.ajax({
			                    data: newsletterForm.serialize(),
			                    url: '${pageContext.request.contextPath}/guardarCarta',
			                    type: "POST",
			                    success: function (response) {
			                        Swal.fire('Saved!', '', 'success');
			                        $("#newsletterForm")[0].reset();
			                    },
			                    error: function (x, e) {
			                        Swal.fire('Something went wrong!', '', 'info')
			                    }
		                    });
		  				}
					});
				});
        		
        	});
        </script>
    </head>
    <body>

		<!-- NAVBAR IMPORT -->
		<%@include file="/WEB-INF/vistas/navbar.jsp" %>

        <div class="container p-3">         
            
            
            <div class="alert alert-success" style="background-color: #1F69FF;" role="alert">
			  	<h1 class="text-white alert-heading text-center font-weight-bold" style="font-family: 'Fredoka One', cursive; font-weight:900;">We donate 20%</h1>
			  	<p class="text-white text-center" style="font-family: 'Roboto', sans-serif; font-style: normal;">of the value of the product to charity</p>
			</div>   
            
            <!-- CARDS START
			<div class="row mt-4 mb-5">
				<div class="col-lg-4 col-sm-12">
					<div class="card" style="">
						<a href="/singleproduct">					
	  						<img src="<c:url value='/resources/assets/products/t-shirt.png' />" class="card-img-top" alt="...">
						</a>
		  				<div class="card-body">
						    <h5 class="card-title">Card title</h5>
						    <p><span>$100.00</span></p>
						    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
						    <a href="/cart" type="button" style="width: 100%; background-color: #1F69FF;" class="btn text-white"><i style="margin-right: 5px;" class="fa-solid fa-plus"></i> ADD TO CART</a>
		  				</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-12">
					<div class="card" style="">
						<a href="/singleproduct">
  							<img src="<c:url value='/resources/assets/products/t-shirt.png' />" class="card-img-top" alt="...">
		  				</a>
		  				<div class="card-body">
						    <h5 class="card-title">Card title</h5>
						    <p><span>$100.00</span></p>
						    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
						    <a href="/cart" type="button" style="width: 100%; background-color: #1F69FF;" class="btn text-white"><i style="margin-right: 5px;" class="fa-solid fa-plus"></i> ADD TO CART</a>
		  				</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-12">
					<div class="card" style="">
						<a href="/singleproduct">
  							<img src="<c:url value='/resources/assets/products/t-shirt.png' />" class="card-img-top" alt="...">
		  				</a>
		  				<div class="card-body">
						    <h5 class="card-title">Card title</h5>
						    <p><span>$100.00</span></p>
						    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
						    <a href="/cart" type="button" style="width: 100%; background-color: #1F69FF;" class="btn text-white"><i style="margin-right: 5px;" class="fa-solid fa-plus"></i> ADD TO CART</a>
		  				</div>
					</div>
				</div>
			</div>
			CARDS END -->
			
			<!-- CARROUSEL START -->
			<!-- Slider main container -->
			<div class="swiper mt-4 mb-4" style="padding-bottom: 2rem;">
			  <!-- Additional required wrapper -->
			  <div class="swiper-wrapper">
			    <!-- Slides -->
			    <c:forEach items="${products}" var="product"> 
              		<div class="card swiper-slide">
						<a href="/singleproduct/${product.id}">
							<img style="height: 200px;" src="<c:url value='/resources/assets/products/t-shirt.png' />" class="card-img-top" alt="product">
		  				</a>
		  				<div class="card-body">
						    <h5 class="card-title"><c:out value="${product.nombre}"/></h5>
						    <p><span>$ <c:out value="${product.precio}"/></span></p>
						    <p class="card-text"><c:out value="${product.descripcion}"/></p>
						    <button id="${product.id}" type="button" style="width: 100%; background-color: #1F69FF; z-index:100;" class="addToCart btn text-white"><i style="margin-right: 5px;" class="fa-solid fa-plus"></i> ADD TO CART</button>
		  				</div>
					</div>
				</c:forEach>
			  </div>
			  <!-- If we need pagination -->
			  <div class="swiper-pagination"></div>
			
			  <!-- If we need navigation buttons -->
			  <div class="swiper-button-prev"></div>
			  <div class="swiper-button-next"></div>
			</div>
			<!-- CARROUSEL END -->

			<!-- QUESTIONS SECTION START -->
			<div class="mb-5 p-4 rounded" style="background-color: #F0F2FE; font-family: 'Roboto', sans-serif; -webkit-box-shadow: 5px 5px 0px 0px #289FED, 10px 10px 0px 0px #5FB8FF, 15px 15px 0px 0px #A1D8FF, 20px 20px 0px 0px #CAE6FF, 25px 25px 0px 0px #E1EEFF, 10px 10px 27px 5px rgba(0,0,0,0); 
				box-shadow: 5px 5px 0px 0px #289FED, 10px 10px 0px 0px #5FB8FF, 15px 15px 0px 0px #A1D8FF, 20px 20px 0px 0px #CAE6FF, 25px 25px 0px 0px #E1EEFF, 10px 10px 27px 5px rgba(0,0,0,0);">
				<div class="row">
					<div class="col-lg-5">
						<h1 style="color: #FF4754; font-weight: 900; font-family: 'Fredoka One', cursive;">Frequently Asked Questions</h1>
						<p class="text-primary">
							Here are the questions that we have been asked the most.
						</p>
					</div>
					<div class="col-lg-7">
						<div class="accordion" id="accordionExample">
							<div class="accordion-item my-3">
								<h2 class="accordion-header" id="headingOne">
								  <button class="accordion-button font-weight-bold" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
									What Is The Status Of My Online Order?
								  </button>
								</h2>
								<div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
								  <div class="accordion-body">
									<strong>When you place an order on ShopIt or DonateIt, you will receive email updates concerning your order status.</strong> You'll receive a confirmation email after each shipment leaves our warehouse with shipment details and your tracking number. Your order may ship within separate boxes and might be delivered on different date. Each shipping confirmation email will provide information on merchandise that has already been shipped or has not been shipped yet.
								  </div>
								</div>
							</div>
							<div class="accordion-item my-3">
								<h2 class="accordion-header" id="headingTwo">
								  <button class="accordion-button font-weight-bold collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
									Pay Bill
								  </button>
								</h2>
								<div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
								  <div class="accordion-body">
									<strong>Want to pay your bill online?</strong> Sign in to access your account and make a one-time payment.
								  </div>
								</div>
							</div>
							<div class="accordion-item my-3">
								<h2 class="accordion-header" id="headingThree">
								  <button class="accordion-button font-weight-bold collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
									View my orders
								  </button>
								</h2>
								<div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
								  <div class="accordion-body">
									<strong>See your full history:</strong> Please sign in to view the status and details of your online orders and store purchases.
								  </div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		<!-- QUESTIONS SECTION END -->

		<!-- CONTACT SECTION START -->
		<div class="my-3">
			<div style="background-color: #F0F2FE; -webkit-box-shadow: 5px 5px 0px 0px #289FED, 10px 10px 0px 0px #5FB8FF, 15px 15px 0px 0px #A1D8FF, 20px 20px 0px 0px #CAE6FF, 25px 25px 0px 0px #E1EEFF, 10px 10px 27px 5px rgba(0,0,0,0); 
				box-shadow: 5px 5px 0px 0px #289FED, 10px 10px 0px 0px #5FB8FF, 15px 15px 0px 0px #A1D8FF, 20px 20px 0px 0px #CAE6FF, 25px 25px 0px 0px #E1EEFF, 10px 10px 27px 5px rgba(0,0,0,0);">
			<h1 class="p-4" style="color: #1F69FF; font-weight: 900; font-family: 'Fredoka One', cursive;" class="text-center">Our contact</h1>
				<div class="row p-4" style="font-family: 'Roboto', sans-serif;">
					<div class="col-lg-7" style="font-family: 'Roboto', sans-serif;">
						<h3 style="color: #1F69FF; font-weight: 900;">Drop us a message</h3>
						<p style="color: black;">We will get back to you as soon as possible.</p>
						<form id="newsletterForm">
							<div class="row mb-3">
								<div class="col-lg-12">
									<input class="form-control form-control-lg" required name="nombre" type="text" placeholder="Full Name" aria-label=".form-control-lg example">
								</div>
								<!--
								<div class="col-lg-6">
									<input class="form-control form-control-lg" type="text" placeholder="Company Name" aria-label=".form-control-lg example">
								</div>
								-->
							</div>
							<div class="row mb-3">
								<div class="col-lg-12">
									<input class="form-control form-control-lg" required name="correo" type="email" placeholder="Work Email" aria-label=".form-control-lg example" >
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-lg-12">
									<input class="form-control form-control-lg" required name="asunto" type="text" placeholder="Subject" aria-label=".form-control-lg example">
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-lg-12">
									<textarea class="form-control" name="mensaje" required id="exampleFormControlTextarea1" rows="3" placeholder="Message"></textarea>
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-lg-12">
									<input type="submit" value="Send" style="width: 100%; background-color: #FF4754; font-weight: 800;" class="btn text-white"></input>
								</div>
							</div>
						</form>
					</div>
					<div class="col-lg-5 d-flex flex-column justify-content-center align-items-center">
						<div class="row mb-2">
							<div class="col-lg-2">
								<div class="p-2">
									<i style="color: #5EFC8D;" class="bi bi-telephone-fill fa-2x"></i>
								</div>
							</div>
							<div class="col-lg-10" >
								<h4 style="font-style: normal; font-weight: bold;">+180 23433-43263</h4>
								<p>Free support</p>
							</div>
						</div>
						<div class="row mb-2">
							<div class="col-lg-2">
								<div class="p-2">
									<i style="color: #5EFC8D;" class="bi bi-telegram fa-2x"></i>
								</div>
							</div>
							<div class="col-lg-10" >
								<h4 style="font-style: normal; font-weight: bold;">support@siodi.com</h4>
								<p>Help email support</p>
							</div>
						</div>
						<div class="row mb-2">
							<div class="col-lg-2">
								<div class="p-2">
									<i style="color: #5EFC8D;" class="bi bi-mailbox2 fa-2x" ></i>
								</div>
							</div>
							<div class="col-lg-10" >
								<h4 style="font-style: normal; font-weight: bold;">donate@siodi.com</h4>
								<p>Donates enquiry</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	<!-- CONTACT SECTION END -->

	</div>
			<!-- FOOTER SECTION START -->
			<%@include file="/WEB-INF/vistas/footer.jsp" %>
			<!-- FOOTER SECTION END-->
    </body>
</html>