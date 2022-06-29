package com.uca.ncapas.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.uca.ncapas.models.entities.Category;

public interface CategoryRepository extends JpaRepository<Category, Integer> {
	
	Category findByNombre(String nombre);

}
