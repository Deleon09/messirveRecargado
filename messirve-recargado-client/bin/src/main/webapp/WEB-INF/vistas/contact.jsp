<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="/WEB-INF/vistas/include-css.jsp" %>
        <%@include file="/WEB-INF/vistas/include-js.jsp" %>
        <script>
        	$(document).ready(function(){
        	
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
            
		<!-- CONTACT SECTION START -->
		<div class="my-3">
			<h1 style="color: #1F69FF; font-weight: bold; font-family: 'Fredoka One', cursive; font-style: normal;" class="text-center">Get in touch with us</h1>
			<div style="background-color: #F0F2FE;">
				<div class="row p-4" style="font-family: 'Roboto', sans-serif;">
					<div class="col-lg-7" style="font-family: 'Roboto', sans-serif;">
						<h3 style="color: #1F69FF; font-style: normal; font-weight: 900;">Drop us a message</h3>
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