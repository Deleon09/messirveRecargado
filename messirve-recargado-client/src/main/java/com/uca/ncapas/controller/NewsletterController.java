package com.uca.ncapas.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.uca.ncapas.models.entities.Newsletter;
import com.uca.ncapas.services.NewsletterService;

@Controller
@RequestMapping("/")
public class NewsletterController {

	@Autowired
	private NewsletterService service;
	
	@RequestMapping(value = {"/listaCartas"}, method = RequestMethod.GET)
    public String newsletterPage(ModelMap model) {
        return "newsLetterTemplate";
    }
	
	@RequestMapping(value = {"/verCarta/{id}"}, method = RequestMethod.GET)
    public String newsletterViewPage(ModelMap model, @PathVariable int id) {
        model.addAttribute("carta", service.getNewsletterById(id));
        return "newsLetterUpdate";
    }
	
	@RequestMapping(value = "/guardarCarta", method = RequestMethod.POST)
    public @ResponseBody String guardarCarta(@ModelAttribute("Newsletter") Newsletter newsletter) {
    	
         service.saveNewsletter(newsletter);
         return null;
     }
	
	@RequestMapping(value = "/actualizarCarta", method = RequestMethod.PUT)
	public @ResponseBody String actualizarRol(@ModelAttribute("Newsletter") Newsletter newsletter) {
		
		service.updateNewsletter(newsletter);
		return null;
	}
	
	@RequestMapping(value = "/eliminarCarta/{id}", method = RequestMethod.DELETE)
	public @ResponseBody String eliminarCarta(@PathVariable int id) {
		
		service.deleteNewsletter(id);
		return null;
	}
}
