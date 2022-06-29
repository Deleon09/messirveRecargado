<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="/WEB-INF/vistas/include-css.jsp" %>
        <%@include file="/WEB-INF/vistas/include-js.jsp" %>
        <script>
        	$(document).ready(function(){
        		
        		var retrievedObject = JSON.parse(localStorage.getItem('userInfo'));
        		
	    		if(!retrievedObject){
	    			$('#logout-nav-item').hide();
	    		}
	    		
	    		if(retrievedObject){
	    			$('#login-nav-item').hide();
	    		}
	    		
	    		if(retrievedObject.rol === 'Administrador'){
	    			$('#admin-nav-item').show();
	    		}
        		
        		$( "#cartPage" ).click(function() {
        			
        			var retrievedObject = JSON.parse(localStorage.getItem('userInfo'));
        		
        			if(retrievedObject){
        				document.location.href='/cart/' + retrievedObject.id;        			
        			} else {
        				Swal.fire('Not autheticated!', '', 'info')
        			}
        			
        		});
        		
				 $( "#myOrdersPage" ).click(function() {
        			
        			var retrievedObject = JSON.parse(localStorage.getItem('userInfo'));
        		
        			console.log(retrievedObject);
        			if(retrievedObject){
        				document.location.href='/myOrders/' + retrievedObject.id;        			
        			}
        			
        		});
        		
        		$( "#logout" ).click(function(){
    				localStorage.removeItem("userInfo");
    				document.location.href='/login';
    			});
        	});
        </script>
    	<!-- Bootstrap Font Icon CSS -->
    	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" />
    </head>
    <body>
        <!-- NAVBAR START -->
				<nav class="navbar navbar-expand-lg bg-white" style="height:41px; -webkit-box-shadow: 0px 1px 0px 0px #000000; box-shadow: 0px 1px 0px 0px #000000;">
                    <div class="container-fluid" style="font-family: 'Roboto', sans-serif;">
                      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon">
                            <i class="fa-solid fa-sliders"></i>
                        </span>
                      </button>
                      <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        
                        <div class="container-fluid">
                          <a class="navbar-brand" href="/home">
                              <img style="width: 10.607em; height: 2.063em;" src="<c:url value='/resources/assets/logo/logoHorizontal.png'/>" class="img-fluid b-ini" alt="Logo" >
                          </a>
                          </div>
                        <ul class="navbar-nav">
                            <li class="nav-item">
                            <a class="nav-link" style="white-space: nowrap; color: gray;" href="/home">
                                Home
                            </a>
                          </li>
                          <li id="admin-nav-item" class="nav-item" style="display:none;">
                            <a style="white-space: nowrap; color: gray;" class="nav-link" href="/listaUsuarios">
                                Admin
                            </a>
                          </li>
                          <li class="nav-item">
                            <a style="white-space: nowrap; color: gray;" class="nav-link" href="/donations">
                                Donate
                            </a>
                          </li>
                          <li class="nav-item">
                            <button id="myOrdersPage" style="background-color: white; border: none; display: flex; color: gray; white-space: nowrap;" class="nav-link">
                                My orders
                            </button>
                          </li>
                          <li class="nav-item">
                            <a style="white-space: nowrap; color: gray;" class="nav-link" href="/aboutus">
                                About Us
                            </a>
                          </li>
                          <li class="nav-item">
                            <a style="white-space: nowrap; color: gray;" class="nav-link" href="/contact">
                                Contact
                            </a>
                          </li>
                          <li class="nav-item" id="login-nav-item">
                            <a style="white-space: nowrap; color: gray;" class="nav-link" href="/login">
                                Login
                            </a>
                          </li>
                          <li class="nav-item">
                            <button id="cartPage" style="background-color: white; border: none; display: flex; color: gray;" style="white-space: nowrap; color: gray;" class="nav-link">
                                <i class="bi bi-cart2"></i>
                            </button>
                          </li>
                          <li class="nav-item" id="logout-nav-item">
                            <button id="logout" style="background-color: white; border: none; display: flex; color: gray; white-space: nowrap;" class="nav-link">
                                Log Out
                            </button>
                          </li>
                        </ul>
                      </div>
                    </div>
                  </nav>
              <!-- NAVBAR END -->
    </body>
</html>