<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="/WEB-INF/vistas/include-css.jsp" %>
        <%@include file="/WEB-INF/vistas/include-js.jsp" %>
    </head>
    <body class="d-flex flex-column min-vh-100">
        <div class="mt-auto" style="-webkit-box-shadow: 0px -14px 25px 0px rgba(0,0,0,0.4); box-shadow: 0px -14px 25px 0px rgba(0,0,0,0.4);">         
            
            <!-- FOOTER START -->
				<div class="bg-dark text-white">
					<div class="row p-3" style="margin: 0; font-family: 'Roboto', sans-serif;">
						<div class="col-lg-3 ">
							<h4>Company</h4>
							<div class="row">
								<a href="/aboutus" class="text-white" style="text-decoration: none;">About us</a>
							</div>
														
						</div>
						<div class="col-lg-3 ">
							<h4>Resources</h4>
							<div class="row">
								<a href="/contact" class="text-white" style="text-decoration: none;">Contact us</a>
							</div>
						</div>
						<div class="col-lg-5">
							<img src="<c:url value='/resources/assets/important/SoD.png' />" class="img-fluid b-ini" alt="Logo">
							<p class="ml-3 mb-2" style="width: fit-content">Subscribe to our Newsletter</p>
							<div class="row ml-3">
								<div class="col-lg-6">
									<input class="form-control border-0" style="background: #2B2E3C;" type="text" placeholder="Enter your Email" aria-label="default input example">
								</div>
								<div class="col-lg-6">
									<button type="button" class="btn btn-light">Subscribe</button>
								</div>
							</div>
						</div>
					</div>
					<div class="row p-4" style="margin: 0; font-family: 'Roboto', sans-serif;">
						<div class="col-lg-4">
							<hr>
						</div>
						<div class="col-lg-4 text-center">
							Ⓒ Copyright Enterprise 2022
							<a href="www.facebook.com" style="color: white; text-decoration: none;">
								<i class="mx-1 fa-brands fa-facebook" style="font-size: 1.2rem;"></i>							
							</a>
							<a href="www.twitter.com" style="color: white; text-decoration: none;">
								<i class="mx-1 fa-brands fa-twitter" style="font-size: 1.2rem;"></i>						
							</a>
							<a href="www.instagram.com" style="color: white; text-decoration: none;">
								<i class="mx-1 fa-brands fa-instagram" style="font-size: 1.2rem;"></i>						
							</a>
							<a href="www.linkedin.com" style="color: white; text-decoration: none;">
								<i class="mx-1 fa-brands fa-linkedin" style="font-size: 1.2rem;"></i>						
							</a>
						</div>
						<div class="col-lg-4">
							<hr>
						</div>
					</div>
				</div>
			<!-- FOOTER END -->
            
		</div>	
    </body>
</html>