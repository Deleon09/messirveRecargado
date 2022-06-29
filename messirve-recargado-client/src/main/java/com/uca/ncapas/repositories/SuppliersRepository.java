package com.uca.ncapas.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.uca.ncapas.models.entities.Suppliers;

public interface SuppliersRepository extends JpaRepository<Suppliers, Integer> {

	Suppliers findByNombre(String nombre);
	
}
