<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
     <head>
        <%@include file="/WEB-INF/vistas/include-css.jsp" %>
        <%@include file="/WEB-INF/vistas/include-js.jsp" %>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" />
        
        <style>
      tr td{
        padding: 15px 0px;
      }
    </style>
    <script>
    	
    	$(document).ready(function(){
    	
	    	var table;
			
			$.ajax({
				url: '${pageContext.request.contextPath}/listaDonacionesG',
	            type: "GET",
	            dataType: "JSON",
	            success: function (data) {
	            	table = $('#donationsList').DataTable({
	                	"data": data,
	                	"columns": [
	                		{ data: 'usuario' },
	                		{ data: 'harea' },
	                		{ data: 'monto_donacion' },
	                		{
	                			data: null,
	                			render: function(data, type, full, meta)
	                			{
	                				return '<a href="/verDonacion/'+ data.id +'" type="button" style="background-color: #109CF1; color:#FFFFFF; border:none; padding: 10px 40px;">Ver detalles</a>';
	                			}
	                		}
	                	]
	                });
	            },
	            error: function (x, e) {
	                Swal.fire('Algo salió mal!', '', 'info')
	            }
	         });
    	
    	 });
    </script>
     </head>
     <body style="background-color: #F5F6F8">
      <%@include file="/WEB-INF/vistas/sidebar.jsp" %>
      
      <div style="margin-left: 265px;">
      <h1 class="d-block fw-bold" style="color: #6B6B6B; margin-top: 20px; margin-left: 20px;">Donaciones</h1>
      
      <div class="d-flex justify-content-center">
      <h5 class="d-block fw-bold" style="color: #6B6B6B; margin-right: 55px;">Porcentaje de donacion: 20%</h5> 
      <h5 class="d-block fw-bold" style="color: #6B6B6B; margin-right: 55px;">Número de donaciones: 80</h5> 
      <h5 class="d-block fw-bold" style="color: #6B6B6B;">Saldo actual: $2,555,689.00</h5>
      </div>
      
      
      
      <table id="donationsList" class="text-center" style="margin-top: 15px; margin-left: 35px; background-color: #FFFFFF; box-shadow: 0px 0px 5px 0px rgba(0,0,0,0.30); -webkit-box-shadow: 0px 0px 5px 0px rgba(0,0,0,0.30); -moz-box-shadow: 0px 0px 5px 0px rgba(0,0,0,0.30); width: 90%;">
              <thead>
	              <tr style="border-bottom: 1px solid; border-color: #cacaca;">                
	                <td>Donante</td>                
	                <td>Area objetivo</td>
	                <td>Monto de donación</td>
	                <td>Acciónes</td>
	              </tr>
			  </thead>
              <tbody>
              	
			  </tbody>
            </table>
      </div>
      </body>
</html>