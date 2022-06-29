package com.uca.ncapas.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.uca.ncapas.models.entities.Harea;

public interface HareaRepository extends JpaRepository<Harea, Integer> {

	Harea findByNombre(String nombre);
	
}
