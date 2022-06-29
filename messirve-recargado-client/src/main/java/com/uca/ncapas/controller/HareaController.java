package com.uca.ncapas.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.uca.ncapas.models.entities.Harea;
import com.uca.ncapas.services.HareaService;

@Controller
@RequestMapping("/")
public class HareaController {

	@Autowired
	private HareaService service;
	
	@RequestMapping(value = {"/listaHareas"}, method = RequestMethod.GET)
    public String HareasPage(ModelMap model) {
		model.addAttribute("hareas", service.getHareas());
        return "hareasTemplate";
    }
	
	@RequestMapping(value = {"/editarHarea/{id}"}, method = RequestMethod.GET)
    public String hareasEditPage(ModelMap model, @PathVariable int id) {
        model.addAttribute("harea", service.getHareaById(id));
        return "hareasUpdate";
    }
	
	@RequestMapping(value = "/guardarHarea", method = RequestMethod.POST)
    public @ResponseBody String guardarHarea(@ModelAttribute("Harea") Harea harea) {
    	
         service.saveHarea(harea);
         return null;
     }
	
	@RequestMapping(value = "/actualizarHarea", method = RequestMethod.PUT)
	public @ResponseBody String actualizarHarea(@ModelAttribute("Harea") Harea harea) {
		
		service.updateHarea(harea);
		return null;
	}
	
	@RequestMapping(value = "/eliminarHarea/{id}", method = RequestMethod.DELETE)
	public @ResponseBody String eliminarHarea(@PathVariable int id) {
		
		service.deleteHarea(id);
		return null;
	}
}
