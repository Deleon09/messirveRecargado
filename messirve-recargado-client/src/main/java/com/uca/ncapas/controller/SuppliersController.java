package com.uca.ncapas.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.uca.ncapas.models.entities.Suppliers;
import com.uca.ncapas.services.SuppliersService;

@Controller
@RequestMapping("/")
public class SuppliersController {
	
	@Autowired
	private SuppliersService service;

	@RequestMapping(value = {"/listaProveedores"}, method = RequestMethod.GET)
    public String suppliersPage(ModelMap model) {
        return "suppliersTemplate";
    }
	
	@RequestMapping(value = {"/editarProveedor/{id}"}, method = RequestMethod.GET)
    public String proveedoresEditPage(ModelMap model, @PathVariable int id) {
        model.addAttribute("proveedor", service.getSupplierById(id));
        return "suppliersUpdate";
    }
	
	@RequestMapping(value = "/guardarProveedor", method = RequestMethod.POST)
    public @ResponseBody String guardarProveedor(@ModelAttribute("Suppliers") Suppliers suppliers) {
    	
         service.saveSuppliers(suppliers);
         return null;
     }
	
	@RequestMapping(value = "/actualizarProveedor", method = RequestMethod.PUT)
	public @ResponseBody String actualizarProveedor(@ModelAttribute("Suppliers") Suppliers suppliers) {
		
		service.updateSupplier(suppliers);
		return null;
	}
	
	@RequestMapping(value = "/eliminarProveedor/{id}", method = RequestMethod.DELETE)
	public @ResponseBody String eliminarProveedor(@PathVariable int id) {
		
		service.deleteSupplier(id);
		return null;
	}
}
