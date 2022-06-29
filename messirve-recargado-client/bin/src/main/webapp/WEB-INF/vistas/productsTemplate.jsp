<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
     <head>
        <%@include file="/WEB-INF/vistas/include-css.jsp" %>
        <%@include file="/WEB-INF/vistas/include-js.jsp" %>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" />
        
        <style>
      tr td{
        padding: 15px 0px;
      }
    </style>
    <script>
    	$(document).ready(function(){
    	
    		var table;
    		
    		$.ajax({
				url: '${pageContext.request.contextPath}/listaProductosG',
                type: "GET",
                dataType: "JSON",
                success: function (data) {
                	table = $('#productsList').DataTable({
                    	"data": data,
                    	"columns": [
                    		{ data: 'usuario' },
                    		{ data: 'categoria' },
                    		{ data: 'proveedor' },
                    		{ data: 'nombre' },
                    		{ data: 'descripcion' },
                    		{ data: 'precio' },
                    		{ data: 'cantidad' },
                    		{
                    			data: null,
                    			render: function(data, type, full, meta)
                    			{
                    				return '<a href="/editarProducto/'+ data.id +'" type="button" style="background-color: #109CF1; color:#FFFFFF; border:none; padding: 10px 40px;">Editar</a> <button type="button" id="'+ data.id +'" class="eliminarProd btn btn-danger"><i class="fa-solid fa-trash"></i></button>';
                    			}
                    		}
                    	]
                    });
                },
                error: function (x, e) {
                    Swal.fire('Algo salió mal!', '', 'info')
                }
             });
    	
    		//Funcion para agregar un nuevo usuario
    		document.getElementById("formProd").addEventListener("submit", function(event){
	  			event.preventDefault();
	  			var formProd = $("#formProd");
	  	
	  			Swal.fire({
				  title: 'Está seguro?',
				  text: "Se agregara un nuevo registro!",
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: 'Si, continuar!'
				}).then((result) => {
	  				if (result.value) {
	  	
	  					$.ajax({
		                    data: formProd.serialize(),
		                    url: '${pageContext.request.contextPath}/guardarProducto',
		                    type: "POST",
		                    success: function (response) {
		                        Swal.fire('Guardado!', '', 'success');
		                        refreshTable();
		                    },
		                    error: function (x, e) {
		                        Swal.fire('Algo salió mal!', '', 'info')
		                    }
	                    });
	  				}
				});
			});
			
			//funcion para eliminar un usuario
			$("#productsList").on("click",".eliminarProd", function() {
				  var id = this.id;
				                            
				  Swal.fire({
				  title: 'Está seguro?',
				  text: "Este cambio no se puede revertir!",
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: 'Si, eliminar!'
				  }).then((result) => {
					  if (result.value) {
					  	
					  	$.ajax({
		                    url: '${pageContext.request.contextPath}/eliminarProducto/' + id,
		                    type: "DELETE",
		                    success: function (response) {
		                        Swal.fire(
							      'Eliminado!',
							      'El registro se elimino con éxito.',
							      'success'
							    )
							    refreshTable();
		                    },
		                    error: function (x, e) {
		                        Swal.fire('Algo salió mal!', '', 'info')
		               }
	              });
			
				  }
				});
			});
    	
    		function refreshTable(){
					$.ajax({
								url: '${pageContext.request.contextPath}/listaProductosG',
			                    type: "GET",
			                    dataType: "JSON",
			                    success: function (data) {
			                    	table.destroy();
			                    	table = $('#productsList').DataTable({
			                        	"data": data,
			                        	"columns": [
			                        		{ data: 'usuario' },
			                        		{ data: 'categoria' },
			                        		{ data: 'proveedor' },
			                        		{ data: 'nombre' },
			                        		{ data: 'descripcion' },
			                        		{ data: 'precio' },
			                        		{ data: 'cantidad' },
			                        		{
			                        			data: null,
			                        			render: function(data, type, full, meta)
			                        			{
			                        				return '<a href="/editarProducto/'+ data.id +'" type="button" style="background-color: #109CF1; color:#FFFFFF; border:none; padding: 10px 40px;">Editar</a> <button type="button" id="'+ data.id +'" class="eliminarProd btn btn-danger"><i class="fa-solid fa-trash"></i></button>';
			                        			}
			                        		}
			                        	]
			                        });
			                    },
			                    error: function (x, e) {
			                        Swal.fire('Algo salió mal!', '', 'info')
			                    }
		             });
			}
    	
    	});
    </script>
     </head>
     <body style="background-color: #F5F6F8">
    <%@include file="/WEB-INF/vistas/sidebar.jsp" %>
    
    <div style="margin-left: 265px;">
         <h1 class="d-block fw-bold" style="color: #6B6B6B; margin-top: 20px; margin-left: 20px;">Productos</h1>
         
        <div class="form-floating mb-4">
            <input type="search" class="form-control" id="floating-input" placeholder="Nombre" style="margin: 0px 10px; width: 95%;">
            <label for="floating-input" style="margin-left: 10px;">
                <i class="bi bi-search" style="margin: 0px 10px;"></i>
                Nombre
            </label>
            
            <input data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo" type="button" value="Nuevo" style="margin-top: 15px; margin-bottom: 15px; margin-left: 35px; background-color: #152C70; color: #FFFFFF; padding: 10px 40px; border: none; border-radius: 5px;">
        
         	<table id="productsList" class="text-center" style="margin-top: 15px; margin-left: 35px; background-color: #FFFFFF; box-shadow: 0px 0px 5px 0px rgba(0,0,0,0.30); -webkit-box-shadow: 0px 0px 5px 0px rgba(0,0,0,0.30); -moz-box-shadow: 0px 0px 5px 0px rgba(0,0,0,0.30); width: 90%;">
              <thead>
	              <tr style="border-bottom: 1px solid; border-color: #cacaca;">                
	                <td>Usuario creador</td>                              
	                <td>Categoría</td>
	                <td>Proveedor</td>
	                <td>Nombre</td>
	                <td>Descripción</td>
	                <td>Precio</td>
	                <td>Cantidad</td>
	                <td>Acciones</td>                
	              </tr>
              </thead>
              <tbody>
			  	
			  </tbody>
            </table>
        </div>	 
    </div>   
    
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Nuevo producto</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <form id="formProd">
	          <div class="mb-3">
	            <label class="col-form-label">Usuario:</label>
	            <select name="user" class="form-control">
	            	<c:forEach items="${usuarios}" var="usu">     
			   			<option value="${usu.id}">                               
	                		<td><c:out value="${usu.nombre}"/></td>            
	              		</option>
					</c:forEach>
	            </select>
	          </div>
	          <div class="mb-3">
	            <label class="col-form-label">Categoria:</label>
	            <select name="category" class="form-control">
	            	<c:forEach items="${categorias}" var="cat">     
			   			<option value="${cat.id}">                               
	                		<td><c:out value="${cat.nombre}"/></td>            
	              		</option>
					</c:forEach>
	            </select>
	          </div>
	          <div class="mb-3">
	            <label class="col-form-label">Proveedor:</label>
	            <select name="suppliers" class="form-control">
	            	<c:forEach items="${proveedores}" var="prov">     
			   			<option value="${prov.id}">                               
	                		<td><c:out value="${prov.nombre}"/></td>            
	              		</option>
					</c:forEach>
	            </select>
	          </div>
	          <div class="mb-3">
	            <label class="col-form-label">Nombre:</label>
	            <input type="text" required name="nombre" class="form-control">
	          </div>
	          <div class="mb-3">
	            <label class="col-form-label">Descripción:</label>
	            <textarea required name="descripcion" class="form-control"></textarea>
	          </div>
	          <div class="mb-3">
	            <label class="col-form-label">Precio:</label>
	            <input type="number" step="any" required name="precio" class="form-control">
	          </div>
	          <div class="mb-3">
	            <label class="col-form-label">Cantidad:</label>
	            <input type="number" step="1" required name="cantidad" class="form-control">
	          </div>
	          <input type="submit" class="btn btn-primary" value="Guardar" />
	        </form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
	</div>
    </body>
</html>