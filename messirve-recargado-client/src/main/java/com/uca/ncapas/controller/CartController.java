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

import com.uca.ncapas.models.dtos.CartDTO;
import com.uca.ncapas.models.entities.Cart;
import com.uca.ncapas.models.entities.Products;
import com.uca.ncapas.models.entities.Roles;
import com.uca.ncapas.models.entities.WishList;
import com.uca.ncapas.repositories.CartDTORepository;
import com.uca.ncapas.repositories.CartRepository;
import com.uca.ncapas.services.CartService;

@Controller
@RequestMapping("/")
public class CartController {

	@Autowired
	private CartService service;
	@Autowired
	private CartDTORepository Crepository;
	@Autowired
	private CartRepository Corepository;
	
	@RequestMapping(value = {"/listaCarritos"}, method = RequestMethod.GET)
    public String cartsPage(ModelMap model) {
		model.addAttribute("carts", Crepository.getCartsDTO());
        return "cartsTemplate";
    }
	
	@RequestMapping(value = "/guardarCart", method = RequestMethod.POST)
    public @ResponseBody String guardarCart(@ModelAttribute("Cart") Cart cart) {
    	
		Integer user = cart.getUser().getId();
		Integer product = cart.getProducts().getId();
		
		 Cart existingCartItem = Corepository.getExistingCartItem(user,product);
		 
		 if(existingCartItem == null) {
			 service.saveCart(cart);			 
		 }
		
         return null;
     }
	
	@RequestMapping(value = "/actualizarCart", method = RequestMethod.PUT)
	public @ResponseBody String actualizarCart(@ModelAttribute("Cart") Cart cart) {
		
		service.updateCartQuantity(cart);
		return null;
	}
	
	@RequestMapping(value = "/eliminarCart/{id}", method = RequestMethod.DELETE)
	public @ResponseBody String eliminarCart(@PathVariable int id) {
		service.deleteCart(id);
		return null;
	}
	
	@RequestMapping(value = "/comprarCarrito/{id}", method = RequestMethod.GET)
	public String comprarCarrito(ModelMap model, @PathVariable int id) {
		
		List<CartDTO> price = Crepository.getCartsDTOByUserID(id);
		double total = 0;
		
		for(CartDTO tp: price) {
			total = total + (tp.getPrecio()*tp.getCantidad());
		}
	
		model.addAttribute("priceShop", total);
		
		return "shopCart";
	}
}
