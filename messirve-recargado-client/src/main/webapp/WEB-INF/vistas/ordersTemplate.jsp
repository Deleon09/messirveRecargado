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
    		
    		var retrievedObject = JSON.parse(localStorage.getItem('userInfo'));
        		
    		if(!retrievedObject){
    			document.location.href='/login';
    		}
		
			if(retrievedObject.rol !== 'Administrador'){
				document.location.href='/home';
			}
    		
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
                        				return '<a href="/detallesOrden/'+ data.id +'" type="button" style="background-color: #109CF1; color:#FFFFFF; border:none; padding: 10px 40px;">Details</a> <button type="button" id="'+ data.id +'" class="eliminarOrden btn btn-danger"><i class="fa-solid fa-trash"></i></button>';
                        			}
                        		}
                        	]
                        });
                    },
                    error: function (x, e) {
                        Swal.fire('Something went wrong!', '', 'info')
                    }
             });
    		
    		//funcion para eliminar un usuario
			$("#ordersList").on("click",".eliminarOrden", function() {
				  var id = this.id;
				                            
				  Swal.fire({
				  title: 'Are you sure?',
				  text: "This change cannot be reversed!",
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: 'Yes delete!'
				  }).then((result) => {
					  if (result.value) {
					  	
					  	$.ajax({
		                    url: '${pageContext.request.contextPath}/eliminarOrden/' + id,
		                    type: "DELETE",
		                    success: function (response) {
		                        Swal.fire(
							      'Removed!',
							      'The register was deleted successfully.',
							      'success'
							    )
							    refreshTable();
		                    },
		                    error: function (x, e) {
		                        Swal.fire('Something went wrong!', '', 'info')
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
		                        				return '<a href="/detallesOrden/'+ data.id +'" type="button" style="background-color: #109CF1; color:#FFFFFF; border:none; padding: 10px 40px;">Details</a> <button type="button" id="'+ data.id +'" class="eliminarOrden btn btn-danger"><i class="fa-solid fa-trash"></i></button>';
		                        			}
		                        		}
		                        	]
		                        });
		                    },
		                    error: function (x, e) {
		                        Swal.fire('Something went wrong!', '', 'info')
		                    }
	             });
			}
			
    	});
    </script>
     </head>
     <body style="background-color: #F5F6F8">
      <%@include file="/WEB-INF/vistas/sidebar.jsp" %>
      
      <div style="margin-left: 265px;">
      <h1 class="d-block fw-bold" style="color: #1F69FF; padding-top: 50px; margin-left: 64px; margin-right: 1em;">Orders</h1>
      
      <div class="form-floating mb-4">
      
  			<div class="row g-3">  			
  			
  			<div class="col-md-3" style="margin-top: 36px; margin-left:64px;">
    		<select id="inputState" class="form-select">
     		<option selected>Owner</option>
     		<option></option>
    		</select>
  			</div>
  			
  			
 			<div class="col-md-3" style="margin-top: 36px;">
    		<select id="inputState" class="form-select">
     	 	<option selected>Lot</option>
      		<option></option>
    		</select>
  			</div>
  			</div>
  			           
            <div style="padding: 1em 4em;">      
      		<table id="ordersList" class="text-center" style="background-color: #FFFFFF; margin-top:2em; box-shadow: 0px 0px 5px 0px rgba(0,0,0,0.30); -webkit-box-shadow: 0px 0px 5px 0px rgba(0,0,0,0.30); -moz-box-shadow: 0px 0px 5px 0px rgba(0,0,0,0.30);">
              <thead>
	              <tr style="border-bottom: 1px solid; border-color: #cacaca;">                
	                <td>Date</td>                              
	                <td>Owner</td>   
	                <td>Total</td>
	                <td>Address</td>      
	                <td>Actions</td>       
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
                			<a href="/detallesOrden/${orden.id}" type="button" style="background-color: #109CF1; color:#FFFFFF; border:none; padding: 10px 40px;">Details</a>
                			<button type="button" id="${orden.id}" class="eliminarOrden btn btn-danger"><i class="fa-solid fa-trash"></i></button>
                		</td>          
              		</tr>
				</c:forEach>
			  </tbody>
            </table>
          </div>
          </div>
       </div>
      </body>
</html>