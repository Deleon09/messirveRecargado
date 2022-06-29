package com.uca.ncapas.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.uca.ncapas.repositories.CartDTORepository;
import com.uca.ncapas.repositories.OrdersDTORepository;
import com.uca.ncapas.services.ProductsService;

@Controller
public class MainController {

	@Autowired
	private ProductsService Pservice;
	@Autowired
	private CartDTORepository Crepository;
	@Autowired
	private OrdersDTORepository Orepository;
	
	
	@RequestMapping(value = {"/home"}, method = RequestMethod.GET)
    public String home(ModelMap model) {
		model.addAttribute("products", Pservice.getProductsWithLimit());
        return "home";
    }

	@GetMapping("/contact")
	public String contact() {
		return "contact";
	}
	
	@GetMapping("/login")
	public String login() {
		return "login";
	}
	
	@GetMapping("/aboutus")
	public String aboutus() {
		return "aboutus";
	}
	
	@GetMapping("/userTemplate")
	public String userTempalte() {
		return "userTemplate";
	}
	
	@GetMapping("/suppliersTemplate")
	public String suppliersTemplate() {
		return "suppliersTemplate";
	}
	
	
	@GetMapping("/rolesTemplate")
	public String rolesTemplate() {
		return "rolesTemplate";
	}
	
	@GetMapping("/categoriesTemplate")
	public String categoriesTemplate() {
		return "categoriesTemplate";
	}
	
	@GetMapping("/newsLetterTemplate")
	public String newsLetterTemplate() {
		return "newsLetterTemplate";
	}
	
	@GetMapping("/productsTemplate")
	public String productsTemplate() {
		return "productsTemplate";
	}
	
	@GetMapping("/donationsTemplate")
	public String donationsTemplate () {
		return "donationsTemplate";
	}
	
	@GetMapping("/ordersTemplate")
	public String ordersTemplate() {
		return "ordersTemplate";
	}
	
	@RequestMapping(value = {"/myOrders/{id}"}, method = RequestMethod.GET)
	public String myOrders(ModelMap model, @PathVariable int id) {
		model.addAttribute("orderItems", Orepository.getOrdersDTOByUserID(id));
		return "myOrders"; 
	}
	
	@GetMapping("/shop")
	public String shop () {
		return "shop";
	}
	
	@RequestMapping(value = {"/cart/{id}"}, method = RequestMethod.GET)
    public String cart(ModelMap model, @PathVariable int id) {
		model.addAttribute("cartItems", Crepository.getCartsDTOByUserID(id));
        return "cart";
    }
	
	@GetMapping("/newUser")
	public String newUser () {
		return "newUser";
	}
	
	
}
