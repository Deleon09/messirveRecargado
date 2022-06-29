package com.uca.ncapas.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.uca.ncapas.models.entities.Donations;
import com.uca.ncapas.models.entities.User;
import com.uca.ncapas.repositories.DonationsDTORepository;
import com.uca.ncapas.services.DonationsService;
import com.uca.ncapas.services.HareaService;

@Controller
@RequestMapping("/")
public class DonationsController {

	@Autowired
	private DonationsService service;
	@Autowired
	private DonationsDTORepository Drepository;
	@Autowired
	private HareaService Hservice;
	
	@RequestMapping(value = {"/listaDonaciones"}, method = RequestMethod.GET)
    public String donationsPage(ModelMap model) {
        return "donationsTemplate";
    }
	
	@RequestMapping(value = {"/donations"}, method = RequestMethod.GET)
    public String donations(ModelMap model) {
		model.addAttribute("hareas", Hservice.getHareas());
        return "donations";
    }
	
	@RequestMapping(value = {"/verDonacion/{id}"}, method = RequestMethod.GET)
    public String donationsViewPage(ModelMap model, @PathVariable int id) {
        model.addAttribute("donacion", Drepository.getDonationDTOById(id));
        return "donationsView";
    }
	
	@RequestMapping(value = "/guardarDonacion", method = RequestMethod.POST)
    public @ResponseBody String guardarUsuario(@ModelAttribute("Donations") Donations donations) {
    	
         service.saveDonations(donations);
         return null;
     }
	
	@RequestMapping(value = "/eliminarDonacion/{id}", method = RequestMethod.DELETE)
	public @ResponseBody String eliminarDonacion(@PathVariable int id) {
		service.deleteDonations(id);
		return null;
	}
}
