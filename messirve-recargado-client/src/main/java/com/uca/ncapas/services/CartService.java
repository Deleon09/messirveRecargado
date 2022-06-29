package com.uca.ncapas.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uca.ncapas.models.entities.Cart;
import com.uca.ncapas.models.entities.Roles;
import com.uca.ncapas.repositories.CartRepository;

@Service
public class CartService {

	@Autowired
	private CartRepository repository;
	
	public Cart saveCart(Cart cart) {
		return repository.save(cart);
	}
	
	public List<Cart> getCarts() {
		return repository.findAll();
	}
	
	public Cart getCartById(int id) {
		return repository.findById(id).orElse(null);
	}
	
	public String deleteCart(int id) {
		repository.deleteById(id);
		return "Cart deleted || " + id;
	}
	
	public Cart updateCartQuantity(Cart cart) {
		Cart existingCart = repository.findById(cart.getId()).orElse(null);
		existingCart.setCantidad(cart.getCantidad());
		return repository.save(existingCart);
	}
}
