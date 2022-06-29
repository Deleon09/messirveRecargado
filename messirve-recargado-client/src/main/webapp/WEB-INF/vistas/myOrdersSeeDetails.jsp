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

    		//$('#ordersList').DataTable({});
			
		});
        </script>
    </head>
    <body>
        <%@include file="/WEB-INF/vistas/navbar.jsp" %>
        <div class="mb-3 p-4">
            <div class="row mb-3">
                <div class="col-lg-6">
                    <label>Usuario</label>
                    <input type="text" readonly value="${order.usuario}" class="form-control">
                </div>
                <div class="col-lg-6">
                    <label>Address</label>
                    <input readonly value="${order.direccion_orden}" step="1" type="text" class="form-control">
                </div>
            </div>
            <div class="row mb-6">
                <div class="col-lg-6">
                    <label>Total Price</label>
                    <input readonly value="${order.precio_total_orden}" type="text" class="form-control">
                </div>
                <div class="col-lg-6">
                    <label>Purchase Method</label>
                    <input readonly value="${order.metodo_pago_orden}" type="text" class="form-control">
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-lg-6">
                    <label>Order Status</label>
                        <c:choose>
                            <c:when test="${order.pagada_orden==true}">
                                <input readonly value="Pagada" type="text" class="form-control">
                            </c:when>    
                            <c:otherwise>
                                <input readonly value="No Pagada" type="text" class="form-control">
                            </c:otherwise>
                        </c:choose>
                </div>
                <div class="col-lg-6">
                    <label>Ship Status</label>
                    <c:choose>
                        <c:when test="${order.enviada_orden==true}">
                            <input readonly value="Orden Enviada" type="text" class="form-control">
                        </c:when>    
                        <c:otherwise>
                            <input readonly value="Orden No Enviada" type="text" class="form-control">
                        </c:otherwise>
                    </c:choose>                         
                </div>                 
            </div>
            <div class="row mb-3">
                <div class="col-lg-6">
                    <label>Date of Purchase</label>
                    <input readonly value="${order.fecha_creacion}" type="text" class="form-control"> 
                </div>
            </div> 
          </div>
          <div class="row mb-1" style="width: 100%;">
            <div class="col-lg-3">
                <h1 class="d-block fw-bold" style="color: #6B6B6B; margin-top: 20px; margin-left: 20px;">Order Details</h1>            
                <ol class="list-group list-group-numbered p-4">
                    <c:forEach items="${orderDetails}" var="od"> 
                        <li class="list-group-item d-flex justify-content-between align-items-start">
                        <div class="ms-2 me-auto">
                            <div class="fw-bold"><c:out value="${od.producto}"/></div>                        
                        </div>
                        <span class="badge bg-primary rounded-pill"><c:out value="${od.cantidad}"/></span>
                        </li> 
                    </c:forEach>                   
                  </ol>
            </div>
         </div>
        <%@include file="/WEB-INF/vistas/footer.jsp" %>
    </body>
</html>