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
    			document.location.href='/login';
    		}

    		$('#ordersList').DataTable({});

		});
    	</script>
    </head>
<body>
	<!-- NAVBAR IMPORT -->
		<%@include file="/WEB-INF/vistas/navbar.jsp" %>
		    <div class="container p-3">         
     		<h1 style="color: #FF4754; font-weight: 900; font-family: 'Fredoka One', cursive;" class="text-center">My Orders</h1>            
            <div style="padding: 1em 4em;">
      		<table id="ordersList" class="text-center" style="background-color: #FFFFFF; margin-top:2em; box-shadow: 0px 0px 5px 0px rgba(0,0,0,0.30); -webkit-box-shadow: 0px 0px 5px 0px rgba(0,0,0,0.30); -moz-box-shadow: 0px 0px 5px 0px rgba(0,0,0,0.30);">
              <thead>
	              <tr style="border-bottom: 1px solid; border-color: #cacaca;">                
	                <td>Date</td>                              
	                <td>Owner</td>   
	                <td>Total price</td>
	                <td>Address</td>      
	                <td>Actions</td>       
	              </tr>
              </thead>
              <tbody>
			  	<c:forEach items="${orderItems}" var="order">     
		   			<tr style="border-bottom: 1px solid; border-color: #cacaca;">               
                		<td><c:out value="${order.fecha_creacion}"/></td>
                		<td><c:out value="${order.usuario}"/></td>
                		<td><c:out value="${order.precio_total_orden}"/></td>
                		<td><c:out value="${order.direccion_orden}"/></td>
                		<td>
                			<a href="/detallesMyOrders/${order.id}" type="button" style="background-color: #109CF1; color:#FFFFFF; border:none; padding: 10px 40px;">Details</a>
                		</td>          
              		</tr>
				</c:forEach>
			  </tbody>
            </table>
     	</div>
     	</div>

	<!-- FOOTER SECTION START -->
	<%@include file="/WEB-INF/vistas/footer.jsp" %>
	<!-- FOOTER SECTION END-->	
    </body>
</html>