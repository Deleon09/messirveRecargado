package com.uca.ncapas.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.uca.ncapas.models.dtos.ProductDTO;

public interface ProductsDTORepository extends JpaRepository<ProductDTO, Integer> {

	@Query(value = "select  p.id as id, p.usuario_id, p.categoria_id, p.proveedor_id, p.nombre, p.descripcion, p.precio, p.cantidad , "
			+ " u.nombre as usuario, c.nombre as categoria, s.nombre as proveedor "
			+ "from productos p, usuarios u, categorias c, proveedores s "
			+ "where p.usuario_id=u.id and p.categoria_id=c.id and p.proveedor_id=s.id order by p.id",nativeQuery = true)
	List<ProductDTO> getProductsDTO();
	
	@Query(value = "select  p.id as id, p.usuario_id, p.categoria_id, p.proveedor_id, p.nombre, p.descripcion, p.precio, p.cantidad , "
			+ " u.nombre as usuario, c.nombre as categoria, s.nombre as proveedor "
			+ "from productos p, usuarios u, categorias c, proveedores s "
			+ "where p.usuario_id=u.id and p.categoria_id=c.id and p.proveedor_id=s.id and p.id = :id",nativeQuery = true)
	ProductDTO getProductDTOById(@Param("id")  Integer id);
}
