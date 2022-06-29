package com.uca.ncapas.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.uca.ncapas.models.entities.Donations;

public interface DonationsRepository extends JpaRepository<Donations, Integer> {
	
}
