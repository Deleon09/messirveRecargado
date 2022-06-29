package com.uca.ncapas.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uca.ncapas.models.dtos.OrdersDTO;
import com.uca.ncapas.models.entities.Cart;
import com.uca.ncapas.models.entities.Orders;
import com.uca.ncapas.repositories.OrdersRepository;

@Service
public class OrdersService {
	
	@Autowired
	private OrdersRepository repository;
	
	public Orders saveOrder(Orders orders) {
		return repository.save(orders);
	}
	
	public List<Orders> getOrderss() {
		return repository.findAll();
	}
	
	public Orders getOrderById(int id) {
		return repository.findById(id).orElse(null);
	}
	
	public String deleteOrder(int id) {
		repository.deleteById(id);
		return "Order deleted || " + id;
	}
}
