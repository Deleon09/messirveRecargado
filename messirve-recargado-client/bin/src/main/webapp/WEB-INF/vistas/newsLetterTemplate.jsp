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
    	
    		var table;
    	
    		$.ajax({
				url: '${pageContext.request.contextPath}/listaCartasG',
                type: "GET",
                dataType: "JSON",
                success: function (data) {
                	table = $('#newsletterList').DataTable({
                    	"data": data,
                    	"columns": [
                    		{ data: 'nombre' },
                    		{ data: 'correo' },
                    		{
                    			data: null,
                    			render: function(data, type, full, meta)
                    			{
                    				return '<a href="/verCarta/'+ data.id +'" type="button" style="background-color: #109CF1; color:#FFFFFF; border:none; padding: 10px 40px;">Ver</a> <button type="button" id="'+ data.id +'" class="eliminarCarta btn btn-danger"><i class="fa-solid fa-trash"></i></button>';
                    			}
                    		}
                    	]
                    });
                },
                error: function (x, e) {
                    Swal.fire('Algo salió mal!', '', 'info')
                }
             });
    	
    		//funcion para eliminar una carta
			$("#newsletterList").on("click",".eliminarCarta", function() {
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
		                    url: '${pageContext.request.contextPath}/eliminarCarta/' + id,
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
								url: '${pageContext.request.contextPath}/listaCartasG',
			                    type: "GET",
			                    dataType: "JSON",
			                    success: function (data) {
			                    	table.destroy();
			                    	table = $('#newsletterList').DataTable({
			                        	"data": data,
			                        	"columns": [
			                        		{ data: 'nombre' },
			                        		{ data: 'correo' },
			                        		{
			                        			data: null,
			                        			render: function(data, type, full, meta)
			                        			{
			                        				return '<a href="/verCarta/'+ data.id +'" type="button" style="background-color: #109CF1; color:#FFFFFF; border:none; padding: 10px 40px;">Ver</a> <button type="button" id="'+ data.id +'" class="eliminarCarta btn btn-danger"><i class="fa-solid fa-trash"></i></button>';
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

<body style="background-color: #F5F6F8;">

    <%@include file="/WEB-INF/vistas/sidebar.jsp" %>  

    <div style="margin-left: 265px;">
         <h1 class="d-block fw-bold" style="color: #6B6B6B; margin-top: 20px; margin-left: 20px;">Newsletter</h1>

         <div class="form-floating mb-4 position-relative">
            <input type="search" class="form-control" id="floating-input" placeholder="Nombre" style="margin: 0px 10px; width: 95%;">
            <label for="floating-input" style="margin-left: 10px;">
                <i class="bi bi-search" style="margin: 0px 10px;"></i>
                Nombre
            </label>

            <table id="newsletterList" class="text-center" style="margin-top: 15px; margin-left: 35px; background-color: #FFFFFF; box-shadow: 0px 0px 5px 0px rgba(0,0,0,0.30); -webkit-box-shadow: 0px 0px 5px 0px rgba(0,0,0,0.30); -moz-box-shadow: 0px 0px 5px 0px rgba(0,0,0,0.30); width: 90%;">
              <thead>
	              <tr style="border-bottom: 1px solid; border-color: #cacaca;">                
	                <td>Nombre</td>
	                <td>Correo</td>                              
	                <td>Acción</td>                
	              </tr>
              </thead>
              <tbody>
			  	
			  </tbody>
            </table>

        </div>
    </div>
</body>

</html>