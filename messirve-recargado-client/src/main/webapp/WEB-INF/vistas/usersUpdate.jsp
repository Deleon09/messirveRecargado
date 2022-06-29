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
    	
    		document.getElementById("formUser").addEventListener("submit", function(event){
	  			event.preventDefault();
	  			var formUser = $("#formUser");
	  	
	  			Swal.fire({
				  title: 'Are you sure?',
				  text: "The data will be updated!",
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: 'Yes update!'
				}).then((result) => {
	  				if (result.value) {
	  
	  					$.ajax({
                            data: formUser.serialize(),
                            url: '${pageContext.request.contextPath}/actualizarUsuario',
                            type: "PUT",
                            success: function (response) {
                                
                                Swal.fire(
							      'Saved!',
							      'It has been updated successfully.',
							      'success'
							    )
    
								document.location.href='/listaUsuarios';
                                
                            },
                            error: function (x, e) {
                                Swal.fire('Could not update!', '', 'info')
                            }
                          });	
                            
	  				}
				});
			});
			
    	});
    </script>
</head>

<body style="background-color: #F5F6F8;">

    <%@include file="/WEB-INF/vistas/sidebar.jsp" %>  

    <div style="margin-left: 265px;">
         <h1 class="d-block fw-bold" style="color: #6B6B6B; margin-top: 20px; margin-left: 20px;">Update user</h1>

         <form id="formUser">
	          <div class="mb-3">
	            <label class="col-form-label">Username:</label>
	            <input type="text" value="${usuario.nombre}" required name="nombre" class="form-control">
	            <input style="display: none;" value="${usuario.id}" step="1" type="number" name="id">
	            <input style="display: none;" value="rickrolled" type="text" name="password">
	          </div>
	          <div class="mb-3">
	            <label class="col-form-label">Role:</label>
	            <select name="roles" class="form-control">
	            	<c:forEach items="${roles}" var="rol">     
			   			<option value="${rol.id}">                               
	                		<td><c:out value="${rol.nombre}"/></td>            
	              		</option>
					</c:forEach>
	            </select>
	          </div>
	          <input type="submit" class="btn btn-primary" value="Guardar" />
	     </form>
            
    </div>
    
    
</body>

</html>