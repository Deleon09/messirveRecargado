package com.uca.ncapas.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.uca.ncapas.models.entities.User;
import com.uca.ncapas.repositories.UserDTORepository;
import com.uca.ncapas.services.RolesService;
import com.uca.ncapas.services.UserService;

@Controller
@RequestMapping("/")
public class UsersController {

	@Autowired
	private UserService service;
	@Autowired
	private UserDTORepository Urepository;
	
	@Autowired
	private RolesService Rservice;
	
	@RequestMapping(value = {"/listaUsuarios"}, method = RequestMethod.GET)
    public String usersPage(ModelMap model) {
		model.addAttribute("roles", Rservice.getRoles());
        return "userTemplate";
    }
	
	@RequestMapping(value = {"/editarUsuario/{id}"}, method = RequestMethod.GET)
    public String usersEditPage(ModelMap model, @PathVariable int id) {
        model.addAttribute("usuario", Urepository.getUserDTOById(id));
        model.addAttribute("roles", Rservice.getRoles());
        return "usersUpdate";
    }
	
	@RequestMapping(value = "/guardarUsuario", method = RequestMethod.POST)
    public @ResponseBody String guardarUsuario(@ModelAttribute("User") User user) {
    	
         service.saveUser(user);
         return null;
     }
	
	@RequestMapping(value = "/actualizarUsuario", method = RequestMethod.PUT)
	public @ResponseBody String actualizarUsuario(@ModelAttribute("User") User user) {
		
		service.updateUser(user);
		return null;
	}
	
	@RequestMapping(value = "/eliminarUsuario/{id}", method = RequestMethod.DELETE)
	public @ResponseBody String eliminarUsuario(@PathVariable int id) {
		Integer id_usuario = id;
		service.deleteUser(id_usuario);
		return null;
	}
}
