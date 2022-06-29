package com.uca.ncapas.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uca.ncapas.models.entities.Category;
import com.uca.ncapas.repositories.CategoryRepository;

@Service
public class CategoryService {
	
	@Autowired
	private CategoryRepository repository;
	
	public Category saveCategory(Category category) {
		return repository.save(category);
	}
	
	public List<Category> saveCategories(List<Category> categories) {
		return repository.saveAll(categories);
	}
	
	public List<Category> getCategories() {
		return repository.findAll();
	}
	
	public Category getCategoryById(int id) {
		return repository.findById(id).orElse(null);
	}
	
	public Category getCategoryByNombre(String nombre) {
		return repository.findByNombre(nombre);
	}
	
	public String deleteCategory(int id) {
		repository.deleteById(id);
		return "Category deleted || " + id;
	}
	
	public Category updateCategory(Category category) {
		Category existingCategory = repository.findById(category.getId()).orElse(null);
		existingCategory.setNombre(category.getNombre());
		return repository.save(existingCategory);
	}
}
