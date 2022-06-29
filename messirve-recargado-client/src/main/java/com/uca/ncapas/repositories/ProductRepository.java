package com.uca.ncapas.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.uca.ncapas.models.entities.Products;

public interface ProductRepository extends JpaRepository<Products, Integer> {

	Products findByNombre(String nombre);
	
	@Query(value = "select  p.id as id, p.usuario_id, p.categoria_id, p.proveedor_id, p.nombre, p.descripcion, p.precio, p.cantidad "
			+ "from productos p "
			+ "order by p.id limit 9",nativeQuery = true)
	List<Products> getProductsLimit();
	
}
