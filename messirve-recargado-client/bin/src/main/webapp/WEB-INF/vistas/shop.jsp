<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="/WEB-INF/vistas/include-css.jsp" %>
        <%@include file="/WEB-INF/vistas/include-js.jsp" %>
    </head>
    <body>

		<!-- NAVBAR IMPORT -->
		<%@include file="/WEB-INF/vistas/navbar.jsp" %>

        <div class="container p-3">         
            
		<!-- CONTACT SECTION START -->
		<div class="my-3">
			<h1 style="color: #FF4754; font-weight: 900; font-family: 'Fredoka One', cursive;" class="text-center">Shop</h1>
			<div style="background-color: #F0F2FE;">
				<div class="row p-4" style="font-family: 'Roboto', sans-serif;">
					<div class="col-lg-7"  style="font-family: 'Roboto', sans-serif;">
						<h3 style="color: #1F69FF; font-weight: 900;">Form</h3>
						<p style="color: black;">Lorem ipsum</p>
						<form>
							<div class="row mb-3">
								<div class="col-lg-6">
									<input class="form-control form-control-lg" type="text" placeholder="Full Name" aria-label=".form-control-lg example">
								</div>
								<div class="col-lg-6">
									<input class="form-control form-control-lg" type="text" placeholder="Address" aria-label=".form-control-lg example">
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-lg-12">
									<input class="form-control form-control-lg" type="text" placeholder="Email" aria-label=".form-control-lg example">
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-lg-12">
									<input class="form-control form-control-lg" type="text" placeholder="Card Number" aria-label=".form-control-lg example">
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-lg-12">
									<textarea class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="CVC"></textarea>
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-lg-12">
									<input type="submit" value="Buy" style="width: 100%; background-color: #1F69FF; font-weight: 800;" class="btn text-white"></input>
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