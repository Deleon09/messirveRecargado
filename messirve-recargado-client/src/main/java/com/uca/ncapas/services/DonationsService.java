package com.uca.ncapas.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uca.ncapas.models.entities.Donations;
import com.uca.ncapas.repositories.DonationsRepository;

@Service
public class DonationsService {
	
	@Autowired
	private DonationsRepository repository;
	
	public Donations saveDonations(Donations donations) {
		return repository.save(donations);
	}
	
	public List<Donations> saveDonationss(List<Donations> donations) {
		return repository.saveAll(donations);
	}
	
	public List<Donations> getDonations() {
		return repository.findAll();
	}
	
	public Donations getDonationsById(int id) {
		return repository.findById(id).orElse(null);
	}
	
	public String deleteDonations(int id) {
		repository.deleteById(id);
		return "Donation deleted || " + id;
	}
}
