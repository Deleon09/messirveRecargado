package com.uca.ncapas.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uca.ncapas.models.entities.Newsletter;
import com.uca.ncapas.repositories.NewsletterRepository;

@Service
public class NewsletterService {
	
	@Autowired
	private NewsletterRepository repository;
	
	public Newsletter saveNewsletter(Newsletter newsletter) {
		return repository.save(newsletter);
	}
	
	public List<Newsletter> saveNewsletters(List<Newsletter> newsletter) {
		return repository.saveAll(newsletter);
	}
	
	public List<Newsletter> getNewsletters() {
		return repository.findAll();
	}
	
	public Newsletter getNewsletterById(int id) {
		return repository.findById(id).orElse(null);
	}
	
	public Newsletter getNewsletterByNombre(String nombre) {
		return repository.findByNombre(nombre);
	}
	
	public String deleteNewsletter(int id) {
		repository.deleteById(id);
		return "Role deleted || " + id;
	}
	
	public Newsletter updateNewsletter(Newsletter newsletter) {
		Newsletter existingNewsletter = repository.findById(newsletter.getId()).orElse(null);
		existingNewsletter.setNombre(newsletter.getNombre());
		existingNewsletter.setCorreo(newsletter.getCorreo());
		existingNewsletter.setAsunto(newsletter.getAsunto());
		existingNewsletter.setMensaje(newsletter.getMensaje());
		return repository.save(existingNewsletter);
	}
}
