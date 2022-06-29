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
                    				return '<a href="/verCarta/'+ data.id +'" type="button" style="background-color: #109CF1; color:#FFFFFF; border:none; padding: 10px 40px;">See</a> <button type="button" id="'+ data.id +'" class="eliminarCarta btn btn-danger"><i class="fa-solid fa-trash"></i></button>';
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
		                    url: '${pageContext.request.contextPath}/eliminarCarta/' + id,
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
			                        				return '<a href="/verCarta/'+ data.id +'" type="button" style="background-color: #109CF1; color:#FFFFFF; border:none; padding: 10px 40px;">View</a> <button type="button" id="'+ data.id +'" class="eliminarCarta btn btn-danger"><i class="fa-solid fa-trash"></i></button>';
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

<body style="background-color: #F5F6F8;">

    <%@include file="/WEB-INF/vistas/sidebar.jsp" %>  

    <div style="margin-left: 265px;">
         <h1 class="d-block fw-bold" style="color: #1F69FF; padding-top: 50px; margin-left: 64px; margin-right: 1em;">Newsletter</h1>

         <div class="form-floating mb-4 position-relative">          
            <div style="padding: 1em 4em;">
            <table id="newsletterList" class="text-center" style="background-color: #FFFFFF; margin-top:2em; box-shadow: 0px 0px 5px 0px rgba(0,0,0,0.30); -webkit-box-shadow: 0px 0px 5px 0px rgba(0,0,0,0.30); -moz-box-shadow: 0px 0px 5px 0px rgba(0,0,0,0.30);">
              <thead>
	              <tr style="border-bottom: 1px solid; border-color: #cacaca;">                
	                <td>Name</td>
	                <td>eMail</td>                              
	                <td>Action</td>                
	              </tr>
              </thead>
              <tbody>
			  	
			  </tbody>
            </table>
	     </div>

        </div>
    </div>
</body>

</html>