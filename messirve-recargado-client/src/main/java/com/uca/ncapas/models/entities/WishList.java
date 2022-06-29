package com.uca.ncapas.models.entities;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "lista_deseos")
public class WishList {
	
	@Id
	@GeneratedValue
    @Basic(fetch = FetchType.EAGER)
    @Column(name = "id")
	private Integer id;
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JsonIgnore
    @JoinColumns({@JoinColumn(name = "usuario_id", referencedColumnName = "id")})
	private User user;
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JsonIgnore
    @JoinColumns({@JoinColumn(name = "producto_id", referencedColumnName = "id")})
	private Products products;
	
	public WishList() {
		super();
	}

	public WishList(User user, Products products) {
		super();
		this.user = user;
		this.products = products;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Products getProducts() {
		return products;
	}

	public void setProducts(Products products) {
		this.products = products;
	}
	
	
}
