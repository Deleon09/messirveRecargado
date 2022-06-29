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
    <script language="javascript" type="text/javascript"> 
		function openwin(){ 
			window.open ("newUser", "newwindow", "height=655, width=833, toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no") 
		} 
		
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
				url: '${pageContext.request.contextPath}/listaUsuariosG',
                type: "GET",
                dataType: "JSON",
                success: function (data) {
                	table = $('#usersList').DataTable({
                    	"data": data,
                    	"columns": [
                    		{ data: 'nombre' },
                    		{ data: 'rol' },
                    		{
                    			data: null,
                    			render: function(data, type, full, meta)
                    			{
                    				return '<a href="/editarUsuario/'+ data.id +'" type="button" style="background-color: #109CF1; color:#FFFFFF; border:none; padding: 10px 40px;">Edit</a> <button type="button" id="'+ data.id +'" class="eliminarUsuario btn btn-danger"><i class="fa-solid fa-trash"></i></button>';
                    			}
                    		}
                    	]
                    });
                },
                error: function (x, e) {
                    Swal.fire('Something went wrong!', '', 'info')
                }
             });
		
			//Funcion para agregar un nuevo usuario
    		document.getElementById("formUser").addEventListener("submit", function(event){
	  			event.preventDefault();
	  			var formUser = $("#formUser");
	  	
	  			Swal.fire({
				  title: 'Are you sure?',
				  text: "A new register will be added!",
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: 'Yes add!'
				}).then((result) => {
	  				if (result.value) {
	  	
	  					$.ajax({
		                    data: formUser.serialize(),
		                    url: '${pageContext.request.contextPath}/guardarUsuario',
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
			
			//funcion para eliminar un usuario
			$("#usersList").on("click",".eliminarUsuario", function() {
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
		                    url: '${pageContext.request.contextPath}/eliminarUsuario/' + id,
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
								url: '${pageContext.request.contextPath}/listaUsuariosG',
			                    type: "GET",
			                    dataType: "JSON",
			                    success: function (data) {
			                    	table.destroy();
			                    	table = $('#usersList').DataTable({
			                        	"data": data,
			                        	"columns": [
			                        		{ data: 'nombre' },
			                        		{ data: 'rol' },
			                        		{
			                        			data: null,
			                        			render: function(data, type, full, meta)
			                        			{
			                        				return '<a href="/editarUsuario/'+ data.id +'" type="button" style="background-color: #109CF1; color:#FFFFFF; border:none; padding: 10px 40px;">Edit</a> <button type="button" id="'+ data.id +'" class="eliminarUsuario btn btn-danger"><i class="fa-solid fa-trash"></i></button>';
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
         <h1 class="d-block fw-bold" style="color: #1F69FF; padding-top: 50px; margin-left: 64px; margin-right: 1em;">Users</h1>
         <input data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo" type="button" value="Add" style="margin-bottom: 1em; margin-left: 64px; background-color: #152C70; color: #FFFFFF; padding: 10px 40px; border: none; border-radius: 5px;">
         
         <div class="form-floating mb-4 position-relative">            
            <div style="padding: 1em 4em;">
	            <table id="usersList" style="background-color: #FFFFFF; margin-top:2em; box-shadow: 0px 0px 5px 0px rgba(0,0,0,0.30); -webkit-box-shadow: 0px 0px 5px 0px rgba(0,0,0,0.30); -moz-box-shadow: 0px 0px 5px 0px rgba(0,0,0,0.30);">
	              <thead>
		              <tr style="border-bottom: 1px solid; border-color: #cacaca;">                
		                <td>Username</td>
		                <td>Role</td>                              
		                <td>Action</td>                
		              </tr>
	              </thead>
				  <tbody>
				  	<c:forEach items="${usuarios}" var="usu">     
			   			<tr>                               
	                		<td><c:out value="${usu.nombre}"/></td>
	                		<td><c:out value="${usu.rol}"/></td>                
	                		<td>
	                			<a href="/editarUsuario/${usu.id}" type="button" style="background-color: #109CF1; border-radius: 5px; color:#FFFFFF; border:none; padding: 10px 40px; text-decoration: none;">Edit</a>
	                			<button type="button" id="${usu.id}" class="eliminarUsuario btn btn-danger"><i class="fa-solid fa-trash"></i></button>
	                		</td>             
	              		</tr>
					</c:forEach>
				  </tbody>
	            </table>
            </div>
        </div>
    </div>
    
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">New user</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <form id="formUser">
	          <div class="mb-3">
	            <label class="col-form-label">Username:</label>
	            <input type="text" required name="nombre" class="form-control">
	          </div>
	          <div class="mb-3">
	            <label class="col-form-label">Rol:</label>
	            <select name="roles" class="form-control">
	            	<c:forEach items="${roles}" var="rol">     
			   			<option value="${rol.id}">                               
	                		<td><c:out value="${rol.nombre}"/></td>            
	              		</option>
					</c:forEach>
	            </select>
	          </div>
	          <div class="mb-3">
	            <label class="col-form-label">Password:</label>
	            <input type="text" required name="contrasena" class="form-control">
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