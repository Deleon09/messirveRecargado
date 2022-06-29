<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <%@include file="/WEB-INF/vistas/include-css.jsp" %>
    <%@include file="/WEB-INF/vistas/include-js.jsp" %>
    <style>
      tr td{
        padding: 15px 0px;
      }
    </style>
    <script>
    	$(document).ready(function(){
    		
    		var retrievedObject = JSON.parse(localStorage.getItem('userInfo'));
        		
    		if(!retrievedObject){
    			document.location.href='/login';
    		}
		
			if(retrievedObject.rol !== 'Administrador'){
				document.location.href='/home';
			}
    		
    	});
    </script>
</head>

<body style="background-color: #F5F6F8;">

    <%@include file="/WEB-INF/vistas/sidebar.jsp" %>  

    <div style="margin-left: 265px;">
         <h1 class="d-block fw-bold" style="color: #6B6B6B; margin-top: 20px; margin-left: 20px;">Donation details</h1>

         <form id="formDon">
	          <div class="mb-3">
	            <label class="col-form-label">Donor:</label>
	            <input type="text" readonly value="${donacion.usuario}" required name="nombre" class="form-control">
	          </div>
	          <div class="mb-3">
	            <label class="col-form-label">Amount:</label>
	            <input type="text" readonly value="${donacion.monto_donacion}" required name="nombre" class="form-control">
	          </div>
	          <div class="mb-3">
	            <label class="col-form-label">Message:</label>
	            <input type="text" readonly value="${donacion.mensaje_donacion}" required name="nombre" class="form-control">
	          </div>
	          <div class="mb-3">
	            <label class="col-form-label">Hospital area:</label>
	            <input type="text" readonly value="${donacion.harea}" required name="nombre" class="form-control">
	          </div>
	     </form>
         <a href="/listaDonaciones" type="button" style="width: 100%; background-color: #1F69FF;" class="btn text-white">Back</a>
    </div>
    
    
</body>

</html>