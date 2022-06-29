package com.uca.ncapas.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.uca.ncapas.models.dtos.UserDTO;

public interface UserDTORepository extends JpaRepository<UserDTO, Integer> {

	@Query(value = "select  u.id as id, u.nombre, u.rol_id , "
			+ "        r.nombre as rol "
			+ "from usuarios u,roles r "
			+ "where u.rol_id=r.id order by u.id",nativeQuery = true)
	List<UserDTO> getUsersDTO();
	
	@Query(value = "select  u.id as id, u.nombre, u.rol_id , u.contrasena, "
			+ "        r.nombre as rol "
			+ "from usuarios u,roles r "
			+ "where u.rol_id=r.id and u.id = :id",nativeQuery = true)
	UserDTO getUserDTOById(@Param("id")  Integer id);
	
	@Query(value = "select  u.id as id, u.nombre, u.rol_id, "
			+ "        r.nombre as rol "
			+ "from usuarios u,roles r "
			+ "where u.rol_id=r.id and u.nombre = :nombre and u.contrasena = :contrasena limit 1",nativeQuery = true)
	UserDTO getUserDTOByNameAndPass(@Param("nombre") String nombre, @Param("contrasena") String contrasena);
	
	@Query(value = "UPDATE usuarios "
			+ "SET nombre = :nombre, rol_id = :roles "
			+ "WHERE id = :id",nativeQuery = true)
	void updateUserDTO(@Param("id")  Integer id, @Param("nombre")  String nombre, @Param("roles")  Integer roles);
}
