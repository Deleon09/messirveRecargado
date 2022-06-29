package com.uca.ncapas.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.uca.ncapas.models.entities.Roles;
import com.uca.ncapas.services.RolesService;

@Controller
@RequestMapping("/")
public class RolesController {

	@Autowired
	private RolesService service;
	
	@RequestMapping(value = {"/listaRoles"}, method = RequestMethod.GET)
    public String productsPage(ModelMap model) {
        return "rolesTemplate";
    }
		
	@RequestMapping(value = {"/editarRol/{id}"}, method = RequestMethod.GET)
    public String rolesEditPage(ModelMap model, @PathVariable int id) {
        model.addAttribute("rol", service.getRoleById(id));
        return "rolesUpdate";
    }
	
	@RequestMapping(value = "/guardarRol", method = RequestMethod.POST)
    public @ResponseBody String guardarRol(@ModelAttribute("Roles") Roles roles ) {
    	
         service.saveRoles(roles);
         return null;
     }
	
	@RequestMapping(value = "/actualizarRol", method = RequestMethod.PUT)
	public @ResponseBody String actualizarRol(@ModelAttribute("Roles") Roles roles) {
		
		service.updateRole(roles);
		return null;
	}
	
	@RequestMapping(value = "/eliminarRol/{id}", method = RequestMethod.DELETE)
	public @ResponseBody String eliminarRol(@PathVariable int id) {
		
		service.deleteRole(id);
		return null;
	}
}
