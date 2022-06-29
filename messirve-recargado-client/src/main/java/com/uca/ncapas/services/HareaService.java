package com.uca.ncapas.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uca.ncapas.models.entities.Harea;
import com.uca.ncapas.repositories.HareaRepository;

@Service
public class HareaService {

	@Autowired
	private HareaRepository repository;
	
	public Harea saveHarea(Harea harea) {
		return repository.save(harea);
	}
	
	public List<Harea> saveHareas(List<Harea> hareas) {
		return repository.saveAll(hareas);
	}
	
	public List<Harea> getHareas() {
		return repository.findAll();
	}
	
	public Harea getHareaById(int id) {
		return repository.findById(id).orElse(null);
	}
	
	public Harea getHareaByNombre(String nombre) {
		return repository.findByNombre(nombre);
	}
	
	public String deleteHarea(int id) {
		repository.deleteById(id);
		return "Harea deleted || " + id;
	}
	
	public Harea updateHarea(Harea harea) {
		Harea existingHarea = repository.findById(harea.getId()).orElse(null);
		existingHarea.setNombre(harea.getNombre());
		return repository.save(existingHarea);
	}
}
