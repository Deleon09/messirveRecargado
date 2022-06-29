package com.uca.ncapas.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uca.ncapas.models.entities.Products;
import com.uca.ncapas.repositories.ProductRepository;

@Service
public class ProductsService {
	
	@Autowired
	private ProductRepository repository;
	
	public Products saveProducts(Products products) {
		return repository.save(products);
	}
	
	public List<Products> saveProductss(List<Products> products) {
		return repository.saveAll(products);
	}
	
	public List<Products> getProducts() {
		return repository.findAll();
	}
	
	public List<Products> getProductsWithLimit() {
		return repository.getProductsLimit();
	}
	
	public Products getProductsById(int id) {
		return repository.findById(id).orElse(null);
	}
	
	public Products getProductsByNombre(String nombre) {
		return repository.findByNombre(nombre);
	}
	
	public String deleteProducts(int id) {
		repository.deleteById(id);
		return "Products deleted || " + id;
	}
	
	public Products updateProducts(Products products) {
		Products existingProduct = repository.findById(products.getId()).orElse(null);
		existingProduct.setUser(products.getUser());
		existingProduct.setCategory(products.getCategory());
		existingProduct.setSuppliers(products.getSuppliers());;
		existingProduct.setNombre(products.getNombre());
		existingProduct.setDescripcion(products.getDescripcion());
		existingProduct.setPrecio(products.getPrecio());
		existingProduct.setCantidad(products.getCantidad());
		return repository.save(existingProduct);
	}
}
