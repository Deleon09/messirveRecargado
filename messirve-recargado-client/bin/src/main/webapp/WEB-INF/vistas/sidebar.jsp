<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="/WEB-INF/vistas/include-css.jsp" %>
        <%@include file="/WEB-INF/vistas/include-js.jsp" %>
        
    	<!-- Bootstrap Font Icon CSS -->
    	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" />
    	
    	<style type="text/css">
	    	.btn-toggle-nav a {
	    		display: inline-flex;
	    		padding: 0.1875rem 0.5rem;
	    		margin-top: 0.125rem;
	    		margin-left: 1.25rem;
	    		text-decoration: none;}
    	</style>
    </head>
    <body>
        <main class="flex-shrink-0 p-3 bg-white" style="width: 16em; display: block; top: 0; bottom: 0; position: fixed; -webkit-box-shadow: 0px 0px 17px -2px rgba(0,0,0,0.55); box-shadow: 0px 0px 17px -2px rgba(0,0,0,0.33);">
        	<a href="/home" class="d-flex align-items-center link-dark text-decoration-none">
     	 		<img class="m-3" width="170px" height="33px" src="<c:url value='/resources/assets/logo/logoHorizontal.png' />">
   			</a>
   			<div class="py-3" style="margin:1rem;">
	   			<h3 style="font-size:1em;">Manuel</h3>
	   			<p style="font-size:0.8em;">email</p>
	   		</div>
   			<ul class="list-unstyled ps-0">
   				<li>
   					<button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#catalogue-collapse" aria-expanded="true">
   						<p class="text-primary" style="margin:0px;">
   						<i class="bi bi-archive"></i>
   						Catalogos
   						</p>
        			</button>
        			<div class="collapse" id="catalogue-collapse">
          				<ul class="btn-toggle-nav list-unstyled fw-normal small">
            				<li><a href="/listaUsuarios" class="link-dark rounded"><i class="bi bi-caret-right-fill" style="padding:0.3rem 0.5rem 0 0; font-size:8px;"></i>Usuarios</a></li>
            				<li><a href="/listaProductos" class="link-dark rounded"><i class="bi bi-caret-right-fill" style="padding:0.3rem 0.5rem 0 0; font-size:8px;"></i>Productos</a></li>
            				<li><a href="/listaRoles" class="link-dark rounded"><i class="bi bi-caret-right-fill" style="padding:0.3rem 0.5rem 0 0; font-size:8px;"></i>Roles</a></li>
            				<li><a href="/listaProveedores" class="link-dark rounded"><i class="bi bi-caret-right-fill" style="padding:0.3rem 0.5rem 0 0; font-size:8px;"></i>Proveedores</a></li>
          				</ul>
       				</div>
   				</li>
   				<li>
   					<button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#consults-collapse" aria-expanded="true">
          				<p class="text-primary" style="margin:0px;">
   						<i class="bi bi-mailbox"></i>
   						Consultas
   						</p>
        			</button>
        			<div class="collapse" id="consults-collapse">
          				<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            				<li><a href="/listaCategorias" class="link-dark rounded"><i class="bi bi-caret-right-fill" style="padding:0.3rem 0.5rem 0 0; font-size:8px;"></i>Categorías</a></li>
            				<li><a href="/listaOrdenes" class="link-dark rounded"><i class="bi bi-caret-right-fill" style="padding:0.3rem 0.5rem 0 0; font-size:8px;"></i>Ordenes</a></li>
            				<li><a href="/listaDonaciones" class="link-dark rounded"><i class="bi bi-caret-right-fill" style="padding:0.3rem 0.5rem 0 0; font-size:8px;"></i>Donaciones</a></li>
            				<li><a href="/listaCartas" class="link-dark rounded"><i class="bi bi-caret-right-fill" style="padding:0.3rem 0.5rem 0 0; font-size:8px;"></i>Newsletters</a></li>
          				</ul>
       				</div>
   				</li>
   				<li class="border-top my-3"></li>
   				<li>
   					<button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#account-collapse" aria-expanded="true">
   						<p class="text-primary" style="margin:0px;">
   						Cuenta
   						</p>
        			</button>
        			<div class="collapse" id="account-collapse">
          				<ul class="btn-toggle-nav list-unstyled fw-normal small">
            				<li><a href="/home" class="link-dark rounded"><i class="bi bi-caret-right-fill" style="padding:0.3rem 0.5rem 0 0; font-size:8px;"></i>Cerrar sesión</a></li>
            			</ul>
       				</div>
   				</li>
   			</ul>
        </main>
    </body>
</html>