package com.uca.ncapas.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.uca.ncapas.models.entities.Category;
import com.uca.ncapas.models.entities.Roles;
import com.uca.ncapas.services.CategoryService;

@Controller
@RequestMapping("/")
public class CategoryController {

	@Autowired
	private CategoryService service;
	
	@RequestMapping(value = {"/listaCategorias"}, method = RequestMethod.GET)
    public String categoriesPage(ModelMap model) {
        return "categoriesTemplate";
    }
	
	@RequestMapping(value = {"/editarCategoria/{id}"}, method = RequestMethod.GET)
    public String CategoriesEditPage(ModelMap model, @PathVariable int id) {
        model.addAttribute("categoria", service.getCategoryById(id));
        return "categoriesUpdate";
    }
	
	@RequestMapping(value = "/guardarCategoria", method = RequestMethod.POST)
    public @ResponseBody String guardarCategoria(@ModelAttribute("Category") Category category) {
    	
         service.saveCategory(category);
         return null;
     }
	
	@RequestMapping(value = "/actualizarCategoria", method = RequestMethod.PUT)
	public @ResponseBody String actualizarCategoria(@ModelAttribute("Category") Category category) {
		
		service.updateCategory(category);
		return null;
	}
	
	@RequestMapping(value = "/eliminarCategoria/{id}", method = RequestMethod.DELETE)
	public @ResponseBody String eliminarCategoria(@PathVariable int id) {
		
		service.deleteCategory(id);
		return null;
	}
}
