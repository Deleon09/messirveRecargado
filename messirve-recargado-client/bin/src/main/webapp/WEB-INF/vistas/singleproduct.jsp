<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="/WEB-INF/vistas/include-css.jsp" %>
        <%@include file="/WEB-INF/vistas/include-js.jsp" %>
        <script>
        	$(document).ready(function(){
        		
        		//Add to Cart Handler
        		$( ".addToCart" ).click(function() {
  					var id = $(this).attr("id");
  					
  					var cantidad = $( "#prod-quan" ).val();
  					
  					if( !cantidad ){
  						Swal.fire('Please enter quantity!', '', 'info')
  					} else {
  					
  						var retrievedObject = JSON.parse(localStorage.getItem('userInfo'));
  						
  						if(retrievedObject) {
	  						var cartItem = {
		  						user: retrievedObject.id,
		  						products: id,
		  						cantidad: cantidad
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
	                    	Swal.fire('Not authenticated!', '', 'info');
	                    }
                    }
              
				});
        		
        	});
        </script>
    </head>
    <body>

		<!-- NAVBAR IMPORT -->
		<%@include file="/WEB-INF/vistas/navbar.jsp" %>

        <div class="container p-3">         
            
			<!-- SINGLE PRODUCT SECTION START -->
			
				<div class="my-3" style="background-color: #F0F2FE;">
					<div class="row p-4">
						<div class="col-lg-8 d-flex flex-column justify-content-center align-items-left">
							<div class="row">
								<div class="col-lg-12">
									<h3 style="color: #1F69FF; font-weight: 900;"><c:out value="${producto.nombre}"/></h3>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-12">
									<div class="d-flex" style="align-items: baseline;">
										<h4 style="color: #1F69FF; font-weight: 600; margin-right: 40%;">Details</h4>
										<p style="color: black; font-weight: bold;">$<c:out value="${producto.precio}"/></p>
									</div>
								</div>
							</div>
							<div>
								<div class="col-lg-12">
									<p><c:out value="${producto.descripcion}"/></p>
								</div>
							</div>
							<div class="row mb-5">
								<div class="col-lg-6">
									<div class="d-flex" style="align-items: baseline;">
										<p style="color: gray; margin-right: 0.5rem;">Amount:</p>
										<input value="1" id="prod-quan" class="form-control" type="number" step="1" aria-label=".form-control-lg example">
									</div>
								</div>
								<div class="col-lg-6"></div>
							</div>
							<div class="row">
								<div class="col-lg-2">
								</div>
								<div class="col-lg-4">
									<button type="button" style="width: 100%;" class="mb-3 btn btn-danger">Buy</button>
								</div>
								<div class="col-lg-4">
									<button id="${producto.id}" type="button" style="width: 100%; background-color: #1F69FF;" class="addToCart mb-3 btn text-white"><i style="margin-right: 5px;" class="fa-solid fa-plus"></i> ADD TO CART</button>
								</div>
								<div class="col-lg-2">
								</div>
							</div>
						</div>
						<div class="col-lg-4 d-flex flex-column justify-content-center align-items-center">
							<img src="<c:url value='/resources/assets/products/t-shirt.png' />" class="mb-3 img-fluid" style="height: 50%;" alt="product">
							<div class="row mb-2">
								<div class="col-lg-2">
									<div style="width: fit-content; background-color: #5EFC8D; font-size: 1.5rem;" class="rounded-circle p-2 text-white text-center">
										<i class="fa-solid fa-phone"></i>
									</div>
								</div>
								<div class="col-lg-10" >
									<h4>+180 234534-456732</h4>
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
									<h4>example@gmail.com</h4>
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
									<h4>donate@example.com</h4>
									<p>Donates enquiry</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			
			<!-- SINGLE PRODUCT SECTION END -->
	
		</div>
	
	<!-- FOOTER SECTION START -->
		<%@include file="/WEB-INF/vistas/footer.jsp" %>
	<!-- FOOTER SECTION END-->
			
    </body>
</html>