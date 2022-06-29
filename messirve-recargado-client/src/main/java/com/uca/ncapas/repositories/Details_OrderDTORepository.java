package com.uca.ncapas.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.uca.ncapas.models.dtos.Details_OrderDTO;

public interface Details_OrderDTORepository extends JpaRepository<Details_OrderDTO, Integer> {

	@Query(value = "select  od.id as id, od.orden_id, od.producto_id, od.cantidad , "
			+ " p.nombre as producto "
			+ "from orden_detalle od, productos p "
			+ "where od.producto_id=p.id and od.orden_id = :id",nativeQuery = true)
	List<Details_OrderDTO> getDetails_OrderDTOByOrderId(@Param("id")  Integer id);
	
}
