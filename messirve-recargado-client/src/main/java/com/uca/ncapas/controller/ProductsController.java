package com.uca.ncapas.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.uca.ncapas.models.entities.Products;
import com.uca.ncapas.repositories.ProductsDTORepository;
import com.uca.ncapas.services.CategoryService;
import com.uca.ncapas.services.ProductsService;
import com.uca.ncapas.services.SuppliersService;
import com.uca.ncapas.services.UserService;

@Controller
@RequestMapping("/")
public class ProductsController {

	@Autowired
	private ProductsService service;
	@Autowired
	private UserService Uservice;
	@Autowired
	private CategoryService Cservice;
	@Autowired
	private SuppliersService Sservice;
	@Autowired
	private ProductsDTORepository Prepository;
	
	@RequestMapping(value = {"/listaProductos"}, method = RequestMethod.GET)
    public String productsPage(ModelMap model) {
		model.addAttribute("usuarios", Uservice.getUsers());
		model.addAttribute("categorias", Cservice.getCategories());
		model.addAttribute("proveedores", Sservice.getSuppliers());
        return "productsTemplate";
    }
	
	@RequestMapping(value = {"/editarProducto/{id}"}, method = RequestMethod.GET)
    public String productsViewPage(ModelMap model, @PathVariable int id) {
		model.addAttribute("usuarios", Uservice.getUsers());
		model.addAttribute("categorias", Cservice.getCategories());
		model.addAttribute("proveedores", Sservice.getSuppliers());
        model.addAttribute("producto", Prepository.getProductDTOById(id));
        return "productsUpdate";
    }
	
	@RequestMapping(value = {"/singleproduct/{id}"}, method = RequestMethod.GET)
    public String singleproduct(ModelMap model, @PathVariable int id) {
        model.addAttribute("producto", Prepository.getProductDTOById(id));
        return "singleproduct";
    }
	
	@RequestMapping(value = "/guardarProducto", method = RequestMethod.POST)
    public @ResponseBody String guardarProducto(@ModelAttribute("Products") Products products) {
    	
         service.saveProducts(products);
         return null;
     }
	
	@RequestMapping(value = "/actualizarProducto", method = RequestMethod.PUT)
	public @ResponseBody String actualizarProducto(@ModelAttribute("Products") Products products) {
		
		service.updateProducts(products);
		return null;
	}
	
	@RequestMapping(value = "/eliminarProducto/{id}", method = RequestMethod.DELETE)
	public @ResponseBody String eliminarProducto(@PathVariable int id) {
		service.deleteProducts(id);
		return null;
	}
}
