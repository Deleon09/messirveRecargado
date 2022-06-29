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
    	
    		document.getElementById("formSupl").addEventListener("submit", function(event){
	  			event.preventDefault();
	  			var formSupl = $("#formSupl");
	  	
	  			Swal.fire({
				  title: 'Está seguro?',
				  text: "Los datos se actualizaran!",
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: 'Si, actualizar!'
				}).then((result) => {
	  				if (result.value) {
	  
	  					$.ajax({
                            data: formSupl.serialize(),
                            url: '${pageContext.request.contextPath}/actualizarProveedor',
                            type: "PUT",
                            success: function (response) {
                                
                                Swal.fire(
							      'Guardado!',
							      'Se ha actualizado con éxito.',
							      'success'
							    )
    
								document.location.href='/listaProveedores';
                                
                            },
                            error: function (x, e) {
                                Swal.fire('No fue posible actualizar!', '', 'info')
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
         <h1 class="d-block fw-bold" style="color: #6B6B6B; margin-top: 20px; margin-left: 20px;">Actualizar Rol</h1>

         <form id="formSupl">
	          <div class="mb-3">
	            <label class="col-form-label">Nombre proveedor:</label>
	            <input type="text" required value="${proveedor.nombre}" name="nombre" class="form-control">
	            <label class="col-form-label">País de origen:</label>
	            <input type="text" required value="${proveedor.pais_origen}" name="pais_origen" class="form-control">
	            <input style="display: none;" value="${proveedor.id}" step="1" type="number" name="id">
	          </div>
	          <input type="submit" class="btn btn-primary" value="Guardar" />
	     </form>
            
    </div>
    
    
</body>

</html>