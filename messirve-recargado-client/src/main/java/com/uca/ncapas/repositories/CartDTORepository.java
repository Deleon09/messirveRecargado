package com.uca.ncapas.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.uca.ncapas.models.dtos.CartDTO;

public interface CartDTORepository extends JpaRepository<CartDTO, Integer> {

	@Query(value = "select  c.id as id, c.usuario_id, c.producto_id, c.cantidad , "
			+ " u.nombre as usuario, p.nombre as producto, p.precio, p.descripcion "
			+ "from carrito c, usuarios u, productos p "
			+ "where c.usuario_id=u.id and c.producto_id=p.id order by c.id",nativeQuery = true)
	List<CartDTO> getCartsDTO();
	
	@Query(value = "select  c.id as id, c.usuario_id, c.producto_id, c.cantidad , "
			+ " u.nombre as usuario, p.nombre as producto, p.precio as precio, p.descripcion "
			+ "from carrito c, usuarios u, productos p "
			+ "where c.usuario_id=u.id and c.producto_id=p.id and c.usuario_id = :id",nativeQuery = true)
	List<CartDTO> getCartsDTOByUserID(@Param("id")  Integer id);
}
