package com.uca.ncapas.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.uca.ncapas.models.dtos.DonationsDTO;

public interface DonationsDTORepository extends JpaRepository<DonationsDTO, Integer> {

	@Query(value = "select  d.id as id, d.usuario_id, d.monto_donacion, d.mensaje_donacion, d.harea_id , "
			+ " u.nombre as usuario, a.nombre as harea "
			+ "from donaciones d, usuarios u, areas a "
			+ "where d.usuario_id=u.id and d.harea_id=a.id order by d.id",nativeQuery = true)
	List<DonationsDTO> getDonationsDTO();
	
	@Query(value = "select  d.id as id, d.usuario_id, d.monto_donacion, d.mensaje_donacion, d.harea_id , "
			+ " u.nombre as usuario, a.nombre as harea "
			+ "from donaciones d, usuarios u, areas a "
			+ "where d.usuario_id=u.id and d.harea_id=a.id and d.id = :id",nativeQuery = true)
	DonationsDTO getDonationDTOById(@Param("id")  Integer id);
	
}
