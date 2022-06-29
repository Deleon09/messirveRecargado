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
					url: '${pageContext.request.contextPath}/listaOrdenesG',
                    type: "GET",
                    dataType: "JSON",
                    success: function (data) {
                    	table = $('#ordersList').DataTable({
                        	"data": data,
                        	"columns": [
                        		{ data: 'fecha_creacion' },
                        		{ data: 'usuario' },
                        		{ data: 'precio_total_orden' },
                        		{ data: 'direccion_orden' },
                        		{
                        			data: null,
                        			render: function(data, type, full, meta)
                        			{
                        				return '<a href="/detallesOrden/'+ data.id +'" type="button" style="background-color: #109CF1; color:#FFFFFF; border:none; padding: 10px 40px;">Detalles</a> <button type="button" id="'+ data.id +'" class="eliminarOrden btn btn-danger"><i class="fa-solid fa-trash"></i></button>';
                        			}
                        		}
                        	]
                        });
                    },
                    error: function (x, e) {
                        Swal.fire('Algo salió mal!', '', 'info')
                    }
             });
    		
    		//funcion para eliminar un usuario
			$("#ordersList").on("click",".eliminarOrden", function() {
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
		                    url: '${pageContext.request.contextPath}/eliminarOrden/' + id,
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
							url: '${pageContext.request.contextPath}/listaOrdenesG',
		                    type: "GET",
		                    dataType: "JSON",
		                    success: function (data) {
		                    	table.destroy();
		                    	table = $('#ordersList').DataTable({
		                        	"data": data,
		                        	"columns": [
		                        		{ data: 'fecha_creacion' },
		                        		{ data: 'usuario' },
		                        		{ data: 'precio_total_orden' },
		                        		{ data: 'direccion_orden' },
		                        		{
		                        			data: null,
		                        			render: function(data, type, full, meta)
		                        			{
		                        				return '<a href="/detallesOrden/'+ data.id +'" type="button" style="background-color: #109CF1; color:#FFFFFF; border:none; padding: 10px 40px;">Detalles</a> <button type="button" id="'+ data.id +'" class="eliminarOrden btn btn-danger"><i class="fa-solid fa-trash"></i></button>';
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
      <h1 class="d-block fw-bold" style="color: #6B6B6B; margin-top: 20px; margin-left: 20px;">Ordenes</h1>
      
      <div class="form-floating mb-4">
      
  			<div class="row g-3">
  			
  			<div class="col-md-2">  			 
  			<input type="button" value="Editar" style="margin-top: 15px; margin-left: 35px; background-color: #152C70; color: #FFFFFF; padding: 10px 40px; border: none; border-radius: 5px;">
  			</div>
            
            <div class="col-md-3">
            <input type="button" value="Eliminar" style="margin-top: 15px; margin-left: 35px; background-color: #152C70; color: #FFFFFF; padding: 10px 40px; border: none; border-radius: 5px;">
            </div>
  			
  			
  			<div class="col-md-3" style="margin-top: 36px;">
    		<select id="inputState" class="form-select">
     		<option selected>Propietario</option>
     		<option></option>
    		</select>
  			</div>
  			
  			
 			<div class="col-md-3" style="margin-top: 36px;">
    		<select id="inputState" class="form-select">
     	 	<option selected>Unidad</option>
      		<option></option>
    		</select>
  			</div>
  			</div>
      
      		<table id="ordersList" class="text-center" style="margin-top: 15px; margin-left: 35px; background-color: #FFFFFF; box-shadow: 0px 0px 5px 0px rgba(0,0,0,0.30); -webkit-box-shadow: 0px 0px 5px 0px rgba(0,0,0,0.30); -moz-box-shadow: 0px 0px 5px 0px rgba(0,0,0,0.30); width: 90%;">
              <thead>
	              <tr style="border-bottom: 1px solid; border-color: #cacaca;">                
	                <td>Fecha</td>                              
	                <td>Propietario</td>   
	                <td>Precio total</td>
	                <td>Dirección</td>      
	                <td>Acciones</td>       
	              </tr>
              </thead>
              <tbody>
			  	<c:forEach items="${ordenes}" var="orden">     
		   			<tr style="border-bottom: 1px solid; border-color: #cacaca;">                               
                		<td><c:out value="${orden.fecha_creacion}"/></td>
                		<td><c:out value="${orden.usuario}"/></td>
                		<td><c:out value="${orden.precio_total_orden}"/></td>
                		<td><c:out value="${orden.direccion_orden}"/></td>
                		<td>
                			<a href="/detallesOrden/${orden.id}" type="button" style="background-color: #109CF1; color:#FFFFFF; border:none; padding: 10px 40px;">Detalles</a>
                			<button type="button" id="${orden.id}" class="eliminarOrden btn btn-danger"><i class="fa-solid fa-trash"></i></button>
                		</td>          
              		</tr>
				</c:forEach>
			  </tbody>
            </table>
          </div>
       </div>
      </body>
</html>