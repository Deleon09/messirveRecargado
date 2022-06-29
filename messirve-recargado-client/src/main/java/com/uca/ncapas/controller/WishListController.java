package com.uca.ncapas.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.uca.ncapas.models.entities.WishList;
import com.uca.ncapas.repositories.WishListDTORepository;
import com.uca.ncapas.services.WishListService;

@Controller
@RequestMapping("/")
public class WishListController {

	@Autowired
	private WishListService service;
	@Autowired
	private WishListDTORepository Wrepository;
	
	@RequestMapping(value = {"/listaDeDeseos"}, method = RequestMethod.GET)
    public String wishlistPage(ModelMap model) {
        return "wishlistTemplate";
    }
	
	@RequestMapping(value = "/guardarLista", method = RequestMethod.POST)
    public @ResponseBody String guardarLista(@ModelAttribute("WishList") WishList wishlist) {
    	
         service.saveWishList(wishlist);
         return null;
     }
	
	@RequestMapping(value = "/eliminarLista/{id}", method = RequestMethod.DELETE)
	public @ResponseBody String eliminarLista(@PathVariable int id) {
		service.deleteWishList(id);
		return null;
	}
}
