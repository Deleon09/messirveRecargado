package com.uca.ncapas.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uca.ncapas.models.entities.WishList;
import com.uca.ncapas.repositories.WishListRepository;

@Service
public class WishListService {

	@Autowired
	private WishListRepository repository;
	
	public WishList saveWishList(WishList wishlist) {
		return repository.save(wishlist);
	}
	
	public List<WishList> getWishLists() {
		return repository.findAll();
	}
	
	public WishList getWishListById(int id) {
		return repository.findById(id).orElse(null);
	}
	
	public String deleteWishList(int id) {
		repository.deleteById(id);
		return "WishList deleted || " + id;
	}

}
