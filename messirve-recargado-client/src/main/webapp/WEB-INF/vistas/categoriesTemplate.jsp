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
    	
    		//rolesList DataTable
			$.ajax({
					url: '${pageContext.request.contextPath}/listaCategoriasG',
                    type: "GET",
                    dataType: "JSON",
                    success: function (data) {
                    	table = $('#categoriesList').DataTable({
                        	"data": data,
                        	"columns": [
                        		{ data: 'nombre' },
                        		{
                        			data: null,
                        			render: function(data, type, full, meta)
                        			{
                        				return '<a href="/editarCategoria/'+ data.id +'" type="button" style="background-color: #109CF1; color:#FFFFFF; border:none; padding: 10px 40px;">Editar</a> <button type="button" id="'+ data.id +'" class="eliminarCat btn btn-danger"><i class="fa-solid fa-trash"></i></button>';
                        			}
                        		}
                        	]
                        });
                    },
                    error: function (x, e) {
                        Swal.fire('Something went wrong!', '', 'info')
                    }
         	});
    	
    		//Funcion para agregar una nueva categoria
    		document.getElementById("formCat").addEventListener("submit", function(event){
	  			event.preventDefault();
	  			var formCat = $("#formCat");
	  	
	  			Swal.fire({
				  title: 'Are you sure?',
				  text: "A new register will be added!",
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: 'Yes continue!'
				}).then((result) => {
	  				if (result.value) {
	  	
	  					$.ajax({
		                    data: formCat.serialize(),
		                    url: '${pageContext.request.contextPath}/guardarCategoria',
		                    type: "POST",
		                    success: function (response) {
		                        Swal.fire('Saved!', '', 'success');
		                        refreshTable();
		                    },
		                    error: function (x, e) {
		                        Swal.fire('Something went wrong!', '', 'info')
		                    }
	                    });
	  				}
				});
			});
			
			//funcion para eliminar una categoria
			$("#categoriesList").on("click",".eliminarCat", function() {
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
		                    url: '${pageContext.request.contextPath}/eliminarCategoria/' + id,
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
								url: '${pageContext.request.contextPath}/listaCategoriasG',
			                    type: "GET",
			                    dataType: "JSON",
			                    success: function (data) {
			                    	table.destroy();
			                    	table = $('#categoriesList').DataTable({
			                        	"data": data,
			                        	"columns": [
			                        		{ data: 'nombre' },
			                        		{
			                        			data: null,
			                        			render: function(data, type, full, meta)
			                        			{
			                        				return '<a href="/editarCategoria/'+ data.id +'" type="button" style="background-color: #109CF1; color:#FFFFFF; border:none; padding: 10px 40px;">Edit</a> <button type="button" id="'+ data.id +'" class="eliminarCat btn btn-danger"><i class="fa-solid fa-trash"></i></button>';
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
         <h1 class="d-block fw-bold" style="color: #1F69FF; padding-top: 50px; margin-left: 64px; margin-right: 1em;">Categories</h1>
          <input data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo" type="button" value="New" style="margin-bottom: 1em; margin-left: 64px; background-color: #152C70; color: #FFFFFF; padding: 10px 40px; border: none; border-radius: 5px;">

         <div class="form-floating mb-4 position-relative">    
            <div style="padding: 1em 4em;">
            <table id="categoriesList" class="text-center" style="background-color: #FFFFFF; margin-top:2em; box-shadow: 0px 0px 5px 0px rgba(0,0,0,0.30); -webkit-box-shadow: 0px 0px 5px 0px rgba(0,0,0,0.30); -moz-box-shadow: 0px 0px 5px 0px rgba(0,0,0,0.30);">
              <thead>
	              <tr style="border-bottom: 1px solid; border-color: #cacaca;">                
	                <td>Name</td>                              
	                <td>Action</td>                
	              </tr>
              </thead>
			  <tbody>
			  	
			  </tbody>
            </table>

        </div>
        </div>
    </div>
    
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">New category</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <form id="formCat">
	          <div class="mb-3">
	            <label class="col-form-label">Category:</label>
	            <input type="text" required name="nombre" class="form-control">
	          </div>
	          <input type="submit" class="btn btn-primary" value="Save" />
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