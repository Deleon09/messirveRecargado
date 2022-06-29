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
    	
    		document.getElementById("formProd").addEventListener("submit", function(event){
	  			event.preventDefault();
	  			var formProd = $("#formProd");
	  	
	  			Swal.fire({
				  title: 'Are you sure?',
				  text: "The data will be updated!",
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: 'Si, actualizar!'
				}).then((result) => {
	  				if (result.value) {
	  
	  					$.ajax({
                            data: formProd.serialize(),
                            url: '${pageContext.request.contextPath}/actualizarProducto',
                            type: "PUT",
                            success: function (response) {
                                
                                Swal.fire(
							      'Saved!',
							      'It has been updated successfully.',
							      'success'
							    )
    
								document.location.href='/listaProductos';
                                
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
         <h1 class="d-block fw-bold" style="color: #6B6B6B; margin-top: 20px; margin-left: 20px;">Product update</h1>

         <form id="formProd">
	          <div class="mb-3">
	            <label class="col-form-label">User:</label>
	            <select name="user" class="form-control">
	            	<c:forEach items="${usuarios}" var="usu">     
	              		<c:choose>
						    <c:when test="${producto.usuario_id==usu.id}">
						        <option selected value="${usu.id}">                               
	                				<td><c:out value="${usu.nombre}"/></td>            
	              				</option>
						    </c:when>    
						    <c:otherwise>
						        <option value="${usu.id}">                               
	                				<td><c:out value="${usu.nombre}"/></td>            
	              				</option>
						    </c:otherwise>
						</c:choose>
					</c:forEach>
	            </select>
	          </div>
	          <div class="mb-3">
	            <label class="col-form-label">Category:</label>
	            <select name="category" class="form-control">
	            	<c:forEach items="${categorias}" var="cat">     
	              		<c:choose>
						    <c:when test="${producto.categoria_id==cat.id}">
						        <option selected value="${cat.id}">                               
	                				<td><c:out value="${cat.nombre}"/></td>            
	              				</option>
						    </c:when>    
						    <c:otherwise>
						        <option value="${cat.id}">                               
	                				<td><c:out value="${cat.nombre}"/></td>            
	              				</option>
						    </c:otherwise>
						</c:choose>
					</c:forEach>
	            </select>
	          </div>
	          <div class="mb-3">
	            <label class="col-form-label">Supplier:</label>
	            <select name="suppliers" class="form-control">
	            	<c:forEach items="${proveedores}" var="prov">     
			   			<option value="${prov.id}">                               
	                		<td><c:out value="${prov.nombre}"/></td>            
	              		</option>
	              		<c:choose>
						    <c:when test="${producto.proveedor_id==cat.id}">
						        <option selected value="${cat.id}">                               
	                				<td><c:out value="${cat.nombre}"/></td>            
	              				</option>
						    </c:when>    
						    <c:otherwise>
						        <option value="${cat.id}">                               
	                				<td><c:out value="${cat.nombre}"/></td>            
	              				</option>
						    </c:otherwise>
						</c:choose>
					</c:forEach>
	            </select>
	          </div>
	          <div class="mb-3">
	            <label class="col-form-label">Name:</label>
	            <input type="text" value="${producto.nombre}" required name="nombre" class="form-control">
	            <input style="display: none;" value="${producto.id}" step="1" type="number" name="id">
	          </div>
	          <div class="mb-3">
	            <label class="col-form-label">Description:</label>
	            <textarea required name="descripcion" class="form-control"> ${producto.descripcion} </textarea>
	          </div>
	          <div class="mb-3">
	            <label class="col-form-label">Price:</label>
	            <input type="number" value="${producto.precio}" step="any" required name="precio" class="form-control">
	          </div>
	          <div class="mb-3">
	            <label class="col-form-label">Amount:</label>
	            <input type="number" value="${producto.cantidad}" step="1" required name="cantidad" class="form-control">
	          </div>
	          <input type="submit" class="btn btn-primary" value="Save" />
	        </form>
            
    </div>
    
    
</body>

</html>