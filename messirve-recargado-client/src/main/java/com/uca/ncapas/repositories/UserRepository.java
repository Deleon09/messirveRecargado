package com.uca.ncapas.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.query.Param;

import com.uca.ncapas.models.entities.User;

public interface UserRepository extends JpaRepository<User, Integer> {

	User findByNombre(String nombre);
	
}
