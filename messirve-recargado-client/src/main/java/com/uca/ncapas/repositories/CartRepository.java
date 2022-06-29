package com.uca.ncapas.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.uca.ncapas.models.entities.Cart;

public interface CartRepository extends JpaRepository<Cart, Integer> {

	@Query(value = "select  c.id as id, c.usuario_id as user, c.producto_id as products, c.cantidad as cantidad "
			+ "from carrito c "
			+ "where c.usuario_id = :user and c.producto_id = :product",nativeQuery = true)
	Cart getExistingCartItem(@Param("user")  Integer user, @Param("product")  Integer product);
	
}
