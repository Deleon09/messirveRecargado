package com.uca.ncapas.services;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uca.ncapas.models.entities.Roles;
import com.uca.ncapas.repositories.RolesRepository;

@Service
public class RolesService {
	
	@Autowired
	private RolesRepository repository;
	
	public Roles saveRoles(Roles roles) {
		return repository.save(roles);
	}
	
	public List<Roles> saveRoless(List<Roles> roles) {
		return repository.saveAll(roles);
	}
	
	public List<Roles> getRoles() {
		return repository.findAll();
	}
	
	public Roles getRoleById(int id) {
		return repository.findById(id).orElse(null);
	}
	
	public Roles getRoleByNombre(String nombre) {
		return repository.findByNombre(nombre);
	}
	
	public String deleteRole(int id) {
		repository.deleteById(id);
		return "Role deleted || " + id;
	}
	
	public Roles updateRole(Roles role) {
		Roles existingRole = repository.findById(role.getId()).orElse(null);
		existingRole.setNombre(role.getNombre());
		return repository.save(existingRole);
	}
	
}
