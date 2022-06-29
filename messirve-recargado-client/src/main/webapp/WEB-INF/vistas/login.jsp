<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="/WEB-INF/vistas/include-css.jsp" %>
    <%@include file="/WEB-INF/vistas/include-js.jsp" %>
    <script>
    	$(document).ready(function(){
    	
    		if(retrievedObject){
    			if(retrievedObject.rol === 'Administrador'){       
                	document.location.href='/listaUsuarios';
                } else {
                	document.location.href='/home';
                }
    		}
    	
    		//Funcion para agregar un nuevo rol
    		document.getElementById("loginform").addEventListener("submit", function(event){
	  			event.preventDefault();
	  			
	  			var nombre = $( "#userName" ).val();
	  			var contrasena = $( "#userPassword" ).val();
	  			
	  			const user = {
	  				nombre:nombre,
	  				contrasena:contrasena
	  			};
	  	
	  			$.ajax({
	  				headers: { 
				        'Accept': 'application/json',
				        'Content-Type': 'application/json' 
				    },
                    data: JSON.stringify(user),
                    dataType: "JSON",
                    url: '${pageContext.request.contextPath}/loginUser',
                    type: "POST",
                    success: function (data) {
                        
                        localStorage.setItem('userInfo', JSON.stringify(data));
                        
                        if(data.rol === 'Administrador'){       
                        	document.location.href='/listaUsuarios';
                        } else {
                        	document.location.href='/home';
                        }
                        
                    },
                    error: function (x, e) {
                        Swal.fire('Login failed!', '', 'info')
                    }
                });
                
			});
    	
		function openwin(){ 
			window.open ("newUser", "newwindow", "height=655, width=833, toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no") 
		}		
			var retrievedObject = JSON.parse(localStorage.getItem('userInfo'));
			
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
                    				return '<a href="/editarUsuario/'+ data.id +'" type="button" style="background-color: #109CF1; color:#FFFFFF; border:none; padding: 10px 40px;">Editar</a> <button type="button" id="'+ data.id +'" class="eliminarUsuario btn btn-danger"><i class="fa-solid fa-trash"></i></button>';
                    			}
                    		}
                    	]
                    });
                },
                error: function (x, e) {
                    Swal.fire('Something went wrong!', '', 'info')
                }
             });
					
			//Agregar usuario
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
				  confirmButtonText: 'Yes! I want to register.'
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
});
    </script>
</head>
<body>
<section class="vh-100">

    <div class="container-fluid">
        <div class="row">

            <div class="col-sm-6 px-0 d-none d-sm-block">
                	 <img src="/images/imageLogin.png"
                     alt="Login image" class="w-100 vh-100" style="object-fit: cover; object-position: left;">
            </div>

            <div class="col-sm-6 text-black">
                <div class="d-block px-5 ms-xl-4 pt-5 pt-xl-0 mt-xl-n5" style="margin-top:20%;">
                
	            	<a class="nav-link" href="/home">
	                    <h2 class="fw-bold mb-5 pb-3" style="letter-spacing: 1px; font-family: 'Fredoka One', cursive; font-weight:900; text-align: center; color: #F7685B;">Shop-It or Donate-It</h2>
	            	</a>
                    <form id="loginform">
                        <div class="form-floating mb-4">
                            <input id="userName" type="text" class="form-control" name="nombre" placeholder="Usuario">
                            <label style="font-family:'Roboto', sans-serif;">User</label>
                        </div>

                        <div class="form-floating mb-4">
                            <input id="userPassword" type="password" class="form-control" name="contrasena" placeholder="Contraseña">
                            <label style="font-family:'Roboto', sans-serif;">Password</label>
                        </div>

                        <div class="d-grid gap-2 mx-auto">
        					<input data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo" type="button" value="I don't have an account" style="background-color: #009DFF; color: #FFFFFF; border: none; border-radius: 5px; font-family:'Roboto', sans-serif; padding: 10px 40px;">
                            <input  type="submit" value="Log In" style="background-color: #152C70; color: #FFFFFF; border: none; border-radius: 5px; font-family:'Roboto', sans-serif; padding: 10px 40px;"/>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Register</h5>
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
			   		<option value="2">                               
	                <td><c:out value="Cliente"/></td>    
	            </select>
	          </div>
	          <div class="mb-3">
	            <label class="col-form-label">Password:</label>
	            <input type="text" required name="contrasena" class="form-control">
	          </div>
	          <input type="submit" class="btn btn-primary" value="Sign In" />
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