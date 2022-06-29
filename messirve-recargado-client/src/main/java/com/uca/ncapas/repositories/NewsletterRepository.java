package com.uca.ncapas.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.uca.ncapas.models.entities.Newsletter;

public interface NewsletterRepository extends JpaRepository<Newsletter, Integer> {

	Newsletter findByNombre(String nombre);
	
}
