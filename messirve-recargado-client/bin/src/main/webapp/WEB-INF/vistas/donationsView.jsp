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
</head>

<body style="background-color: #F5F6F8;">

    <%@include file="/WEB-INF/vistas/sidebar.jsp" %>  

    <div style="margin-left: 265px;">
         <h1 class="d-block fw-bold" style="color: #6B6B6B; margin-top: 20px; margin-left: 20px;">Detalles de la donación</h1>

         <form id="formDon">
	          <div class="mb-3">
	            <label class="col-form-label">Donante:</label>
	            <input type="text" readonly value="${donacion.usuario}" required name="nombre" class="form-control">
	          </div>
	          <div class="mb-3">
	            <label class="col-form-label">Monto:</label>
	            <input type="text" readonly value="${donacion.monto_donacion}" required name="nombre" class="form-control">
	          </div>
	          <div class="mb-3">
	            <label class="col-form-label">Mensaje:</label>
	            <input type="text" readonly value="${donacion.mensaje_donacion}" required name="nombre" class="form-control">
	          </div>
	          <div class="mb-3">
	            <label class="col-form-label">Area objetivo:</label>
	            <input type="text" readonly value="${donacion.harea}" required name="nombre" class="form-control">
	          </div>
	     </form>
         <a href="/listaDonaciones" type="button" style="width: 100%; background-color: #1F69FF;" class="btn text-white">Regresar</a>
    </div>
    
    
</body>

</html>