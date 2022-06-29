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