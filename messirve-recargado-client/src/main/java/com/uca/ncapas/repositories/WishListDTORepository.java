package com.uca.ncapas.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.uca.ncapas.models.dtos.WishListDTO;

public interface WishListDTORepository extends JpaRepository<WishListDTO, Integer> {

	@Query(value = "select  l.id as id, l.usuario_id, l.producto_id , "
			+ " u.nombre as usuario, p.nombre as producto "
			+ "from lista_deseos l, usuarios u, productos p "
			+ "where l.usuario_id=u.id and l.producto_id=p.id order by l.id",nativeQuery = true)
	List<WishListDTO> getWishListsDTO();
	
}
