package com.uca.ncapas.services;

import java.util.ArrayList;

import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uca.ncapas.models.entities.User;
import com.uca.ncapas.repositories.UserRepository;

@Service
public class UserService {
	
	@Autowired
	private UserRepository repository;
	
	public User saveUser(User user) {
		return repository.save(user);
	}
	
	public List<User> saveUsers(List<User> users) {
		return repository.saveAll(users);
	}
	
	public List<User> getUsers() {
		return repository.findAll();
	}
	
	public User getUserById(int id) {
		return repository.findById(id).orElse(null);
	}
	
	public User getUserByNombre(String nombre) {
		return repository.findByNombre(nombre);
	}
	
	public String deleteUser(int id_usuario) {
		repository.deleteById(id_usuario);
		return "User deleted || " + id_usuario;
	}
	
	public User updateUser(User user) {
		User existingUser = repository.findById(user.getId()).orElse(null);
		existingUser.setNombre(user.getNombre());
		existingUser.setRoles(user.getRoles());
		return repository.save(existingUser);
	}
}
