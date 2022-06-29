<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
     <head>
        <%@include file="/WEB-INF/vistas/include-css.jsp" %>
        <%@include file="/WEB-INF/vistas/include-js.jsp" %>
        
        <script language="JavaScript" type="text/javascript"> 
			function closeit() 
			{ 
			setTimeout("self.close()",100) 
			} 
		</script>
     </head>
     
     <body>
     	<div class="d-flex align-items-center flex-shrink-0 p-3 link-dark text-decoration-none border-bottom" style="background-color:#152C70">
      		<span class="fs-5 fw-bold text-white">Registro de usuarios</span>
    	</div>
    	<div class="col-sm-6 text-black">
	        <div class="d-flex align-items-center px-5">
	          <form style="width: 100%;">
	            <h2 class="fw-bold mb-5 pb-3 text-primary" style="letter-spacing: 1px;">Datos generales</h2>
	            <div class="form-floating mb-4">
		            <input type="text" class="form-control" id="floatingInput" placeholder="Username">
		    		<label for="floatingInput" >Usuario</label>
	            </div>
	            <div class="form-floating mb-4">
		            <input type="password" class="form-control" id="floatingInput" placeholder="Password">
		    		<label for="floatingInput">Contraseña</label>
	            </div>
	            <div class="d-grid gap-2 mx-auto">
		            <a href="#" onclick="closeit()"> 
		            	<input type="button" value="Crear usuario" style="margin-top: 15px; margin-left: 35px; background-color: #152C70; color: #FFFFFF; padding: 10px 40px; border: none; border-radius: 5px;">
		            </a>
	            </div>
	          </form>
	       </div>
      </div>
    </body>
</html>