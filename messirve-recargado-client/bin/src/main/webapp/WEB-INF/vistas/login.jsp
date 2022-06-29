<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="/WEB-INF/vistas/include-css.jsp" %>
    <%@include file="/WEB-INF/vistas/include-js.jsp" %>
    <script>
    	$(document).ready(function(){
    	
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
                        Swal.fire('No fue posible iniciar sesión!', '', 'info')
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
                <img src="/images/image.png"
                     alt="Login image" class="w-100 vh-100" style="object-fit: cover; object-position: left;">
            </div>

            <div class="col-sm-6 text-black">
                <div class="d-flex align-items-center px-5 ms-xl-4 pt-5 pt-xl-0 mt-xl-n5" style="margin-top:20%;">

                    <h2 class="fw-bold mb-5 pb-3" style="letter-spacing: 1px; font-family: 'Fredoka One', cursive; font-weight:900;">Shop-It or Donate-It</h2>

                    <form id="loginform">
                        <div class="form-floating mb-4">
                            <input id="userName" type="text" class="form-control" name="nombre" placeholder="Usuario">
                            <label style="font-family:'Roboto', sans-serif;">Usuario</label>
                        </div>

                        <div class="form-floating mb-4">
                            <input id="userPassword" type="password" class="form-control" name="contrasena" placeholder="Contraseña">
                            <label style="font-family:'Roboto', sans-serif;">Contraseña</label>
                        </div>

                        <div class="d-grid gap-2 mx-auto">
                            <input  type="submit" value="Iniciar sesión"
                                   style="margin-top: 15px;
                                       margin-left: 35px;
                                       background-color: #152C70;
                                       color: #FFFFFF;
                                       padding: 10px 40px;
                                       border: none;
                                       border-radius: 5px;
                                       font-family:'Roboto', sans-serif;"/>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>