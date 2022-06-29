package com.uca.ncapas.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.uca.ncapas.models.entities.Roles;

public interface RolesRepository extends JpaRepository<Roles, Integer> {

	Roles findByNombre(String nombre);
	
}
