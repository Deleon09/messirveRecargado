package com.uca.ncapas.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.uca.ncapas.models.dtos.OrdersDTO;

public interface OrdersDTORepository extends JpaRepository<OrdersDTO, Integer> {

	@Query(value = "select  o.id as id, o.usuario_id, o.direccion_orden, o.precio_total_orden, o.metodo_pago_orden, o.pagada_orden, o.enviada_orden, o.fecha_creacion , "
			+ " u.nombre as usuario "
			+ "from ordenes o, usuarios u "
			+ "where o.usuario_id=u.id order by o.id",nativeQuery = true)
	List<OrdersDTO> getOrdersDTO();
	
	@Query(value = "select  o.id as id, o.usuario_id, o.direccion_orden, o.precio_total_orden, o.metodo_pago_orden, o.pagada_orden, o.enviada_orden, o.fecha_creacion , "
			+ " u.nombre as usuario "
			+ "from ordenes o, usuarios u "
			+ "where o.usuario_id=u.id and o.id = :id",nativeQuery = true)
	OrdersDTO getOrderByIdDTO(@Param("id")  Integer id);
	
	@Query(value = "select  o.id as id, o.usuario_id, o.direccion_orden, o.precio_total_orden, o.metodo_pago_orden, o.pagada_orden, o.enviada_orden, o.fecha_creacion , "
			+ " u.nombre as usuario "
			+ "from ordenes o, usuarios u "
			+ "where o.usuario_id=u.id and o.usuario_id = :id",nativeQuery = true)
	List<OrdersDTO> getOrdersDTOByUserID(@Param("id")  Integer id);
}
