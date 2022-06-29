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
@Table(name = "orden_detalle")
public class Details_Order {

	@Id
	@GeneratedValue
    @Basic(fetch = FetchType.EAGER)
    @Column(name = "id")
	private Integer id;
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JsonIgnore
    @JoinColumns({@JoinColumn(name = "orden_id", referencedColumnName = "id")})
	private Orders orders;
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JsonIgnore
    @JoinColumns({@JoinColumn(name = "producto_id", referencedColumnName = "id")})
	private Products products;
	
	@Column(name = "cantidad")
	private Integer cantidad;

	public Details_Order(Orders orders, Products products, Integer cantidad) {
		super();
		this.orders = orders;
		this.products = products;
		this.cantidad = cantidad;
	}
	
	public Details_Order() {
		super();
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Orders getOrders() {
		return orders;
	}

	public void setOrders(Orders orders) {
		this.orders = orders;
	}

	public Products getProducts() {
		return products;
	}

	public void setProducts(Products products) {
		this.products = products;
	}

	public Integer getCantidad() {
		return cantidad;
	}

	public void setCantidad(Integer cantidad) {
		this.cantidad = cantidad;
	}
	
	
}
