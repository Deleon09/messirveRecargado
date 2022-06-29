package com.uca.ncapas.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uca.ncapas.models.entities.Suppliers;
import com.uca.ncapas.repositories.SuppliersRepository;

@Service
public class SuppliersService {

	@Autowired
	private SuppliersRepository repository;
	
	public Suppliers saveSuppliers(Suppliers suppliers) {
		return repository.save(suppliers);
	}
	
	public List<Suppliers> saveSupplierss(List<Suppliers> suppliers) {
		return repository.saveAll(suppliers);
	}
	
	public List<Suppliers> getSuppliers() {
		return repository.findAll();
	}
	
	public Suppliers getSupplierById(int id) {
		return repository.findById(id).orElse(null);
	}
	
	public Suppliers getSupplierByNombre(String nombre) {
		return repository.findByNombre(nombre);
	}
	
	public String deleteSupplier(int id) {
		repository.deleteById(id);
		return "Supplier deleted || " + id;
	}
	
	public Suppliers updateSupplier(Suppliers suppliers) {
		Suppliers existingSupplier = repository.findById(suppliers.getId()).orElse(null);
		existingSupplier.setNombre(suppliers.getNombre());
		existingSupplier.setPais_origen(suppliers.getPais_origen());
		return repository.save(existingSupplier);
	}
}
