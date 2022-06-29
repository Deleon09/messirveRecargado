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
					  title: 'Está seguro?',
					  text: "Se enviara su carta!",
					  icon: 'warning',
					  showCancelButton: true,
					  confirmButtonColor: '#3085d6',
					  cancelButtonColor: '#d33',
					  confirmButtonText: 'Si, continuar!'
					}).then((result) => {
		  				if (result.value) {
		  	
		  					$.ajax({
			                    data: newsletterForm.serialize(),
			                    url: '${pageContext.request.contextPath}/guardarCarta',
			                    type: "POST",
			                    success: function (response) {
			                        Swal.fire('Guardado!', '', 'success');
			                        $("#newsletterForm")[0].reset();
			                    },
			                    error: function (x, e) {
			                        Swal.fire('Algo salió mal!', '', 'info')
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
               
            <img src="<c:url value='/resources/assets/backgrounds/apreton.jpg' />" class="img-fluid b-ini" style="width: 100%;" alt="Init-imag">
            
            <!-- CARDS START -->
            <!--
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
			-->
			<!-- CARDS END -->
			
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
			<div class="mb-5 p-4" style="background-color: #F0F2FE; font-family: 'Roboto', sans-serif;">
				<div class="row">
					<div class="col-lg-5">
						<h1 style="color: #FF4754; font-weight: 900; font-family: 'Fredoka One', cursive;">Frequently Asked Questions</h1>
						<p class="text-primary">
							It is shown by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions.
						</p>
					</div>
					<div class="col-lg-7">
						<div class="accordion" id="accordionExample">
							<div class="accordion-item my-3">
								<h2 class="accordion-header" id="headingOne">
								  <button class="accordion-button font-weight-bold" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
									Question #1
								  </button>
								</h2>
								<div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
								  <div class="accordion-body">
									<strong>This is the first item's accordion body.</strong> It is shown by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
								  </div>
								</div>
							</div>
							<div class="accordion-item my-3">
								<h2 class="accordion-header" id="headingTwo">
								  <button class="accordion-button font-weight-bold collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
									Question #2
								  </button>
								</h2>
								<div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
								  <div class="accordion-body">
									<strong>This is the second item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
								  </div>
								</div>
							</div>
							<div class="accordion-item my-3">
								<h2 class="accordion-header" id="headingThree">
								  <button class="accordion-button font-weight-bold collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
									Question #3
								  </button>
								</h2>
								<div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
								  <div class="accordion-body">
									<strong>This is the third item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
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
			<h1 style="color: #1F69FF; font-weight: 900; font-family: 'Fredoka One', cursive;" class="text-center">Get in touch with us</h1>
			<div style="background-color: #F0F2FE;">
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
									<input class="form-control form-control-lg" required name="correo" type="email" placeholder="Work Email" aria-label=".form-control-lg example">
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
								<div style="width: fit-content; background-color: #5EFC8D; font-size: 1.5rem;" class="rounded-circle p-2 text-white text-center">
									<i class="fa-solid fa-phone"></i>
								</div>
							</div>
							<div class="col-lg-10" >
								<h4 style="font-style: normal; font-weight: bold;">+180 234534-456732</h4>
								<p>Free support</p>
							</div>
						</div>
						<div class="row mb-2">
							<div class="col-lg-2">
								<div style="width: fit-content; background-color: #5EFC8D; font-size: 1.5rem;" class="rounded-circle p-2 text-white text-center">
									<i class="fa-solid fa-paper-plane"></i>
								</div>
							</div>
							<div class="col-lg-10" >
								<h4 style="font-style: normal; font-weight: bold;">example@gmail.com</h4>
								<p>Help email support</p>
							</div>
						</div>
						<div class="row mb-2">
							<div class="col-lg-2">
								<div style="width: fit-content; background-color: #5EFC8D; font-size: 1.5rem;" class="rounded-circle p-2 text-white text-center">
									<i class="fa-solid fa-envelope"></i>
								</div>
							</div>
							<div class="col-lg-10" >
								<h4 style="font-style: normal; font-weight: bold;">donate@example.com</h4>
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