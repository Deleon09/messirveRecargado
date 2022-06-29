package com.uca.ncapas.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uca.ncapas.models.entities.Cart;
import com.uca.ncapas.models.entities.Details_Order;
import com.uca.ncapas.repositories.Details_OrderRepository;

@Service
public class Details_OrderService {

	@Autowired
	private Details_OrderRepository repository;
	
	public Details_Order saveDetails_Order(Details_Order detailsorder) {
		return repository.save(detailsorder);
	}
	
	public List<Details_Order> getDetails_Order() {
		return repository.findAll();
	}
	
	public Details_Order getDetails_OrderById(int id) {
		return repository.findById(id).orElse(null);
	}
	
	public String deleteDetails_Order(int id) {
		repository.deleteById(id);
		return "Details_Order deleted || " + id;
	}
}
