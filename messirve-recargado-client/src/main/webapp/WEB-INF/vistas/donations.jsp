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
        		$( ".donateBtn" ).click(function() {
        			var id = $(this).attr("id");
				  	var cantidad = $('#Dquantity-'+id).val();
				  	
				  	if(cantidad){
				  		
				  		var donationInfo = {
				  			harea_id: id,
				  			monto_donacion: cantidad
				  		}
				  		
				  		localStorage.setItem('donationInfo', JSON.stringify(donationInfo));
				  		
				  		document.location.href='/shop';
				  		
				  	} else {
				  		Swal.fire('Please enter a quantity!', '', 'info')
				  	}
        		});
        	
        	});
        </script>
    </head>
    <body>

		<!-- NAVBAR IMPORT -->
		<%@include file="/WEB-INF/vistas/navbar.jsp" %>

        <div class="container p-3">         
            
            <!-- DONATION SECTION START -->
				<div class="my-3">
					<h1 class="text-center" style="color: #FF4754; font-family: 'Fredoka One', cursive; font-weight: bold; font-style: normal;">Donate to your</h1>
					<h1 class="text-center" style="color: #FF4754; font-family: 'Fredoka One', cursive; font-weight: bold; font-style: normal;">favorite cause</h1>
					<p class="text-center" style="font-family: 'Roboto', sans-serif;">All your donations will be used to improve Rosales Hospital</p>
					<div class="row mt-4" style="font-family: 'Roboto', sans-serif;">
						<c:forEach items="${hareas}" var="harea">
							<div class="col-lg-4 col-sm-12 mb-4">
								<div class="card" style="-webkit-box-shadow: 5px 5px 0px 0px #289FED, 10px 10px 0px 0px #5FB8FF, 15px 15px 0px 0px #A1D8FF, 20px 20px 0px 0px #CAE6FF, 25px 25px 0px 0px #E1EEFF, 50px 50px 50px 50px rgba(0,0,0,0); 
									box-shadow: 5px 5px 0px 0px #289FED, 10px 10px 0px 0px #5FB8FF, 15px 15px 0px 0px #A1D8FF, 20px 20px 0px 0px #CAE6FF, 25px 25px 0px 0px #E1EEFF, 50px 50px 50px 50px rgba(0,0,0,0);	">
					  				<div class="card-body">
					  					<div class="row d-flex align-items-center" style="margin-left: 1rem;">
					  						<div style="width: 50px;height: 50px;background-color: #FF4754;font-size: 1.70rem;" class="rounded-circle p-1 text-white text-center">
												<i class="fa-solid fa-gift"></i>
											</div>
									    	<h5 style="width: fit-content; color: #FF4754; font-weight:bold" class="card-title"><c:out value="${harea.nombre}"/></h5>
					  					</div>
					  					<hr>
					  					<div class="row d-flex align-items-center" style="margin-left: 1rem; font-weight: bold;">
					  						<div style="width: 50px;height: 50px;font-size: 1.70rem;" class="rounded-circle alert alert-secondary p-1 text-success text-center">
												<i class="fa-solid fa-check"></i>
											</div>
									    	<p class="font-weight-bold" style="width: fit-content">Open 24/7</p>
					  					</div>
									    <div class="row d-flex align-items-center" style="margin-left: 1rem; font-weight: bold;">
					  						<div style="width: 50px;height: 50px;font-size: 1.70rem;" class="rounded-circle alert alert-secondary p-1 text-success text-center">
												<i class="fa-solid fa-check"></i>
											</div>
									    	<p class="font-weight-bold" style="width: fit-content">Free for patients</p>
					  					</div>
					  					<div class="row d-flex align-items-center" style="margin-left: 1rem; font-weight: bold;">
					  						<div style="width: 50px;height: 50px;font-size: 1.70rem;" class="rounded-circle alert alert-secondary p-1 text-success text-center">
												<i class="fa-solid fa-check"></i>
											</div>
									    	<p class="font-weight-bold" style="width: fit-content">Social work</p>
					  					</div>
					  					<div class="row d-flex align-items-center" style="margin-left: 1rem; font-weight: bold;">
					  						<div style="width: 50px;height: 50px;font-size: 1.70rem;" class="rounded-circle alert alert-secondary p-1 text-success text-center">
												<i class="fa-solid fa-check"></i>
											</div>
									    	<p class="font-weight-bold" style="width: fit-content">Needs an upgrade</p>
					  					</div>
					  					<p class="text-center" style="margin-bottom: 5%;">Responsible: Lic. Salvador Mendoza</p>
					  					<input id="Dquantity-${harea.id}" class="mb-4 form-control" type="number" step="any" />
					  					<div class="row d-flex justify-content-center align-items-center">
					  						<button id="${harea.id}" style="width: 50%;" type="button" class="btn btn-primary donateBtn">Donate</button>
					  					</div>
					  				</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			<!-- DONATION SECTION START --> 
            
		</div>	
		
		<!-- FOOTER SECTION START -->
			<%@include file="/WEB-INF/vistas/footer.jsp" %>
		<!-- FOOTER SECTION END-->
    </body>
</html>