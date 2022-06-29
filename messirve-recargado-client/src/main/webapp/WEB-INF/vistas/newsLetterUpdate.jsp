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
    	
    		document.getElementById("formSupl").addEventListener("submit", function(event){
	  			event.preventDefault();
	  			var formSupl = $("#formSupl");
	  	
	  			Swal.fire({
				  title: 'Are you sure?',
				  text: "The data will be updated!",
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: 'Yes update!'
				}).then((result) => {
	  				if (result.value) {
	  
	  					$.ajax({
                            data: formSupl.serialize(),
                            url: '${pageContext.request.contextPath}/actualizarProveedor',
                            type: "PUT",
                            success: function (response) {
                                
                                Swal.fire(
							      'Saved!',
							      'It has been updated successfully.',
							      'success'
							    )
    
								document.location.href='/listaProveedores';
                                
                            },
                            error: function (x, e) {
                                Swal.fire('Could not update!', '', 'info')
                            }
                          });	
                            
	  				}
				});
			});
			
    	});
    </script>
</head>

<body style="background-color: #F5F6F8;">

    <%@include file="/WEB-INF/vistas/sidebar.jsp" %>  

    <div style="margin-left: 265px;">
         <h1 class="d-block fw-bold" style="color: #1F69FF; padding-top: 50px; margin-left: 64px; margin-right: 1em;">${carta.asunto}</h1>
       
         <div style="padding: 1em 4em;">
         <form id="formSupl">
	          <div class="mb-3">
	            <label class="col-form-label">Name:</label>
	            <input type="text" required value="${carta.nombre}" readonly name="nombre" class="form-control">
	            <label class="col-form-label">eMail:</label>
	            <input type="text" required value="${carta.correo}" readonly name="correo" class="form-control">
	            <label class="col-form-label">Subject:</label>
	            <input type="text" required value="${carta.asunto}" readonly name="asunto" class="form-control">
	            <label class="col-form-label">Message:</label>
	            <input type="text" required value="${carta.mensaje}" readonly name="mensaje" class="form-control">
	            <input style="display: none;" value="${carta.id}" step="1" type="number" name="id">
	          </div>
	     </form>
         <a href="/listaCartas" type="button" style="width: 100%; background-color: #1F69FF;" class="btn text-white">Back</a>
    </div>
	</div>
    
    
</body>

</html>