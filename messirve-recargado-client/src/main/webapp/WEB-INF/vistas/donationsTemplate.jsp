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
    	
    		var retrievedObject = JSON.parse(localStorage.getItem('userInfo'));
        		
    		if(!retrievedObject){
    			document.location.href='/login';
    		}
		
			if(retrievedObject.rol !== 'Administrador'){
				document.location.href='/home';
			}
    	
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
	                				return '<a href="/verDonacion/'+ data.id +'" type="button" style="background-color: #109CF1; color:#FFFFFF; border:none; padding: 10px 40px;">Details</a>';
	                			}
	                		}
	                	]
	                });
	            },
	            error: function (x, e) {
	                Swal.fire('Something went wrong!', '', 'info')
	            }
	         });
    	
    	 });
    </script>
     </head>
     <body style="background-color: #F5F6F8">
      <%@include file="/WEB-INF/vistas/sidebar.jsp" %>
      
      <div style="margin-left: 265px;">
      <h1 class="d-block fw-bold" style="color: #1F69FF; padding-top: 50px; margin-left: 64px; margin-right: 1em;">Donations</h1>
         
      <div style="padding: 1em 4em;">
      <table id="donationsList" class="text-center" style="background-color: #FFFFFF; margin-top:2em; box-shadow: 0px 0px 5px 0px rgba(0,0,0,0.30); -webkit-box-shadow: 0px 0px 5px 0px rgba(0,0,0,0.30); -moz-box-shadow: 0px 0px 5px 0px rgba(0,0,0,0.30);">
              <thead>
	              <tr style="border-bottom: 1px solid; border-color: #cacaca;">                
	                <td>Donator</td>                
	                <td>Hospital area</td>
	                <td>Amount of donation</td>
	                <td>Actions</td>
	              </tr>
			  </thead>
              <tbody>
              	
			  </tbody>
            </table>
      </div>
      </div>
      </body>
</html>