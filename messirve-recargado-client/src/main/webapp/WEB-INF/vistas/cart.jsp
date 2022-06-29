<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="/WEB-INF/vistas/include-css.jsp" %>
        <%@include file="/WEB-INF/vistas/include-js.jsp" %>
        <script>
        	$(document).ready(function(){

				var userInfo = JSON.parse(localStorage.getItem('userInfo'));
				
				if(!userInfo){
	    			document.location.href='/home';
	    		}

				$( "#shopCartPage" ).click(function() {
        			
        			var retrievedObject = JSON.parse(localStorage.getItem('userInfo'));
        		
        			if(retrievedObject){
        			
        				const user = {
        					id: retrievedObject.id,
			  				nombre: 'nombre',
			  				contrasena: 'contrasena'
			  			};
			  	
			  			$.ajax({
			  				headers: { 
						        'Accept': 'application/json',
						        'Content-Type': 'application/json' 
						    },
		                    data: JSON.stringify(user),
		                    dataType: "JSON",
		                    url: '${pageContext.request.contextPath}/listaCarritoC',
		                    type: "POST",
		                    success: function (data) {
		                        
		                        if(data.length == 0){
		                        	Swal.fire('No items in cart!', '', 'info')
		                        } else {
		                        	document.location.href='/comprarCarrito/' + retrievedObject.id;
		                        }
		                        
		                    },
		                    error: function (x, e) {
		                        Swal.fire('No items in cart!', '', 'info')
		                    }
		                });
        			        			
        			}
        		});
        		
        		//Delete from Cart Handler
        		$( ".deleteFromCart" ).click(function() {
        			var id = $(this).attr("id");
        			console.log(id);
        			$("#cartItem-"+id).addClass("animate__zoomOut");
        			
        			setTimeout(function () {
					  $("#cartItem-"+id).hide();
					}, 500);
        		});
        		
        		//DELETE CART ITEM
				$( ".deleteFromCart" ).click(function(){
	  				  var id = $(this).attr("id");
					                            
					  $.ajax({
		                    url: '${pageContext.request.contextPath}/eliminarCart/' + id,
		                    type: "DELETE",
		                    success: function (response) {
		                        Swal.fire(
							      'Removed!',
							      'The item was removed from the cart.',
							      'success'
							    )
							    
							    $("#cartItem-"+id).addClass("animate__zoomOut");
			        			setTimeout(function () {
								  $("#cartItem-"+id).hide();
								}, 500);
								
		                    },
		                    error: function (x, e) {
		                        Swal.fire('Something went wrong!', '', 'info')
		               		}
		              });
				});
        		//DELETE CART ITEM
        		
        		//CHANGE ITEM QUANTITY
        		$( ".item-quantity" ).change(function() {
				  var id = $(this).attr("id");
				  var cantidad = $(this).val()
				  
				  var cart = {
				  	id: id,
				  	user: 0,
				  	products: 0,
				  	cantidad: cantidad
				  };
				  
				  $.ajax({
                    data: cart,
                    url: '${pageContext.request.contextPath}/actualizarCart',
                    type: "PUT",
                    success: function (response) {
                        
                        Swal.fire(
					      'Saved!',
					      'It has been updated successfully.',
					      'success'
					    )                        
                    },
                    error: function (x, e) {
                        Swal.fire('Could not update!', '', 'info')
                    }
                  });
				  
				});
        		//CHANGE ITEM QUANTITY
        	});
        </script>
    </head>
    <body>

		<!-- NAVBAR IMPORT -->
		<%@include file="/WEB-INF/vistas/navbar.jsp" %>

        <div class="container p-3" style="font-family: 'Roboto', sans-serif;">         
            
			<!-- CART START -->
			<h1 style="color: #FF4754; font-weight: 900; font-family: 'Fredoka One', cursive;" class="text-center">Cart</h1>
			<div class="row mt-4 mb-4">
				<c:forEach items="${cartItems}" var="item"> 
					<div class="animate__animated col-lg-4 col-sm-12" id="cartItem-${item.id}">
						<div class="card" style="margin-bottom: 2rem;">
							<a href="/singleproduct">
	  							<img style="height: 200px; object-fit: contain;" src="<c:url value='/resources/assets/products/t-shirt.png' />" class="card-img-top" alt="...">
			  				</a>
			  				<div class="card-body">
							    <div class="d-flex" style="align-items: baseline; justify-content: space-between;">
							    	<h5 class="card-title"><c:out value="${item.producto}"/></h5>
			  						<i id="${item.id}" style="color: #FF4754; font-size: 1.5rem; cursor: pointer;" class="deleteFromCart fa-solid fa-x"></i>
			  					</div>
			  					<div class="d-flex" style="align-items: baseline; justify-content: space-between;">
			  						<p><span>$<c:out value="${item.precio}"/></span></p>
							    	<input style="width: 3rem;" id="${item.id}" class="item-quantity" type="number" step="1" required value="${item.cantidad}" />
			  					</div>  
							    <p class="card-text"><c:out value="${item.descripcion}"/></p>
			  				</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="row">
				<div class="col-lg-4">
				
				</div>
				<div class="col-lg-4">
					<a id="shopCartPage" type="button" style="width: 100%; background-color: #1F69FF; font-family: 'Roboto', sans-serif;" class="btn text-white">Buy</a>
				</div>
				<div class="col-lg-4">
				
				</div>
			</div>
			<!-- CART END -->
			
		</div>
	
	<!-- FOOTER SECTION START -->
		<%@include file="/WEB-INF/vistas/footer.jsp" %>
	<!-- FOOTER SECTION END-->
			
    </body>
</html>